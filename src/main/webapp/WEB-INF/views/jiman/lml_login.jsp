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
                <form id="login" action="mLogin.do" class="input-group" method="post">
                    <input name="id"  type="text" class="input-field" placeholder="User id" required>
                    <input name="upwd" type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit"> Login</button>
                </form>
                <form id="register" action="mInsert.do" class="input-group">
                                       <!-- 아이디 중복 체크  --> 
                      <input name="id" type="text" id="userId" class="input-field" placeholder="User id" required>
                    <span class="guide ok">사용가능</span>
						<span class="guide error">사용불가능</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						<!-- 아이디 중복 체크 끝 -->
                   
                    <input name="uname" id="inputname" type="text" class="input-field" placeholder="name" required>
                    <span class="guides oks">사용가능</span>
						<span class="guides errors">사용불가능</span>
						<input type="hidden" name="nameDuplicateCheck" id="nameDuplicateCheck" value="0">
					
                    <input name="mail" id="inputemail" type="email" class="input-field" placeholder="Your Email" required>
                    <input name="upwd" id="inputpwd" type="password" class="input-field" placeholder="Enter Password (문자+숫자+특수문자)" required>
                    <input name="m_phone"  type="number" class="input-field" placeholder="phone" required>
                    <input name="height" id="inheight" type="number" class="input-field" placeholder="hight" required style="width: 100px;">cm
                  &nbsp; &nbsp;
                    <input name="weight" id="inweight" type="number" class="input-field"  placeholder="weight" required style="width: 100px;" >kg <br>
                    <div class="radio_gender">
                    <input type="radio"  name="gender"  class="radio" value="M" >male &nbsp;
                    <input type="radio"  name="gender" class="radio"  value="F">female <br>
                    </div>
                    <div class="Register">
                        <input type="checkbox" id="termsbtn" class="checkbox"><span>Terms and conditions</span>
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
    			// 중복체크 여부,유효성검사
    			
    			if($("#termsbtn").prop("checked")==true){
    				
    			
    			//비밀번호 유효성 검사
			      var pw = $("#inputpwd").val();
			      var id = $("#userId").val();
				    var checkNumber = pw.search(/[0-9]/g);
				    var checkEnglish = pw.search(/[a-z]/ig);
				 
				    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
				        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
				        return false;
				    }else if(checkNumber <0 || checkEnglish <0){
				        alert("숫자와 영문자를 혼용하여야 합니다.");
				        return false;
				    }else if(/(\w)\1\1\1/.test(pw)){
				        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
				        return false;
				    }else if(pw.search(id) > -1){
				        alert("비밀번호에 아이디가 포함되었습니다.");
				        return false;
				    }else {
					console.log("비밀번호 ok")	
					}
				   
			//아이디 중복 검사
    			if($("#idDuplicateCheck").val() == 0){
    				alert("사용가능한 아이디를 입력해주세요");
    				$("#userId").focus();
    				return false;
    			}
			//이름 중복 검사 
    			if($("#nameDuplicateCheck").val() == 0){
    				alert("사용가능한 이름을 입력해주세요");
    				$("#inputname").focus();
    				return false;
    			}
			//키 유효성
			if($("#inheight").val()<50 || $("#inheight").val()>300 ){
				alert("키는 50이상 300이하여야 합니다.");
				return false;
			}
			//몸무게 유효성
			if($("#inweight").val()<30){
				alert("30kg이상의 값을 입력해주세요.");
				return false;
			}
			



			//if($("input:radio[name='gender']").is(":checked")== true){
				if($(".radio").is(":checked")== false){
				alert("성별을 체크해주세요.");
				return false;
			}

			
			return true;
			
    		}else{
    			console.log(' ㅠㅠ');
    			alert('이용약관에 동의해주세요');
    			return false;
    		}
    		
            }
            
            
            
            
            
            
    	
    		$(function(){
    			$("#userId").on("keyup",function(){
    				console.log("아이디 여까지2");
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
    			
    					}
    				});
    			});
    		});
    		
    		
    		//닉네임 중복 체크 여부
    		$(function(){
    			$("#inputname").on("keyup",function(){
    				console.log("이름 여까지2");
    				var userName = $("#inputname").val();
    				
    				if(userName.length < 2){
    					$(".guides").hide();
    					$("#nameDuplicateCheck").val(0);
    					return;
    				}
    				
    				$.ajax({
    					url:"nameCheck.do",
    					data:{name:userName},
    					type:"post",
    					success:function(data){
    						console.log(data);
    						if(data == "ok"){
    							$(".errors").hide();
    							$(".oks").show();
    							$("#nameDuplicateCheck").val(1);
    						}else{
    							$(".oks").hide();
    							$(".errors").show();
    							$("#nameDuplicateCheck").val(0);
    						}
    					},
    					error:function(jqxhr, textStatus,errorThrown){
    						console.log("ajax 처리 실패");
    						//에러 로그
    					
    					}
    				});
    			});
    		});
    		
    		
    
        </script>
    </body>
</html> 