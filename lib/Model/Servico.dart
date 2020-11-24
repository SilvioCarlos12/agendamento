class Servico {
  String id;
  String descricao;
  String valor;

  Servico({this.id, this.descricao, this.valor});

  Servico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['valor'] = this.valor;
    return data;
  }
}
