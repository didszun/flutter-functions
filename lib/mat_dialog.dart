import 'package:flutter/material.dart';

class DialogOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<DialogOverlay>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 180.0,
              decoration: ShapeDecoration(
                  color: Color.fromRGBO(41, 167, 77, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30.0, left: 20.0, right: 20.0),
                        child: Text(
                          "Dies ist eine Dialogbox mit DREI Antwortmöglichkeiten.",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                            child: ButtonTheme(
                                height: 35.0,
                                minWidth: 110.0,
                                child: ElevatedButton(
                                  child: const Text(
                                    'Antwort links',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context, builder: (BuildContext context) {
                                      return const AlertDialog(
                                        title: Text("Links gedrückt!"),
                                        content: Text(
                                            "Alert angezeigt, Dialogbox bleibt stehen. \n(setState() wird nicht aufgerufen)"),
                                      );
                                    });
                                  },
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                              child:  ButtonTheme(
                                  height: 35.0,
                                  minWidth: 110.0,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Antwort Mitte',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context, builder: (BuildContext context) {
                                        return const AlertDialog(
                                          title: Text("Mitte gedrückt!"),
                                          content: Text(
                                              "Alert angezeigt, Dialogbox schließt sich. \n (setState() wird aufgerufen -- TODO!)"),
                                        );
                                      });
                                   //    setState(() {
                                   //      /* Route route = MaterialPageRoute(
                                   //        builder: (context) => LoginScreen());
                                   //    Navigator.pushReplacement(context, route);
                                   // */ });
                                    },
                                  ))
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                              child:  ButtonTheme(
                                  height: 35.0,
                                  minWidth: 110.0,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Antwort rechts (NOP)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ))
                          ),
                        ],
                      ))
                ],
              )),
        //),
      ),
    );
  }
}