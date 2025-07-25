import 'package:flutter/material.dart';
import 'aboutfrecheirinha.dart';
import 'aboutagrinho.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1.0,
          image: AssetImage('assets/fundoprincipal.png'), // Caminho da imagem
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxHeight = constraints.maxHeight; // Altura máxima disponível
          double tamanhoTela = MediaQuery.of(context).size.width;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Logo do Projeto
                Image.asset("assets/icons/icon.png", width: tamanhoTela*0.75,),
              
                // BOTAO SOBRE O AGRINHO
                OutlinedButton(
                    style: OutlinedButton.styleFrom(

                      fixedSize: Size(tamanhoTela*0.8, 60),
                      side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                      backgroundColor: Color.fromARGB(255, 6, 98, 53),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                    )),
                    
                    // Animacao quando o botao da pontuacao é pressionado
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => InfoAgrinho()))),
                    
                    child: Text(
                    'Sobre o Agrinho',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 10),
                // BOTÃO CONHEÇA FRECHERINHA
                OutlinedButton(
                    style: OutlinedButton.styleFrom(

                      fixedSize: Size(tamanhoTela*0.8, 60),
                      side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                      backgroundColor: Colors.yellowAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                    )),
                    
                    // Animacao quando o botao da pontuuacao é pressionado
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => InfoCity()))),
                    
                    child: const Text(
                    'Conheça Tianguá',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                //const SizedBox(height: 150),
              ],
            ),
          );
        },
      ),
    );
  }
}
