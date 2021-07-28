import 'package:flutter/material.dart';

void main() => runApp(const FormularioQuatro());

/// Esta é a aplicação main do widget
class FormularioQuatro extends StatelessWidget {
  const FormularioQuatro({Key? key}) : super(key: key);

  static const String _title = 'CheckBox Simples';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// Este é o estado do widget instanciado
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// Este é o estado provado da classe
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //variavel definida booleana que receve false or true para
  //especificar se o checkbox estará selecionado ao carregar o app
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        ///estados definidos do widget
        ///na ordem é:
        ///pressionado, passar sobre e ativo (no foco)
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
