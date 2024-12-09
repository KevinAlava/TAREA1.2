class LogicaLogin {
  bool verificarCredenciales(String usuario, String contrasenia){
    const usuarioValido="admin";
    const contraseniaValida = "12345";


    return usuario == usuarioValido && contrasenia == contraseniaValida;
  }
}