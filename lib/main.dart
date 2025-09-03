import 'package:agrinho_arapa_tiangua/boas_vindas.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'MeioAmbientePage.dart';
import 'acoesPage.dart';
import 'telaInicial.dart';
import 'play.dart';
//import 'JogodeReciclagem/jogo_reciclagem.dart';
//import 'boas_vindas.dart';
//import 'preferencias.dart';
//import 'package:shared_preferences/shared_preferences.dart';


void main () {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      title: "Programa Agrinho",
      theme: ThemeData(
        primarySwatch: Colors.green,
          )
      );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  //final firstTime = Prefs();
  int a = 1;

  // Chamamos o showDialog após a construção inicial do widget.
  // Usamos WidgetsBinding.instance.addPostFrameCallback para garantir
  // que o contexto esteja disponível e a interface gráfica pronta.
  @override
  void initState() {
      /*if(firstTime.settings['first']==true){
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BoasVindasAlert(context);
        },);*/
      if(a==1){
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BoasVindasAlert(context);
          
        },);
    }
  }

   // Lista de telas que 
   //serão exibidas ao selecionar um item da barra de navegação
  final List<Widget> _pages = [
    // 01 tela home
    const TelaInicial(),
    // 02 tela sobre saude
    const MeioAmbiente(),
    // 03 tela com as acoes desenvolvidas
    const Acoes(),
    // 04 tela sobre o quiz jogos
    GridGame(),
    // ReciclaApp(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: _pages[_currentIndex], // Conteúdo da tela selecionada
        bottomNavigationBar: ConvexAppBar(
      
          backgroundColor: Colors.transparent, // barra principal
          color: Colors.black, //texto
          activeColor: Colors.transparent, // fundo do icone
          shadowColor: Colors.transparent, // sombra
          
      
          items: const [
            TabItem(icon: Image(image: AssetImage("assets/icons/inicio.png"), fit: BoxFit.contain,), title: 'Início'),
            TabItem(icon: Image(image: AssetImage("assets/icons/meioambiente.png"), fit: BoxFit.contain,), title: 'Aprenda'),
            TabItem(icon: Image(image: AssetImage("assets/icons/acao.png"), fit: BoxFit.contain,), title: 'Ações'),
            TabItem(icon: Image(image: AssetImage("assets/icons/play.png"), fit: BoxFit.contain,), title: 'Jogos'),
          ],
      
          initialActiveIndex: _currentIndex, // Índice do item selecionado
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Atualiza o índice ao selecionar um item
            });
          },
        
        ),
      ),
    );
  }
}
