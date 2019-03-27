<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
							
													
													<table class="table table-hover" style="">
														<tr>
															<td>제목</td>
															<td>내가넣은금액</td>
															<td>내가얻을상품</td>
															<td>목표금액</td>
															<td>현재금액</td>
															<td>달성률</td>
														</tr>
													
														<c:forEach items="${fundingList }" var="list">
															<tr>
																<td><a
																	href="../funding/goodsView.do?num=${list.goodsNum}">${list.title }</a></td>
																	<td><fmt:formatNumber value="${list.price }" type="number"/></td>
																<td>${list.product }</td>
																<td><fmt:formatNumber value="${list.wantPrice }" type="number"/></td>
																<td><fmt:formatNumber value="${list.currentPrice }" type="number"/></td>
																<td><fmt:formatNumber value="${list.currentPrice/list.wantPrice}" type="percent"/></td>
															</tr>
														</c:forEach>
														</table>
														<div align="center">
															 <!-- 이전 -->
															<c:if test="${startpage>blockpage }">
																<a href="javascript:PagingMypage(${startpage-blockpage })">[이전]</a>
															</c:if>
															<!-- 페이지출력 -->
															<c:forEach begin="${startpage }" end="${endpage }" var="i">
																<c:if test="${currentPage eq i}" >
																	${i }
																</c:if>
																<c:if test="${currentPage ne i}" >
																	<a href="javascript:PagingMypage(${i })">${i }</a>
																</c:if>
															</c:forEach>
															<!-- 다음 -->
															<c:if test="${endpage<totpage }">
																<a  href="javascript:PagingMypage(${endpage+1})">[다음]</a>
															</c:if>
															<br><br><br>
														</div>
												
							