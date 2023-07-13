<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 1. 아이디 중복 확인 */
	// 넘겨준 attr 받기
	String message = (String)request.getAttribute("message");
	// 넘어온 message가 빈 문자열이 아닐경우
	if(message != null && message.equals("") == false){
		// 가입 성공
		if(message.equals("MEMBER_YES")){
			%>
			<script type="text/javascript">
				alert("성공적으로 가입했습니다.");
				location.href = "login.do";
			</script>
			<%
		}
		// 실패
		else{
			%>
			<script type="text/javascript">
				alert("가입에 실패했습니다.");
				location.href = "regi.do";
			</script>
			<%
		}
	}
	
	/* 2. 로그인 */
	String login = (String)request.getAttribute("loginmsg");
	if(login != null && login.equals("") == false){
		
		if(login.equals("LOGIN_NO")){
			%>
			<script>
				alert("아이디나 비밀번호를 확인해 주십시오");
				location.href = "login.do";
			</script>
			<%	
		}
		
		else{
			%>
			<script>
				alert("로그인되었습니다.");
				location.href = "bbslist.do";
			</script>
			<%	
		}
	}
	
	/* 3. 게시판 글쓰기 */
	String bbswrite = (String)request.getAttribute("bbswrite");
	if(bbswrite != null && bbswrite.equals("") == false){
		
		if(bbswrite.equals("BBS_ADD_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 작성되었습니다");
				location.href = "bbs?param=bbslist";
			</script>
			<%
		}
		
		else{
			%>
			<script type="text/javascript">
				alert("다시 작성해 주십시오");
				location.href = "bbs?param=bbswrite";
			</script>
			<%
		}
	}

	/* 4. 게시판 답글쓰기 */
	String answer = (String)request.getAttribute("answer");
	if(answer != null && answer.equals("") == false){
		
		if(answer.equals("BBS_ANSWER_OK")){
			%>
			<script type="text/javascript">
				alert("답글이 성공적으로 작성되었습니다");
				location.href = "bbs?param=bbslist";
			</script>
			<%
		}
		
		else{
			int seq = (Integer)request.getAttribute("seq");
			%>
			<script type="text/javascript">
				alert("답글을 다시 작성해 주십시오");
				let seq = "<%=seq %>";		
				location.href = "bbs?param=answer&seq=" + seq;
			</script>
			<%
		}	
	}

	/* 5. 게시판 수정 */
	String bbsupdate = (String)request.getAttribute("bbsupdate");
	if(bbsupdate != null && bbsupdate.equals("") == false){
		
		if(bbsupdate.equals("BBS_UPDATE_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 수정되었습니다");
				location.href = "bbs?param=bbslist";
			</script>
			<%
		}
		
		else{
			int seq = (Integer)request.getAttribute("seq");
			%>
			<script type="text/javascript">
				alert("다시 작성해 주십시오");
				let seq = "<%=seq %>";		
				location.href = "bbs?param=bbsupdate&seq=" + seq;
			</script>
			<%
		}	
	}

	/* 6. 게시판 삭제 */
	String bbsdelete = (String)request.getAttribute("bbsdelete");
	if(bbsdelete != null && bbsdelete.equals("") == false){
		
		if(bbsdelete.equals("BBS_DELETE_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 삭제되었습니다");
				location.href = "bbs?param=bbslist";
			</script>
			<%
		}
		
		else{
			%>
			<script type="text/javascript">
				alert("삭제되지 않았습니다");		
				location.href = "bbs?param=bbslist";
			</script>
			<%
		}	
	}
	
	/* 7. 일정 작성 */
	String calwrite = (String)request.getAttribute("calwrite");
	if(calwrite != null && calwrite.equals("") == false){
		
		if(calwrite.equals("CAL_WRITE_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 추가되었습니다");
				location.href = "calendar?param=calendarList";
			</script>
			<%
		}
		
		else{
			%>
			<script type="text/javascript">
				alert("추가되지 않았습니다");		
				location.href = "calendar?param=calendarList";
			</script>
			<%
		}	
	}

	/* 8. 일정 수정 */
	String calupdate = (String)request.getAttribute("calupdate");
	if(calupdate != null && calupdate.equals("") == false){
		
		if(calupdate.equals("CAL_UPDATE_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 수정되었습니다");
				location.href = "calendar?param=calendarList";
			</script>
			<%
		}
		
		else{
			%>
			<script type="text/javascript">
			alert("수정되지 않았습니다");		
			location.href = "calendar?param=calendarList";
			</script>
			<%
		}	
	}

	/* 9. 일정 삭제 */
	String caldelete = (String)request.getAttribute("caldelete");
	if(caldelete != null && caldelete.equals("") == false){
		if(caldelete.equals("CAL_DELETE_OK")){
			%>
			<script type="text/javascript">
				alert("성공적으로 삭제되었습니다");
				location.href = "calendar?param=calendarList";
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
				alert("삭제되지 않았습니다");		
				location.href = "calendar?param=calendarList";
			</script>
			<%
		}	
	}
%>