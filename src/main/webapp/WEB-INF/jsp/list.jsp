<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isAdmin" value="${sessionScope.id != null || sessionScope.id == 'admin' ? true : false}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>범일정보 게시판</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2, user-scalable=no">
<!--     <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/font.css">
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/design.js"></script> -->
    
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
    <script type="text/javascript" src="<c:url value="/js/jquery-1.12.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/design.js"/>"></script>
    
</head>
<body>

<!-- container -->
<div id="container">
    <section class="visual">              
      <h1 class="logo"><a href="#">범일정보</a></h1>
      <div class="v_txt">
        <h2 class="txt_cover"><span class="move_point"><b>온라인 문의</b></span></h2>
        <p class="txt_cover">㈜범일정보에서 제공하는 온라인 문의 게시판은 로그인 없이 아래의 기본 정보 입력 후<br>고객의 의견을 수렴하는 서비스를 제공하고 있습니다.
        </p>                
      </div>
      <div class="inner"></div>              
      
    </section>
    

    <!-- CONT -->
    <section id="content" class="content__body">
    <a href="<c:url value="write.do"/>" class="btn btn-primary list-write-btn">글쓰기</a>
        <div class="cont">

          <table class="boardList-tbl3 qna-tbl">
            <caption>게시판 목록</caption>
            <colgroup>
                <col class="wp5">
                <col class="wp15">
                <col>
                <col class="wp10">
                <col class="wp10">
                <col class="wp5">
                <col class="wp10">
              </colgroup>
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">구분</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성일</th>
                    <th scope="col">작성자</th>
                    <th scope="col">조회</th>
                    <th scope="col">답변여부</th>
                  </tr>
            </thead>
            <tbody>
            	<c:forEach items="${boardList}" var="board">
            		<tr id="board${board.board_row}">
            			<td class="td-num"><c:out value="${board.board_row}" /></td>
            			<td class="td-type"><c:out value="${board.service}" /></td>
            			<%-- <td class="td-title"><span onclick="clickTitle('board${board.board_row}', '${board.board_id}')"><c:out value="${board.title}"/></span><span class="new"></span></td> --%>
            			<td class="td-title"><a href="#" onclick="clickTitle('board${board.board_row}', '${board.board_id}')"><c:out value="${board.title}"/></a><span class="new"></span></td>
            			<td class="td-info"><fmt:formatDate value="${board.reg_date}" pattern="y-M-d"/></td>
            			<td class="td-info td-admin"><c:out value="${board.writer}" /></td>
            			<td class="td-view"><c:out value="${board.view_count}" /></td>
            			
	        			<c:if test="${board.comment_state == 1}">
            				<td class="td-an"><span class="answer"><i class="fas fa-check"></i> 답변완료</span></td>
            			</c:if>
            			<c:if test="${board.comment_state == 0}">
							<td class="td-an"><span class="answer2"><i class="fa fa-exclamation" aria-hidden="true"></i>미답변</span></td>            			
						</c:if>
            		</tr>            		
            	</c:forEach>
<!--                 <tr>
                  <td class="td-num">3</td>
                  <td class="td-type">청년월세 지원사업(대구형)</td>
                  <td class="td-title"><a href="#this">청년학교 딴길을 신청하고싶은데 자격요건이 궁금합니다?<span class="new"></span></a></td>
                  <td class="td-info">2021-11-16</td>
                  <td class="td-info td-admin">관리자</td>
                  <td class="td-view">9</td>
                  <td class="td-an"><span class="answer"><i class="fas fa-check"></i> 답변완료</span></td>
                </tr>
                <tr>
                  <td class="td-num">2</td>
                  <td class="td-type">청년 전월세 대출이자 지원사업</td>
                  <td class="td-title"><a href="#this">청년학교 딴길을 신청하고싶은데 자격요건이 궁금합니다?<span class="new"></span></a></td>
                  <td class="td-info">2021-11-16</td>
                  <td class="td-info td-admin">관리자</td>
                  <td class="td-view">9</td>
                  <td class="td-an"><span class="answer"><i class="fas fa-check"></i> 답변완료</span></td>
                </tr>
                <tr>
                  <td class="td-num">1</td>
                  <td class="td-type">청년 전세 임차보증금 반환보증료 지원사업</td>
                  <td class="td-title"><a href="#this">데이터테이블의 제목입니다 hover시 tr에 효과 </a></td>
                  <td class="td-info">2021-11-16</td>
                  <td class="td-info td-admin">관리자</td>
                  <td class="td-view">9</td>
                  <td class="td-an"><span class="answer2"><i class="fa fa-exclamation" aria-hidden="true"></i>미답변</span></td>
                </tr> -->
              </tbody>
              </table>

