package com.ipc2.demo.web.tareas;


import com.ipc2.demo.datos.UsuarioDB;
import com.ipc2.demo.web.HelloServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/Eliminar-Usuarios")

public class EliminarUsuarios extends HelloServlet {
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

        request.setAttribute("tiendanormal", usuarioDB.listar());
        request.getRequestDispatcher("inicio.jsp").forward(request, response);

    }
}
