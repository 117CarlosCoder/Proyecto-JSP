package com.ipc2.demo.modelo;

import lombok.*;

import java.util.ArrayList;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Devolucion {

    private  int id;
    private  int tienda;
    private  int usuario;
    private  int fecha;
    private ArrayList productos;
    private int total;
    private String estado;
}

