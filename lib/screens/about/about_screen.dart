import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context, '/tasks');
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF65CBA8), Color(0xFF7FFFD4), Color(0xFFFF0032)],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '''O Lista Fácil foi criado por Felipe Grechi do Prado e Luiz Della Vechia Junior para ajudar você a organizar suas tarefas 
              do dia a dia de forma prática e rápida. Com uma interface simples e intuitiva,
              o app permite que você adicione, edite e marque suas tarefas como concluídas com apenas alguns toques.
              Quer você esteja organizando sua rotina, estudos, trabalho ou lista de compras, o Lista Fácil é seu 
              parceiro ideal para manter tudo sob controle.
              ''',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 77, 77, 77),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}