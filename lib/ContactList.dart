import 'package:flutter/material.dart';

class Contactlist extends StatefulWidget {
  const Contactlist({super.key});

  @override
  State<Contactlist> createState ()=> _ContactlistState(); }

class _ContactlistState  extends State<Contactlist>{
  final TextEditingController nameController =
      TextEditingController();
  final TextEditingController phoneController =
      TextEditingController();
  final List<Map<String, String>> contacts = [
    {'name': 'Jawad', 'phone': '01877-777777'},
    {'name': 'Ferdous', 'phone': '01673-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
  ];
  void addContact(){
    String name = nameController.text.trim();
    String phone  = phoneController.text.trim();
    
    if(name.isEmpty || phone.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter name and phone number'),
        ),
      );
      return ;
  }
    setState(() {
      contacts.add({
        'name': name,
        'phone' : phone,

      });
    });
    nameController.clear();
    phoneController.clear();

    FocusScope.of(context).unfocus();
}

@override
void dispose(){
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
}


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
              controller: nameController,
          decoration: InputDecoration(
          hintText: 'Mehedi',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),

      ),
      ),
            const SizedBox(height: 32),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '01750763767',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(onPressed: addContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                  child:  Container(
                    width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),

                      child: const Center(
                        child: Text('Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )),
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: contacts.length,
              itemBuilder: (context, index){
                  final contact = contacts[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:  const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const  Icon(
                          Icons.person,
                          color:  Color(0xFF70584F),
                          size: 30,
                        ),
                        const SizedBox( width: 24),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact['name']!,
                                  style: const TextStyle(
                                    color: Colors.brown,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  contact['phone']!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                        ),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Phone: ${contact['phone']}',
                                  ),
                              ),
                          );
                        },
                          icon:  const Icon(
                          Icons.call,
                          color: Colors.blue,
                          size: 30,
                        ),
                        ),
                      ],
                    ),

                  );
              }
            )
            )
        ],
      ),

      ),
    );
  }
}
