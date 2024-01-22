import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

 //Como Passar Parâmetros em Rotas Nomeadas em Flutter - Passagem de Parâmetros via Named Routes
  class Argumentos{
    final int id;
    final String nome;

    Argumentos(this.id, this.nome);
  }

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     // home:  Tela1(),
     initialRoute: '/',
      routes: {
        '/': (context) => const Tela1(),
       // '/tela2' :(context) => const Tela2(),
       Tela2.routeName: (context) => const Tela2(),
      },
    );
  }
}

//Rotas nomeadas  
class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    int valor = 1;

    return Scaffold(
      appBar: AppBar(title: const Text('Tela 1'),),
        body: Center(
        child: ElevatedButton(
          child: const Text('Ir para tela 2'),
          onPressed: (){
           //Navigator.pushNamed(context, '/tela2',arguments: Argumentos(1, ' Luide'));
          Navigator.pushNamed(context, '/tela2',arguments: Argumentos(valor, ' Luide $valor'));
          //valor++;
        },
      ),
      ),  
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  static const routeName = '/tela2';

  @override
  Widget build(BuildContext context) {

    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos?;

    // Verificação para garantir que 'argumentos' não seja nulo
    final nome = argumentos?.nome ?? "Nome não encontrado";

    return Scaffold(
      appBar: AppBar(title: Text('Tela 2 $nome'),backgroundColor: Colors.red,),
      
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/');
        },child: const Text('Ir para tela 1'),
      ),
      ),
    );
  }
}