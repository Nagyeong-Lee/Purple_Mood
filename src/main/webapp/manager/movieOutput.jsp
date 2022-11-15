<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

div {
	border: 1px solid;
}

.container {
	margin: auto;
	padding: 10px;
}

.header {
	height: 100px;
	line-height: 100px;
	background-color: #431e5c60;
	font-size: x-large;
	font-weight: bold;
}

.navi {
	background-color: #58257920;
}

.title, .meg {
	height: 40px;
	line-height: 40px;
}

.contentTitles {
	overflow: hidden;
	background-color: #431e5c60;
}

.contentTitle {
	float: left;
	border: 1px solid;
}

.contents {
	overflow: hidden;
}

.content {
	float: left;
	border: 1px solid;
	height: 50px;
	word-break: break-all
}

button {
	margin-top: 10px;
}
</style>
		<script>
		$(function(){
			$("#movieDelete").on("click", function() {
				var mv_title = $(this).closest(".contents").find("title").html();
				if (confirm("해당 콘텐츠를 삭제하시겠습니까?")) {
					alert(mv_title);
				} else {
					alert("취소되었습니다.");
				}
			});
		})
			
		</script>
</head>
<body>
	<div class="container">
		<div class="header">관리자페이지</div>
		<div class="navi">
			<ul class="nav nav-tabs">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">회원관리</a>
					<ul class="dropdown-menu">
						<li id="memberAllOutputLi"><a class="dropdown-item" href="/memberOutput.manager"> <strong>전체조회</strong>
						</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">콘텐츠관리</a>
					<ul class="dropdown-menu">
						<li id="MovieOutputLi"><a class="dropdown-item" href="/movieOutput.manager"><strong>영화조회</strong></a></li>
						<li id="DramaOutputLi"><a class="dropdown-item" href="#"><strong>드라마조회</strong></a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">게시판관리</a>
					<ul class="dropdown-menu">
						<li id="boardComplainOutputLi"><a class="dropdown-item" href="#"> <strong>신고게시글조회</strong>
						</a></li>
						<li id="commentComplainOutputLi"><a class="dropdown-item" href="#"> <strong>신고댓글조회</strong>
						</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="main">
			<div class="memberAllOutput">
				<div class="title">콘텐츠관리 > 영화조회</div>
				<div class="contentTitles">
					<div class="contentTitle" style="width: 10%;">아이디</div>
					<div class="contentTitle" style="width: 45%;">제목</div>
					<div class="contentTitle" style="width: 7%;">장르</div>
					<div class="contentTitle" style="width: 7%;">넷플릭스</div>
					<div class="contentTitle" style="width: 7%;">웨이브</div>
					<div class="contentTitle" style="width: 7%;">디즈니</div>
					<div class="contentTitle" style="width: 7%;">왓챠</div>
					<div class="contentTitle" style="width: 5%;">삭제</div>
				</div>

				<!-- 영화 조회 -->
				<c:forEach var="i" items="${list}">
					<div class="contents">
						<div class="content" style="width: 10%;">${i.mv_id}</div>
						<div class="content title" style="width: 45%;">${i.mv_title}</div>
						<div class="content" style="width: 7%;">${i.mv_genre}</div>
						<div class="content" style="width: 7%;">${i.mv_ottNF}</div>
						<div class="content" style="width: 7%;">${i.mv_ottWV}</div>
						<div class="content" style="width: 7%;">${i.mv_ottDZ}</div>
						<div class="content" style="width: 7%;">${i.mv_ottWC}</div>
						<div class="content" style="width: 5%;">
							<a href="/movieDelete.manager?mv_id=${i.mv_id }">
								<button type="button" id="movieDelete">삭제</button>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

</body>
</html>