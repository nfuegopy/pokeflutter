import 'package:flutter/material.dart';
import 'package:api/service/PokedexService.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokedexService().getPokemonList(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<dynamic> pokemons = snapshot.data['results'];
        return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(pokemons[index]['name']),
              );
            });
      },
    );
  }
}
