<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>AccessDenied page 無造訪頁面權限</title>
</head>
<body>
    Dear <strong>${user}</strong>, You are not authorized to access this page (無造訪頁面權限)
    <a href="<c:url value="/logout" />">Logout</a>
</body>
</html>