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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/final_main.css">
    <link rel="stylesheet" href="../css/final_main2.css">
    <link rel="stylesheet" href="./CSS/final_mypage.css">
</head>
<body>
    <header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href="../lml_main.html"><img src="../images/logo/logo_medium.png" class="titleImg"/></a></div>
                <div class="hTitle1">
                    <form action="#" autocomplete="off">
                        <fieldset class="sUrl">
                            <input class="searchInput" type="text" required placeholder=" 검색">
                            <div class="sAfter"></div>
                        </fieldset>
                    </form>
                </div>
                <div class="hTitle1">
                    <div class="htMenu">
                        <div class="myMenu">
                            <img src="../images/icon/menu/iconmonstr-menu-thin-72.png"><!-- 이미지 클릭 시 서브메뉴 나옴 -->
                            <ul class="mySub">
                                <a href="#"><li><div class="mySub1">마이페이지</div></li></a>
                                <a href="../lml_Settings.html"><li><div class="mySub1">설정</div></li></a>
                                <a href="../lml_main_logout.html"><li><div class="mySub1">로그아웃</div></li></a>
                            </ul>
                        </div><!--메뉴-->
                        <div class="heart"><img src="../images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><a href="../lml_message.html"><img src="../images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></a></div><!--채팅-->
                    </div>
                </div>
            </div>


        </div>
        <div class="hMenu">
            <div class="hMenu1">
                <div class="hMenu2 on"><span>인기순</span></div>
                <div class="hMenu2"><span>최신순</span></div>
                <div class="hMenu2"><span>팔로잉</span></div>
                <div class="hMenu2"><span>QnA</span></div>
                <span></span>
            </div>
            
        </div>
    </header>
    <section>
        <div class="myPage">
            <div class="my_top" >
                <div class="top">
                <div class="my_photo">
                    <img src="./images/프로필.png">
                </div>
                <div class="my_info">
                    <div class="info">
                          <h2>ooOP._.s  <button class="info_btn" onclick="location.href='../lml_Settings.html'" ><img src="./images/설정.png" class="btn_img">
                        </button> </h2>
                    </div>
                    <div class="info" >
                        <div class="iftext_1"><span>게시글</span></div>
                        <div class="iftext"><span>팔로워</span></div>
                        <div class="iftext"><span>팔로잉</span></div>
                    </div>
                    <div class="info">
                        <div class="name">유지만</div>
                        <div class="iftext_2">여러분 파이팅~~</div>
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
                            <div class=img><img src="./images/블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
            </table>
            
            </div>
            <div class="tagtable">
                <table>
                <tr>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/블루 (1).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/블루 (3).jpg" class="cImg"></div>
                    </td>
                    <td>
                        <div class="content">
                            <div class=img><img src="./images/무지갱.ico" class="cImg"></div>
                    </td>
                </tr>
            </table>
            
            </div>
        </div>
   
    </section>
    
    <script>
        $(document).ready(function() {
        $('mytable').show(); //페이지를 로드할 때 표시할 요소
        $('.tagtable').hide(); //페이지를 로드할 때 숨길 요소
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


        /* 마이페이지 햄버거메뉴 */
        $(document).ready(function(){
            $(".mySub").hide();
            $(".myMenu").click(function(){
                $("ul",this).slideToggle("fast");
            });
        });

        $("body").click(function(e){
            if(!$(".myMenu").has(e.target).length){
                $(".mySub").hide();
            }
        });


        /* 알림 아이콘 클릭 시 아이콘 변경 */
        $(".heart").click(function(){
            $('.heartIcon').attr('src','../images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // 다른곳 클릭하면 하트 원래대로
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','../images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
    </script>
    
</body>
</html>