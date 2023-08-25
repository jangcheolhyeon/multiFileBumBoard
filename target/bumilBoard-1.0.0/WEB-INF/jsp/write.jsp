<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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


<!-- container -->
<div id="container">
    <section class="visual">              
        <h1  class="logo"><a href=""#>범일정보</a></h1>
        <div class="v_txt">
          <h2 class="txt_cover"><span class="move_point"><b>온라인 문의</b></span></h2>
          <p class="txt_cover">㈜범일정보에서 제공하는 온라인 문의 게시판은 로그인 없이 아래의 기본 정보 입력 후<br>고객의 의견을 수렴하는 서비스를 제공하고 있습니다.
          </p>   
          
          <a href="https://cloud.kt.com/product" target="_blank" class="go_box"> 상품별 상세 내역 확인  바로가기 </a>             
        </div>
        <div class="inner"></div>              
      </section>
     

    <!-- CONT -->
    <section id="content" class="content__body">
        <div class="cont">

			<form id="form" <%-- action="<c:url value="/testMulti.do"/>" method="POST" enctype="multipart/form-data" --%> >
            <table class="boardWrite no_line">
                <caption>게시판 상세보기</caption>
                <colgroup>
                    <col style="width:15%">
                    <col style="width:35%">
                    <col style="width:15%">
                    <col style="width:35%">
                </colgroup>
                <!-- board_id 가져오기 -->
                <c:if test="${not empty param.board_id}">
                	<input type="hidden" value="${param.board_id}" name="board_id" />
                </c:if>
                <tbody>
                    <tr>
                        <th scope="row">회신 이메일</th>
                        <td>
                            <input type="text" class="form" value="${boardInfo.writer}" placeholder="텍스트 입력" title="텍스트 입력" name="writer" id="writerEmail">
                        	<input type="password" name="board_password" value="${boardInfo.board_password}" placeholder="게시판 비밀번호 입력하세요"> 
                        </td>

                        </td>
                        <th scope="row">연락처</th>
                        <td>
                            <div class="phone-number">
                                <select class="form" name="first_phone" id="firstPhoneNumber">
                                    <option value="010" >010</option>
                                    <option value="011">011</option>
                                </select>
                                <input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력" name="mid_phone" id="midPhoneNumber" maxlength=4>
                                <input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력" name="end_phone" id="endPhoneNumber" maxlength=4>
                            </div>
                        </td>
                    </tr>
                    <tr>                                
                        <th scope="row">문의서비스</th>
                        <!-- modify할때 -->
                        <c:if test="${modifyState == 1}">
	                        <td>
	                        
	                            <select class="form wp100" id="serviceType" name="service" >
									<c:forEach items="${serviceList}" var="serviceType">
										<option value="<c:out value="${serviceType.service_name}"/>" ${serviceType.service_name == boardInfo.service ? 'selected' : ''}>${serviceType.service_name}</option>										
									</c:forEach>
	                            </select>
	                           
	                        </td>
                        </c:if>
                        
                        <!-- write할때 -->
                        <c:if test="${modifyState == 0}">
	                        <td>
	                        
	                            <select class="form wp100" id="serviceType" name="service" >
									<c:forEach items="${serviceList}" var="serviceType">
										<option value="<c:out value="${serviceType.service_name}"/>" >${serviceType.service_name}</option>
									</c:forEach>
	                            </select>
	                           
	                        </td>
                        </c:if>
                        
                        
                        <th scope="row">문의유형</th>
                        <td>
                        	<!-- modify할때 -->
                        	<c:if test="${modifyState == 1}">
	                   	        <select class="form wp100" id="selectType1" name="type1" onchange="onChangeType1()">
	                                <c:forEach items="${type1List}" var="type1">
	                                	<option value="<c:out value="${type1.pk_code}"/>" ${type1.pk_code == boardInfo.type1 ? 'selected' : ''} >${type1.code_name}</option>                                
	                                </c:forEach>
                        		</select>
                        		
	                            <select class="form wp100" id="selectType2" name="type2">
	                                <option>선택하세요</option>
	                            </select>     
                        	</c:if>
                        	
                        	
                        	
                        	<!-- write할때 -->
                        	<c:if test="${modifyState == 0}">
	                   	        <select class="form wp100" id="selectType1" name="type1" onchange="onChangeType1()">
	                            	<option>선택하세요</option>
	                                <c:forEach items="${type1List}" var="type1">
	                                	<option value="<c:out value="${type1.pk_code}"/>">${type1.code_name}</option>                                
	                                </c:forEach>
	                            </select>
	                            <select class="form wp100" id="selectType2" name="type2">
	                                <option>선택하세요</option>
	                            </select>                         	
                        	</c:if>
                        	
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">제목</th>
                        <td colspan="3"><input type="text" class="form" value="${boardInfo.title}" placeholder="텍스트 입력" title="텍스트 입력" name="title" id="title"></td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3">
                            <textarea class="form" title="텍스트 입력" name="content" id="content">${boardInfo.content}</textarea>
                        </td>
                    </tr>
                    <tr class="file-tr">
                        <th scope="row">첨부파일</th>
                        <td colspan="3">

                            <ul class="file-list">
     						 	<c:forEach items="${boardFiles}" var="file" varStatus="status">
									<li id="getfileElement" <%-- data-filenum="${status.index} --%>">
										<div class="form-file">
											<span><c:out value="${file.original_file_name}"/>
												<%-- <input type="hidden" name="original_file_name" value="<c:out value="${file.original_file_name}"/>" /> --%>
												<input type="hidden" name="file_name" value="<c:out value="${file.file_name}"/>" />
												<span id="deleteFile" onclick='deleteFileClick(this)'>X</span>
											</span>
										</div>
									</li>
                            	</c:forEach>
                            
