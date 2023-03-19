package com.ipc2.demo.web.tareas;

import com.ipc2.demo.datos.PedidosDB;
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

@WebServlet("/listar-Pedidos")
public class ListarPedidos extends HttpServlet {
    private PedidosDB pedidosDB;

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
        pedidosDB = new PedidosDB(connection);
        Usuario usuario = (Usuario) session.getAttribute("user");

        request.setAttribute("pedidos", pedidosDB.listarUsuario(String.valueOf(usuario.getUsername())));
        request.getRequestDispatcher("pedidos/pedidos.jsp").forward(request, response);

    }


}
