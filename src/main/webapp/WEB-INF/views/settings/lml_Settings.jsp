<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>lml_MyInfo</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./././resources/css/final_Settings.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <section>
        <div class="AContent">
            <div class="Atable">
                <div class="Abox">
                   <div class="lContent">
                    <div class="lmenu">
                        <li class="minimenu put"><a href="./lml_Settings.html" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mprofile.png">프로필 수정</a></li>
                        <li class="minimenu"><a href="./lml_Settings_2.html" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Mrock.png">비밀번호 변경</a></li>
                        <li class="minimenu"><a href="./lml_Settings_5.html" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/xxx.png">친구관리</a></li>
                        <li class="minimenu"><a href="./lml_Settings_3.html" class="Ma"> <img class="mainbtn" src="resources/images/icon/settings/Memail.png">이메일 문의</a></li>
                    </div>
                </div>
               
                <div class="rContent">
                    <form class="MyInfo" method="POST" action="#">
                        <div class="profile">
                            <div class="photo">
                                <img src="resources/images/mainImg/jessie.jpg" id="Myimg">
                            </div>
                            <div class="ChangeBtn">
                                 <input type="file" id="file" name="file" onchange="changeValue(this)"  accept="image/*" />
                                 <button type="button" id="btn-upload">프로필 사진 바꾸기</button></div>
                        </div>
                        <div class="ModifyInfo">
                            <label class=Info>닉네임 &nbsp;&nbsp;&nbsp;
                                 <input class="infoinput" name="id" type="text" placeholder="유니짱"></label><br>
                            <label class=Info>이메일 &nbsp;&nbsp;&nbsp; 
                                <input class="infoinput" name="email" type="email" placeholder="yoon2zzang@naver.com"></label><br>
                            <label class=Info>전화번호  
                                <input class="infoinput" name="phone" type="text" placeholder="010-2612-2238"></label><br>
                            <label class=Info>성  별 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input class="gender" type="radio" name="gender" value="woman" checked>여
                                <input class="gender" type="radio" name="gender" value="man">남
                            </label><br>
                            <label class=Info>몸무게 &nbsp;&nbsp;&nbsp;
                                 <input class="infoinput" name="weight" type="text" placeholder="70" maxlength="3" numberOnly></label><br>
                            <label class=Info>키 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input class="infoinput" name="height" type="text" maxlength="3" placeholder="180" numberOnly></label><br>
                            <label class=Info2 id="infomy">자기소개</label> &nbsp; 
                            <textarea id="inrtoduce" name="inrtoduce" type="text" placeholder="맛집 추천해주세요"></textarea><br>
                        </div>
                        <div class="Fbtn">
                            <button class="btns2"id="Delbtn" type="button" onClick="location.href='lml_Settings_4.jsp'">탈퇴</button>
                            <input class="btns2" id="Sbtn" type="submit" value="변경하기"/>
                        </div>
                    </form>
               </div>
                </div>
            </div>
        </div>
    </section>

    
    <script>
        /*제출 버튼 눌렀을 때*/
        $(document).ready(function(){
          $('#Sbtn').on('click', function(){
            alert("변경되었습니다.")
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
    function changeValue(value) {

        console.log("실행되니");

        // src를 변경할 img태그
       var preview = document.querySelector('#Myimg');
        
        // 자바스크립트에서 0, -0, null, false, NaN, undefined, ''의 값을 가지면 false이고, 나머지는 true이다.
        // 객체 or 변수를 넣게 되면 true가 나오므로 실행이 되는 것이다..!!
        if(value.files && value.files[0]) {
           
           // FileReader란?
   // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File혹은 Blob객체를 이용해 
   // 파일의 내용을(혹은 raw data버퍼로) 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 한다.
             var reader = new FileReader();
           
             reader.onload = function (e) {
                console.log(e); // ProgressEvent객체
                console.log(e.target); // FileReader객체
                console.log(e.target.result); // 파일을 String값으로 저장한다.
                 $('#Myimg').attr('src', e.target.result); // src를 불러온 String값으로 치환한다.
             }
             reader.readAsDataURL(value.files[0]); // DataURL 형식으로 파일을 읽어준다.
        }
    }
</script>

<script type="text/javascript">
    /*iput태그 파일*/
    $(function () {    
    $('#btn-upload').click(function (e) {
    e.preventDefault();   
    $('#file').click();
    });
    
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