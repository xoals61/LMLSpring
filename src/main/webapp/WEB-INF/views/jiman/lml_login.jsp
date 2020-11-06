<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
          <link rel="stylesheet" href="resources/css/jmCSS/final_login.css">
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOGIN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="resources/images/jmImg/fb.png" alt="facebook">
                    <img src="resources/images/jmImg/tw.png" alt="twitter">
                    <img src="resources/images/jmImg/gl.png" alt="google">
                </div>
                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User id" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit" onclick="location.href='../lml_main.html'"> Login</button>
                </form>
                <form id="register" action="mInsert.do" class="input-group">
                                       <!-- 아이디 중복 체크  --> 
                      <input name="id" type="text" id="userId" class="input-field" placeholder="User id" required>
                    <span class="guide ok">사용가능</span>
						<span class="guide error">사용불가능</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						<!-- 아이디 중복 체크 끝 -->
                   
                    <input name="uname" type="text" class="input-field" placeholder="name" required>
                    <input name="mail" type="email" class="input-field" placeholder="Your Email" required>
                    <input name="upwd" type="password" class="input-field" placeholder="Enter Password" required>
                    <input name="m_phone" type="tel" class="input-field" placeholder="phone" required>
                    <input name="height" type="number" class="input-field" placeholder="hight" required style="width: 100px;">cm
                  &nbsp; &nbsp;
                    <input name="weight" type="number" class="input-field"  placeholder="weight" required style="width: 100px;" >kg <br>
                    <div class="radio_gender">
                    <input type="radio" name="gender"  class="radio" value="M">male &nbsp;
                    <input type="radio" name="gender" class="radio"  value="F">female <br>
                    </div>
                    <div class="Register">
                        <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                        </div>
                        <button class="submit" onclick="return validate();">REGISTER</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            
            function validate(){
    			// 아이디 중복체크 여부
    			if($("#idDuplicateCheck").val() == 0){
    				alert("사용가능한 아이디를 입력해주세요");
    				$("#userId").focus();
    				return false;
    			}else{
    				return true;
    			}
    		}
    	
    		$(function(){
    			console.log("여까지1");
    			$("#userId").on("keyup",function(){
    				console.log("여까지2");
    				var userId = $(this).val();
    				
    				if(userId.length < 2){
    					$(".guide").hide();
    					$("#idDuplicateCheck").val(0);
    					return;
    				}
    				
    				$.ajax({
    					url:"idCheck.do",
    					data:{id:userId},
    					type:"post",
    					success:function(data){
    						console.log(data);
    						if(data == "ok"){
    							$(".error").hide();
    							$(".ok").show();
    							$("#idDuplicateCheck").val(1);
    						}else{
    							$(".ok").hide();
    							$(".error").show();
    							$("#idDuplicateCheck").val(0);
    						}
    					},
    					error:function(jqxhr, textStatus,errorThrown){
    						console.log("ajax 처리 실패");
    						//에러 로그
    						console.log(jqxhr);
    						console.log(textStatus);
    						console.log(errorThrown);
    					}
    				});
    			});
    		});
    		
        </script>
    </body>
</html> 