<%--                             	<c:forEach items="${boardFiles}" var="file" varStatus="status">
									<li id="fileElement" data-filenum="${status.index}">
										<div class="form-file">
											<span><c:out value="${file.original_file_name}"/>
												<span id="deleteFile" onclick='deleteFileClick(this)'>X</span>
											</span>
										</div>
									</li>
                            	</c:forEach> --%>
                            
                            
<!--                                 <li>
                                    <div class="form-file">
                                        <input type="text" class="form" title="텍스트 입력" placeholder="파일을 선택해주세요">
                                        <button class="btn-txt"><span class="blind">검색</span><i class="fas fa-link"></i></button>
                                        <button class="btn-txt form-fileDelete"><i class="fas fa-times-circle"></i></button>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-file">
                                        <input type="text" class="form" title="텍스트 입력" placeholder="파일을 선택해주세요">
                                        <button class="btn-txt"><span class="blind">검색</span><i class="fas fa-link"></i></button>
                                        <button class="btn-txt form-fileDelete"><i class="fas fa-times-circle"></i></button>
                                    </div>
                                </li> -->
                            </ul>
<!--                             <button class="btn-txt form-fileAdd"><i class="fas fa-plus"></i> 파일추가</button> -->
							
							
							
							<input type="file" id="uploadFile" name="uploadFile" multiple="multiple"/>

                        </td>
                    </tr>
                </tbody>
            </table>


            <div style="margin:15px 5px 5px 5px">
                <ul class="radio">
                    <li>
                        <input type="checkbox" id="r1" name="rg1" >
                        <label for="r1">개인정보 수집/이용 동의</label></li>
                </ul>
            </div>
            <table class="boardWrite">
                <colgroup>
                    <col style="width:15%">
                    <col style="width:65%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">항목</th>
                        <td>회신 이메일, 휴대전화번호, 첨부파일</td>
                    </tr>
                    <tr>
                        <th scope="row">수집목적</th>
                        <td>고객 민원 접수, 연락 및 처리 결과 안내 통지일</td>
                    </tr>
                    <tr>
                        <th scope="row">보유기간</th>
                        <td>법정 보존기간으로 소비자 불만/분쟁 처리 후 3년</td>
                    </tr>
                </tbody>
            </table>

                <div class="btnWrap">
	                <div class="fr">
	                
	                	<!-- write 작성할때 -->
	                	<c:if test="${empty param.board_id}">
		                    <a href="<c:url value='list.do'/>" class="btn btn-danger">취소</a>
		                    <a href="#this" class="btn btn-primary" onclick="onClickWriteBtn()"><i class="fas fa-check"></i> <button type="button" id="writeBtn">저장</button></a>
	                	</c:if>
	                	
	                	<!-- modify할때 -->
	                	<c:if test="${not empty param.board_id}">
		                    <a href="<c:url value="list.do"/>" class="btn btn-danger">취소</a>
		                    <a href="#this" class="btn btn-primary" onclick="onClickUpdateBtn()"><i class="fas fa-check"></i> <button type="button" id="updateBtn">수정</button></a>
	                	</c:if>
	                	
	                </div>
                </div>

            </form>



        </div>
    </section>
