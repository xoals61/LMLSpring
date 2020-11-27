<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/final_search.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<section>
        <div class="hashtagSection">
            <div class="hashInfo">
                <div class="hashtag">
                   Tag 😜 ; ${keyword}
                </div>
                <a href="SearchHash.do">
                    <div class="hashMore">
                     <c:if test="${tagCount > 1}">
                        	${tagCount} 개의 게시글 더보기
                        </c:if>
                    </div>
                </a>
            </div>
            <div class="hashTable">
               <c:if test="${ !empty tagpost}">
                <table id="table">
                  		<c:forEach var="tagBoard" items="${tagpost }" varStatus="status" >
					<c:if test="${status.index mod 3 eq 0}">
					<tr>
					</c:if>
						<td>
							<div class="content">
								<div class=img>
									<img src="resources/buploadFiles/${tagBoard.image1}" class="cImg">
								</div>
						</td>
						
					<c:if test="${status.index mod 3 eq 2}">
					</tr>
					</c:if>
				
					</c:forEach>
					
                </table>
                </c:if>
                	<c:if test="${ empty tagpost}">
					<br>검색 결과가 없습니다
					</c:if>
            </div>
        </div>
    </section>
    <div class="divhr">
	<hr class="hr">
	</div>
    <section>
        <div class="userSection">
            <div class="userInfo">
                <div class="suser">
                    사용자
                </div>
                <a href="SearchUser.do?keyword=${keyword}">
                    <div class="suserMore">
                    	<c:if test="${userCount > 6}">
                        	${userCount} 명의 사용자 더보기
                        </c:if>
                    </div>
                </a>
            </div>
            <div class="userTable">
                <table>
                	<c:if test="${ !empty searchUser }">
                		<c:set var="i" value="0"/>
                		<c:forEach var="r" begin="1" end="3">
                			<tr>
	                			<c:forEach var="c" begin="1" end="2">
	                				<c:if test="${ !empty searchUser[i] }">
		                				<td>
		                					<c:set var="uNum" value="${searchUser[i].user_num }"/>
						                    <div class="infoDiv" >
						                        <div class="uImg" onclick="infoPage('${searchUser[i].id}');">
						                            <img src="resources/images/profileImg/${searchUser[i].rename_profile_img}">
						                        </div>
						                        <div class="uName" onclick="infoPage('${searchUser[i].id}');">
						                            <div class="uid">${searchUser[i].id}</div>
						                            <div class="uname">${searchUser[i].uname}</div>
						                        </div>
						                        <c:if test="${ !empty loginUser.id && loginUser.user_num != searchUser[i].user_num}">
							                        <div class="follow" id="${searchUser[i].user_num }">
							                            <div>팔로우</div>
							                        </div>
							                    </c:if>
						                    </div>
						                </td>
		                				<c:set var="i" value="${i+1}"/>
	                				</c:if>
	                				<c:if test="${ empty searchUser[i] }">
	                					<td>
	                						<div class="noinfoDiv">
	                							
	                						</div>
	                					</td>
	                				</c:if>
	                			</c:forEach>
                			</tr>
                		</c:forEach>
					</c:if>
					<c:if test="${ empty searchUser }">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과가 없습니다
					</c:if>
                </table>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
        // 게시물 마우스오버
        $(document).ready(function(){
            $('.chover').hide();
            $('.content').mouseover(function(){
                $('.chover',this).show();
            });
            $('.content').mouseout(function(){
                $('.chover').hide();
            });
        });
        
        function infoPage(id){
        	
        	console.log('id:'+ id);
        	//console.log("MyPage.do?uNum="+uNum);
        	location.href="userPage.do?id="+id;
        	
        	
        	
        	
        }
        
        $(document).ready(function(){
        	
        	var uNum = 0${loginUser.user_num};
        	
        	
        		console.log(uNum);
     
        	
			/* var searchUser = new Array();
			var searchUserCount = ${fn:length(searchUser)};
			
	 <c:forEach items="${searchUser}" var="su">
				searchUser.push({num:"${su.user_num}"});
			</c:forEach> 		
			
        	$.ajax({
				url:"searchFollowList.do",
				data:{uNum:uNum},
				dataType:"json",
				success:function(data){
					if(data.length > 0){
						for(var i=0; i<searchUser.length; i++){
							for(var j=0; j<data.length; j++){
								if(searchUser[i].num == data[j].to_follow){
									$("#"+data[j].to_follow).hide();
								}
							}
						}
					}else{
						alert("실패");
					}
				},
				error:function(jqxhr, textStatus,errorThrown){
					console.log("ajax 처리 실패");
				}
			}); */
        });
        
        $(".follow").click(function(e){
        	
        	var followQ = confirm('팔로우 하시겠습니까?');
        	
        	if(followQ){
	            var to_follow = $(this).attr('id');
	    
	            var from_follow = 0${loginUser.user_num};
	            console.log(to_follow);
	            console.log(from_follow);
	            
	            $.ajax({
					url:"followBtn.do",
					data:{toFollow:to_follow, fromFollow:from_follow},
					type:"post",
					success:function(data){
						if(data == "success"){
							$("#"+to_follow).hide();
						}else{
							alert("실패");
						}
					},
					error:function(jqxhr, textStatus,errorThrown){
						console.log("ajax 처리 실패");
					}
				});
        	}else{
        		
        	}
        });
    </script>
</body>
</html>