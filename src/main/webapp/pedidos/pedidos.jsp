<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Inicio</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href='//fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/navBarMenu.jsp"/>
<div class="container shadow min-vh-100 py-4">
<br>
<br>
<br>
<c:if test="${empty(pedido)}">
    <c:choose>
        <c:when test="${!empty(pedidos)}">
            <table id="listTareas" class="table table-striped table-sm" cellspacing="0"
                   width="100%">
                <thead class="bg-dark text-white">
                <tr>
                    <th>Id</th>
                    <th>Tienda</th>
                    <th>Usuario</th>
                    <th>Fecha</th>
                    <th>Productos</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pedido" items="${pedidos}" >
                    <tr>
                        <td>${pedido.id}</td>
                        <td>${pedido.tienda}</td>
                        <td>${pedido.usuario}</td>
                        <td>${pedido.fecha}</td>
                        <td>${pedido.productos}</td>
                        <td>${pedido.total}</td>
                        <td>${pedido.estado}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h4 class="pl-4">No hay pedidos</h4>
        </c:otherwise>
    </c:choose>
</c:if>
</div>
</body>
</html>
