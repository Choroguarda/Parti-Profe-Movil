class Usuario {
  int? id;
  String? email;
  String? password;
  int? rol;
  int? datoscompletados;

  Usuario(
      {this.id, this.email, this.password, this.rol, this.datoscompletados});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'rol': rol,
      'datoscompletados': datoscompletados
    };
  }
}
