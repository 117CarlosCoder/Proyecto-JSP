package com.ipc2.demo.modelo;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Pedido {
    private  int codigo;
    private  String nombre;
    private  int costo;
    private  int precio;
    private  String existencia;
}
