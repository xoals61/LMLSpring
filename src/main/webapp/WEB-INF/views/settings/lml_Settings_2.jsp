<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Change_Pwd</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/final_main.css">
    <link rel="stylesheet" href="./css/final_Settings_ChangePWd.css">
</head>
<body>
    <header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href="./lml_main.html"><img src="./images/logo/logo_medium.png" class="titleImg"/></a></div>
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
                            <img src="./images/icon/menu/iconmonstr-menu-thin-72.png"><!-- 이미지 클릭 시 서브메뉴 나옴 -->
                            <ul class="mySub">
                                <li><div class="mySub1">마이페이지</div></li>
                                <a href="./lml_Settings.html"><li><div class="mySub1">설정</div></li></a>
                                <a href="./lml_main_logout.html"><li><div class="mySub1">로그아웃</div></li></a>
                            </ul>
                        </div><!--메뉴-->
                        <div class="heart"><img src="./images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><img src="./images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></div><!--채팅-->
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
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                        <li class="minimenu"><a href="./lml_Settings.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu put"><a href="./lml_Settings_2.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu"><a href="./lml_Settings_5.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/xxx.png">친구관리</a></li>
                        <li class="minimenu"><a href="./lml_Settings_3.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Memail.png">이메일 문의</a></li>
                     </div>
                </div>
                   <div class="rContent">
                    <form method="POST" action="" class="ChangePwd">
                        <div class="login_input_container">
                            <div class="Origin Pwd">현재 비밀번호
                                <input class="login_input" name="origin_password" type="password" maxlength="13" required>
                            </div>
                            
                            <div class="New Pwd">새로운 비밀번호
                                <input class="login_input" id="pwd1" name="password1" type="password" maxlength="13" required>
                            </div>

                            <div class="Confirm Pwd">비밀번호 확인
                                <input class="login_input" id="pwd2" name="password2" type="password" maxlength="13" required>
                            </div>
                            <div class="alert-success Al" id="alert-success">&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.</div>
                            <div class="alert-danger Al" id="alert-danger">&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</div>
                        </div>
                        <div class="login_btn_container">
                            <input type="submit" class="login_btn" id="submit" value="변경하기" disabled>
                        </div>
                    </form>
                </div>
                   </div>
                </div>
            </div>
        </div>
    </section>

     <script>
         /*pwd 입력값 비교*/
         $(function(){
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function(){
                var pwd1 = $("#pwd1").val();
                var pwd2 = $("#pwd2").val();
                if(pwd1 !=""&& pwd2 !=""){
                    if(pwd1==pwd2){
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                        $("#submit").removeAttr("disabled");
                        console.log("넘어감")
                    }else if(pwd1!=pwd2){
                        $("alert-success").hide();
                        $("#alert-danger").show();
                        $("#submit").attr("disabled","disabled");
                        console.log("안넘어감")
                    }
                }
            });
         });
    </script>

    <script>
        /*선택 메뉴 고정*/
        $(document).ready(function(){
          $('.minimenu').on('click', function(){
              $(this).addClass('put');
              $(this).siblings().removeClass('put');
          });
      });
  </script>

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
                    $(".hMenu").css("top", "50px");
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
            $('.heartIcon').attr('src','./images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // 다른곳 클릭하면 하트 원래대로
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','./images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
        
      </script>

      
</body>
</html>