<%--
  Created by IntelliJ IDEA.
  User: gpwls514
  Date: 2022-10-17
  Time: 오후 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HYEJIN</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">HYEJIN</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div>

<script>
    let msg = "${msg}";
    if(msg == "WRT_ERR") alert("게시물 등록에 실패했습니다. 다시 시도해주세요.";
    if(msg == "MOD_ERR") alert("게시물 수정에 실패했습니다. 다시 시도해주세요.")
</script>

<div style="text-align:center">
    <h2>게시물 ${mode == "new" ? "글쓰기" : "읽기"}</h2>
    <form action="" id="form">
        <input type="hidden" name="bno" value="${boardDto.bno}">
        <input type="text" name="title" value="${boardDto.title}" ${mode != "new" ? 'readonly="readonly"' : ''}>
        <textarea name="content" cols="30" rows="10" ${mode != "new" ? 'readonly="readonly"' : ''}>${boardDto.content}</textarea>
        <button type="button" id="writeBtn" class="btn">글쓰기</button>
        <button type="button" id="modifyBtn" class="btn">수정</button>
        <button type="button" id="removeBtn" class="btn">삭제</button>
        <button type="button" id="listBtn" class="btn">목록</button>
    </form>
</div>


<script>

    $(function(){

        // 목록
        $("#listBtn").on("click", function(){
            location.href = "<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
        });

        // 삭제
        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제 하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });


        // 수정
        $("#modifyBtn").on("click", function(){

            let form = $("#form");
            let isReadOnly = $("input[name=title]").prop("readonly");

            // 1. 읽기 상태 - 수정 상태로 변경
            if(isReadOnly) {
                $("input[name=title]").prop("readonly", false);
                $("textarea").prop("readonly", false);
                $("#modifyBtn").text("등록");
                $("h2").text("게시물 수정");
                return;
            }
            // 2. 수정 상태 - 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify?page=${page}&pageSize=${pageSize}'/>");
            form.attr("method", "post");
            form.submit();
        });

        // 글쓰기
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            form.submit();
        });


    }); // document ready

</script>
</body>
</html>
