<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath }/empList">전체조회</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath }/empInsert">등록</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath }/getBoardList">게시판 전체 조회</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath }/boardInsert">게시글 등록</a></li>
	</ul>
</nav>