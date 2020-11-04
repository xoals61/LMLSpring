<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>헤더</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/final_main.css">
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
	<header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href='Index.do'><img src="resources/images/logo/logo_medium.png" class="titleImg"/></a></div>
                <div class="hTitle1">
                    <form action="#" autocomplete="off">
                        <fieldset class="sUrl">
                            <input class="searchInput" type="text"  required placeholder=" 검색" onKeyPress="if( event.keyCode==13 ){search();}">
                            <div class="sAfter"></div>
                        </fieldset>
                    </form>
                </div>
                <div class="hTitle1">
                    <div class="htMenu">
                        <div class="myMenu">
                            <img src="resources/images/icon/menu/iconmonstr-menu-thin-72.png"><!-- 이미지 클릭 시 서브메뉴 나옴 -->
                            <ul class="mySub">
                                <a href='MyPage.do'><li><div class="mySub1">마이페이지</div></li></a>
                                <a href='Settings.do'><li><div class="mySub1">설정</div></li></a>
                                <a href="Logout.do"><li><div class="mySub1">로그아웃</div></li></a>
                                 <a href="login.do"><li><div class="mySub1">로그인</div></li></a>
                            </ul>
                        </div><!--메뉴-->
<<<<<<< HEAD
                        <div class="heart"><img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><a href="./lml_message.html"><img src="resources/images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></a></div><!--채팅-->
=======
                        <div class="heart"><img src="./resources/images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><a href="Message.do"><img src="./resources/images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></a></div><!--채팅-->
>>>>>>> branch 'master' of https://github.com/xoals61/LMLSpring.git
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
    
    <script>
	    /* 상단 메뉴 스크롤 */
	    $(function () {
	    	var lastScrollTop = 0,
	        	delta = 15;
	    	$(window).scroll(function (event) {
	        	var st = $(this).scrollTop();
	        	if (Math.abs(lastScrollTop - st) <= delta) return;
	        	if ((st > lastScrollTop) && (lastScrollTop > 0)) {
	            	$(".hMenu").css("top", "0px");
	        	} else {
	            	$(".hMenu").css("top", "60px");
	        	}
	        	lastScrollTop = st;
	    	});
		});
	    
	    $(document).ready(function(){
            $('.hMenu2').on('click', function(){
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
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
            $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // 다른곳 클릭하면 하트 원래대로
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
        
        // 검색 페이지 이동
        function search(){
            location.href="Search.do";
        };
    </script>