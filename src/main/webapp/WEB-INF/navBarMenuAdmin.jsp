<%@page contentType="text/html" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/inicio.jsp">Tienda</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/listar-Usuarios">Usuarios Tienda</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/index.jsp">Usuarios Bodega</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/index.jsp">Usuarios Supervisor</a>
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