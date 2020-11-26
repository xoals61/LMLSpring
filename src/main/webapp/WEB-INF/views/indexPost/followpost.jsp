<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>팔로우 게시글 모아보기</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<c:url var="mypage" value="MyPage.do" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		$(function(){
			$.ajax({
				url:"followingpostAjax.do",
				dataType:"JSON",
				data:{usernum : "${usernum}"},
				success:function(data){					
					
					
					var a = 0;	// tr
					var b = 0;	// data[b]
					
					var row = Math.ceil((data.length)/3);
					
					addTable();
					
					window.onscroll = function (e) {
		        		  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		        			  if(a<row){
		        				  addTable();
		        			  }		        			  
		        		  }
		        	}
					
					function addTable(){
						boardHover();
						for(var i=0; i<7; i++){	// 행
							if(a<row){
								
								$('#table').append('<tr id="'+a+'">');
							
								for(var j=0; j<3; j++){	// 열
									
									if(b < data.length){
										
										$('#'+a).append('<td>'+
													'<div class="content">'+
														'<div>'+
															'<img src="resources/buploadFiles/'+ data[b].image1 +'" class="cImg">'+
														'</div>'+
														'<div class="chover">'+
															'<div class="hover-detail-content" onclick="modalDetail('+data[b].b_num+');"></div>'+
															'<div class="chContnet">'+
																'<div class="user">'+
																	'<div class="userImg">'+
																		'<a href="userPage.do?id='+ data[b].b_user_id +'"><img src="resources/images/profileImg/'+ data[b].b_profile_img +'"></a>'+
																	'</div>'+
																	'<a href="userPage.do?id='+ data[b].b_user_id +'"><div class="userId">'+ data[b].b_name +'</div></a>'+
																'</div>'+
																'<div class="con" onclick="modalDetail('+data[b].b_num+');">'+
																	'<div class="userCon">'+
																		'<p>'+ data[b].b_content +'</p>'+
																	'</div>'+
																'</div>'+
																'<div class="cBtn">'+
																	'<div class="cHeart">'+
																		'<img src="resources/images/icon/main/heart.png" class="cheart">'+
																	'</div>'+
																	'<div class="cComment" onclick="modalDetail('+data[b].b_num+');">'+
																		'<div class="cbox"></div>'+
																		'<img src="resources/images/icon/main/comment.png">'+
																	'</div>'+
																	'<div class="cEtc">'+
																		'<img src="resources/images/icon/main/etc.png">'+
																	'</div>'+
																'</div>'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</td>');
										
									}else if(b >= data.length){
										
									}
									b++;
								}
								a++;
							}
						}
						boardHover();
					}
				},
				error:function(request,status,error){
					alert("code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + error);
				}
			});
		});
	</script>
	
	<section>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">
				<!-- <div class="board-img">
					<img src="resources/images/detailImg/theman.jpg">
				</div>
				<div class="board-right">
					<div class="board-user">
						<div class="board-userImg">
							<a href="./jiman/MyPage.html"><img
								src="resources/images/detailImg/40x40man.jpg"></a>
						</div>
						<a href="./jiman/MyPage.html"><div class="board-id">
								<p>__maybenotyet__</p>
							</div></a>
						<div class="board-follow">팔로잉</div>
					</div>
					<div class="board-textDiv">
						<div class="board-text">글 내용</div>
						<div class="board-hashtag">#가을코디 #맨투맨 #맨투맨코디 #흑청바지 #청바지코디
							#캐주얼룩 #캐주얼코디 #남자데일리코디</div>
					</div>
					<div class="board-stateicon">
						<div class="board-heartCount">좋아요 234개</div>
						<div class="board-heart">
							<img
								src="resources/images/icon/menu/iconmonstr-heart-thin-72.png">
						</div>
						<div class="board-etc">
							<img src="resources/images/icon/main/menu1.png">
						</div>
					</div>
					<div class="board-clothesInfo">
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/top.png">
							</div>
							<div class="clothes-p">상의</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/pants.png">
							</div>
							<div class="clothes-p">하의</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/shoes.png">
							</div>
							<div class="clothes-p">신발</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/watch.png">
							</div>
							<div class="clothes-p">Acc</div>
							<div class="clothes-info">아디다스</div>
						</div>
						<div class="clothesInfo-div">
							<div class="clothes-img">
								<img src="resources/images/detailImg/bag.png">
							</div>
							<div class="clothes-p">Etc</div>
							<div class="clothes-info">아디다스</div>
						</div>
					</div>
				</div>
				<div class="board-bottom">
					<div class="commentCount">
						<p>댓글 (8)</p>
					</div>
					<div class="board-commentDiv">
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
						<div class="board-comment">
							<div class="comment-img">
								<a href="./jiman/MyPage.html"><img
									src="resources/images/mainImg/andy.jpg"></a>
							</div>
							<div class="comment-content">
								<p class="comment-user">iamandy</p>
								<p class="comment-comment">댓글1</p>
							</div>
						</div>
					</div>
					<div class="board-commentWrite">
						<div class="comment-write">
							<input type="text" placeholder="댓글 달기...">
						</div>
						<div class="comment-submit">게시</div>
					</div>
				</div> -->
			</div>
		</div>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="scContent">
			<div class="upBtn">
				<img src="resources/images/icon/main/arrow.png">
			</div> 
			<c:if test="${loginUser ne null}">
			<div class="postBtn">
				<img src="resources/images/icon/main/plus.png">
			</div>
			</c:if>
			<div class="choice">
				<p class="pchoice">체형별 보기</p>
				<div class="choice1">
					<div class="cSelect">
						키 : <select name="height">
							<option value="">---</option>
							<option value="1">140cm 이하</option>
							<option value="2">140~150cm</option>
							<option value="3">150~160cm</option>
							<option value="4">160~170cm</option>
							<option value="5">170~180cm</option>
							<option value="6">180~190cm</option>
							<option value="7">190cm 이상</option>
						</select>&nbsp;&nbsp;&nbsp; 몸무게 : <select name="weight">
							<option value="">---</option>
							<option value="1">40kg 이하</option>
							<option value="2">40~50kg</option>
							<option value="3">50~60kg</option>
							<option value="4">60~70kg</option>
							<option value="5">70~80kg</option>
							<option value="6">80~90kg</option>
							<option value="7">90~100kg</option>
							<option value="8">100kg 이상</option>
						</select>&nbsp;&nbsp;&nbsp;
						<div class="choiceBtn">체형별 보기</div>
					</div>
					<div class="close">
						<img src="resources/images/icon/main/close.png">
					</div>
				</div>
			</div>
			<div class="ctable">
				<table id="table">
					<!-- <tr>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/buzz.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/pbuzz.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">iambuzz</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/alien.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/palien.png"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">_alien88_</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To To To Infinity Infinity Infinity and and and
													Beyond Beyond Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/andy.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/pandy.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">chilly_b_f</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>시작부터 다 예상밖에 놀라운 스따일 작은 스탭들로 뿜어내 빅바입</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/jessie.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/pjessie.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">xjexxiex</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/woody.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/pwoody.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">woody79</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/rex.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/prex.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">nice_rex</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td id="conte">
							<div class="content">
								<div>
									<img src="resources/images/mainImg/potato.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/ppotato.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">potato_man</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/potato.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/ppotato.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">potato_man</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="content">
								<div>
									<img src="resources/images/mainImg/potato.jpg" class="cImg">
								</div>
								<div class="chover">
									<div class="hover-detail-content"></div>
									<div class="chContnet">
										<div class="user">
											<div class="userImg">
												<a href="./jiman/MyPage.html"><img
													src="resources/images/mainImg/ppotato.jpg"></a>
											</div>
											<a href="./jiman/MyPage.html"><div class="userId">potato_man</div></a>
										</div>
										<div class="con">
											<div class="userCon">
												<p>To Infinity and Beyond</p>
											</div>
										</div>
										<div class="cBtn">
											<div class="cHeart">
												<img src="resources/images/icon/main/heart.png"
													class="cheart">
											</div>
											<div class="cComment">
												<div class="cbox"></div>
												<img src="resources/images/icon/main/comment.png">
											</div>
											<div class="cEtc">
												<img src="resources/images/icon/main/etc.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr> -->
				</table>
			</div>
		</div>
		<div class="modal2" id="modal2" style="display: none;"></div>
        <div class="md_content" id="md_content" style="display: none;">
            <span id="text">업로드</span>
            <button class="xbutton">X</button>
            <hr style="border: solid 0.5px rgb(211, 211, 211);">

            <div class="post-style-div" onclick="postStyle();">
                <div class="post-style-btn"><img class="posticon" src="resources/images/icon/main/sunglasses.png"></div>
                <div class="post-style-p">스타일</div>
            </div>

            <div class="post-qna-div" onclick="postQna();">
                <div class="post-qna-btn"><img class="posticon" src="resources/images/icon/main/QandA.png"></div>
                <div class="post-qna-p">QnA</div>
            </div>
        </div>
	</section>

	<jsp:include page="../common/footer.jsp" />


	<script>
		// 게시물 마우스오버
		function boardHover(){
		  $('.chover').hide();
		    $('.content').mouseover(function(){
		        $('.chover',this).show();
		    });
		    $('.content').mouseout(function(){
		        $('.chover').hide();
		    });
		    
		    /* 게시물 좋아요 아이콘 클릭 시 아이콘 변경 */
			$(".cHeart").click(function(){
				if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
					$('.cheart',this).attr('src','./resources/images/icon/main/heart2.png');
				}else{
			  		$('.cheart',this).attr('src','resources/images/icon/main/heart.png');
			 	}
			});
		}


		/* 체형별 */
		$( document ).ready( function() {
		    $('.choice1').hide();
		    $( '.pchoice' ).click( function() {
		        $( '.choice' ).animate( {
		            width: '1106px',
		            height: '50px',
		            cursor: 'pointer'
		        }, 400 );
		        $('.choice').css('cursor','default');
		        $('.choice1').show();
		        $('.pchoice').hide();
		    } );
		    $( '.close' ).click( function() {
		        $( '.choice' ).animate( {
		            width: '100px',
		            height: '30px'
		        }, 400 );
		        $('.choice1').hide();
		        setTimeout(function() {
		            $('.pchoice').show();
		        }, 400);
		        $('.choice').css('cursor','pointer');
		    } );
		
		
		});
          

		/* 맨 위로 가는 버튼 */
		$( document ).ready( function() {
		    $('.upBtn').hide();
		    $( window ).scroll( function() {
		        if ( $( this ).scrollTop() > 200 ) {
		            $( '.upBtn' ).fadeIn();
		        } else {
		            $( '.upBtn' ).fadeOut();
		        }
		    });
		    $( '.upBtn' ).click( function() {
		        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		        return false;
		    });
		});

		/* 모달팝업 디테일 */
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
					console.log(data);
					
					$('.board-detail').append('<div class="board-img">'+
							'<img src="resources/buploadFiles/'+ data[0].image1 +'">'+
							'</div>'+
							'<div class="board-right">'+
								'<div class="board-user">'+
									'<div class="board-userImg">'+
									'<a href="userPage.do?id='+ data[0].b_user_id +'"><img src="resources/images/profileImg/'+ data[0].b_profile_img +'"></a>'+
									'</div>'+
									'<a href="userPage.do?id='+ data[0].b_user_id +'"><div class="board-id">'+
											'<p>'+ data[0].b_name +'</p>'+
										'</div></a>'+
									'<div class="board-follow">팔로잉</div>'+
								'</div>'+
								'<div class="board-textDiv">'+
									'<div class="board-text">'+ data[0].b_content +'</div>'+
									'<div class="board-hashtag">#가을코디 #맨투맨 #맨투맨코디 #흑청바지 #청바지코디 #캐주얼룩 #캐주얼코디 #남자데일리코디</div>'+
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
										'<a href="userPage.do?id='+ data[0].b_user_id +'"><img src="resources/images/mainImg/andy.jpg"></a>'+
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
									'<div class="comment-submit">게시</div>'+
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
		}
		
 
		var modal2 = document.getElementById('modal2');
		var md_content = document.getElementById('md_content'); 
      
		$('.postBtn').click(function(){
			$( 'html, body' ).animate( { scrollTop : 0 },0);
			$('.modal2').css('display','block');
			$('.md_content').css('display','block');
		});

		window.onclick = function(event) {
		    if (event.target == modal2) {
		        modal2.style.display = "none";
		        md_content.style.display = "none";
		    }
		}

		$('.xbutton').click(function(){
		    modal2.style.display = "none";
		    md_content.style.display = "none";
		});
		
		function postStyle(){
		    location.href="PostStyle.do";
		}
		
		function postQna(){
		    location.href="PostQna.do";
		}
		
		
		function infoPage(id){
			location.href="userPage.do?id="+id;
		}
    </script>


</body>
</html>