import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobills_flutter/ui/shared/widgets/mobills_button.dart';
import 'package:mobills_flutter/ui/shared/widgets/mobills_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: _body(),
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          backgroundColor: Colors.indigoAccent.shade700,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // TODO: Adicionar animação de transição
      bottomNavigationBar: Visibility(
        visible: _isVisible,
        child: BottomAppBar(
          // Acho que fica melhor do que a original :)
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 58.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _barItem(icon: Icons.home, text: 'Principal', selected: true),
                _barItem(icon: Icons.line_weight, text: 'Transações'),
                SizedBox(width: 16.0),
                _barItem(icon: Icons.flag, text: 'Planejamento'),
                _barItem(icon: Icons.more_horiz, text: 'Mais'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _barItem({
    @required IconData icon,
    String text,
    bool selected = false,
  }) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: selected ? Colors.blue : Colors.grey),
            Text(
              text ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: <Widget>[
          Container(
            height: 250.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  )
                ]),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200'),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Março',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_alert,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 15.0),
                          Icon(
                            Icons.menu,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Saldo em contas',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'RS 0,00',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                height: 40.0,
                                width: 40.0,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Receitas'),
                                  Text(
                                    'RS 0,00',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                height: 40.0,
                                width: 40.0,
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Despesas'),
                                  Text(
                                    'RS 0,00',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 20.0,
                bottom: 8.0,
              ),
              child: Text(
                'Cartões de crédito',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          MobillsCard(
            icon: Icons.card_giftcard,
            text:
                'Ops! Você ainda não tem nenhum cartão de crédito cadastrado.',
            description: 'Melhore seu controle financeiro agora!',
            button: MobillsButton(
              text: 'ADICIONAR NOVO CARTÃO',
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 20.0,
                bottom: 8.0,
              ),
              child: Text(
                'Despesas por categoria',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          MobillsCard(
            icon: Icons.graphic_eq,
            text: 'Opa! Você não tem despesas cadastradas esse mês.',
            description:
                'Adicione seus gastos no mês atual para ver seus gráficos',
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 20.0,
                bottom: 8.0,
              ),
              child: Text(
                'Blog Mobills',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 200.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/400'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 300.0,
                        height: 100.0,
                        margin: EdgeInsets.all(10.0),
                        // margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'Saiba como usar o cartão de crédito a seu favor.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'MAIS ARTIGOS',
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // SizedBox(width: 25.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25.0,
                                      right: 5.0,
                                    ),
                                    child: Text(
                                      'LEIA MAIS',
                                      style: TextStyle(
                                        color: Colors.blue.shade600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 150.0,
            margin: EdgeInsets.only(top: 15.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('images/coins.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }
}
