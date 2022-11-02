<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js"></script>
    <style>
        #write-form{
            width: 800px;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="write-form">
    <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
        작성자: <input type="text" name="boardWriter" placeholder="작성자입력" class="form-control"><br>
        글비밀번호: <input type="text" name="boardPass" placeholder="글비밀번호입력" class="form-control"><br>
        제목: <input type="text" name="boardTitle" placeholder="제목입력" class="form-control"><br>
        <textarea name="boardContents" cols="30" rows="10" placeholder="내용입력" class="form-control"></textarea>
<%--        내용: <input type="text" name="boardContents" placeholder="내용입력" class="form-control"><br>--%>
        <input type="file" class="form-control" name="boardFile">
        <input type="button" value="작성하기" onclick="save()" class="btn btn-primary">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
    
</div>
</body>
<script>
    const save = () => {
        document.saveForm.submit();
    }
</script>
</html>
