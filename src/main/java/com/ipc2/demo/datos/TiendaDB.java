package com.ipc2.demo.datos;

import com.ipc2.demo.modelo.Tienda;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TiendaDB {
    private Connection conexion;
    public TiendaDB(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Tienda> listar() {
        var tiendas = new ArrayList<Tienda>();
        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT *  FROM TIENDA")) {

            while (resultSet.next()) {

                var codigo = resultSet.getInt("codigo");
                var direccion = resultSet.getString("direccion");
                var tipo  = resultSet.getString("tipo") ;
                var productos = resultSet.getArray("productos");

                var tienda = new Tienda(codigo,direccion,tipo, (ArrayList) productos);
                tiendas.add(tienda);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }
        return tiendas;
    }
}
