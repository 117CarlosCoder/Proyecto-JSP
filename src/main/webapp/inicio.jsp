<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Inicio</title>
    <link href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href='//fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<c:choose>
<c:when test="${tipo == 'tienda normal'}">
    <jsp:include page="WEB-INF/navBarMenu.jsp"/>
    <div class="container shadow min-vh-100 py-4">
        <h1>Bienvenido a la Tienda Normal ${user.nombre}</h1>
    </div>
</c:when>
<c:when test="${tipo == 'tienda supervisada'}">
    <jsp:include page="WEB-INF/navBarMenu.jsp"/>
    <div class="container shadow min-vh-100 py-4">
        <h1>Bienvenido a la Tienda supervisada ${user.nombre}</h1>
    </div>
</c:when>
<c:when test="${tipo == 'bodega'}">
    <jsp:include page="WEB-INF/navBarMenuBodega.jsp"/>
    <div class="container shadow min-vh-100 py-4">
        <h1>Bienvenido a la Bodega ${user.nombre}</h1>
    </div>
</c:when>
<c:when test="${tipo == 'admin'}">
    <jsp:include page="WEB-INF/navBarMenuAdmin.jsp"/>
    <div class="container shadow min-vh-100 py-4">
        <h1>Bienvenido a la Tienda Administrador ${user.nombre}</h1>
    </div>
</c:when>
    <c:otherwise>
        <jsp:include page="WEB-INF/navBarMenu.jsp"/>
        <div class="container shadow min-vh-100 py-4">
            <h1>Bienvenido a la Tienda ${user.nombre}</h1>
        </div>
    </c:otherwise>
</c:choose>

<img src="/WEB-INF/tienda.jpg" >
</body>
</html>
