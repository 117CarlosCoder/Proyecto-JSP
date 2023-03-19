<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:if test="${empty(tarea)}">
  <code>${tarea}</code>
  <c:choose>
    <c:when test="${!empty(productos)}">
      <table id="listTareas" class="table table-striped table-sm" cellspacing="0"
             width="100%">
        <thead class="bg-dark text-white">
        <tr>
          <th>No</th>
          <th>Titulo</th>
          <th>Fecha creacion</th>
          <th>Prioridad</th>
          <th>Estado</th>
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

