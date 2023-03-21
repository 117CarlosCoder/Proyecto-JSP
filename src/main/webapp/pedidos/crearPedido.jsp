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

<jsp:include page="/WEB-INF/navBarMenu.jsp"/>


<div class="container shadow min-vh-100 py-4">
<div class="row">
    <div class="col-md-5 mx-auto">
        <div class="input-group">
            <input class="form-control border-end-0 border rounded-pill" type="search" value="search" id="example-search-input">
            <span class="input-group-append">
                    <button class="btn btn-outline-secondary bg-primary.bg-gradient border-bottom-0 border rounded-pill ms-n5" type="button">
                        <i class="fa fa-search" ></i>
                    </button>
                </span>
        </div>
    </div>
</div>


<br>
<br>
<br>
    <div class="bg-dark p-3">
    </div>

    <h1>Compra</h1>
<c:if test="${empty(compra)}">
    <c:choose>
        <c:when test="${!empty(compras)}">
            <form method="post">
            <h1>${compra}</h1>
            <table id="listaPedidos" class="table table-striped table-sm" cellspacing="0"
                   width="100%">
                <thead class="bg-dark text-white">
                <tr>
                    <th>Codigo</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Catidad</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="compra" items="${compras}" >
                    <tr>
                        <td>${compra.codigo}</td>
                        <td>${compra.nombre}</td>
                        <td>${compra.precio}</td>
                        <td>${compra.cantidad}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h4 class="pl-4">No hay compras</h4>
        </c:otherwise>
    </c:choose>

    <input type="hidden" name="informacion" value="${compras}"/>
    <button type="submit" formaction="${pageContext.request.contextPath}/construir-Pedido">Cancelar</button>
    <button type="submit" formaction="${pageContext.request.contextPath}/construir-Pedido">Editar</button>
    <button type="submit" formaction="${pageContext.request.contextPath}/completar-Pedido">Completar compra</button>
    </form>
</c:if>
    <br>
    <br>
    <br>
    <br>
    <div class="bg-dark p-3">
    </div>
    <h1>Productos</h1>
    <form action="${pageContext.request.contextPath}/construir-Pedido" method="POST">
    <c:if test="${empty(producto)}">
        <c:choose>
            <c:when test="${!empty(productos)}">
                <table id="listTareas" class="table table-striped table-sm" cellspacing="0"
                       width="100%">
                    <thead class="bg-dark text-white">
                    <tr>
                        <th>Codigo</th>
                        <th>Producto</th>
                        <th>Costo</th>
                        <th>Precio</th>
                        <th>Existencia</th>
                        <th>Catidad</th>
                        <th>Agregar al pedido</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <form action="/construir-Pedido" method="post">
                        <c:forEach var="producto" items="${productos}" varStatus="status">
                            <tr data-id="${status.index}">
                                <td>${producto.codigo}</td>
                                <td>${producto.nombre}</td>
                                <td>${producto.costo}</td>
                                <td>${producto.precio}</td>
                                <td>${producto.existencia}</td>
                                <td><input type="number" id="cantidad" value="1" name="cantidad_${status.index}" ></td>
                                <td><button type="submit" class="agregar" name="id" value="${status.index}">Agregar</button></td>
                            </tr>
                        </c:forEach>
                    </form>
                    </tbody>
                </table>

            </c:when>
            <c:otherwise>
                <h4 class="pl-4">No hay productos</h4>
            </c:otherwise>
        </c:choose>
    </c:if>
    </form>

</div>
</body>
</html>