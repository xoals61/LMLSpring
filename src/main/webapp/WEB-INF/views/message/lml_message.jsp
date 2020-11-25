<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>채팅</title>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/final_message.css">
        
    </head>
    
    
    
    
    
      <!-- 여기 채팅 겁난다 -->
      <script src="http://52.79.234.164:3001/socket.io/socket.io.js"></script>
   
        
        
        
        
        
    <body>
       <jsp:include page="../common/header.jsp"/>

        <section>
            <div class="sContent" >
                <div class="aTable">
                    <div class="aBox">
                        <div class="lContent">
                            <div class="direct-div">Direct</div>
                            <div class="direct-user-div">
                                <div class="direct-user select-bar">
                                    <img src="resources/images/mainImg/pbuzz.jpg">
                                    <div class="user-li">
                                        <div class="li-userId">iambuzz</div>
                                        <div class="li-direct">안녕</div>
                                    </div>
                                </div>
                                <div class="direct-user">
                                    <img src="resources/images/mainImg/pandy.jpg">
                                    <div class="user-li">
                                        <div class="li-userId">chillyandy</div>
                                        <div class="li-direct">아이스 애플민트티 먹어</div>
                                    </div>
                                </div>
                                <div class="direct-user">
                                    <img src="resources/images/mainImg/pjessie.jpg">
                                    <div class="user-li">
                                        <div class="li-userId">jexxie</div>
                                        <div class="li-direct">진진삼계탕 ㅋ</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="rContent">
                            <div class="message-user-div">
                                <div class="user-img">
                                    <a href="MyPage.do"><img src="resources/images/mainImg/pbuzz.jpg"></a> 
                                </div>
                                <a href="MyPage.do"><div class="user-id">iambuzz</div></a>
                            </div>
                            <div class="message">
                                <div class="yourmessagediv">   
                                    <a href="MyPage.do"><img src="resources/images/mainImg/pbuzz.jpg" class="yourmessageimg"></a>
                                    <span class="yourmessage">안녕</span>
                                </div>
                                <div class="mymessagediv">    
                                    <span class="mymessage">안녕</span>
                                </div>
                            </div>
                            <div class="send">
                                <input type="text" class="inputsend" placeholder="메세지 입력..." onKeyPress="if( event.keyCode==13 ){send();}">
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </section>

        <jsp:include page="../common/footer.jsp"/>
        
        <script>
        var socket;
            $(document).ready(function () {
            	
            	
            	
            	
            	  var as = "${loginUser.id}";
            	  var roomname = "room1";
            	socket = io("http://52.79.234.164:3001");
            	  socket.emit("login",as,roomname);
                $('.direct-user').on('click', function () {
                    $(this).addClass('select-bar');
                    $(this).siblings().removeClass('select-bar');
                });

               
                
                
                socket.on('send_msg',function(name,msg){
    				console.log(msg);
    				console.log(name);
    				if(name =="149756660"){
    				$('.message').append('<div class="yourmessagediv"><img src="resources/images/mainImg/pbuzz.jpg" class="yourmessageimg"><span class="yourmessage">'+ msg +'</span></div>');
    				}
    				 $('.message').scrollTop($('.message').prop('scrollHeight'));
    			});
                
            });

            /* 채팅 */
            function send(){
                if($('.inputsend').val()!=''){
             //   $('.message').append('<div class="yourmessagediv"><img src="resources/images/mainImg/pbuzz.jpg" class="yourmessageimg"><span class="yourmessage">안녕</span></div>');
                
               var as = "${loginUser.id}";
                var mas = '<div class="mymessagediv"><span class="mymessage">' + $('.inputsend').val() + '</span></div>';
                $('.message').append(mas);
                socket.emit("send_msg",as,$(".inputsend").val());
         
                $('.inputsend').val('');
                $('.message').scrollTop($('.message').prop('scrollHeight'));
                
                }
            };

			

        </script>

    </body>
</html>