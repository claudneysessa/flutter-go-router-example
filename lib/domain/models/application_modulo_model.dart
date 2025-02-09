import 'package:spallawebapp/domain/models/application_modulo_permissao_model.dart';

class ModuloModel {
  String? nome;
  List<PermissaoModel>? permissoes;

  ModuloModel({
    this.nome,
    this.permissoes,
  });
}
