package com.koreaIT.vBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.vBlog.service.MemberService;
import com.koreaIT.vBlog.util.Util;
import com.koreaIT.vBlog.vo.Member;
import com.koreaIT.vBlog.vo.ResultData;
import com.koreaIT.vBlog.vo.Rq;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	private Rq rq;
	
	public UsrMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/member/loginIdDupChk")
	@ResponseBody
	public ResultData loginIdDupChk(String loginId) {
		
		if (Util.empty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return ResultData.from("F-2", Util.f("%s은(는) 이미 사용중인 아이디입니다", loginId));
		}
		
		return ResultData.from("S-1", Util.f("%s은(는) 사용 가능한 아이디입니다", loginId));
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		
		if (Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}
		if (Util.empty(name)) {
			return Util.jsHistoryBack("이름을 입력해주세요");
		}
		if (Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요");
		}
		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요");
		}
		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return Util.jsHistoryBack(Util.f("%s은(는) 이미 사용중인 아이디입니다", loginId));
		}
		
		memberService.joinMember(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return Util.jsReplace(Util.f("%s님의 가입이 완료되었습니다", name), "/");
	}
	
	@RequestMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {
		
		if (Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return Util.jsHistoryBack(Util.f("%s은(는) 존재하지 않는 아이디입니다", loginId));
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return Util.jsHistoryBack("비밀번호를 확인해주세요");
		}
		
		rq.login(member);
		
		return Util.jsReplace(Util.f("%s 회원님 환영합니다~", member.getNickname()), "/");
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout() {
		
		rq.logout();
		
		return Util.jsReplace("정상적으로 로그아웃 되었습니다", "/");
	}
	
	@RequestMapping("/usr/member/myPage")
	public String myPage(Model model) {
		
		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		model.addAttribute("member", member);
		
		return "/usr/member/myPage";
	}

	@RequestMapping("/usr/member/checkPassword")
	public String checkPassword(Model model, String loginId) {

		model.addAttribute("loginId", loginId);

		return "usr/member/checkPassword";
	}

	@RequestMapping("/usr/member/doCheckPassword")
	public String doCheckPassword(Model model, String loginPw) {

		if (Util.empty(loginPw)) {
			
			return rq.jsReturnOnView("비밀번호를 입력해주세요"); 
		}

		Member member = memberService.getMemberById(rq.getLoginedMemberId());

		if (member.getLoginPw().equals(Util.sha256(loginPw)) == false) {
			
			return rq.jsReturnOnView("비밀번호가 일치하지 않습니다");
		}

		model.addAttribute("member", member);

		return "usr/member/modify";
	}

	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(String name, String nickname, String cellphoneNum, String email) {

		if (Util.empty(name)) {
			
			return Util.jsHistoryBack("이름을 입력해주세요");
		}

		if (Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요"); 
		}

		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요"); 
		}

		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요"); 
		}

		memberService.doModify(rq.getLoginedMemberId(), name, nickname, cellphoneNum, email);

		return Util.jsReplace(Util.f("%s님의 회원정보가 수정되었습니다", name), "myPage");
	}

	@RequestMapping("/usr/member/passwordModify")
	public String passwordModify() {
		
		return "usr/member/passwordModify";
	}

	@RequestMapping("/usr/member/doPasswordModify")
	@ResponseBody
	public String doPasswordModify(String loginPw, String loginPwChk) {
		
		if (Util.empty(loginPw)) {
			
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}

		if (Util.empty(loginPwChk)) {
			return Util.jsHistoryBack("비밀번호확인을 입력해주세요"); 
		}

		if (loginPw.equals(loginPwChk) == false) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다"); 
		}

		memberService.doPasswordModify(rq.getLoginedMemberId(), Util.sha256(loginPw));
		
		return Util.jsReplace("비밀번호가 변경되었습니다", "myPage");
	}
	
	@RequestMapping("/usr/member/findLoginId")
	public String findLoginId() {
		
		return "usr/member/findLoginId";
	}

	@RequestMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(String name, String email, String cellphoneNum) {

		if (Util.empty(name)) {
			
			return Util.jsHistoryBack("이름을 입력해주세요"); 
		}

		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요"); 
		}

		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요"); 
		}

		Member member = memberService.getMemberByNameAndEmailAndCell(name, email, cellphoneNum);

		if (member == null) {
			
			return Util.jsHistoryBack("입력하신 정보와 일치하는 회원이 없습니다");
		}

		return Util.jsReplace(Util.f("회원님의 아이디는 [ %s ] 입니다", member.getLoginId()), "login");
	}

	@RequestMapping("/usr/member/findLoginPw")
	public String findLoginPw() {
		
		return "usr/member/findLoginPw";
	}

	@RequestMapping("/usr/member/doFindLoginPw")
	@ResponseBody
	public String doFindLoginPw(String loginId, String name, String email, String cellphoneNum) {

		if (Util.empty(loginId)) {
			
			return Util.jsHistoryBack("아이디를 입력해주세요"); 
		}

		if (Util.empty(name)) {
			return Util.jsHistoryBack("이름을 입력해주세요"); 
		}

		if (Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요"); 
		}

		if (Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요"); 
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			
			return Util.jsHistoryBack("입력하신 아이디와 일치하는 회원이 없습니다");
		}

		if (member.getName().equals(name) == false) {
			
			return Util.jsHistoryBack("이름이 일치하지 않습니다");
		}

		if (member.getEmail().equals(email) == false) {
			return Util.jsHistoryBack("이메일이 일치하지 않습니다");
		}

		if (member.getCellphoneNum().equals(cellphoneNum) == false) {
			return Util.jsHistoryBack("전화번호가 일치하지 않습니다");
		}

		ResultData notifyTempLoginPwByEmailRd = memberService.notifyTempLoginPwByEmail(member);

		return Util.jsReplace(notifyTempLoginPwByEmailRd.getMsg(), "login");

	}

}