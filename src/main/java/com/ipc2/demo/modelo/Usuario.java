package com.ipc2.demo.modelo;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Usuario {

    private  int codigo;
    private  String nombre;
    private  int tienda;
    private  String username;
    private  String password;
    private  String email;

}
