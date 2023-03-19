package com.ipc2.demo.modelo;

import lombok.*;

import java.util.ArrayList;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Incidencia {

    private  int id;
    private  int tienda;
    private  int usuario;
    private  int fecha;
    private ArrayList productos;
    private String solucion;

    private String estado;
}
