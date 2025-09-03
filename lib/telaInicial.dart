import 'package:flutter/material.dart';
//import 'abouttiangua.dart';
import 'aboutagrinho.dart';
import 'dev.dart';

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
          //final double maxHeight = constraints.maxHeight; // Altura máxima disponível
          double tamanhoTela = MediaQuery.of(context).size.width;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Logo do Projeto
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/icon.png", width: tamanhoTela*0.40,),
                      Image.asset("assets/icons/cepon.png", width: tamanhoTela*0.40,)
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                      'Centro Educacional Professor Osvaldo Nogueira Lima - Arapa - Tianguá',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1,
                          color: Colors.black,
                          backgroundColor: const Color.fromRGBO(65 , 84, 158, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                ),
                const SizedBox(height: 50),
                // BOTAO SOBRE O AGRINHO
                OutlinedButton(
                    style: OutlinedButton.styleFrom(

                      fixedSize: Size(tamanhoTela*0.6, 50),
                      //side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                      backgroundColor: Color.fromARGB(255, 6, 98, 53),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                    )),
                    
                    // quando o botao da pontuacao é pressionado
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => InfoAgrinho()))),
                    
                    child: Text(
                    'Sobre o Agrinho',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 10),
                // BOTÃO CONHEÇA TIANGUA
                OutlinedButton(
                    style: OutlinedButton.styleFrom(

                      fixedSize: Size(tamanhoTela*0.6, 50),
                      //side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
                      //backgroundColor: Colors.yellowAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                    )),
                    
                    // Animacao quando o botao da Tinagua é pressionado
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => InfoDev()))),
                    
                    child: const Text(
                    'Sobre o Desenvolvedor',
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
