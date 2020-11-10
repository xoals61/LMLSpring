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
  
    <link rel="stylesheet" href="resources/css/final_Settings_address.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                       <li class="minimenu"><a href="Settings.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="Settings2.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu put">
							<c:url var="followList" value="Settings5.do">
								<c:param name="uNum" value="${ loginUser.user_num }"/>
							</c:url>
                        	<a href="${followList}" class="Ma"> 
                        		<img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리
                        	</a>
						</li>
                        <li class="minimenu"><a href="Settings3.do" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Memail.png">이메일 문의</a></li>
                     
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
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/무지갱.ico" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">팔로워친구목록</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로잉"></td>
                                </tr>
                                <tr>
                                    <td>팔로워친구목록입니다</td>
                                </tr>
                            </table>
                            <table class="add_table">
                                <tr>
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/블루 (1).jpg" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">유지만</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button1" type="button" value="팔로우"></td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                </tr>
                            </table>
                            <table class="add_table">
                                <tr>
                                    <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/블루 (3).jpg" alt="#"></td>
                                    <td class="idtd" style="width: 30%;">강은지</td>
                                    <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로잉"></td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                </tr>
                            </table>
                    </div>
                    <div id="address_woo" class="address">
                      <!-- 팔로우친구 -->
                      	<c:if test="${ !empty FollowList }">
							<c:forEach var="f" items="${ FollowList }">
	                       		<table class="add_table">
		                            <tr>
		                                <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/${f.profile_img }" alt="#"></td>
		                                <td class="idtd" style="width: 30%;">${f.id }</td>
		                                <td class="btntd" rowspan="2" style="width: 30%;"><input class="button2" type="button" value="팔로우"></td>
		                            </tr>
		                            <tr>
		                                <td>${f.uname }</td>
		                            </tr>
		                        </table>
	                       </c:forEach>
						</c:if>
						<c:if test="${ empty FollowList }">
							<table class="add_table">
			                    <tr>
			                        <td class="imgtd" rowspan="2" style="width: 10%;"></td>
			                        <td class="idtd" style="width: 30%;">다른 사람을 팔로우 해보셔</td>
			                        <td class="btntd" rowspan="2" style="width: 30%;"></td>
			                    </tr>
			                    <tr>
			                        <td></td>
			                    </tr>
		                	</table>
						</c:if>
                        
                </div>
                <div id="address_block" class="address">
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/무지갱.ico" alt="#"></td>
                            <td class="idtd" style="width: 30%;">차단친구</td>
                            <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
                        </tr>
                        <tr>
                            <td>차단친구목록입니다</td>
                        </tr>
                    </table>
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/블루 (1).jpg" alt="#"></td>
                            <td class="idtd" style="width: 30%;">유지만</td>
                            <td class="btntd" rowspan="2" style="width: 30%;"><input class="button3" type="button" value="차단"></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                        </tr>
                    </table>
                    <table class="add_table">
                        <tr>
                            <td class="imgtd" rowspan="2" style="width: 10%;"><img class="userimg" src="resources/images/jmImg/블루 (3).jpg" alt="#"></td>
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