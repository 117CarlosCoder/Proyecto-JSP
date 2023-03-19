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

<c:if test="${empty(tarea)}">
    <code>${tarea}</code>
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

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h4 class="pl-4">No hay tareas</h4>
        </c:otherwise>
    </c:choose>
</c:if>