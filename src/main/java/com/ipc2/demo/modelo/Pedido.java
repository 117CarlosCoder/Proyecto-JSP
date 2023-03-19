package com.ipc2.demo.modelo;

import lombok.*;

import java.util.ArrayList;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Pedido {
    private  int id;
    private  int tienda;
    private  String usuario;
    private  String fecha;
    private  ArrayList productos;
    private  int total;
    private String estado;

}
