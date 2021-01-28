import 'package:calculator_app/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _numberController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      child: Builder(
        builder: (context) {

          return GestureDetector(
            onTap: (){
              FocusScopeNode currentScope = FocusScope.of(context);
              FocusScopeNode rootScope =
                  WidgetsBinding.instance.focusManager.rootScope;

              if (currentScope != rootScope) {
                currentScope.unfocus();
              }
              print('tap');
            },
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                top: 30,bottom: 30,left: 15, right: 15,
              ),
              child: Consumer<HomeScreenProvider>(
                builder: (context, provider, child){
                  return Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                                  controller: _numberController,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: RaisedButton(
                                child: Text('Check Prime'),
                                elevation: 5,
                                onPressed: () {
                                  provider.checkPrime(int.parse(_numberController.text));
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(provider.isPrimeText),
                                  ));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      provider.primeNumbers.isNotEmpty?
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'History Prime:'
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: RaisedButton(
                                child: Text('Delete History'),
                                elevation: 5,
                                onPressed: () {
                                  provider.removeNumbers();
                                },
                              ),
                            )
                          ],
                        ),
                      ) : Container(),
                      provider.primeNumbers.isNotEmpty?
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: provider.primeNumbers.length,
                              itemBuilder: (context, index) => Text(provider.primeNumbers[index])
                          ),
                        ),
                      ) : Container(),
                    ],
                  );
                }
              ),
            ),
          );
        }
      ),
    );
  }
}