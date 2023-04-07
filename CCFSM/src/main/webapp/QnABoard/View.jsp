<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판 확인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/Style.css">
<jsp:include page="/Frame/Header.jsp" />
</head>
<body>
	<jsp:include page="/Frame/HeadNav.jsp" />
	<header>
		<img src="${pageContext.request.contextPath}/Resources/Images/img1.jpg" style="height: 100%; width: 100%">
	</header>
	<div class="container">
		<aside>
			<jsp:include page="/Navigator/Notice.jsp" />
		</aside>
		<article>			
			<h1 class="display-6 m-2 p-2 bg-danger-subtle" style="text-align: center;">질문/답변 확인</h1>
			<div class="table-responsive">
				<table class="table table-bordered p-5 m-5" style="width: 90%">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col />
					</colgroup>
					<!-- 게시글 정보 -->
					<tr>
						<th scope="row">번호</th>
						<td>${dto.idx}</td>
						<th scope="row">작성자</th>
						<td>${dto.userid}</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td>${dto.postdate}</td>
						<th scope="row">조회수</th>
						<td>${dto.visitcount}</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3" height="100">${dto.content} ${session.UserId }</td>
					</tr>

					<!-- 답변 -->
					<tr>
						<th scope="row">답변</th>
						<td colspan="3" height="100">
							<c:choose>
								<c:when test="${not empty dto.reply }">
									${dto.reply }
								</c:when>
								<c:otherwise>
									답변 대기중 입니다..									
								</c:otherwise>
							</c:choose>
						</td>
					</tr>

					<tr>
						<td colspan="4" class="text-center">
								<!-- 로그인 아이디 = 작성한 아이디 => 수정하기 버튼 활성화 -->
								<c:if test="${sessionScope.UserId eq dto.userid }">
									<button type="button" class="btn btn-warning"
										onclick="location.href='../qnaboard/edit.do?idx=${param.idx}';">
										수정하기
									</button>
								</c:if>
								
								<!-- 관리자 => 답변달기 버튼 활성화 -->
								<c:if test="${sessionScope.UserId eq 'admin' }">
									<button type="button" class="btn btn-warning"
										onclick="location.href='../qnaboard/reply.do?idx=${param.idx}';">
										답변 달기
									</button>
								</c:if>
								
								<!-- 모달 버튼 -->
								<button type="button" class="btn btn-warning"
									data-bs-toggle="modal" data-bs-target="#confirmModal">삭제하기</button>

								<!-- 모달 -->
								<div class="modal fade" id="confirmModal" tabindex="-1"
									aria-labelledby="confirmModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="confirmModalLabel">삭제 확인</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">정말로 삭제하시겠습니까?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
												<button type="button" class="btn btn-danger"
													onclick="location.href='../qnaboard/delete.do?idx=${param.idx}';">확인</button>
											</div>
										</div>
									</div>
								</div>
							<button type="button" class="btn btn-warning"
								onclick="location.href='../qnaboard/list.do';">목록 바로가기
							</button>
						</td>
					</tr>
				</table>
			</div>
		</article>
	</div>
	<footer>
		<jsp:include page="/Frame/Footer.jsp" />
	</footer>
</body>
</html>