<!--             <ul class="pagination2">
                <li class="pageCtr page1st"><a href="#this"><span class="blind">첫 페이지</span></a></li>
                <li class="pageCtr pagePrev"><a href="#this">PREV</a></li>
                <li class="pageOn"><a href="#this">1</a></li>
                <li><a href="#this">2</a></li>
                <li><a href="#this">3</a></li>
                <li><a href="#this">4</a></li>
                <li><a href="#this">5</a></li>
                <li class="pageCtr pageNext"><a href="#this">NEXT</a></li>
                <li class="pageCtr pageLast"><a href="#this"><span class="blind">마지막 페이지</span></a></li>
              </ul> -->
              
              <ul class="pagination2">
              	<c:if test="${pageInfo.showPrev}">              	
	         		<li class="pageCtr page1st"><a href="<c:url value="/list.do?page=1"/>"><span class="blind">첫 페이지</span></a></li>
	                <li class="pageCtr pagePrev"><a href="<c:url value="/list.do?page=${pageInfo.beginPage-1}"/>">PREV</a></li>
              	</c:if>
              	
              	
				<c:forEach var="i" begin="${pageInfo.beginPage}" end="${pageInfo.endPage}" step="1">
					<c:if test="${i == pageInfo.page || pageInfo.page == null}">
		                <li class="pageOn"><a href="#this">${i}</a></li>
					</c:if>
					
					<c:if test="${i != pageInfo.page}">
						<li><a href="<c:url value="/list.do?page=${i}"/>">${i}</a></li>
					</c:if>
				</c:forEach>


                <c:if test="${pageInfo.showNext}">                
	                <li class="pageCtr pageNext"><a href="<c:url value="/list.do?page=${pageInfo.endPage+1}"/>">NEXT</a></li>
	                <li class="pageCtr pageLast"><a href="<c:url value="/list.do?page=${pageInfo.totalPage}"/>"><span class="blind">마지막 페이지</span></a></li>
                </c:if>
              </ul>
              
                
        </div>
    </section>
</div>

	<script>	
		function clickTitle(board_num, board_id){
			if(${isAdmin} == true){
				location.href = "<c:url value='/readBoard.do'/>?board_id=" + board_id;
			}else{				
				if(document.querySelector(".td-password") != null || document.querySelector(".td-password") != undefined){
					document.querySelector(".td-password").remove();
				}
			
				//console.log("click");
				//console.log(board_num);
				//console.log(board_id);
								
				let currentBoardContainer = document.querySelector("#" + board_num);
				
				let passwordCheckBox = "<td class='td-password'>";
				passwordCheckBox += "비밀번호";
				passwordCheckBox += "<input type='password' class='form' id='userInputPassword' placeholder>"
				passwordCheckBox += "<a href='#' onclick='enterBoardPassword(event, " + board_id + ")'>확인</a>";
				passwordCheckBox += "</td>";
				
				currentBoardContainer.innerHTML += passwordCheckBox;
				
			}
			
		}
		
		function enterBoardPassword(e, board_id){
			e.preventDefault();
			//console.log("click boardEnter");
			
			let userInputPassword = document.querySelector("#userInputPassword").value;
			
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value="/getBoardPassword/"/>" + board_id + ".do");
			xhr.send();
			
			xhr.onload = () => {
				if(xhr.status == 200){
 					let password = xhr.response;
					
					if(userInputPassword == password){
						//console.log("true");
						location.href = "<c:url value='/readBoard.do'/>?board_id=" + board_id;
					} else{
 						if(document.querySelector(".td-password").querySelector("#error_msg") == null || document.querySelector(".td-password").querySelector("#error_msg") == undefined){					
							document.querySelector(".td-password").innerHTML += "<span id='error_msg'>비밀번호를 확인해주세요</span>";
						} 
						document.querySelector("#userInputPassword").value = "";
					}  
				}else{
					//console.log(xhr.response);
				}
			}
	
			
		}
	</script>

</body>
</html>