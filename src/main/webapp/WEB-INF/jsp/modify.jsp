<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isAdmin" value="${sessionScope.id != null || sessionScope.id == 'admin' ? true : false }" />

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

            <table class="boardWrite no_line">
                <caption>게시판 상세보기</caption>
                <colgroup>
                    <col style="width:15%">
                    <col style="width:35%">
                    <col style="width:15%">
                    <col style="width:35%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">회신 이메일</th>
                        <td>
                            <input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력">
                        </td>
                        <th scope="row">연락처</th>
                        <td>
                            <div class="phone-number">
                                <select class="form" id="">
                                    <option>카테고리1</option>
                                    <option>카테고리2</option>
                                </select>
                                <input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력">
                                <input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력">
                            </div>
                        </td>
                    </tr>
                    <tr>                                
                        <th scope="row">문의서비스</th>
                        <td>
                            <select class="form wp100" id="">
                                <option>카테고리1</option>
                                <option>카테고리2</option>
                            </select>
                        </td>
                        <th scope="row">문의유형</th>
                        <td>
                            <select class="form wp100" id="">
                                <option>카테고리1</option>
                                <option>카테고리2</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">제목</th>
                        <td colspan="3"><input type="text" class="form" placeholder="텍스트 입력" title="텍스트 입력"></td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3">
                            <textarea class="form" title="텍스트 입력"></textarea>
                        </td>
                    </tr>
                    <tr class="file-tr">
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                            <ul class="file-list">
                                <li>
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
                                </li>
                            </ul>
                            <button class="btn-txt form-fileAdd"><i class="fas fa-plus"></i> 파일추가</button>
                        </td>
                    </tr>
                </tbody>
            </table>


            <div style="margin:15px 5px 5px 5px">
                <ul class="radio">
                    <li>
                        <input type="checkbox" id="r1" name="rg1" value="Y" checked="">
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
                    <a href="#this" class="btn btn-danger">취소</a>
                    <a href="#this" class="btn btn-primary"><i class="fas fa-check"></i> 저장</a>
                </div>
                </div>

                



        </div>
    </section>
</div>


</body>

</html>