<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<head>
	<meta charset="UTF-8">
	<title>헤더</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/final_main.css">
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
	<header>
        <div class="hTitle">
            <div class="nav1">
                <div class="hTitle1"><a href='Index.do'><img src="resources/images/logo/logo_medium.png" class="titleImg"/></a></div>
                <div class="hTitle1">
                    <form action="Search.do" autocomplete="off">
                        <fieldset class="sUrl">
                            <input class="searchInput" type="text" name="keyword" required placeholder=" 검색" >
                            <!-- onKeyPress="if( event.keyCode==13 ){search();}" -->
                            <div class="sAfter"></div>
                        </fieldset>
                    </form>
                </div>
                <div class="hTitle1">
                    <div class="htMenu">
                   <%
    String clientId = "xdLgSJ5mS0zQ1kf7UqKd";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "Kq4vS0xwTO";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:9090/lml/", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
                    	<c:if test="${ !empty sessionScope.loginUser }">
                        <div class="myMenu">
                            <img src="resources/images/icon/menu/iconmonstr-menu-thin-72.png"><!-- 이미지 클릭 시 서브메뉴 나옴 -->
                            <ul class="mySub">
	                            <c:url var="mypage" value="MyPage.do">
									<c:param name="uNum" value="${ loginUser.user_num }"/>
								</c:url>
                                <a href='${mypage}'><li><div class="mySub1">마이페이지</div></li></a>
                                <a href='Settings.do'><li><div class="mySub1">설정</div></li></a>
                                
                                <a href="logout.do"><li><div class="mySub1">로그아웃</div></li></a>
                            </ul>
                        </div><!--메뉴-->
                        <div class="heart"><img src="./resources/images/icon/menu/iconmonstr-heart-thin-72.png" class="heart heartIcon"></div><!--알림-->
                        <div><a href="Message.do"><img src="./resources/images/icon/menu/iconmonstr-speech-bubble-thin-72.png"></a></div><!--채팅-->
                        </c:if>
                        
						<c:if test="${ empty sessionScope.loginUser }">
                        	<a href="login.do"><div class="loginBtn">로그인/가입</div></a>
                        </c:if>
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
	            	$(".hMenu").css("top", "60px");
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
            $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-favorite-3-72.png');
        });

        // 다른곳 클릭하면 하트 원래대로
        $("body").click(function(e){
            if(!$(".heart").has(e.target).length){
                $('.heartIcon').attr('src','resources/images/icon/menu/iconmonstr-heart-thin-72.png');
            }
        });
        
        // 검색 페이지 이동
        function search(){
            location.href="Search.do";
        };
    </script>