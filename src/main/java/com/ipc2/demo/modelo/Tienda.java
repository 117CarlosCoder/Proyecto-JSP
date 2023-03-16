package com.ipc2.demo.modelo;

import lombok.*;

import java.util.ArrayList;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Tienda {
    private  int codigo;
    private  String direccion;
    private  String tipo;
    private ArrayList productos;
}
