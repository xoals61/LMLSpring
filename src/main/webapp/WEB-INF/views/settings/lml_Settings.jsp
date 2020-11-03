<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_MyInfo</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/final_main.css">
    <link rel="stylesheet" href="./css/final_Settings.css">
</head>
<body>
    <header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href="./lml_main.html"><img src="./images/logo/logo_medium.png" class="titleImg"/></a></div>
                <div class="hTitle1">
                    <form action="#" autocomplete="off">
                        <fieldset class="sUrl">
                            <input class="searchInput" type="text" required placeholder=" ê²ì">
                            <div class="sAfter"></div>
                        </fieldset>
                    </form>
                </div>
                <div class="hTitle1">
                    <div class="htMenu">
                        <div class="myMenu">
                            <img src="./images/icon/menu/iconmonstr-menu-thin-72.png"><!-- ì´ë¯¸ì§ í´ë¦­ ì ìë¸ë©ë´ ëì´ -->
                            <ul class="mySub">
                                <li><div class="mySub1">ë§ì´íì´ì§</div></li>
                                <a href="./lml_Settings.html"><li><div class="mySub1">ì¤ì </div></li></a>
                                <a href="./lml_main_logout.html"><li><div class="mySub1">ë¡ê·¸ìì</div></li></a>
                            </ul>
                        </div><!--ë©ë´-->
                        <div class="heart"><img src="./images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--ìë¦¼-->
                        <div><img src="./images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></div><!--ì±í-->
                    </div>
                </div>
            </div>


        </div>
        <div class="hMenu">
            <div class="hMenu1">
                <div class="hMenu2 on"><span>ì¸ê¸°ì</span></div>
                <div class="hMenu2"><span>ìµì ì</span></div>
                <div class="hMenu2"><span>íë¡ì</span></div>
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
                        <li class="minimenu put"><a href="./lml_Settings.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mprofile.png">íë¡í ìì </a></li>
                        <li class="minimenu"><a href="./lml_Settings_2.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mrock.png">ë¹ë°ë²í¸ ë³ê²½</a></li>
                        <li class="minimenu"><a href="./lml_Settings_5.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/xxx.png">ì¹êµ¬ê´ë¦¬</a></li>
                        <li class="minimenu"><a href="./lml_Settings_3.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Memail.png">ì´ë©ì¼ ë¬¸ì</a></li>
                    </div>
                </div>
               
                <div class="rContent">
                    <form class="MyInfo" method="POST" action="#">
                        <div class="profile">
                            <div class="photo">
                                <img src="./images/mainImg/jessie.jpg" id="Myimg">
                            </div>
                            <div class="ChangeBtn">
                                 <input type="file" id="file" name="file" onchange="changeValue(this)"  accept="image/*" />
                                 <button type="button" id="btn-upload">íë¡í ì¬ì§ ë°ê¾¸ê¸°</button></div>
                        </div>
                        <div class="ModifyInfo">
                            <label class=Info>ëë¤ì &nbsp;&nbsp;&nbsp;
                                 <input class="infoinput" name="id" type="text" placeholder="ì ëì§±"></label><br>
                            <label class=Info>ì´ë©ì¼ &nbsp;&nbsp;&nbsp; 
                                <input class="infoinput" name="email" type="email" placeholder="yoon2zzang@naver.com"></label><br>
                            <label class=Info>ì íë²í¸  
                                <input class="infoinput" name="phone" type="text" placeholder="010-2612-2238"></label><br>
                            <label class=Info>ì±  ë³ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input class="gender" type="radio" name="gender" value="woman" checked>ì¬
                                <input class="gender" type="radio" name="gender" value="man">ë¨
                            </label><br>
                            <label class=Info>ëª¸ë¬´ê² &nbsp;&nbsp;&nbsp;
                                 <input class="infoinput" name="weight" type="text" placeholder="70" maxlength="3" numberOnly></label><br>
                            <label class=Info>í¤ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input class="infoinput" name="height" type="text" maxlength="3" placeholder="180" numberOnly></label><br>
                            <label class=Info2 id="infomy">ìê¸°ìê°</label> &nbsp; 
                            <textarea id="inrtoduce" name="inrtoduce" type="text" placeholder="ë§ì§ ì¶ì²í´ì£¼ì¸ì"></textarea><br>
                        </div>
                        <div class="Fbtn">
                            <button class="btns2"id="Delbtn" type="button" onClick="location.href='lml_Settings_4.html'">íí´</button>
                            <input class="btns2" id="Sbtn" type="submit" value="ë³ê²½íê¸°"/>
                        </div>
                    </form>
               </div>
                </div>
            </div>
        </div>
    </section>

    
    <script>
        /*ì ì¶ ë²í¼ ëë ì ë*/
        $(document).ready(function(){
          $('#Sbtn').on('click', function(){
            alert("ë³ê²½ëììµëë¤.")
          });
      });
  </script>
    <script>
        /*ì í ë©ë´ ê³ ì */
          $(document).ready(function(){
            $('.minimenu').on('click', function(){
                $(this).addClass('put');
                $(this).siblings().removeClass('put');
            });
        });
    </script>

  <script>
    function changeValue(value) {

        console.log("ì¤íëë");

        // srcë¥¼ ë³ê²½í  imgíê·¸
       var preview = document.querySelector('#Myimg');
        
        // ìë°ì¤í¬ë¦½í¸ìì 0, -0, null, false, NaN, undefined, ''ì ê°ì ê°ì§ë©´ falseì´ê³ , ëë¨¸ì§ë trueì´ë¤.
        // ê°ì²´ or ë³ìë¥¼ ë£ê² ëë©´ trueê° ëì¤ë¯ë¡ ì¤íì´ ëë ê²ì´ë¤..!!
        if(value.files && value.files[0]) {
           
           // FileReaderë?
   // ì¹ ì íë¦¬ì¼ì´ìì´ ë¹ëê¸°ì ì¼ë¡ ë°ì´í°ë¥¼ ì½ê¸° ìíì¬ ì½ì íì¼ì ê°ë¦¬í¤ë Fileí¹ì Blobê°ì²´ë¥¼ ì´ì©í´ 
   // íì¼ì ë´ì©ì(í¹ì raw dataë²í¼ë¡) ì½ê³  ì¬ì©ìì ì»´í¨í°ì ì ì¥íë ê²ì ê°ë¥íê² íë¤.
             var reader = new FileReader();
           
             reader.onload = function (e) {
                console.log(e); // ProgressEventê°ì²´
                console.log(e.target); // FileReaderê°ì²´
                console.log(e.target.result); // íì¼ì Stringê°ì¼ë¡ ì ì¥íë¤.
                 $('#Myimg').attr('src', e.target.result); // srcë¥¼ ë¶ë¬ì¨ Stringê°ì¼ë¡ ì¹ííë¤.
             }
             reader.readAsDataURL(value.files[0]); // DataURL íìì¼ë¡ íì¼ì ì½ì´ì¤ë¤.
        }
    }
</script>

<script type="text/javascript">
    /*iputíê·¸ íì¼*/
    $(function () {    
    $('#btn-upload').click(function (e) {
    e.preventDefault();   
    $('#file').click();
    });
    
    });
       
    </script>

      <script>
          /* ìë¨ ë©ë´ ì¤í¬ë¡¤ */
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
        /* ë§ì´íì´ì§ íë²ê±°ë©ë´ */
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


        /* ìë¦¼ ìì´ì½ í´ë¦­ ì ìì´ì½ ë³ê²½ */
        $(".heart").click(function(){
            $('.heartIcon').attr('src','./images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // ë¤ë¥¸ê³³ í´ë¦­íë©´ íí¸ ìëëë¡
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','./images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
        
      </script>

<script>
    $(function(){
        $('li').click(function(){
            $('li').removeClass()
                $(this).addClass('on')
        });
    });
</script>

      
</body>
</html>