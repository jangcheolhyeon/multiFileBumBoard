<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isAdmin" value="${sessionScope.id != null && sessionScope.id == 'admin' ? true : false }" />

    
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
    <script type="text/javascript" src="<c:url value="/js/jquery-1.12.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/design.js"/>"></script>
</head>
<body>

<div id="container">
    <section class="visual">              
        <h1  class="logo"><a href=""#>범일정보</a></h1>
        <div class="v_txt">
          <h2 class="txt_cover"><span class="move_point"><b>온라인 문의</b></span></h2>
          <p class="txt_cover">㈜범일정보에서 제공하는 온라인 문의 게시판은 로그인 없이 아래의 기본 정보 입력 후<br>고객의 의견을 수렴하는 서비스를 제공하고 있습니다.
          </p>                
        </div>
        <div class="inner"></div>              
      </section>
      
    <!-- CONT -->
    <section id="content" class="content__body">
        <div class="cont">
            <!-- 컨텐츠 들어감 -->
            <table class="boardView-tbl">
                <caption>공지사항 상세보기</caption>
                <colgroup>
                    <col style="width:15%">
                    <col style="width:35%">
                    <col style="width:15%">
                    <col style="width:35%">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4"><c:out value="${board.title}"/></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <input type="hidden" value="<c:out value="${board.board_password}"/>" id="hideAdminPassword" />                        
                    
<%--                         <c:if test="${isAdmin}">
	                        <input type="hidden" value="<c:out value="${board.board_password}"/>" id="hideAdminPassword" />                        
                        </c:if> --%>
                        <th scope="row">작성자</th>
                        <td><c:out value="${board.writer}"/></td>
                        <th scope="row">작성일</th>
                        <td><fmt:formatDate value="${board.reg_date}" pattern="y-M-d"/></td>
                    </tr>
                    <tr>
                        <th scope="row">조회수</th>
                       	<td colspan="3"><c:out value="${board.view_count}"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" class="boardView_cont">
                        	<c:out value="${board.content}"/>
                        </td>
                    </tr>
                    <tr class="file-tr">
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                            <ul class="file-list">
                            	<c:forEach items="${boardFiles}" var="file">
                            		 <li><a href="fileDownload.do?fileName=${file.file_name}&originalFileName=${file.original_file_name}&ext=${file.file_ext}"><c:out value="${file.original_file_name}"/><span class="capacity">(${file.file_size})</span></a></li>
                            	</c:forEach>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="tbl_head">
                <h5 class="tle"><i class="far fa-comment-dots"></i> 답변</h5>
            </div>
            
            <!-- 관리자인 경우 -->
            <c:if test="${isAdmin}">
            	<c:if test="${board.comment_state == 1}">
		            <div class="answerBox">
		                <div class="answerB_top">
		                	<p>관리자</p><span><fmt:formatDate value="${answer.reg_date}" pattern="y-M-d hh:mm:ss"/></span>
		               		<a href="#" class="btn btn_sm" id="deleteBtn" onclick="deleteComment(event)"><i class="fas fa-times"></i> 삭제</a> 
		               		<a href="#" class="btn btn_sm" id="updateBtn" onclick="updateComment(event)"><i class="fas fa-pen"></i> 수정</a> 
<%-- 		                    <p>관리자</p><span><fmt:formatDate value="${answer.reg_date}" pattern="y-M-d"/></span> --%>
<!-- 		                    <button id="updateBtn" class="btn btn_sm" onclick="updateComment()"><i class="fas fa-times"></i> 수정</button>
		                    <button id="deleteBtn" class="btn btn_sm" onclick="deleteComment()"><i class="fas fa-pen"></i> 삭제</button>  -->
