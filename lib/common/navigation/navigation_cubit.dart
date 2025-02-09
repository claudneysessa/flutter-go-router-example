import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spallawebapp/common/routes/app_router.dart';

class NavigationState extends Equatable {
  // Declara as propriedades da classe
  final String bottomNavItems;

  final int index;

  // Define o construtor da classe
  const NavigationState({
    required this.bottomNavItems,
    required this.index,
  });

  // Define o método get props que retorna uma lista de objetos que representam o estado
  @override
  List<Object> get props => [bottomNavItems, index];
}

// Defina a classe NavigationCubit que estende Cubit<NavigationState>
class NavigationCubit extends Cubit<NavigationState> {
  // Construtor da classe NavigationCubit
  // Chama o construtor da superclasse com o estado inicial
  // bottomNavItems: AppRoutesNames.homeNamedPage - Define a rota inicial como a página inicial
  // index: 0 - Define o índice inicial como 0 (correspondente à página inicial)
  NavigationCubit()
      : super(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          index: 0,
        )) {
    _loadState();
  }

  // Chave para persistir o estado no shared_preferences
  static const String _navIndexKey = 'nav_index';

  // Carrega o estado persistido ao iniciar o Cubit
  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();

    // Carrega o índice ou usa 0 como padrão
    final index = prefs.getInt(_navIndexKey) ?? 0;

    // Define o estado inicial com o índice carregado
    getNavBarItem(index);
  }

  // Persiste o índice da barra de navegação no shared_preferences
  Future<void> _saveState(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_navIndexKey, index);
  }

  // Define o método getNavBarItem que recebe um índice como parâmetro
  void getNavBarItem(int index) {
    String routeName;

    // Utiliza uma estrutura switch para determinar a rota com base no índice
    switch (index) {
      case 0:
        routeName = AppRoutesNames.homeNamedPage;
        break;
      case 1:
        routeName = AppRoutesNames.profileNamedPage;
        break;
      case 2:
        routeName = AppRoutesNames.settingsNamedPage;
        break;
      default:
        routeName = AppRoutesNames.homeNamedPage;

        // Garante que o índice seja válido
        index = 0;
        break;
    }

    // Emite um novo estado com a rota e o índice atualizados
    emit(NavigationState(bottomNavItems: routeName, index: index));

    // Persiste o índice
    _saveState(index);
  }
}
