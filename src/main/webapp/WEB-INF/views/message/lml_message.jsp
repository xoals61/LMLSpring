<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_message.css">

</head>





<!-- 여기 채팅 겁난다 -->
<script src="http://52.79.234.164:3001/socket.io/socket.io.js"></script>






<body>
	<jsp:include page="../common/header.jsp" />

	<section>
		<div class="sContent">
			<div class="aTable">
				<div class="aBox">
					<div class="lContent">
						<div class="direct-div">Direct</div>
						<div class="direct-user-div">


							<c:forEach var="message" items="${messageList}">
								<div class="direct-user ${message.touser}">
									<img
										src="resources/images/profileImg/${message.rename_profile_img}">
									<div class="user-li">
										<div class="li-userId">${message.touser}</div>
										<div class="li-direct">안녕</div>
										<input class="userId" type="hidden" value="${message.touser }">
									</div>
								</div>
								<script>
                                    $('.${message.touser}').on('click', function () {
                                    	$(".message").html('');
                                    	$(".inputsend").removeAttr("disabled");
                                    	rename_profile_img ="${message.rename_profile_img}";
                                    	touser = "${message.touser}";
                                    	 var as = "${loginUser.id}";
                                        $(this).addClass('select-bar');
                                        $(this).siblings().removeClass('select-bar');
                                          
                                        $("#user-id").html('${message.touser}');
                                    	$("#user-img").attr("src","resources/images/profileImg/${message.rename_profile_img}");
                                    	$("#user-img").removeAttr("hidden");
                                    	
                                       socket.emit("leaveRoom",as);
                                       socket.emit("login",as,"${message.chatroomid}");
                                       
                                       
                                       $.ajax({
                       					url : "chatLog.do",
                       					data : {chatid : "${message.chatroomid}"},
                       					type : "post",
                       					success : function(data) {
                       						$.each(data,function(index,value){
                       						if(value.user_name == "${message.touser}"){
                       							$('.message').append('<div class="yourmessagediv"><img src="resources/images/profileImg/${message.rename_profile_img}" class="yourmessageimg"><div style="width:fit-content;   margin: 0 0 0 82px;"><p class="yourmessage">'+ value.chatlog +'</p></div></div>');
                       							
                            				}else{
                            					$('.message').append('<div class="mymessagediv"><p class="mymessage">' + value.chatlog + '</p></div>');
                            				}
                       						$('.message').scrollTop($('.message').prop('scrollHeight'));
                       						
                       						});	
                       					},
                       					error : function(jqxhr, textStatus, errorThrown) {
                       						console.log("ajax 오류");

                       					}
                       					});
                                    	
                                       
                                    });
                                    
                                    
                                    
                                    </script>

							</c:forEach>




						</div>
					</div>

					<div class="rContent">
						<div class="message-user-div">
							<div class="user-img">
								<a href="MyPage.do"><img id="user-img" src="" hidden="true"></a>
							</div>
							<a href="#"><div class="user-id" id="user-id"></div></a>
						</div>
						<div class="message"></div>
						<div class="send">
							<input type="text" class="inputsend" placeholder="메세지 입력..."
								onKeyPress="if( event.keyCode==13 ){send();}">
						</div>

					</div>

				</div>

			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

	<script>
        var socket;
        var rename_profile_img;
        var touser;
        
            $(document).ready(function () {
            	
            	 
            	socket = io("http://52.79.234.164:3001");
                
            	
            	 socket.on('send_msg',function(name,msg){
        				if(name ==touser){
        				$('.message').append('<div class="yourmessagediv"><img src="resources/images/profileImg/' + rename_profile_img +  '" class="yourmessageimg"><div style="width:fit-content;   margin: 0 0 0 82px;"><p class="yourmessage">'+ msg +'</p></div></div>');
        				}
        				 $('.message').scrollTop($('.message').prop('scrollHeight'));
        			});
            	$(".inputsend").attr("disabled",true);
            });
           
            /* 채팅 */
            function send(){
                if($('.inputsend').val()!=''){
              //ggd
                var as = "${loginUser.id}";
                var mas = '<div class="mymessagediv"><p class="mymessage">' + $('.inputsend').val() + '</p></div>';
                $('.message').append(mas);
                socket.emit("send_msg",as,$(".inputsend").val());
         
                $('.inputsend').val('');
                $('.message').scrollTop($('.message').prop('scrollHeight'));
                
                }
            };
			
			

        </script>

</body>
</html>