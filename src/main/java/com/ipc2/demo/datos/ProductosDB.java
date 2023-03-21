package com.ipc2.demo.datos;

import com.ipc2.demo.modelo.Compra;
import com.ipc2.demo.modelo.Producto;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductosDB {
    private Connection conexion;
    public ProductosDB(Connection conexion) {
        this.conexion = conexion;
    }
    public List<Producto> listar() {
        var productos = new ArrayList<Producto>();
        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT * FROM PRODUCTO")) {
            System.out.println(resultSet);
            while (resultSet.next()) {

                var codigo = resultSet.getInt("codigo");
                var nombre = resultSet.getString("nombre");
                var costo  = resultSet.getInt("costo") ;
                var precio  = resultSet.getInt("precio") ;
                var exitencias = resultSet.getInt("existencias");

                var producto = new Producto(codigo,nombre,costo,precio, exitencias);
                productos.add(producto);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }
        return productos;
    }

    public  List<Compra> listarPoducto(int numero, int cantidad, ArrayList<Compra> compras) {

        try (var stmt = conexion.createStatement();
             var resultSet = stmt.executeQuery("SELECT * FROM PRODUCTO WHERE codigo = '" + numero +"'")) {
            System.out.println("numero :" +numero);
            while (resultSet.next()) {
                var nombre = resultSet.getString("nombre");
                var precio  = resultSet.getInt("precio");
                var compra = new Compra(numero,nombre,precio,cantidad);
                System.out.println(compra);
                compras.add(compra);
            }
        }catch (SQLException e) {
            System.out.println("Error al consultar: " + e);
        }
        System.out.println(compras);
        return compras;
    }
}
