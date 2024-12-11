class Role {
  int id;
  String name;

  // Construtor da classe Role
  Role({
    required this.id,
    required this.name,
  });

  // Fábrica que cria uma instância de Role a partir de um JSON
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }

  // Método que converte uma instância de Role para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
