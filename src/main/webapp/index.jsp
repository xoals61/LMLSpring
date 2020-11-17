<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>찐메인</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet"> -->

<link rel="stylesheet" href="resources/css/final_main2.css">
<link rel="stylesheet" href="resources/css/final_detail.css">
<link rel="stylesheet" href="resources/css/final_post2.css">

<script src="https://kit.fontawesome.com/d0f63198f6.js" crossorigin="anonymous"></script> <!-- 폰트어썹 -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  <!-- 부트스트랩4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<!-- include libraries(jQuery, bootstrap) -->
<!-- summernote홈페이지에서 받은 summernote를 사용하기 위한 코드를 추가 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
 
<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<c:url var="mypage" value="MyPage.do"/>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />
	<section>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="myModal" id="myModal" style="display: none;">
			<div class="board-detail" id="board-detail" style="display: none;">
				<div class="board-img">
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
				</div>
			</div>
		</div>
		<!-- ===================================================== 모달 ======================================================== -->
		<div class="scContent">
			<div class="upBtn">
				<img src="resources/images/icon/main/arrow.png">
			</div>
			<a>
				<div class="postBtn">
					<img src="resources/images/icon/main/plus.png">
				</div>
			</a>
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
					<tr>
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
					</tr>
				</table>
			</div>
		</div>
		 <!-- ############################# plus모달창 #############################-->
        <div class="modal2 hidden"></div>
        <div class="md_content hidden">
            <span id="text">업로드</span>
            <button class="xbutton">X</button>
            <hr style="border: solid 1px gray;">
            <i id="stlye-btn" class="fas fa-camera"></i>
            <i id="mypage-btn" class="far fa-address-card"></i>
            <i id="QnA-btn" class="fas fa-question"></i>
            <span class="modal_text">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스타일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QnA
            </span>
        </div>

        <!-- ############################# stlye-btn모달창 ############################# -->
        <div class="myModal3 hidden">
            <div class="container-lg my-3">
                <div id="myCarousel" class="carousel slide" data-pause="false">
                    <!-- Carousel indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                    </ol>
                    <!-- Wrapper for carousel items -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <!-- 1번 페이지입니다. -->
                            <div id="uploadExpl">이미지 파일을 업로드해주세요.</div><br>
                            <input type="file" id="image" accept="image/*" multiple />
                        </div>
                        <div class="carousel-item">
                            <div id="summernoteExpl">게시글 작성</div>
                            <div id="summernote"></div>
                            <script>
                            	$('#summernote').summernote({
                                    dialogsInBody: true,
                                    lang: "ko-KR",					// 한글 설정
                                    // placeholder: 'Hello Bootstrap 4',
                                    tabsize: 2,
                                    height: 430,
                                    width: 700,
                                    disableResizeEditor: true,
                                    toolbar: [
                                        ['style', ['style']],
                                        ['font', ['bold', 'underline', 'clear']],
                                        ['color', ['color']],
                                        ['para', ['ul', 'ol', 'paragraph']],
                                        ['table', ['table']],
                                        ['insert', ['link', 'picture', 'video']],
                                        ['view', ['codeview', 'help']]
                                    ]
                                });
                            </script>
                            <textarea id="hashtagarea" placeholder="해시태그 ex)#태그내용"></textarea> <br>
                            <span id="brandExpl">브랜드 태그 : </span>
                            <select name="clothes" id="clothes">
                                <option value="top">상의</option>
                                <option value="pants">하의</option>
                                <option value="shoes">신발</option>
                                <option value="acc">Acc</option>
                                <option value="etc">Etc</option>
                            </select>
                            <select name="brand" id="brand">
                                <option value="ablelyn">에이블린</option>
                                <option value="1507">1507</option>
                                <option value="8Seconds">8Seconds</option>
                                <option value="adidas">adidas</option>
                                <option value="bbia">bbia</option>
                                <option value="BLACKROUGE">BLACKROUGE</option>
                                <option value="CARHARTT">CARHARTT</option>
                                <option value="champion">champion</option>
                                <option value="eglips">eglips</option>
                                <option value="envylook">envylook</option>
                                <option value="H&M">H&M</option>
                                <option value="kirsh">kirsh</option>
                                <option value="Mango">Mango</option>
                                <option value="McQueen">McQueen</option>
                                <option value="MIXXO">MIXXO</option>
                                <option value="MUAHMUAH ">MUAHMUAH </option>
                                <option value="NIKE">NIKE</option>
                                <option value="OVDY">OVDY</option>
                                <option value="romand">romand</option>
                                <option value="SPAO">SPAO</option>
                                <option value="TOPTEN">TOPTEN</option>
                                <option value="ZARA">ZARA</option>
                                <option value="bullang">불량소녀</option>
                            </select>
                            <button class="hashtagbtn">추가</button> <br>
                            <textarea id="hashtagtext" readonly placeholder="브랜드 태그"></textarea> <br>
                            <button id="postbtn">게시</button>
                        </div>
                    </div>
                    <!-- Carousel controls -->
                    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
        </div>
        <!-- ############################# QnA-btn모달창 ############################# -->
        <div class="myModal4 hidden">
            <div class="modal4window">
                <div id="QnAExpl">QnA 작성</div>
                <textarea id="qnatitle" placeholder="제목을 적어주세요."></textarea>
                <div id="summernote2"></div>
                <script>
                    $('#summernote2').summernote({
                        dialogsInBody: true,
                        lang: "ko-KR",					// 한글 설정
                        // placeholder: 'Hello Bootstrap 4',
                        tabsize: 2,
                        height: 573,
                        width: 700,
                        disableResizeEditor: true,
                        toolbar: [
                            ['style', ['style']],
                            ['font', ['bold', 'underline', 'clear']],
                            ['color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['link', 'picture', 'video']],
                            ['view', ['codeview', 'help']]
                        ]
                    });
                </script>
                <button id="QnAbtn">게시</button>
            </div>
        </div>
	</section>

	<jsp:include page="WEB-INF/views/common/footer.jsp" />


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

              /* 게시물 좋아요 아이콘 클릭 시 아이콘 변경 */
              $(".cHeart").click(function(){
            	  
            	 if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
                  $('.cheart',this).attr('src','./resources/images/icon/main/heart2.png');
              }
                  else{
                	  $('.cheart',this).attr('src','resources/images/icon/main/heart.png');
                  }
              });

              /* 모달팝업 디테일 */
              var modal = document.getElementById('myModal');
              var detail = document.getElementById('board-detail');
              var content = document.getElementById('conte');

              $('.hover-detail-content, .con, .cComment').click(function(){
                  $('.myModal').css('display','block');
                  $('.board-detail').css('display','block');
              });
      
              window.onclick = function(event) {
                  if (event.target == modal) {
                      modal.style.display = "none";
                      detail.style.display = "none";
                  }else if (event.target == modal3) {
                      closeModal3();
                  }else if (event.target == modal4) {
                      closeModal4();
                  }
              }
          
          var td = '<td>' + 
                      '<div class="content">' +
                          '<div><img src="./resources/images/mainImg/potato.jpg" class="cImg"></div>' +
                          '<div class="chover">' +
                              '<div class="hover-detail-content"></div>' +
                              '<div class="chContnet">' +
                                  '<div class="user">' +
                                      '<div class="userImg"><a href="./jiman/MyPage.html"><img src="./resources/images/mainImg/ppotato.jpg"></a></div>' +
                                      '<a href="./jiman/MyPage.html"><div class="userId">potato_man</div></a>' +
                                  '</div>' + 
                                  '<div class="con">' +
                                      '<div class="userCon"><p>To Infinity and Beyond</p></div>' +
                                  '</div>' +
                                  '<div class="cBtn">' + 
                                      '<div class="cHeart"><img src="./resources/images/icon/main/heart.png" class="cheart"></div>' +
                                      '<div class="cComment"><div class="cbox"></div><img src="./resources/images/icon/main/comment.png"></div>' +
                                      '<div class="cEtc"><img src="./resources/images/icon/main/etc.png"></div>' +
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

      /* 게시물 좋아요 아이콘 클릭 시 아이콘 변경 */
       $(".cHeart").click(function(){
            	  console.log("sadasd");
            	 if($('.cheart',this).attr('src') == "resources/images/icon/main/heart.png"){
                  $('.cheart',this).attr('src','./resources/images/icon/main/heart2.png');
              }
                  else{
                	  $('.cheart',this).attr('src','resources/images/icon/main/heart.png');
                  }
              });

      /* 모달팝업 디테일 */
      var modal = document.getElementById('myModal');
      var detail = document.getElementById('board-detail');
      var content = document.getElementById('conte');

      $('.hover-detail-content, .con, .cComment').click(function(){
          $('.myModal').css('display','block');
          $('.board-detail').css('display','block');
      });
 
      window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = "none";
              detail.style.display = "none";
          }
      }
      /* 플러스 버튼을 눌러 모달창 열림. */
      const openButton = document.querySelector(".postBtn");
      const modal2 = document.querySelector(".modal2");
      const modal_content = document.querySelector(".md_content");
      const closeButton = modal_content.querySelector(".xbutton");
      //동작함수
      const openModal = () => {
          modal_content.classList.remove("hidden");
          modal2.classList.remove("hidden");
          modal2.classList.add("md_overlay");

      }
      const closeModal = () => {
          modal_content.classList.add("hidden");
          modal2.classList.add("hidden");
          modal2.classList.remove("md_overlay");
      }
      //클릭 이벤트
      openButton.addEventListener("click", openModal);
      closeButton.addEventListener("click", closeModal);
      modal2.addEventListener("click", closeModal);

      //-------------------스타일 모달 버튼--------------------//
      const modal3 = document.querySelector('.myModal3');
      const stlyeBtn = document.getElementById('stlye-btn');

      const openModal3 = () => {
          closeModal();
          modal3.classList.remove("hidden");
          modal3.classList.add("md_overlay");
          $('#summernote').summernote({
              dialogsInBody: true
          });
      }
      const closeModal3 = () => {
          modal3.classList.add("hidden");
          modal3.classList.remove("md_overlay");
      }
      stlyeBtn.addEventListener("click", openModal3); //열기


      window.addEventListener("click", function(event) {
          if (event.target == modal3) {
              closeModal3();
          }
      });

      const hashtagbtn = document.querySelector(".hashtagbtn");
      const clothes = document.getElementById("clothes");
      const brand = document.getElementById("brand");
      const hashtagtext = document.getElementById("hashtagtext");

      const hashtagfunc = () => {
          hashtagtext.value += $("#clothes option:checked").text() + "-" + $("#brand option:checked").text() + "\n";
      }

      hashtagbtn.addEventListener("click", hashtagfunc);

      //-------------------QnA 모달 버튼--------------------//
      const modal4 = document.querySelector('.myModal4');
      const QnABtn = document.getElementById('QnA-btn');

      const openModal4 = () => {
          closeModal();
          modal4.classList.remove("hidden");
          modal4.classList.add("md_overlay4");
          $('#summernote').summernote({
              dialogsInBody: true
          });
      }
      const closeModal4 = () => {
          modal4.classList.add("hidden");
          modal4.classList.remove("md_overlay");
      }
      QnABtn.addEventListener("click", openModal4); //열기
      window.addEventListener("click", function(event) { //닫기
          if (event.target == modal4) {
              closeModal4();
          }
      });
    </script>


</body>
</html>