<%--
  Created by IntelliJ IDEA.
  User: calin10
  Date: 3/20/23
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestión Usuarios Tienda Normal</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href='//fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/navBarMenuAdmin.jsp"/>
<div class="container shadow min-vh-100 py-4">

    <h1>Usuarios Tienda</h1>
    <br>
    <br>
    <br>
    <h1>Crear Usuarios</h1>
    <table id="listTareas" class="table table-striped table-sm" cellspacing="0"
           width="100%">
        <thead class="bg-dark text-white">
        <tr>
            <th>Codigo</th>
            <th>Nombre</th>
            <th>Tienda</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Correo</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="number" id="codigo" name="codigo" ></td>
                <td><input type="text" id="nombre" name="nombre" ></td>
                <td><input type="number" id="tienda" name="tienda" ></td>
                <td><input type="text" id="usuario" name="usuario" ></td>
                <td><input type="text" id="contraseña" name="contraseña" ></td>
                <td><button type="submit" class="agregar" name="agregar" >Crear Usuario</button></td>
            </tr>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <h1>Edición de Usuarios</h1>
    <c:if test="${empty(tiendaUser)}">
        <c:choose>
            <c:when test="${!empty(tiendanormal)}">
                <table id="listTareas" class="table table-striped table-sm" cellspacing="0"
                       width="100%">
                    <thead class="bg-dark text-white">
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Tienda</th>
                        <th>Usuario</th>
                        <th>Contraseña</th>
                        <th>Correo</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tiendaUser" items="${tiendanormal}" >
                        <tr data-id="${status.index}">
                            <td>${tiendaUser.codigo}</td>
                            <td>${tiendaUser.nombre}</td>
                            <td>${tiendaUser.tienda}</td>
                            <td>${tiendaUser.username}</td>
                            <td>${tiendaUser.password}</td>
                            <td>${tiendaUser.email}</td>
                            <td><button type="submit" class="Eliminar" name="Eliminar" value="${status.index}">Eliminar</button></td>
                            <td><button type="submit" class="Editar" name="Editar" value="${status.index}">Editar</button></td>
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
