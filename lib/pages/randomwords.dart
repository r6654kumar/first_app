import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[]; 
    final _saved = <WordPair>{};    
    void _pushSaved() {
      Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),);
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title:const Center(child: Text("Startup Name Generator")),
            actions: [
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: _pushSaved,
              )
            ],
            ),
          body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder:(context,i) {
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
        final alreadySaved = _saved.contains(_suggestions[index]); 
        return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
            ),
            trailing: Icon(    // NEW from here ...
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
           ),
            onTap: (() {
              setState(() {
                if(alreadySaved){
                  _saved.remove(_suggestions[index]);
                }
                else
                {
                  _saved.add(_suggestions[index]);
                }
              });
            }),
          );
          }
        
    ),
    );
}
}