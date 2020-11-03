<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Email</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
   
    <link rel="stylesheet" href="./css/final_Settings_Email.css">
</head>
<body>
   <jsp:include page="WEB-INF/views/common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                        <li class="minimenu"><a href="./lml_Settings.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="./lml_Settings_2.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu"><a href="./lml_Settings_5.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/xxx.png">친구관리</a></li>
                        <li class="minimenu put"><a href="./lml_Settings_3.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Memail.png">이메일 문의</a></li>
                     </div>
                </div>
                <div class="rContent">
                    <div class="emailform">
                        문의사항 혹은 저희 홈페이지에 대한<br>
                        피드백이 있으시다면<br>
                        하단의 메일 버튼을 누르시거나<br>
                        <a href="mailto:feedback@lml.com">feedback@lml.com</a> 으로 메일을 보내주세요!
                    </div>
                    <div class="Ebtn">
                        <a href="mailto:feedback@lml.com"><img id="emailbtn" src="./images/icon/settings/email2.png"></a>
                    </div>
               </div>
                </div>
            </div>
        </div>
    </section>

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
      </script>

      <script>
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