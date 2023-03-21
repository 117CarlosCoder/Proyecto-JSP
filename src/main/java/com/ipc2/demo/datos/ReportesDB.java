package com.ipc2.demo.datos;

import com.ipc2.demo.modelo.Producto;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReportesDB {

    private Connection conexion;
    public ReportesDB(Connection conexion) {
        this.conexion = conexion;
    }

    public void listar() {
        var productos = new ArrayList<Producto>();
        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT * FROM PRODUCTO")) {
            System.out.println(resultSet);
            while (resultSet.next()) {

                var codigo = resultSet.getInt("codigo");
                var nombre = resultSet.getString("nombre");
                var costo  = resultSet.getInt("costo") ;
                var precio  = resultSet.getInt("precio") ;
                var exitencias = resultSet.getInt("exitencias");

                var producto = new Producto(codigo,nombre,costo,precio, exitencias);
                productos.add(producto);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }

    }
}
