kv# Classe NavigationCubit

A classe `NavigationCubit` é responsável por gerenciar o estado da navegação na aplicação, permitindo a transição entre diferentes páginas e a persistência do estado da navegação entre sessões.

## Visão Geral

O `NavigationCubit` utiliza o padrão BLoC (Business Logic Component) para separar a lógica de navegação da interface do usuário. Ele emite estados do tipo `NavigationState`, que contêm informações sobre a página atual e o índice do item selecionado na barra de navegação.

## Classe `NavigationState`

A classe `NavigationState` representa o estado da navegação na aplicação. Ela contém as seguintes propriedades:

*   `bottomNavItems`: Uma string que representa a rota da página atual.
*   `index`: Um inteiro que representa o índice do item selecionado na barra de navegação.

```dart
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final String bottomNavItems;
  final int index;

  const NavigationState({
    required this.bottomNavItems,
    required this.index,
  });

  @override
  List<Object> get props => [bottomNavItems, index];
}
```

## Classe `NavigationCubit`

A classe `NavigationCubit` estende a classe `Cubit<NavigationState>` e implementa a lógica de navegação na aplicação.

```dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spallawebapp/common/routes/app_router.dart';

class NavigationCubit extends Cubit<NavigationState> {
  // Estado inicial do Cubit. Define a página inicial como 'home' e o índice como 0.
  NavigationCubit()
      : super(const NavigationState(
          bottomNavItems: AppRoutesNames.homeNamedPage,
          index: 0,
        )) {
    // Carrega o estado persistido (se existir) ao iniciar o Cubit.
    _loadState();
  }

  // Chave utilizada para armazenar o índice da página no SharedPreferences.
  static const String _navIndexKey = 'nav_index';

  // Carrega o estado persistido do SharedPreferences.
  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    // Recupera o índice da página do SharedPreferences. Se não existir, usa 0 como padrão.
    final index = prefs.getInt(_navIndexKey) ?? 0;
    // Define o estado inicial do Cubit com o índice recuperado.
    getNavBarItem(index);
  }

  // Persiste o índice da página no SharedPreferences.
  Future<void> _saveState(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_navIndexKey, index);
  }

  // Atualiza o estado do Cubit com base no índice da página selecionada.
  void getNavBarItem(int index) {
    String routeName;

    // Mapeia o índice para o nome da rota correspondente.
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
        index = 0; // Garante que o índice seja válido.
        break;
    }

    // Emite um novo estado com o nome da rota e o índice atualizados.
    emit(NavigationState(bottomNavItems: routeName, index: index));

    // Persiste o índice no SharedPreferences.
    _saveState(index);
  }
}
```

### Construtor

O construtor da classe `NavigationCubit` inicializa o estado do Cubit com a página inicial (Home) e o índice 0. Ele também chama o método `_loadState()` para carregar o estado persistido do `SharedPreferences`.

### Métodos

*   `_loadState()`: Carrega o estado persistido do `SharedPreferences`.
*   `_saveState(int index)`: Persiste o índice da página no `SharedPreferences`.
*   `getNavBarItem(int index)`: Atualiza o estado do Cubit com base no índice da página selecionada.

### Utilização

1.  **Crie uma instância do `NavigationCubit`:**

    ```dart
    final navigationCubit = NavigationCubit();
    ```

2.  **Forneça o `NavigationCubit` para a árvore de widgets:**

    ```dart
    BlocProvider(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        // ...
      ),
    )
    ```

3.  **Utilize o `NavigationCubit` para navegar entre as páginas:**

    ```dart
    context.read<NavigationCubit>().getNavBarItem(0); // Navega para a página Home
    context.read<NavigationCubit>().getNavBarItem(1); // Navega para a página Profile
    context.read<NavigationCubit>().getNavBarItem(2); // Navega para a página Settings
    ```

### Persistência

O `NavigationCubit` utiliza o `SharedPreferences` para persistir o índice da página selecionada. Isso permite que a aplicação restaure o estado da navegação quando é reiniciada.

*   `_navIndexKey`: A chave utilizada para armazenar o índice da página no `SharedPreferences`.
*   `_loadState()`: Carrega o índice da página do `SharedPreferences` e atualiza o estado do Cubit.
*   `_saveState(int index)`: Persiste o índice da página no `SharedPreferences`.