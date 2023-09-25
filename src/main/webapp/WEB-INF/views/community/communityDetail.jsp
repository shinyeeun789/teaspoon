<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 </title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<section class="page-title background-primary is-relative">
    <div class="container">
        <div class="has-text-centered">
            <h1 class="has-text-white font-tertiary"> 커뮤니티 상세보기 </h1>
        </div>
    </div>
    <!-- background shapes -->
    <img src="${path}/resources/images/illustrations/page-title.png" alt="illustrations" class="bg-shape-1 w-100">
    <img src="${path}/resources/images/illustrations/leaf-pink-round.png" alt="illustrations" class="bg-shape-2">
    <img src="${path}/resources/images/illustrations/dots-cyan.png" alt="illustrations" class="bg-shape-3">
    <img src="${path}/resources/images/illustrations/leaf-orange.png" alt="illustrations" class="bg-shape-4">
    <img src="${path}/resources/images/illustrations/leaf-yellow.png" alt="illustrations" class="bg-shape-5">
    <img src="${path}/resources/images/illustrations/leaf-cyan-lg.png" alt="illustrations" class="bg-shape-7">
</section>

<section class="section">
    <div class="container">
        <div class="buttons is-right">
            <a href="${path}/community/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button"> 목록 </a>
            <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                <a href="${path}/community/edit.do?cno=${detail.cno}" class="button"> 수정 </a>
                <a href="${path}/community/delete.do?cno=${detail.cno}" class="button"> 삭제 </a>
            </c:if>
        </div>
        <div class="columns">
            <div class="column is-one-quarter">
                <p> 카테고리 </p>
                <input type="text" value="${detail.cateName}" class="input" readonly>
            </div>
            <div class="column">
                <p> 제목 </p>
                <input type="text" value="${detail.title}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <p> 작성자 </p>
                <input type="text" value="${detail.author}" class="input" readonly>
            </div>
            <div class="column">
                <p> 작성일 </p>
                <input type="text" value="${detail.resdate}" class="input" readonly>
            </div>
            <div class="column is-one-fifth">
                <p> 조회수 </p>
                <input type="text" value="${detail.cnt}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column m-3 p-5" style="border: 1px solid #ddd; border-radius: 5px; min-height:500px;">
                ${detail.content}
            </div>
        </div>
    </div>
    <c:if test="${sid ne null}">
        <div class="container">
            <form action="${path}/comment/insert.do" method="post" class="columns mt-5">
                <div class="column is-four-fifths">
                    <textarea name="content" id="content" class="textarea has-fixed-size" maxlength="990" cols="30" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                </div>
                <div class="column">
                    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
                    <input type="hidden" id="page" name="page" value="${curPage}">
                    <c:if test="${!empty cate}">
                        <input type="hidden" id="cate" name="cate" value="${cate}">
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <input type="hidden" id="type" name="type" value="${type}">
                        <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                    </c:if>
                    <input type="submit" class="button is-fullwidth is-primary" style="height:72px" value="전송">
                </div>
            </form>
        </div>
    </c:if>

    <div class="container">
        <c:forEach var="comment" items="${commentList}">
            <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
                <div class="buttons is-right mt-5" style="margin-bottom:-10px">
                    <a href="${path}/comment/delete.do?comNo=${comment.comNo}&cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button is-small"> 삭제 </a>
                </div>
            </c:if>
            <div class="columns">
                <div class="column">
                    <p> ${comment.author} </p>
                </div>
                <div class="column">
                    <p class="has-text-right"> ${comment.resdate} </p>
                </div>
            </div>
            <div class="columns">
                <div class="column">
                    <textarea class="textarea has-fixed-size" readonly>${comment.content}</textarea>
                </div>
            </div>
        </c:forEach>
            <!-- pagination -->
            <nav class="pagination is-rounded is-centered mt-5 mb-6" role="navigation" aria-label="pagination">
                <c:if test="${commentPage > 5}">
                    <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == commentPage}">
                                <li>
                                    <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>
        </section>
    </div>

<%@ include file="../layout/footer.jsp"%>

<form action="#">
    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

<!-- jQuery -->
<script src="${path}/resources/plugins/jQuery/jquery.min.js"></script>
<!-- slick slider -->
<script src="${path}/resources/plugins/slick/slick.min.js"></script>
<!-- filter -->
<script src="${path}/resources/plugins/shuffle/shuffle.min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>