</div>


</body>

<script>


	const dataTransfer = new DataTransfer();
	let deleteFiles = document.querySelectorAll("#deleteFile");
	let fileIdx = 0;

	document.querySelector("#uploadFile").addEventListener("change", (e) => {
		
		console.log(e.target.files);
		let file = e.target.files[0];
		console.log("file = " + file);
		
		
		let currentFile = null;
		let fileArr = document.querySelector("#uploadFile").files;
		console.log(fileArr);
		if(fileArr != null && fileArr.length > 0){
			for(let i=0;i<fileArr.length;i++){
				if(fileArr[i] == file){
					currentFile = fileArr[i];
					dataTransfer.items.add(fileArr[i]);					
				}
			}
			
			document.querySelector("#uploadFile").files = dataTransfer.files;
		}
		
		
		
		//if(file != ""){
			console.log("file if");
			let files = e.target.files;
			
 			if(document.querySelectorAll("fileElement") != undefined){
				//console.log("fileElement");
				let objs = document.querySelectorAll("#fileElement");
				//console.log(objs);
/* 				for(let i=0;i<objs.length;i++){
					objs[i].remove();
				} */
				
				for(let i=0;i<objs.length;i++){
					//console.log(objs[i].innerText.substr(0, objs[i].innerText.length - 2));
					//console.log(files);
					//objs[i].remove();
				}
			} 
			//console.log(files);

			//for(let i=0;i<dataTransfer.files.length;i++){
				
				//let currentFile = dataTransfer.files[i];
				//console.log("currentFile = ", files[0]);
				//console.log(currentFile);
				
				//if()
					

				console.log(currentFile);
					
				let reader = new FileReader();
				reader.readAsDataURL(currentFile);
				reader.onload = (e) => {

	                
					let objs = document.querySelectorAll("#fileElement");
	
	                 let liTag = "<li id='fileElement' data-filenum="+ fileIdx + ">";
	                 fileIdx++;
	                 liTag += "<div class='form-file'>"
	                 liTag += "<span>";
	                 liTag += currentFile.name;
	                 liTag += " <span id='deleteFile' onclick='deleteFileClick(this)'>X</span>"
	                 liTag += "</span>";
	                 liTag += "</div>";
	                 liTag += "</li>";
	                 
	                 document.querySelector(".file-list").innerHTML += liTag;        
	                 deleteFiles = document.querySelectorAll("#deleteFile");
	            	
					console.log("deleteFiles");
					console.log(deleteFiles);
				
				}
			//}
			
		//}
		
	});
	
	// x박스 누르면 삭제
	function deleteFileClick(e){
		console.log(e.parentElement.parentElement.parentElement);
		console.log(e.parentElement.parentElement.parentElement.dataset.filenum);
		let fileNum = e.parentElement.parentElement.parentElement.dataset.filenum;
		
		let fileArr = document.querySelector("#uploadFile").files;
		console.log(fileArr);
		
		for(let i=0;i<dataTransfer.files.length;i++){
			if(i == fileNum){
				dataTransfer.items.remove(i);
				break;
			}
		}
		
		
		console.log("삭제 된 후 dataTransfer");
		console.log(dataTransfer.files);
		
		console.log(e.parentElement.parentElement.parentElement);
		e.parentElement.parentElement.parentElement.remove();
	}
	
	
	
	//타입1이 변경되면 ajax로 타입2 가져오기
	function onChangeType1(){
		let selectType1 = document.querySelector("#selectType1").value;
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value="/updateType2/"/>" + selectType1 + ".do");
		xhr.send();
		
		xhr.onload = () => {
			if(xhr.status == 200){
				let dataArr = JSON.parse(xhr.response);
				
				let selectType2 = document.querySelector("#selectType2"); 
				//아이디가 타입2인거에 html 만들어주기
				let makeHTML = "";
				makeHTML += "<option>선택하세요</option>";
				for(let i=0;i<dataArr.length;i++){
					let pk_code = dataArr[i].pk_code;
					let codeName = dataArr[i].code_name;
                	
//                	<option value="<c:out value="${type1.pk_code}"/>">${type1.code_name}</option>                                

					//makeHTML += "<option value=" + pk_code + ">" + codeName + "</option>";

					if(pk_code == "${boardInfo.type2}"){
						makeHTML += "<option value='" + pk_code + "' " + "selected" + ">" + codeName + "</option>";
					} else{
						makeHTML += "<option value=" + pk_code + ">" + codeName + "</option>";
					}
				}
				
				selectType2.innerHTML = makeHTML;		
				
				
			} else{
				console.log(xhr.response);
			}
		}
	}
	
	// 서브밋 할때 유효성 각각 유효성 체크
	function onClickWriteBtn(){		
		let writerEmail = document.querySelector("#writerEmail");
		let firstNumber = document.querySelector("#firstPhoneNumber").value;
		let midNumber = document.querySelector("#midPhoneNumber").value;
		let endNumber = document.querySelector("#endPhoneNumber").value;
		let totalPhoneNumber = firstNumber + midNumber + endNumber;
		
		let serviceType = document.querySelector("#serviceType");
		let selectType1 = document.querySelector("#selectType1");
		let selectType2 = document.querySelector("#selectType2");
		let title = document.querySelector("#title");
		let content = document.querySelector("#content");
		
		if(!regExpTest()){
			return;
		}
		
		let form = document.querySelector("#form");
		form.method = "POST";
		form.action = "<c:url value="showWriteData.do"/>";
		form.enctype="multipart/form-data";
		//form.submit();
	}
	
	function onClickUpdateBtn(){
		console.log("onClickUpdateBtn");
		
		let writerEmail = document.querySelector("#writerEmail");
		let firstNumber = document.querySelector("#firstPhoneNumber").value;
		let midNumber = document.querySelector("#midPhoneNumber").value;
		let endNumber = document.querySelector("#endPhoneNumber").value;
		let totalPhoneNumber = firstNumber + midNumber + endNumber;
		
		let serviceType = document.querySelector("#serviceType");
		let selectType1 = document.querySelector("#selectType1");
		let selectType2 = document.querySelector("#selectType2");
		let title = document.querySelector("#title");
		let content = document.querySelector("#content");
		
		if(!regExpTest()){
			return;
		}
		
		let form = document.querySelector("#form");
		form.method = "POST";
		form.action = "<c:url value="modifyBoard.do"/>";
		form.enctype="multipart/form-data";
		//form.submit();
		
	}
	
	
	if(${modifyState} == 1){
		onChangeType1();
			
	}
	
	function regExpTest(){
		let writerEmail = document.querySelector("#writerEmail");
		let firstNumber = document.querySelector("#firstPhoneNumber").value;
		let midNumber = document.querySelector("#midPhoneNumber").value;
		let endNumber = document.querySelector("#endPhoneNumber").value;
		let totalPhoneNumber = firstNumber + midNumber + endNumber;
		
		let serviceType = document.querySelector("#serviceType");
		let selectType1 = document.querySelector("#selectType1");
		let selectType2 = document.querySelector("#selectType2");
		let title = document.querySelector("#title");
		let content = document.querySelector("#content");
		let agreeCheckBox = document.querySelector("#r1");
		
		
		//이메일 정규식
		console.log("이메일");
		
		
		//전화번호 정규식
		console.log("전화번호");
		
		//serviceType
		console.log("서비스타입");
		
		
		//selectType1
		console.log("타입1");
		
		//selectType2
		console.log("타입2");
		
		//title
		console.log("제목");
		
		//content
		console.log("내용");
		
		
		
		//checkbox
		console.log("체크박스");
		console.log(agreeCheckBox.checked);
		if(!agreeCheckBox.checked){
			alert("개인정보 수집/이용 동의를 해주세요");
			return false;
		}

		
		return true;
		
		
	}
	
	
	

	
</script>

</html>