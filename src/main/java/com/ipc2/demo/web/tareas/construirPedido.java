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
import java.util.Arrays;

@WebServlet("/construir-Pedido")
public class construirPedido extends HttpServlet {

    private ProductosDB productosDB;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("conexion");
        productosDB = new ProductosDB(connection);

        String cantidad = request.getParameter("cantidad");
        System.out.println(cantidad);
        String codigo = Arrays.toString(request.getParameterValues("producto.codigo"));
        System.out.println(codigo);


        //request.setAttribute("pedidos", productosDB.listarPoducto(cantidad,codigo));
        request.getRequestDispatcher("/listar-Productos").forward(request, response);
    }

}
