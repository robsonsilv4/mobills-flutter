import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobills_flutter/ui/shared/widgets/mobills_button.dart';
import 'package:mobills_flutter/ui/shared/widgets/mobills_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
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
            child: Column(
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
        ],
      ),
    );
  }
}
