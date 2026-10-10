import 'package:flutter/material.dart';

class Contactlist extends StatelessWidget {
  const Contactlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Contact List', style:TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Roboto',
          fontSize: 22,),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
              child: Column(
          children: [
            TextFormField(
          decoration: InputDecoration(
          hintText: 'Mehedi',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
            )

      ),
      ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '01750763767',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white
                  ),
                  child: const Text('Add')),
            )
        ],
      ),

      ),


    );
  }
}
