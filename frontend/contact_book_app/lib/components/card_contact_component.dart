import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';

class CardContactComponent extends StatefulWidget {
  const CardContactComponent({super.key});

  @override
  State<CardContactComponent> createState() => _CardContactComponentState();
}

class _CardContactComponentState extends State<CardContactComponent> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding:  EdgeInsets.only(top: 20.0, bottom: 20),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        //border: Border.all(color: Colors.white)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Juliana Teste", style: AppTheme.darkFontStyleContactName,),
                Text("Subtitulo aqui embaixo como teste", style: AppTheme.darkFontStyleContatcSubtitle,
                ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.star, color: Colors.yellowAccent),
            ),
          )
        
        ],
      ),
    ),
    );
  }
}