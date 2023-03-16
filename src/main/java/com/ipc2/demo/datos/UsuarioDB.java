package com.ipc2.demo.datos;

import com.ipc2.demo.modelo.Usuario;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UsuarioDB {
    private Connection conexion;
    public UsuarioDB(Connection conexion) {
        this.conexion = conexion;
    }

    public void crear(Usuario user) {
        String query = "INSERT INTO USUARIO (codigo,nombre,tienda, username, password,email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (var preparedStatement = conexion.prepareStatement(query)) {
            preparedStatement.setInt(1, user.getCodigo());
            preparedStatement.setString(2, user.getNombre());
            preparedStatement.setInt(3, user.getTienda());
            preparedStatement.setString(4, user.getUsername());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.executeUpdate();
            System.out.println("Usuario creado");
        } catch (SQLException e) {
            System.out.println("Error al crear usuario: " + e);
        }
    }

        public void actualizar(Usuario user) {
            String query = "UPDATE USUARIO SET nombre = ?, username = ?, password = ? WHERE codigo = ?";

            try (var preparedStatement = conexion.prepareStatement(query)) {
                preparedStatement.setString(1, user.getNombre());
                preparedStatement.setString(2, user.getUsername());
                preparedStatement.setString(3, user.getPassword());
                preparedStatement.setInt(4, user.getCodigo());
                preparedStatement.executeUpdate();
                System.out.println("Usuario actualizado");
            } catch (SQLException e) {
                System.out.println("Error al actualizar usuario: " + e);
            }
        }

        public void eliminar(int codigo) {
            String query = "DELETE FROM USUARIO WHERE codigo = ?";

            try (var preparedStatement = conexion.prepareStatement(query)) {
                preparedStatement.setInt(1, codigo);
                preparedStatement.executeUpdate();
                System.out.println("Usuario eliminado");
            } catch (SQLException e) {
                System.out.println("Error al eliminar usuario: " + e);
            }
        }

        public List<Usuario> listar() {
            var usuarios = new ArrayList<Usuario>();
            try (var stmt = conexion.createStatement();
                 var resultSet = stmt.executeQuery("SELECT *  FROM USUARIOTIENDA_N")) {

                while (resultSet.next()) {

                    var codigo = resultSet.getInt("codigo");
                    var nombre = resultSet.getString("nombre");
                    var tienda  = resultSet.getInt("tienda") ;
                    var username = resultSet.getString("username");
                    var password = resultSet.getString("password");
                    var email = resultSet.getString("email");

                    var usuario = new Usuario(codigo,nombre,tienda, username, password,email);
                    usuarios.add(usuario);
                }
            }catch (SQLException e) {
                System.out.println("Error al consultar: " + e);
            }
            return usuarios;
        }

        public Optional<Usuario> obtenerUsuario(String username, String password,String email) {
            String query = "SELECT * FROM USUARIOTIENDA_N WHERE username = ? AND password = ? OR email = ? AND password = ? ";
            Usuario usuario = null;

            try (var preparedStatement = conexion.prepareStatement(query)) {

                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, password);


                try (var resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        var codigo = resultSet.getInt("codigo");
                        var nombre = resultSet.getString("nombre");
                        var tienda = resultSet.getInt("tienda");
                        usuario = new Usuario(codigo, nombre, tienda, username, password,email);
                    }
                }
            }catch (SQLException e) {
                System.out.println("Error al consultar: " + e);
            }

            return Optional.ofNullable(usuario);
        }
    }

