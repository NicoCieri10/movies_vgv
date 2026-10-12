part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  const new({this.items = const []});

  final List<String> items;

  FavoritesState copyWith({List<String>? items}) =>
      FavoritesState(items: items ?? this.items);

  @override
  List<Object?> get props => [items];
}
