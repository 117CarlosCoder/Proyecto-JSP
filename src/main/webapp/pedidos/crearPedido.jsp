<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



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

<c:if test="${empty(compra)}">
    <c:choose>
        <c:when test="${!empty(compras)}">
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
                        <td>${cmopra.precio}</td>
                        <td>${cmopra.cantidad}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h4 class="pl-4">No hay compras</h4>
        </c:otherwise>
    </c:choose>
</c:if>

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
                    <c:forEach var="producto" items="${productos}" >
                        <tr>
                            <td>${producto.codigo}</td>
                            <td>${producto.nombre}</td>
                            <td>${producto.costo}</td>
                            <td>${producto.precio}</td>
                            <td>${producto.existencia}</td>
                            <td><input  type="number" id="cantidad" name="cantidad" value="1"></td>
                            <td><form action="${pageContext.request.contextPath}/construir-Pedido" method="POST"><button type="submit" >Agregar</button></form></td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h4 class="pl-4">No hay productos</h4>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>