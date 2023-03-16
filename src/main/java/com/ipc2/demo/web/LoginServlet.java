package com.ipc2.demo.web;

import com.ipc2.demo.datos.UsuarioDB;
import com.ipc2.demo.modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    private Usuario usuarioLogin;
    private UsuarioDB usuarioDB;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conexion = (Connection) session.getAttribute("conexion");
        Usuario usuario = (Usuario) session.getAttribute("user");

        if (usuario != null) {
            response.sendRedirect("index.jsp");
            return;
        }

        usuarioDB = new UsuarioDB(conexion);

        String username = request.getParameter("username");
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        if (validarUsuario(username, password, email)) {
            session.setAttribute("user", usuarioLogin);
            response.sendRedirect("inicio.jsp");
        } else {
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public boolean validarUsuario(String username, String password, String email) {
        var oUsuario = usuarioDB.obtenerUsuario(username, password, email);
        if (oUsuario.isEmpty()) return false;

        usuarioLogin = oUsuario.get();
        return true;
    }
}
