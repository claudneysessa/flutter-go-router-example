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
          rota: AppRoutesNames.homeNamedPage,
        ),
        PermissaoModel(
          nome: "Settings",
          permissao: "settings",
          rota: AppRoutesNames.homeNamedPage,
        ),
      ],
    ),
    ModuloModel(
      nome: "SPACAD",
      permissoes: [
        PermissaoModel(
          nome: "Cadastro de Clientes",
          permissao: "CadastrodeClientes1",
          rota: AppRoutesNames.homeNamedPage,
        ),
      ],
    ),
    ModuloModel(
      nome: "SPACOM",
      permissoes: [
        PermissaoModel(
          nome: "Pedido de Venda",
          permissao: "SpacomPedidoCliente1",
          rota: AppRoutesNames.profileNamedPage,
        ),
      ],
    )
  ];

  static List<ModuloModel> get listaMenu => _listaMenu;

  static obterNomePorPermissao(String permissao) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.permissao == permissao) {
          return subItem.nome;
        }
      }
    }
  }

  static obterNomePorRota(String rota) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.rota == rota) {
          return subItem.nome;
        }
      }
    }
  }

  static obterRotaPorNome(String nome) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.nome == nome) {
          return subItem.rota;
        }
      }
    }
  }

  static obterRotaPorPermissao(String permissao) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.permissao == permissao) {
          return subItem.rota;
        }
      }
    }
  }

  static obterPermissaoPorNome(String nome) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.nome == nome) {
          return subItem.permissao;
        }
      }
    }
  }

  static obterPermissaoPorRota(String rota) {
    for (var item in listaMenu) {
      for (var subItem in item.permissoes!) {
        if (subItem.rota == rota) {
          return subItem.permissao;
        }
      }
    }
  }

  static obterPermissoesPorModulo(String modulo) {
    for (var item in listaMenu) {
      if (item.nome == modulo) {
        return item.permissoes;
      }
    }
  }
}
