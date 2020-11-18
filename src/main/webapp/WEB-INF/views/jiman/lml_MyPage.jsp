<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/final_main2.css">
    <link rel="stylesheet" href="resources/css/jmCSS/final_mypage.css">
</head>
<body>

 <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="myPage">
            <div class="my_top" >
                <div class="top">
                <div class="my_photo">
                    <img src="resources/images/profileImg/${loginUser.rename_profile_img}">
                </div>
                <div class="my_info">
                    <div class="info">
                          <h2>${loginUser.id}  <button class="info_btn" onclick="location.href='Settings.do'" ><img src="resources/images/jmImg/설정.png" class="btn_img">
                        </button> </h2>
                    </div>
                    <div class="info" >
                        <div class="iftext_1"><span>게시글</span></div>
                        <div class="iftext"><span>팔로워&nbsp; ${Follower} </span></div>
                        <div class="iftext"><span>팔로우&nbsp; ${Follow}</span></div>
                    </div>
                    <div class="info">
                        <div class="name">${loginUser.uname} </div>
                        <c:if test="${empty loginUser.intro}">
                         <div class="iftext_2">자기소개를 등록해주세요.</div>
                        </c:if>
                        <c:if test="${!empty loginUser.intro}">
                        <div class="iftext_2">${loginUser.intro}</div>
                        </c:if>
                        
                    </div>
               
                </div>
            </div>
             <div>
             </div>
            </div>
            <div class="tagmenu">
               <span><button id="my" class="tagbtn" onclick="my()">MY 게시물</button> <button id="tag" class="tagbtn" onclick="tag()">태그된 게시물</button></span>
            </div>
            <div class="mytable">
                <table>
                <tr>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
            </table>
            
            </div>
            <div class="tagtable">
                <table>
                <tr>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="resources/images/jmImg/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
            </table>
            
            </div>
        </div>
   
    </section>
    
    <script>
        $(document).ready(function() {
        $('mytable').show(); //페이지를 로드할 때 표시할 요소
        $('.tagtable').hide(); //페이.지를 로드할 때 숨길 요소
        $('#tag').click(function(){
        $ ('.mytable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.tagtable').show(); //클릭 시 두 번째 요소 표시
        $('#my').click(function(){
         $ ('.tagtable').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('.mytable').show(); //클릭 시 두 번째 요소 표시
        })
        return false;
        });
        });

        /* 알림 아이콘 클릭 시 아이콘 변경 */
    </script>
    
</body>
</html>