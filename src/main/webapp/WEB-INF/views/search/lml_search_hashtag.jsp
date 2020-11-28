<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>검색 더보기(해쉬태그)</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/final_search.css">
<link rel="stylesheet" href="resources/css/final_detail.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
   <section>
	<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">
			
			</div>
			</div>
	
        <div class="hashtagSection">
            <div class="hashInfo">
                <div class="hashtag">
                   Tag 😜 ; ${keyword}
                </div>
                    <div class="hashMore">
                        	${tagCount} 개의 게시글 
                    </div>
            </div>
            <div class="hashTable">
               <c:if test="${ !empty tagpost}">
                <table id="table">
                  		<c:forEach var="tagBoard" items="${tagpost }" varStatus="status" >
					<c:if test="${status.index mod 3 eq 0}">
					<tr>
					</c:if>
						<td>
							<div class="content" onclick="modalDetail('${tagBoard.b_num}')">
								<div class=img>
									<img src="resources/buploadFiles/${tagBoard.image1}" class="cImg">
								</div>
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
    
    <jsp:include page="../common/footer.jsp"/>


    <script>
        /* 맨 위로 가는 버튼 */
        $( document ).ready( function() {
            $('.upBtn').hide();
            $( window ).scroll( function() {
                if ( $( this ).scrollTop() > 200 ) {
                    $( '.upBtn' ).fadeIn();
                } else {
                    $( '.upBtn' ).fadeOut();
                }
            } );
            $( '.upBtn' ).click( function() {
                $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
                return false;
            } );
        } );

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

        //스크롤 바닥 감지
        window.onscroll = function (e) {
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

            // 게시물 좋아요 아이콘 클릭 시 아이콘 변경
            $(".cHeart").click(function(){
                $('.cheart',this).attr('src','resources/images/icon/main/heart2.png');
            });

            var td = '<td>' +
                        '<div class="content">' +
                            '<div><img src="resources/images/mainImg/andy.jpg" class="cImg"></div>' +
                            '<div class="chover">' +
                                '<div class="chContnet">' +
                                    '<div class="user">' +
                                        '<div class="userImg">' +
                                            '<img src="resources/images/mainImg/pandy.jpg">' +
                                        '</div>' +
                                        '<div class="userId">chilly_b_f</div>' +
                                    '</div>' +
                                    '<div class="con">' +
                                        '<div class="userCon"><p>시작부터 다 예상밖에 놀라운 스따일 작은 스탭들로 뿜어내 빅바입</p></div>' +
                                    '</div>' +
                                    '<div class="cBtn">' +
                                        '<div class="cHeart"><img src="resources/images/icon/main/heart.png"  class="cheart"></div>' +
                                        '<div class="cComment"><div class="cbox"></div><img src="resources/images/icon/main/comment.png"></div>' +
                                        '<div class="cEtc"><img src="resources/images/icon/main/etc.png"></div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</td>';

            //추가되는 콘텐츠
            //window height + window scrollY 값이 document height보다 클 경우,
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            //실행할 로직 (콘텐츠 추가)

            var addContent = '<tr>' + td + td + td + '</tr>' + '<tr>' + td + td + td + '</tr>' + '<tr>' + td + td + td + '</tr>' + '<tr>' + td + td + td + '</tr>';

                //article에 추가되는 콘텐츠를 append
                $('#table').append(addContent);
            }
        };
        
        
        <script>
        
    	function modalDetail(bnum){
    		
    		var modal = document.getElementById('myModal');
    		var detail = document.getElementById('board-detail');
    		var content = document.getElementById('conte');
    		
    		$('.myModal').css('display','block');
    		$('.board-detail').css('display','block');
    		
    		$.ajax({
    			url:"BoardDetail.do",
    			data:{bnum:bnum},
    			dataType:"JSON",
    			success:function(data){	
    				hashAjax();
    				getReplyList();
    				
    				$('.board-detail').append('<div class="board-img">'+
    						'<img src="resources/buploadFiles/'+ data[0].image1 +'">'+
    						'</div>'+
    						'<div class="board-right">'+
    							'<div class="board-user">'+
    								'<div class="board-userImg">'+
    								'<a href="userPage.do?id='+data[0].b_user_id+'"><img src="resources/images/profileImg/'+ data[0].b_profile_img +'"></a>'+
    								'</div>'+
    								'<a href="userPage.do?id='+data[0].b_user_id+'"><div class="board-id">'+
    										'<p>'+ data[0].b_name +'</p>'+
    									'</div></a>'+
    								'<div class="board-follow">팔로잉</div>'+
    							'</div>'+
    							'<div class="board-textDiv">'+
    								'<div class="board-text">'+ data[0].b_content +'</div>'+
    								'<div class="board-hashtag"></div>'+
    							'</div>'+
    							'<div class="board-stateicon">'+
    								'<div class="board-heartCount">좋아요 234개</div>'+
    								'<div class="board-heart">'+
    									'<img src="resources/images/icon/menu/iconmonstr-heart-thin-72.png">'+
    								'</div>'+
    								'<div class="board-etc">'+
    									'<img src="resources/images/icon/main/menu1.png">'+
    								'</div>'+
    							'</div>'+
    							'<div class="board-clothesInfo">'+
    								
    							'</div>'+
    						'</div>'+
    						'<div class="board-bottom">'+
    							'<div class="commentCount">'+
    								'<p>댓글 (8)</p>'+
    							'</div>'+
    							'<div class="board-commentDiv">'+
    								'<div class="board-comment">'+
    									'<div class="comment-img">'+
    										'<a href="./jiman/MyPage.html"><img src="resources/images/mainImg/andy.jpg"></a>'+
    									'</div>'+
    									'<div class="comment-content">'+
    										'<p class="comment-user">iamandy</p>'+
    										'<p class="comment-comment">댓글1</p>'+
    									'</div>'+
    								'</div>'+
    								
    							'</div>'+
    							'<div class="board-commentWrite">'+
    								'<div class="comment-write">'+
    									'<input type="text" placeholder="댓글 달기...">'+
    								'</div>'+
    								'<div class="comment-submit" onclick="cSubmit();">게시</div>'+
    							'</div>'+
    						'</div>');
    				
    				if(data[0].b_top !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/top.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_top +'</div>'+
    					'</div>');
    				}
    				if(data[0].b_bottom !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/pants.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_bottom +'</div>'+
    					'</div>');
    				}
    				if(data[0].b_shoes !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/pants.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_shoes +'</div>'+
    					'</div>');
    				}
    				if(data[0].b_acc !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/pants.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_acc +'</div>'+
    					'</div>');
    				}
    				if(data[0].b_acc !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/pants.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_acc +'</div>'+
    					'</div>');
    				}
    				if(data[0].b_etc !=null){
    					$('.board-clothesInfo').append('<div class="clothesInfo-div">'+
    							'<div class="clothes-img">'+
    							'<img src="resources/images/detailImg/pants.png">'+
    						'</div>'+
    						'<div class="clothes-p">상의</div>'+
    						'<div class="clothes-info">'+ data[0].b_etc +'</div>'+
    					'</div>');
    				}
    				
    			},
    			error:function(request,status,error){
    				console.log("** error code : " + request.status + "\n"
    					+ "message : " + request.responseText + "\n"
    					+ "error : " + error);
    			}
    		});
    		
    		window.onclick = function(event) {
    		    if (event.target == modal) {
    		        modal.style.display = "none";
    		        detail.style.display = "none";
    		        $('.board-detail').empty();
    		    }
    		}
    		
    		function getReplyList(){
    			$.ajax({
    				url:"BoardDetailComm.do",
    				data:{bnum:bnum},
    				dataType:"JSON",
    				success:function(data){	
    					console.log(data);
    					if(data.length > 0){
    						console.log('하하');
    					}else{
    						$('.board-commentDiv').append(''+
    							'<div class="board-comment">'+
    								//'<div class="comment-img"></div>'+
    								'<div class="comment-content">'+
    									'<p class="comment-user">등록된 댓글이 없습니다.</p>'+
    									'<p class="comment-comment"></p>'+
    								'</div>'+
    							'</div>');
    					}
    				},
    				error:function(request,status,error){
    					console.log("** error code : " + request.status + "\n"
    						+ "message : " + request.responseText + "\n"
    						+ "error : " + error);
    				}
    			});
    		}
    		
    	}
        
        
    function infoPage(id){
        	
        	console.log('id:'+ id);
        	//console.log("MyPage.do?uNum="+uNum);
        	location.href="userPage.do?id="+id;
        	
        	
        	
        	
        }
    
    $(document).ready(function(){
    	
    	var uNum = 0${loginUser.user_num};
    	
    	
    		console.log(uNum);
 
    
    });
    	
    	
    </script>
</body>
</html>