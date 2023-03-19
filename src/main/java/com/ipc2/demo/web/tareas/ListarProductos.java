package com.ipc2.demo.web.tareas;

import com.ipc2.demo.datos.ProductosDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/listar-Productos")
public class ListarProductos extends HttpServlet{
        private ProductosDB productosDB;
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
            productosDB = new ProductosDB(connection);

            request.setAttribute("productos", productosDB.listar());
            request.getRequestDispatcher("inicio.jsp").forward(request, response);

        }
}