<!-- 		                    <button id="updateBtn" onclick="updateComment()">수정</button>
		                    <button id="deleteBtn" onclick="deleteComment()">삭제</button> -->
		                </div>
		                
		                <div class="answerB_cont">
		                    ${answer.content}
		                </div>
	            	</div>
            	</c:if>
            	
            	<c:if test="${board.comment_state == 0}">
            		<div class="answerBox">
            			<div class="answerB_top">            			
	                    	<p>관리자</p><span><fmt:formatDate value="${board.reg_date}" pattern="y-M-d hh:mm:ss"/></span><a href="#" class="btn btn_sm" id="writeAnswerBtn" onclick="onWriteAnswerBtn()"><i class="fas fa-save"></i> 저장</a>
            			</div>
            		 	<div class="answerB_cont">
            		 		<textarea class="form" id="answerTxt"  style="height: 280px; color: #6a6a6a;">${baord.content}</textarea>
            			</div>
            			<!-- <textarea style="width: 100%; height: 100px" id="answerTxt"></textarea> -->
            			<!-- <input type="button" value="작성하기" id="writeAnswerBtn" onclick="onWriteAnswerBtn()" /> -->
            		</div>
            	</c:if>
            </c:if>
            
            
            <!-- 일반유저인 경우 -->
            <c:if test="${isAdmin == false}">
            	<c:if test="${board.comment_state == 1}">
		            <div class="answerBox">
		                <div class="answerB_top">
		                    <p>관리자</p><span><fmt:formatDate value="${answer.reg_date}" pattern="y-M-d"/></span>
		                </div>
		                
		                <div class="answerB_cont">
		                    ${answer.content}
		                </div>
	            	</div>
            	</c:if>
            	
            	<c:if test="${board.comment_state == 0}">
            		<div>
            			<span>아직 답변이 작성되지 않았습니다.</span>
            		</div>
            	</c:if>
            </c:if>
               

            <div class="btnWrap">
                <div class="fl">
                    <a href="<c:url value="/list.do"/>" class="btn"><i class="fas fa-list"></i> 목록</a>
                </div>
                <div class="fr">
                    <a href="#this" class="btn btn-danger" onclick="deleteBoard(event)">삭제</a>
                    <a href="#this" class="btn btn-primary" onclick="updateBoard(event)">수정</a>
                </div>
            </div>
            
            <ul class="boardView_nav">
            	<c:if test="${sideBoards.last != 9999}">            	
	                <li><span><i class="fas fa-angle-up"></i> 이전글</span><a href="<c:url value="/readBoard.do?board_id=${sideBoards.last}"/>"><c:out value="${sideBoards.lastTitle}"/></a></li>
            	</c:if>
            	<c:if test="${sideBoards.next != 9999}">
	                <li><span><i class="fas fa-angle-down"></i> 다음글</span><a href="<c:url value="/readBoard.do?board_id=${sideBoards.next}"/>"><c:out value="${sideBoards.nextTitle}"/></a></li>
            	</c:if>
            </ul>
        </div>
    </section>


	<script>
	
		function onWriteAnswerBtn(){
			let board_id = ${param.board_id};
			let content = document.querySelector("#answerTxt").value;
			
			
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value="/writeAnswer.do"/>");
			xhr.setRequestHeader("Content-Type", "application/json");
			
			let data = {
				board_id : board_id,
				content : content
			}
			
			xhr.send(JSON.stringify(data));
			
			xhr.onload = () => {
				if(xhr.status == 200){
					document.querySelector("#answerTxt").value = "";
					location.href = "<c:url value="/readBoard.do?board_id="/>" + board_id;
				}
			}
		}
		
		
		
		function updateComment(e){
			e.preventDefault();
			let commentText = document.querySelector(".answerB_cont").innerText;
			let btnName = document.querySelector("#updateBtn").innerText;
			
			if(btnName == " 수정"){

				document.querySelector("#deleteBtn").innerHTML = "<i class='fas fa-times'></i> 취소";
				document.querySelector("#updateBtn").innerHTML = "<i class='fas fa-pen'></i> 수정 후 작성";
				
				document.querySelector(".answerB_cont").style.display = "none";
				

				let textArea = "<div class='answerB_cont' id='updateAnswerContainer'>";
				textArea += "<textarea class='form' id='answerTxt' style='height:200px; color:#6a6a6a;'>" + commentText + "</textarea>";
				textArea += "</div>";
				
				document.querySelector(".answerBox").innerHTML += textArea;
				
			} else{
				let board_id = ${param.board_id};
				
				let xhr = new XMLHttpRequest();
				xhr.open("PUT", "<c:url value="/answer/"/>" + board_id + ".do");
				xhr.setRequestHeader("Content-Type", "application/json");		
				let newText = document.querySelector("#answerTxt").value;

				//console.log(newText);
				let data = {
					content : newText
				}
				
				xhr.send(JSON.stringify(data));
				
				xhr.onload = () => {
					if(xhr.status == 200){
						alert("수정했습니다.");
						location.href = "<c:url value="/readBoard.do?board_id="/>" + board_id;
					} 
				} 
				
			
			}
			
		}
		
		
		
		
		
		
		
		
		/*
		function updateComment(){
			console.log(document.querySelector(".answerB_cont"));
			let commentText = document.querySelector(".answerB_cont").innerText;
			
			let btnName = document.querySelector("#updateBtn").innerText;
			if(btnName == "수정"){
				
				document.querySelector("#deleteBtn").innerText = "취소";
				document.querySelector("#updateBtn").innerText = "수정 후 작성";
				
				document.querySelector(".answerB_cont").style.display = "none";
				
				let textArea = "<textarea style='width: 100%; height: 100px' id='updateAnswerTxt'>" + commentText + "</textarea>";		
				
				document.querySelector(".answerBox").innerHTML += textArea;
				
				
				
			} else{
				let board_id = ${param.board_id};
				
				let xhr = new XMLHttpRequest();
				xhr.open("PUT", "<c:url value="/answer/"/>" + board_id + ".do");
				xhr.setRequestHeader("Content-Type", "application/json");
				console.log("에러나는부분");
				console.log(document.querySelector("#updateAnswerTxt"));
				let newText = document.querySelector("#updateAnswerTxt").value;
				
				let data = {
					content : newText
				}
				
				xhr.send(JSON.stringify(data));
				
				xhr.onload = () => {
					if(xhr.status == 200){
						alert("수정했습니다.");
						location.href = "<c:url value="/readBoard.do?board_id="/>" + board_id;
					} else{
						console.log(xhr.response);
					}
				}
			}
			
			
			
		}
		
		*/
		
		
		function deleteComment(e){
			e.preventDefault();
			
			let btnName = document.querySelector("#deleteBtn").innerText;
			
			if(btnName == " 삭제"){
				if(confirm("삭제하겠습니까?")){
					let board_id = ${param.board_id};
					
					let xhr = new XMLHttpRequest();
					xhr.open("Delete", "<c:url value="/answer/"/>" + board_id + ".do");
					xhr.send();
					
					xhr.onload = () => {
						if(xhr.status == 200){
							alert("삭제되었습니다.");
							location.href = "<c:url value="/readBoard.do?board_id="/>" + board_id;
						} else{
							alert("삭제를 실패했습니다.");
						}
					}
					
				}
			}else{
				if(confirm("취소하시겠습니까")){
					document.querySelector("#updateAnswerContainer").remove();
					document.querySelector(".answerB_cont").style.display = "block";
					document.querySelector("#updateBtn").innerHTML = "<i class='fas fa-pen'></i> 수정";
					document.querySelector("#deleteBtn").innerHTML = "<i class='fas fa-pen'></i> 삭제";
					
				} 
			}
			
			
		}
		
		
		
		
		/*
		
		function deleteComment(){
			let btnName = document.querySelector("#deleteBtn").innerText;

			if(btnName == "삭제"){

				if(confirm("삭제하겠습니까?") == true){				
					let board_id = ${param.board_id};
				
					
					let xhr = new XMLHttpRequest();
					xhr.open("Delete", "<c:url value="/answer/"/>" + board_id + ".do");
					xhr.send();
					
					xhr.onload = () => {
						if(xhr.status == 200){
							alert("삭제되었습니다.");
							location.href = "<c:url value="/readBoard.do?board_id="/>" + board_id;
						} else{
							alert("삭제를 실패했습니다.");
						}
					}
				}
				
			} else{
				if(confirm("취소하시겠습니까")){
					document.querySelector("#updateAnswerTxt").remove();
					document.querySelector(".answerB_cont").style.display = "block";
					document.querySelector("#updateBtn").innerText = "수정";
					
				} else{
					console.log(xhr.response);
				}
				
				
			}

		}
		*/
		
		
		function deleteBoard(e){
			e.preventDefault();
			//console.log("deleteBoard");
			let board_id = ${param.board_id};
			
			if(confirm("게시글을 삭제하겠습니까?") == true){
				let xhr = new XMLHttpRequest();
				xhr.open("Delete", "<c:url value="/board/"/>" + board_id + "/" + document.querySelector("#hideAdminPassword").value + ".do");
				xhr.send();
				
				xhr.onload = () => {
					if(xhr.status == 200){
						alert("삭제되었습니다.");
						location.href = "<c:url value="/list.do"/>";
					} else{
						alert("삭제를 실패했습니다.");
					}
				}
			}
			
/* 			console.log(document.querySelector("#hideAdminPassword").value);
			if(${isAdmin} == true){
				if(confirm("게시글을 삭제하겠습니까?") == true){
					
					let xhr = new XMLHttpRequest();
					xhr.open("Delete", "<c:url value="/board/"/>" + board_id + "/" + document.querySelector("#hideAdminPassword").value + ".do");
					xhr.send();
					
					xhr.onload = () => {
						if(xhr.status == 200){
							alert("삭제되었습니다.");
							location.href = "<c:url value="/list.do"/>";
						} else{
							alert("삭제를 실패했습니다.");
						}
					}
				}
			}else{
				
				if(document.querySelector("#userWritePasswordContainer") != null || document.querySelector("#userWritePasswordContainer") != undefined){
					document.querySelector("#userWritePasswordContainer").remove();
				}
				
				console.log("click");
				document.querySelector(".td-table");
				
				let passwordCheckBox = "<div id='userWritePasswordContainer'>"
				passwordCheckBox += "<input type='password' id='userWritePassword'/>";
				passwordCheckBox += "<button id='userWritePasswordBtn' onclick='enterBoardPassword(" + board_id + ")'>확인</button>";
				passwordCheckBox += "</div>";
				
				document.querySelector(".fr").innerHTML += passwordCheckBox;
				
			} */
			
		}
		
		
		function updateBoard(e){
			//console.log("updateBoard");
			e.preventDefault();
			let board_id = ${param.board_id};
			//console.log(document.querySelector("#hideAdminPassword").value);
			location.href = "<c:url value="modifyBoard.do"/>?board_id=" + board_id + "&password=" + document.querySelector("#hideAdminPassword").value;
			
/* 			if(${isAdmin} == true){
				if(confirm("게시글을 수정하겠습니까?") == true){
					location.href = "<c:url value="modifyBoard.do"/>?board_id=" + board_id;
				}
			}else{
				
				if(document.querySelector("#userWritePasswordContainer") != null || document.querySelector("#userWritePasswordContainer") != undefined){
					document.querySelector("#userWritePasswordContainer").remove();
				}
				
				console.log("click");
				document.querySelector(".td-table");
				
				let passwordCheckBox = "<div id='userWritePasswordContainer'>"
				passwordCheckBox += "<input type='password' id='userWritePassword'/>";
				passwordCheckBox += "<button id='userWritePasswordBtn' onclick='enterModifyBoardPassword(" + board_id + ")'>확인</button>";
				passwordCheckBox += "</div>";
				
				document.querySelector(".fr").innerHTML += passwordCheckBox;
				
			} */
			
		}
		
		
		
		/*
		function enterModifyBoardPassword(board_id){	
			let userPassword = document.querySelector("#userWritePassword").value;
			let password = "";
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value="/getBoardPassword/"/>" + board_id + ".do");
			xhr.send();
			
			xhr.onload = () => {
				if(xhr.status == 200){
 					password = xhr.response;
					
					if(userPassword == password){
						//console.log("패스워드 일치");
						location.href = "<c:url value="/modifyBoard.do"/>?board_id=" + board_id + "&password=" + password;

					} else{
						alert("비밀번호가 일치하지 않습니다.");
						if(document.querySelector("#userWritePasswordContainer").querySelector("#error_msg") == null || document.querySelector("#userWritePasswordContainer").querySelector("#error_msg") == undefined){					
							document.querySelector("#userWritePasswordContainer").innerHTML += "<span id='error_msg'>비밀번호를 확인해주세요</span>";
						}
						document.querySelector("#userWritePassword").value = "";
						
					}  
				}else{
					//console.log(xhr.response);
				}
			}
			
		}
		
		
		
		function enterBoardPassword(board_id){
			let userPassword = document.querySelector("#userWritePassword").value;
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value="/getBoardPassword/"/>" + board_id + ".do");
			xhr.send();
			
			xhr.onload = () => {
				if(xhr.status == 200){
 					let password = xhr.response;
					
					if(userPassword == password){
						//console.log("패스워드 일치");
						let xhr = new XMLHttpRequest();
						xhr.open("Delete", "<c:url value="/board/"/>" + board_id + "/" + password + ".do");
						xhr.send();
						
						xhr.onload = () => {
							if(xhr.status == 200){
								alert("삭제되었습니다.");
								location.href = "<c:url value="/list.do"/>";
							} else{
								alert("삭제를 실패했습니다.");
							}
						}

					} else{
						if(document.querySelector("#userWritePasswordContainer").querySelector("#error_msg") == null || document.querySelector("#userWritePasswordContainer").querySelector("#error_msg") == undefined){					
							document.querySelector("#userWritePasswordContainer").innerHTML += "<span id='error_msg'>비밀번호를 확인해주세요</span>";
						}
						document.querySelector("#userWritePassword").value = "";
					}  
				}else{
					//console.log(xhr.response);
				}
			}
			
		}
		
		*/
		

		
		
		
		
		
		
	</script>
</body>
</html>