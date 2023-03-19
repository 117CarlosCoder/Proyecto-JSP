package com.ipc2.demo.datos;

import com.ipc2.demo.modelo.Pedido;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidosDB {

    private Connection conexion;
    public PedidosDB(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Pedido> listar() {
        var pedidos = new ArrayList<Pedido>();
        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT * FROM PEDIDO")) {
            System.out.println(resultSet);
            while (resultSet.next()) {

                var id_pedido = resultSet.getInt("id");
                var tienda = resultSet.getInt("tienda");
                var username  = resultSet.getString("usuario") ;
                var fecha_pedido  = resultSet.getString("fecha") ;
                var lista_producto = resultSet.getString("productos");
                var total_pedido = resultSet.getInt("total");
                var estado = resultSet.getString("estado");


                var pedido = new Pedido(id_pedido,tienda,username,fecha_pedido,lista_producto,total_pedido,estado);
                pedidos.add(pedido);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }
        return pedidos;
    }

    public List<Pedido> listarUsuario(String user) {
        var pedidos = new ArrayList<Pedido>();
        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT * FROM PEDIDO WHERE usuario = '" + user +"'")) {
            System.out.println(resultSet);
            while (resultSet.next()) {

                var id = resultSet.getInt("id");
                var tienda = resultSet.getInt("tienda");
                var usuario  = resultSet.getString("usuario") ;
                var fecha  = resultSet.getString("fecha") ;
                var productos = resultSet.getString("productos");
                var total = resultSet.getInt("total");
                var estado = resultSet.getString("estado");


                var pedido = new Pedido(id,tienda,usuario,fecha, productos,total,estado);
                pedidos.add(pedido);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }
        return pedidos;
    }
}
