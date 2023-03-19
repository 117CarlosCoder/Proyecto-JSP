package com.ipc2.demo.modelo;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Pedido {
    private  int id;
    private  int tienda;
    private  String usuario;
    private  String fecha;
    private  String productos;
    private  int total;
    private String estado;

}
