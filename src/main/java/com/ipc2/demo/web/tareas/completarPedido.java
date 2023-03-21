package com.ipc2.demo.web.tareas;

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

@WebServlet("/completar-Pedido")
public class completarPedido extends HttpServlet {

    private ArrayList<Compra> comprar = new ArrayList<>();

    private ArrayList<String> compras = new ArrayList<String>();
    //private ArrayList<Compra> pedir = new ArrayList<>();
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

        comprar = (ArrayList<Compra>) session.getAttribute("compras");

        session.removeAttribute("compras");

        request.getRequestDispatcher("/pedidos/crearPedido.jsp").forward(request, response);

    }



}
