<%@page contentType="text/html" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/inicio.jsp">Tienda</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/listar-Productos">Crear Pedido</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/listar-Pedidos">Envíos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Crear Incidencia</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Crear Devolución</a>
        </li>
        <c:if test = "${tipo == 'tienda supervisada'}}">
          <li class="nav-item">
            <a class="nav-link active" href="#">Editar Pedido</a>
          </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link active" href="#">Reportes</a>
        </li>
      </ul>

    <div class="justify-content-end">
      <div class="container-fluid">
        <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" >${user.nombre}</a>
      </li>
      <li>
        <a class="nav-link active" href="${pageContext.request.contextPath}/logout">Cerrar sesión</a>
      </li>
          </ul>
    </div>
    </div>


  </div>
</nav>