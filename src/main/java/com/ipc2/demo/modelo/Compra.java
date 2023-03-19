package com.ipc2.demo.modelo;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Compra {
    private  int codigo;
    private  String nombre;
    private  int precio;
    private int cantidad;
}
