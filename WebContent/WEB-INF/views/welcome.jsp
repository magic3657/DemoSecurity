<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome page - User登入頁</title>
</head>
<body>
    Greeting : ${greeting}
    This is a welcome page.  (User登入頁)
    <a href="<c:url value="/logout" />">Logout</a>
</body>
</html>