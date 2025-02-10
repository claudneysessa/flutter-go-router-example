import 'package:spallawebapp/common/routes/app_router.dart';
import 'package:spallawebapp/domain/models/application_modulo_model.dart';
import 'package:spallawebapp/domain/models/application_modulo_permissao_model.dart';

class ApplicationMenuItem {
  static final List<ModuloModel> _listaMenu = [
    ModuloModel(
      nome: "SPAAPP",
      permissoes: [
        PermissaoModel(
          nome: "Home",
          permissao: "home",
          rota: AppRoutesNames.homeNamedPage,
        ),
        PermissaoModel(
          nome: "Profile",
          permissao: "profile",
          rota: AppRoutesNames.profileNamedPage, // Corrigindo a rota
        ),
        PermissaoModel(
          nome: "Settings",
          permissao: "settings",
          rota: AppRoutesNames.settingsNamedPage, // Corrigindo a rota
        ),
      ],
    ),
    ModuloModel(
      nome: "SPACAD",
      permissoes: [
        PermissaoModel(
          nome: "Cadastro de Clientes",
          permissao: "CadastrodeClientes1",
          rota: AppRoutesNames.cadastroClientesNamedPage,
        ),
      ],
    ),
    ModuloModel(
      nome: "SPACOM",
      permissoes: [
        PermissaoModel(
          nome: "Pedido de Venda",
          permissao: "SpacomPedidoCliente1",
          rota: AppRoutesNames.vendasNamedPage,
        ),
      ],
    )
  ];

  static List<ModuloModel> get listaMenu => _listaMenu;

  static T? _findPermissao<T>(bool Function(PermissaoModel) predicate,
      T Function(PermissaoModel) selector) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (predicate(subItem)) {
          return selector(subItem);
        }
      }
    }
    return null;
  }

  static String? obterNomePorPermissao(String permissao) {
    return _findPermissao(
      (p) => p.permissao == permissao,
      (p) => p.nome!,
    );
  }

  static String? obterNomePorRota(String rota) {
    return _findPermissao(
      (p) => p.rota == rota,
      (p) => p.nome!,
    );
  }

  static String? obterRotaPorNome(String nome) {
    return _findPermissao(
      (p) => p.nome == nome,
      (p) => p.rota!,
    );
  }

  static String? obterRotaPorPermissao(String permissao) {
    return _findPermissao(
      (p) => p.permissao == permissao,
      (p) => p.rota!,
    );
  }

  static String? obterPermissaoPorNome(String nome) {
    return _findPermissao(
      (p) => p.nome == nome,
      (p) => p.permissao!,
    );
  }

  static String? obterPermissaoPorRota(String rota) {
    return _findPermissao(
      (p) => p.rota == rota,
      (p) => p.permissao!,
    );
  }

  static List<PermissaoModel>? obterPermissoesPorModulo(String modulo) {
    for (var item in listaMenu) {
      if (item.nome == modulo) {
        return item.permissoes;
      }
    }
    return null;
  }
}
