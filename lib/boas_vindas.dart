import 'package:flutter/material.dart';

void BoasVindasAlert(BuildContext context){
    showDialog(

      context: context, 
      builder: (context) {
        //playFinal();
        return AlertDialog(
          icon: Image(image: AssetImage("assets/icons/icon.png"), fit: BoxFit.fitWidth,),
          title: Text('BOAS VINDAS'),
          content: Text('Bem vindo ao App Agrinho Tiangua! Aqui você aprende e ainda se diverte'),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(

                side: BorderSide(color: const Color.fromARGB(255, 5, 3, 3), width: 2),
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
            
          ]
        );
      }      
    );
  }