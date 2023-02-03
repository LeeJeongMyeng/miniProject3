<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">  
<link rel="stylesheet" type="text/css" href="${path}/resources/nosion/css/top.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
});
			
	
</script>
</head>

<body>
<header class="p-3 mb-3 border-bottom fixed-top">
    <div class="container">
     	
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <div id="Top_Logo"><img src="${path}/resources/nosion/image/Logo.jpg"></div>
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none ">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 link-secondary">Overview</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Inventory</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Customers</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Products</a></li>
        </ul>
	<c:if test="${Login.name!=null}"> 
        <div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle Top_PageMenu" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    페이지 메뉴
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">페이지 추가</a></li>
		    <li><a class="dropdown-item" href="#">페이지 삭제</a></li>
		    <li><a class="dropdown-item" href="#">페이지명 벼녕</a></li>
		  </ul>
		</div>

        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="#">설정</a></li>
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#MemberInfoModal">회원정보</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="NE_Logout.do">로그아웃</a></li>
          </ul>
        </div>
     </c:if>
      </div>
    </div> 
</header>

<!-- 회원정보 확인창 -->
<!-- 회원가입 모달 -->
<div class="modal fade" id="MemberInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
  <div class="row">
    <div class="modal-content col InfoMadalContent">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">'${Login.name}'님 회원정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="MemInfo_Form" action="NE_UpdateInfo.do" method="post" onsubmit="return UpdateInfo()">
      <div class="modal-body">
      <label for="MemInfo_name" class="form-label">이름</label>
		  <div class="mb-3">
		    <input name="name" type="text" class="form-control"  id="MemInfo_name" value="${Login.name}" readonly>    
		  </div>
		  
		  <hr>
		  
		  <label for="MemInfo_email" class="form-label">이메일</label>
		  <div class="mb-3">   
		    <input name="email" type="email" class="form-control" id="MemInfo_email"  value="${Login.email}"  required>
		    <div class="invalid-feedback" id="emailfeedback">이메일양식이 맞지 않습니다.</div>
		  </div>
		  <div class="d-flex justify-content-left" id="CheckEmail_Wrap">
		  	<button type="button" class="btn btn-primary " id="CheckEmailBtn">이메일 인증</button>
		  	<input type="text" class="form-control w-25" id="checkEmailCode"/>
		  </div>
		  <label for="MemInfo_SNSemail" class="form-label">연동 계정</label>
		  <div class="mb-3"> 
		  	<label for="" class="form-label">카카오</label>  
		    <input name="email" type="email" class="form-control" id="MemInfo_SNSemail1"  value="${Login.kakaoemail }" placeholder="카카오연동이메일" readonly>
		    <label for="" class="form-label">구글</label> 
		    <input name="email" type="email" class="form-control" id="MemInfo_SNSemail2"  value="${Login.googleemail }" placeholder="구글이메일" readonly>
		   
		  </div>
		  
		   <hr>
		  <div class="mb-3">
		    <label for="MemInfo_password1" class="form-label " >비밀번호</label>
		    <div id="passHelp" class="form-text UptPass">숫자/영문/특수문자 중 2가지 이상 혼합(8자리 이상 16자리 이하)</div>
		    <input name=password type="password" class="form-control" id="MemInfo_password1" aria-describedby="passHelp" value="${Login.password }" required>
		  	<div class="invalid-feedback" id="pass1feedback"></div>
		  </div>
		  <div class="mb-3">
		    <label for="MemInfo_password2" class="form-label UptPass" >비밀번호 확인</label>
		    <input type="password" class="form-control UptPass" id="MemInfo_password2" required>
		     <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
		  </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
        <button type="submit" class="btn btn-success" id="ConnectSNS">SNS계정연동</button>
        <button type="submit" class="btn btn-primary">수정하기</button>
      </div>
     </form>
    </div>
      <div class="modal-content col SNSModalContent">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">SNS 연동</h1>
        <button type="button" class="btn-close"  id="SNSModalClose"></button>
      </div>
      <div class="modal-body">
      	<div>
      	<h4 style="text-align:center;">구글연동</h4>
	       <img src="${path}/resources/nosion/image/btn_google_signin_light_normal_web.png">
	    <h4 style="text-align:center;">카카오연동</h4>
		   <img src="${path}/resources/nosion/image/kakao_login_medium_narrow.png">
	   </div>
      </div>
      <div class="modal-footer">
      	연동 이후,로그인 화면에서 <strong>SNS로그인을 바로 이용</strong>할 수 있습니다.
      </div>
     
    </div>
    </div>
  </div>
</div>
  
  
  
  
  
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${path}/resources/nosion/js/Top.js"></script> <%--el태그안써도되는것만 여기 --%>
<%--EL태그써야하면 밑에 --%>
<script>

var Upt_Email=true;
var Upt_Password=true;


	$('#MemInfo_email').keyup(function(){
		 var InfoEmail = $(this).val(); //회원정보창에 적혀져있는 이메일
		 var SessionEmail = '${Login.email}'; //세션처리된 이메일
		if(InfoEmail!=SessionEmail){
			$("#CheckEmailBtn").slideDown('slow')
			$("#checkEmailCode").slideDown('slow')
			Upt_Email=false;
			
		}else{
			$("#CheckEmailBtn").slideUp('slow')
			$("#checkEmailCode").slideUp('slow')
			Upt_Email=true;
		}
	})
	
	$('#MemInfo_password1').keyup(function(){
		var InfoPass = $(this).val()
		var SessionPass = '${Login.password}';
		if(InfoPass!=SessionPass){
			$('.UptPass').slideDown('slow')
			Upt_Password=false;
		}else{
			$('.UptPass').slideUp('slow')
			Upt_Password=true;
		}
	})
	
	
	$('#ConnectSNS').click(function(){
	$('.InfoMadalContent').animate(
			{'left':'-=350'},
			1000,
			function(){
				$('.SNSModalContent').slideDown()
	});
	$('#SNSModalClose').click(function(){
		$('.SNSModalContent').slideUp('fast',function(){
			$('.InfoMadalContent').animate(
					{'left':'+=350'},
					1000)
		})
		
	})
})
</script>
</body>
</html>