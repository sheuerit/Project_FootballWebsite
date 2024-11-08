<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	let msg = '${msg }'.trim();
	// 변수 msg에 {EL, Rq 클래스 jsReturnOnView() 메서드에서 전달받은 변수 msg }에서 trim() 메서드로 공백 제거한 후 저장
	
	if (msg) {
		// 만약 변수 msg가 공백과 같지 않다면 (falsy)
		
		alert(msg);
		// alert() 메서드 호출해서 인자로 변수 msg를 전달 (알림창에 문자열 출력)
	}
	// 공백과 같다면 조건문 탈출해서 다음 코드로
	
	history.back();
	// history.back() 메서드 호출해서 직전 기록된 url로 이동
	
</script>