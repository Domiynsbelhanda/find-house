import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karibukwako/models/HomeLocation.dart';
import 'package:provider/provider.dart';

import '../services/datas.dart';
import '../utils/color.dart';
import '../utils/env.dart';
import '../widget/url_launcher_files.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.data}) : super(key: key);
  final HomeLocation data;

  @override
  State<Details> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<Details> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messagesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Env env = Env();

  int reservation = 0;

  @override
  void initState() {
    Provider.of<Datas>(context, listen: false).details(context, widget.data.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 245, 252),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: buildBody()

                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8.0,
            child: Container(
              width: env.size(context).width / 1.00,
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // bool auth = Provider.of<Auth>(context, listen: false).authenticated;
                              reservation_dialog(context);
                              // if(auth){
                              //   reservation_dialog(context);
                              // } else {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context) => LoginScreen()));
                              // }
                            },
                            child: Container(
                              height: env.size(context).width / 9,
                              width: env.size(context).width / 1.28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: env.secondaryColor
                              ),
                              child: const Center(
                                child: const Text(
                                  "Réserver",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              await FlutterShare.share(
                                  title: 'KaribuKwako',
                                  text: '${widget.data.categories[0].name} ${widget.data.detail.number_pieces} Pièce (s)',
                                  linkUrl: 'http://karibukwako/maisons/${widget.data.id}',
                                  chooserTitle: ''
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Icon(
                                FontAwesomeIcons.share,
                                color: env.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ]
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  reservation_dialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("ANNULER"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget plusButton = TextButton(
      child: Text("CONFIRMER"),
      onPressed: () {
        Map data = {
          'apartment':widget.data.id,
          'username': usernameController.text,
          'email' : emailController.text,
          'phone_number': phoneController.text,
          'messages' : messagesController.text,
        };
        if(_formKey.currentState!.validate()){
          Navigator.pop(context);
          Provider.of<Datas>(context, listen: false).reservations(context, data);
        }
      },
    );

    // set up the AlertDialog
    Dialog alert = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0)),
      child: SingleChildScrollView(
        child: Container(
          width: env.size(context).width / 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nom complet',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: usernameController,
                    keyboardType : TextInputType.name,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un votre nom' : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter your username",
                      fillColor: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  Text(
                    'Adresse email',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType : TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer une adresse mail' : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter your mail address",
                      fillColor: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  Text(
                    'Numéro de téléphone',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: phoneController,
                    keyboardType : TextInputType.phone,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un numéro de téléphone' : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter your phone number",
                      fillColor: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  Text(
                    'Message',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: messagesController,
                    keyboardType : TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un message' : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter your message here",
                      fillColor: Colors.white70,
                    ),
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        okButton,
                        plusButton,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Text(
                        'Details',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage('http://karibukwako.com/storage/${widget.data.images}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: ()=>urlLaunch('tel:${widget.data.phone_number}'),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: env.primaryColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      FontAwesomeIcons.squarePhone,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8.0,),
                                  Text(
                                    "Nous Contactez",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),

            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.green
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 8.0,),
                                Text(
                                  '${widget.data.type.name}',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),

                  SizedBox(width : 16.0),

                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.red
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 8.0,),
                                Consumer<Datas>(
                                    builder: (context, datas, child){
                                      try {
                                        return Text(
                                          '${datas.reservation != null ? datas.reservation : reservation} En attente',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white
                                          ),
                                        );
                                      } catch (e){
                                        return Text(
                                          '$reservation En attente',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white
                                          ),
                                        );
                                      }
                                    }
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.0),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Container(
                child: Text(
                  '${widget.data.categories[0].name} ${widget.data.detail.number_pieces} Pièce (s).',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16.0, 0, 12),
              child: Container(
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20,
                      color: textColor),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 16),
                child: Text(
                  '${widget.data.detail.description}',
                  style: TextStyle(
                    fontSize: 16, color: Colors.black,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16.0, 0, 12),
              child: Container(
                child: Text(
                  'Details appartements',
                  style: TextStyle(
                      fontSize: 20,
                      color: textColor),
                ),
              ),
            ),

            cardInfo('Code Référence', '${widget.data.reference}'),

            cardInfo('Chambres', '${widget.data.detail.number_rooms}'),

            cardInfo('Nombre des pièces', '${widget.data.detail.number_pieces}'),

            cardInfo('Toilette interieur', '${widget.data.detail.toilet}'),

            cardInfo('Prix Mensuel', '${widget.data.prices} \$'),

            cardInfo('Garantie', '${widget.data.warranty_price} \$'),

            cardInfo('Electricité', '${widget.data.detail.electricity == 1 ? 'Disponible' : 'Non Disponible'}'),

            SizedBox(height: 84.0,)

          ],
        ),
      ),
    );
  }

  Widget cardInfo(String name, String content){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
      child: Container(
        height: env.size(context).width /10,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 0.75,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$name'),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$content'),
            )
          ],
        ),
      ),
    );
  }

  Widget cardInfoPhone(String name, String content){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
      child: Container(
        height: env.size(context).width /10,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 0.75,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$name'),
            ),

            GestureDetector(
              onTap: ()=>whatsappCall('$content'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.whatsapp,
                      color: env.primaryColor,
                    ),
                    SizedBox(width: 4.0,),
                    Text('Contactez-nous'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
