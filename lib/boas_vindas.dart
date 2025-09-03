import 'package:flutter/material.dart';
import 'dev.dart';

void BoasVindasAlert(BuildContext context){
    showDialog(

      context: context, 
      builder: (context) {
        return AlertDialog(
          //icon: Image(image: AssetImage("assets/icons/icon.png"), fit: BoxFit.contain,),
          //title: Text('BOAS VINDAS'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              Text(
                'Bem vindo ao App Agrinho Tiangua! Aqui você aprende e ainda se diverte',
              ),
              Text('>> Na aba Ensino você terá acesso a cartilhas temáticas'),
              Text('>> Na aba Ações voçê poder ver as principais ações desenvolvidas no contexto do programa agrinho. Confira!'),
              Text('>> Na aba Jogos há varios jogos divertidos e interativos para você testar seus conhecimentos'),
            ],
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(

                //side: BorderSide(color: const Color.fromARGB(255, 5, 3, 3), width: 2),
                backgroundColor: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),

              )),
              

              onPressed: () => Navigator.of(context).pop(),
              
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(

                //side: BorderSide(color: const Color.fromARGB(255, 5, 3, 3), width: 2),
                //backgroundColor: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),

              )),
              

               onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => InfoDev()))),
              
              child: Text(
                'Sobre o desenvolvedor',
                style: TextStyle(color: Colors.black),
              ),
            ),
            
          ]
        );
      }      
    );
  }