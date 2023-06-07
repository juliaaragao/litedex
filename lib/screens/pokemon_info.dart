import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litedex/model/pokemon.dart';


class PokemonInfo extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Color backgroundColor = Colors.black;
    if (pokemon != null) {
      switch (pokemon?.tipo) {
        case 'normal':
          backgroundColor = Color.fromARGB(255, 205, 202, 201);
          break;
        case 'fire':
          backgroundColor = Color.fromARGB(255, 230, 172, 78);
          break;
        case 'water':
          backgroundColor = Color.fromARGB(183, 40, 90, 238);
          break;
        case 'electric':
          backgroundColor = Color.fromARGB(255, 246, 236, 147);
          break;
        case 'grass':
          backgroundColor = Color.fromARGB(255, 143, 208, 145);
          break;
        case 'flying':
          backgroundColor = Color.fromARGB(207, 95, 218, 240);
          break;
        case 'fighting':
          backgroundColor = Color.fromARGB(255, 243, 139, 139);
          break;
        case 'ghost':
          backgroundColor = Color.fromARGB(255, 244, 240, 240);
          break;
        case 'poison':
          backgroundColor = Color.fromARGB(255, 133, 93, 142);
          break;
        case 'rock':
          backgroundColor = Color.fromARGB(255, 115, 111, 111);
          break;
          case 'ground':
          backgroundColor = Color.fromARGB(255, 121, 85, 72);
          break;
        case 'steel':
          backgroundColor = Color.fromARGB(255, 48, 55, 53);
          break;
        case 'bug':
          backgroundColor = Color.fromARGB(255, 17, 62, 36);
          break;  
        case 'dragon':
          backgroundColor = Color.fromARGB(255, 106, 52, 52);
          break;
        case 'dark':
          backgroundColor = Color.fromARGB(255, 23, 22, 32);
          break;
        case 'psychic':
          backgroundColor = Color.fromARGB(255, 66, 65, 93);
          break;
        case 'ice':
          backgroundColor = Color.fromARGB(255, 171, 214, 223);
          break;
        case 'fairy':
          backgroundColor = Color.fromARGB(255, 234, 133, 183);
          break;
      }
    }


    return Scaffold(
      appBar: AppBar(
      title: getTitle(),
      ),
      backgroundColor: backgroundColor,
      body: showInformation(context),
    );
  }

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  Flex showInformation(BuildContext context) {
    if (pokemon != null) {
      return pokemonInfoScreen(context);
    } else {
      return noInfoScreen();
    }
  }



  Row pokemonInfoScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
              child: SvgPicture.network(
                  '${pokemon?.image}',
                  fit: BoxFit.scaleDown,
                ),
                width: MediaQuery.of(context).size.width -100,
              ),
            ),
            
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: EdgeInsets.all(15),                
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "#${pokemon?.id}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 98, 96, 92),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                     Text(
                      "${pokemon?.tipo}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 8, 8, 7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "#${pokemon?.name}",
                      style: const TextStyle(
                        fontSize: 45.0,
                        color: Colors.black,
                      ),
                    ),
                    
                    
                    Text(
                      "hp: ${pokemon?.hp}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      SizedBox(
                        width: 252,
                        height: 3,
                        child: LinearProgressIndicator(
                          value: pokemon?.defense != null
                              ? pokemon!.defense! / 252 : 0,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 16, 213, 164)),
                        ),
                    ),

                    Text(
                      "Attack: ${pokemon?.attack}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      SizedBox(
                        width: 252,
                        height: 3,
                        child: LinearProgressIndicator(
                          value: pokemon?.attack != null
                              ? pokemon!.attack! / 252 : 0,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 16, 213, 164)),
                        ),
                    ),

                    Text(
                      "Defense: ${pokemon?.defense}",
                        style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 252,
                      height: 3,
                      child: LinearProgressIndicator(
                        value: pokemon?.defense != null
                            ? pokemon!.defense! / 252 : 0,
                        backgroundColor: Colors.grey,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 16, 213, 164)),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row noInfoScreen() {
    return const Row(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text(
              "Pokémon não encontrado...",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
