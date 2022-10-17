<%--
  Created by IntelliJ IDEA.
  User: gpwls514
  Date: 2022-10-17
  Time: 오후 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HYEJIN</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">HYEJIN</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='/login/login'/>">login</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div>
<div style="text-align:center">
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="board" items="${list}">
            <tr>
                <td>${board.bno}</td>
                <td>${board.title}</td>
                <td>${board.writer}</td>
                <td>${board.reg_date}</td>
                <td>${board.view_cnt}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <c:if test="${ph.showPrev}">
            <a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value='/board/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
        </c:if>
    </div>
</div>
</body>
</html>
