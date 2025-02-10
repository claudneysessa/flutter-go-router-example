import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final String bottomNavItems;
  final String permissionKey;

  const NavigationState({
    required this.bottomNavItems,
    required this.permissionKey,
  });

  @override
  List<Object> get props => [bottomNavItems, permissionKey];
}
