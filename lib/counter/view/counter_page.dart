import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:movies_vgv/counter/cubit/favorites_cubit.dart';

class CounterPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: const Center(child: ItemsList()),
    );
  }
}

class ItemsList extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesCubit>().state.items;
    final items = [
      'NICU',
      'CASTRO',
      'AGUS',
      'SOL',
      'TOTO',
      'NAHUEL',
      'LOPEZ',
      'CIERI',
      'PUTO',
      'HOLA',
    ];

    return Column(
      children: items
          .map(
            (item) => Column(
              children: [
                _BotonNicu(
                  text: item,
                  isSelected: favorites.contains(item),
                  onPressed: () {
                    if (favorites.contains(item)) {
                      context.read<FavoritesCubit>().removeFavorite(item);
                    } else {
                      context.read<FavoritesCubit>().addFavorite(item);
                    }
                  },
                ),
                if (items.last != item)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _BotonNicu extends StatelessWidget {
  const new({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 70, child: Text(text, overflow: TextOverflow.ellipsis)),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            isSelected ? Icons.favorite : Icons.favorite_border,
            color: isSelected ? Colors.red : Colors.grey,
          ),
        ),
      ],
    );
  }
}
