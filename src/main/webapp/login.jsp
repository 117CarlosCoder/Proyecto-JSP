<%--
  Created by IntelliJ IDEA.
  User: calin10
  Date: 3/13/23
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>

<jsp:include page="WEB-INF/navBar.jsp"/>

<section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <form id="form-login" class="mb-md-5 mt-md-4 pb-5" action="${pageContext.request.contextPath}/login-servlet" method="POST">

                            <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                            <p class="text-white-50 mb-5">Please enter your login and password!</p>

                            <div class="form-outline form-white mb-4">
                                <input type="text" id="username" class="form-control form-control-lg" name="username"/>
                                <label class="form-label" for="username">Email</label>
                            </div>

                            <div class="form-outline form-white mb-4">
                                <input type="password" id="password" class="form-control form-control-lg" name="password"/>
                                <label class="form-label" for="Password">Password</label>
                            </div>

                            <c:if test="${!empty(error)}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <strong>Login fallido!</strong> ${error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>

                            <button class="btn btn-outline-light btn-lg px-5" type="submit" >Login</button>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
