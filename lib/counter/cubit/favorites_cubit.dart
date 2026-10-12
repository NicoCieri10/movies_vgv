import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  new() : super(const FavoritesState());

  void addFavorite(String item) {
    if (state.items.contains(item)) return;
    emit(state.copyWith(items: [...state.items, item]));
  }

  void removeFavorite(String item) {
    if (!state.items.contains(item)) return;
    final items = state.items.where((i) => i != item);
    emit(state.copyWith(items: items.toList()));
  }
}
