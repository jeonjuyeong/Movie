<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Portfolio Modal 1 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="../ctrl/resources/img/portfolio/cabin.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 2 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td width="14"><img src="/teamproject/Imgs/blank.gif" width="14" height="3"></td>
		    <td colspan="3"><table width="908" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="230"><img src="${image.get(1) }" width="230" height="336"></td>
		        <td><table border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td width="20">&nbsp;</td>
		            <td colspan="4"><img src="/teamproject/Imgs/12.gif" width="30" height="31"> <span class="style4" id="movieName">${title.get(1) } </span></td>
		            </tr>
		          <tr>
		            <td rowspan="3">&nbsp;</td>
		            <td height="5" colspan="4" background="/teamproject/Imgs/blank.gif"><img src="/teamproject/Imgs/blank.gif" width="3" height="15"></td>
		            </tr>
		          <tr>
		            <td height="1" colspan="4" background="/teamproject/Imgs/line.gif"><img src="/teamproject/Imgs/line.gif" width="8" height="1"></td>
		          </tr>
		          <tr>
		            <td height="5" colspan="4" background="/teamproject/Imgs/blank.gif"><img src="/teamproject/Imgs/blank.gif" width="3" height="15"></td>
		          </tr>
		          <tr>
		            <td rowspan="2">&nbsp;</td>
		            <td width="213">946명 참여 8.8 </td>
		            <td colspan="2">예매율 <span class="style3">1</span>위 29.6% </td>
		            <td width="122">
		            	<div align="right">
		            		<img src="/teamproject/Imgs/eyme.gif" width="121" height="43" onclick="sendMovieTitleTicket();">
		            	</div>
		            </td>
		          </tr>
		          <tr>
		            <td height="5" colspan="4"><img src="/teamproject/Imgs/blank.gif" width="3" height="20"></td>
		            </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>타입 : 디지털 </td>
		            <td colspan="3">&nbsp;</td>
		          </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>개봉일 : 2019.01.09</td>
		            <td colspan="3">&nbsp;</td>
		          </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>감독 : 엄유나 </td>
		            <td colspan="3">&nbsp;</td>
		          </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>출연진 : 유해진, 윤계상 </td>
		            <td colspan="3">&nbsp;</td>
		          </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>장르 : 드라마/135분 </td>
		            <td colspan="3">&nbsp;</td>
		          </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td>누적관객 : 1,185,837명 </td>
		            <td colspan="3">전일관객 : 324,341명 </td>
		          </tr>
		          <tr>
		            <td rowspan="2">&nbsp;</td>
		            <td height="10" colspan="4" background="/teamproject/Imgs/blank.gif"><img src="/teamproject/Imgs/blank.gif" width="3" height="20"></td>
		            </tr>
		          <tr>
		            <td colspan="4" background="/teamproject/Imgs/line.gif"><img src="/teamproject/Imgs/line.gif" width="8" height="1"></td>
		            </tr>
		          <tr>
		            <td>&nbsp;</td>
		            <td colspan="4" background="/teamproject/Imgs/blank.gif"><img src="/teamproject/Imgs/blank.gif" width="3" height="15"></td>
		            </tr>
		          <tr>
		            <td></td>
		            <td></td>
		            <td width="322"></td>
		            <td colspan="2"><div align="right"><img src="/teamproject/Imgs/movie_time.gif" width="100" height="39"></div></td>
		            </tr>
		        </table></td>
		      </tr>
		    </table></td>
		    <td width="14"><img src="/teamproject/Imgs/blank.gif" width="14" height="3"></td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3">&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3"><table width="763" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="763"><p class="style3 style5">줄거리</p>
		        	<div id="movie_story">
		        		까막눈 판수, 우리말에 눈뜨다! vs 조선어학회 대표 정환, ‘우리'의 소중함에 눈뜨다! <br>
		        		1940년대 우리말이 점점 사라져가고 있는 경성.
		        		극장에서 해고된 후 아들 학비 때문에 가방을 훔치다 실패한 판수.
		        		하필 면접 보러 간 조선어학회 대표가 가방 주인 정환이다.
		        		사전 만드는데 전과자에다 까막눈이라니!
		        		그러나 판수를 반기는 회원들에 밀려 정환은 읽고 쓰기를 떼는 조건으로 그를 받아들인다.
		        		돈도 아닌 말을 대체 왜 모으나 싶었던 판수는 난생처음 글을 읽으며 우리말의 소중함에 눈뜨고,
		        		정환 또한 전국의 말을 모으는 ‘말모이'에 힘을 보태는 판수를 통해 ‘우리'의 소중함에 눈뜬다.
		        		얼마 남지 않은 시간, 바짝 조여오는 일제의 감시를 피해 ‘말모이'를 끝내야 하는데…
		        		우리말이 금지된 시대, 말과 마음이 모여 사전이 된다.
		        	</div>
		         </td>
		      </tr>
		    </table></td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3">&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>
		    	<span class="style6" id="stillcut-button" onclick="showStillcut();">스틸컷</span>
		    </td>
		    <td><span class="style8" id="video-button" onclick="showVideo();">동영상</span></td>
		    <td width="76">&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3">&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td width="76" bgcolor="#000000"></td>
		    <td width="798" bgcolor="#000000">
		    		<div id="cutORvideo"> <!-- 스틸컷 or 동영상이 나오도록 구분해야함 -->
		    		</div>
		    </td>
		    <td width="76" bgcolor="#000000"></td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td width="14">&nbsp;</td>
		    <td colspan="3">&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3"><table width="940" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="84">&nbsp;</td>
		        <td width="175">&nbsp;</td>
		        <td width="604">&nbsp;</td>
		        <td width="77">&nbsp;</td>
		      </tr>
		      <tr>
		        <td>&nbsp;</td>
		        <td>&nbsp;</td>
		        <td>&nbsp;</td>
		        <td>
		        	<div align="right"> <!-- 글자수 체크 -->
	 						<span id="commentCount">0</span>/100
		       	 	</div>
		        </td>
		      </tr>
		      <tr>
		        <td><div align="center"><img src="/teamproject/Imgs/stillcut/man_img.gif" width="62" height="62"></div></td>
		        <!--평점입력 -->
				<td><div align="center">				
				  <table width="175" border="0" cellspacing="0" cellpadding="0">
		            <tr>
					<!-- 별표 평점 입력부분 -->
		              <td>&nbsp;</td>
		            </tr>
		            <tr>
		              <td>
		              		<div align="center">     
		              			 <!-- 나중에는 영화이름까지 넣으면 해당 상세페이지에만 그 평점이 보이도록 해야함 -->     		
		              		</div> 
		              </td>
		            </tr>
		          </table>
				</div>
				</td>
		        <td>
		        <table style="width: 604px; border : 0px; cellspacing: 0px; cellpadding:0px;">
		          <tr>
		            <td>
		            	<c:if test="${sessionScope.mem_id != null}">
		              	<textarea name="comment_content" id="comment_content" cols="100%" rows="5" placeholder="100자까지 적을 수 있습니다." maxlength="100" onkeyup="textCount(this,'commentCount')"></textarea>
		              	</c:if>
		              	<input type="hidden" id="userID" value="${sessionScope.mem_id}"/>
		              	<input type="hidden" id="movieTitle" value="${param.movieTitle}"/>
		              	
		              	<c:if test="${sessionScope.mem_id == null}">
		              	<textarea name="comment_content" id="comment_content" cols="100%" rows="5" placeholder="로그인이 필요합니다." disabled="disabled" maxlength="100" onkeyup="textCount(this,'commentCount')"></textarea>
		              	</c:if>
		            </td>
		          </tr>
		        </table>
		     
		        </td>
		        <td>
		        	<img src="/teamproject/Imgs/submit_btn.gif" width="86" height="86" onclick="sendComment();">
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4">&nbsp;</td>
		        </tr>
		    </table>
		      
		    </td>
		    <td>&nbsp;</td>
		  </tr>
		</table>
		</div>
	</div>

	<!-- Portfolio Modal 3 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="../ctrl/resources/img/portfolio/circus.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 4 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="../ctrl/resources/img/portfolio/game.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 5 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="../ctrl/resources/img/portfolio/safe.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 6 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="../ctrl/resources/img/portfolio/submarine.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>