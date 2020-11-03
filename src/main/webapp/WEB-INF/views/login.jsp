<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="./CSS/final_login.css">
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
                    <img src="./images/fb.png" alt="facebook">
                    <img src="./images/tw.png" alt="twitter">
                    <img src="images/gl.png" alt="google">
                </div>
                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit" onclick="location.href='../lml_main.html'"> Login</button>
                </form>
                <form id="register" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User id" required>
                    <input type="email" class="input-field" placeholder="Your Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="tel" class="input-field" placeholder="phone" required>
                    <input type="number" class="input-field" placeholder="hight" required style="width: 100px;">cm
                  &nbsp; &nbsp;
                    <input type="number" class="input-field"  placeholder="weight" required style="width: 100px;" >kg <br>
                    <div class="radio_gender">
                    <input type="radio" name="gender"  class="radio" value="male">male &nbsp;
                    <input type="radio" name="gender" class="radio"  value="female">female <br>
                    </div>
                    <div class="Register">
                        <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                        </div>
                        <button class="submit">REGISTER</button>
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
        </script>
    </body>
</html> 