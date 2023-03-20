package com.ipc2.demo.web.tareas;

import com.ipc2.demo.datos.ProductosDB;
import com.ipc2.demo.modelo.Compra;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

@WebServlet("/construir-Pedido")
public class construirPedido extends HttpServlet {

    private ProductosDB productosDB;

    private ArrayList<Compra> compras = new ArrayList<>();
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

        String cantidadString = request.getParameter("cantidad_" + request.getParameter("id"));
        int cantidad = cantidadString != null ? Integer.parseInt(cantidadString) : 0;
        System.out.println(cantidad);

        String idString = request.getParameter("id");
        int id = idString != null ? Integer.parseInt(idString) : 0;
        System.out.println(id+1);


        /*String codigoProducto = request.getParameter("codigo");
        System.out.println(codigoProducto);
        if (codigoProducto == null) {
        } else {
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            System.out.println(cantidad);
        }

        String cant = request.getParameter("cantidad");
        int cantidad = ( cant==null?1:Integer.valueOf(cant));
        System.out.println(cantidad);
        String cod = request.getParameter("indice");
        System.out.println(cod);*/

        request.setAttribute("compras", productosDB.listarPoducto(id+1,cantidad,compras));
        request.getRequestDispatcher("/listar-Productos").forward(request, response);
    }

}
