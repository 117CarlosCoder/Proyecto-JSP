package com.ipc2.demo.web.tareas;

import com.ipc2.demo.datos.UsuarioDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/listar-Usuarios")
public class ListarUsuarios extends HttpServlet {
    private UsuarioDB usuarioDB;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("conexion");
        usuarioDB = new UsuarioDB(connection);
        session.setAttribute("tiendanormal", usuarioDB.listar());
        request.getRequestDispatcher("usuarios/usuariosTiendaN.jsp").forward(request, response);

    }
}
