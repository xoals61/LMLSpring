<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_Email</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/final_main.css">
    <link rel="stylesheet" href="./css/final_Settings_address.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

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
                        <li class="minsimenu"><a href="./lml_Settings.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="./lml_Settings_2.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu put"><a href="./lml_Settings_5.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/xxx.png">친구관리</a></li>
                        <li class="minimenu"><a href="./lml_Settings_3.html" class="Ma"> <img class="mainbtn" src="./images/icon/settings/Memail.png">이메일 문의</a></li>
                     
                    </div>
                </div>
                <div class="rContent">
                        <div class="friends">
                            <input class="fsearch" type="text">
                            <input class-="fbtn" type="button" value="검색">
                        </div>
                        <div class="change_address">
                            <!-- <button>FALLOWER</button>
                            <button>FALOWOO</button>
                            <button>BLOCK FRIENDS</button> -->
                            <ul class="tags">
                                <li><a id="add_wer" href="#">팔로워</a></li><br><br>
                                <li><a id="add_woo" href="#">팔로우</a></li><br><br>
                                <li><a id="add_block" href="#">차단</a></li>
                            </ul>
                        </div>
                    <div class="address" id="address">
                            <table class="add_table">
                                <tr>
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/무지갱.ico" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">팔로워친구목록</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로잉"></td>
                                </tr>
                                <tr>
                                    <td>팔로워친구목록입니다</td>
                                </tr>
                            </table>
                            <table class="add_table">
                                <tr>
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (1).jpg" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">유지만</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로우"></td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                </tr>
                            </table>
                            <table class="add_table">
                                <tr>
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (3).jpg" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">강은지</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로잉"></td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                </tr>
                            </table>
                    </div>
                    <div id="address_woo" class="address">
                        <table class="add_table">
                            <tr>
                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/무지갱.ico" alt="#"></td>
                                <td class="idtd" style="width: 30%;">팔로우친구</td>
                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로우"></td>
                            </tr>
                            <tr>
                                <td>팔로우친구목록입니다</td>
                            </tr>
                        </table>
                        <table class="add_table">
                            <tr>
                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (1).jpg" alt="#"></td>
                                <td class="idtd" style="width: 30%;">유지만</td>
                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로우"></td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                            </tr>
                        </table>
                        <table class="add_table">
                            <tr>
                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (3).jpg" alt="#"></td>
                                <td class="idtd" style="width: 30%;">강은지</td>
                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로우"></td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                            </tr>
                        </table>
                </div>
                <div id="address_block" class="address">
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/무지갱.ico" alt="#"></td>
                            <td class="idtd" style="width: 30%;">차단친구</td>
                            <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
                        </tr>
                        <tr>
                            <td>차단친구목록입니다</td>
                        </tr>
                    </table>
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (1).jpg" alt="#"></td>
                            <td class="idtd" style="width: 30%;">유지만</td>
                            <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                        </tr>
                    </table>
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="./JIMAN/images/블루 (3).jpg" alt="#"></td>
                            <td class="idtd" style="width: 30%;">강은지</td>
                            <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                        </tr>
                    </table>
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
        
        //버튼 값 변경
       
        $(function(){
            $('.button1, .button2').click( function() {
            if( $(this).val() == '팔로우' ) {
                $(this).val('팔로잉').css("background","rgb(50, 158, 230)");
            }
            else {
                $(this).val('팔로우').css("background"," #f5f5f5");
            }
            
            
        });

        });


     
        $(document).ready(function() {
        $('#address').show(); //페이지를 로드할 때 표시할 요소
        $('#address_woo').hide(); //페이지를 로드할 때 숨길 요소
        $('#address_block').hide(); //페이지를 로드할 때 숨길 요소
        // $('#add_woo').click(function(){
        // $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
        // $ ('#address_block').hide(); //클릭 시 세번째 요소 숨김
        // $ ('#address_woo').show(); //클릭 시 두 번째 요소 표시
        // $('#add_block').click(function(){
        //  $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
        //  $ ('#address_woo').hide(); //클릭 시 두 번째 요소 숨김
        // $ ('#address_block').show(); //클릭 시 세 번째 요소 표시
        // })
        // $('#address').click(function(){
        //  $ ('#address_woo').hide(); //클릭 시 첫 번째 요소 숨김
        //  $ ('#address_block').hide(); //클릭 시 두 번째 요소 숨김
        // $ ('#address').show(); //클릭 시 세 번째 요소 표시
        // })
        
        
        return false;
        // });
        });

        $('#add_woo').click(function(){
        $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
        $ ('#address_block').hide(); //클릭 시 세번째 요소 숨김
        $ ('#address_woo').show(); //클릭 시 두 번째 요소 표시
        return false;
        });
        $('#add_block').click(function(){
         $ ('#address').hide(); //클릭 시 첫 번째 요소 숨김
         $ ('#address_woo').hide(); //클릭 시 두 번째 요소 숨김
        $ ('#address_block').show(); //클릭 시 세 번째 요소 표시
        return false;
        });
        $('#add_wer').click(function(){
         $ ('#address_woo').hide(); //클릭 시 첫 번째 요소 숨김
         $ ('#address_block').hide(); //클릭 시 두 번째 요소 숨김
        $ ('#address').show(); //클릭 시 세 번째 요소 표시
        return false;
        });

        </script>


      
</body>
</html>