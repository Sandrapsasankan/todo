import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider.dart';

class Grocery extends StatefulWidget {
  const Grocery({Key? key}) : super(key: key);

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {

  List items=['Sayur','Roti','Pisang','Ubat','Sayur','Roti','Pisang','Ubat','Sayur','Roti','Pisang','Ubat'];
  TextEditingController item_Contoller=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final object= Provider.of<Provider_class>(context);


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context)=> AlertDialog(
              title: Text('Add Item',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
              content: TextField(
                controller: item_Contoller,

                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade600),
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('CANCEL',style: TextStyle(fontSize: 12,color: Colors.blueGrey,fontWeight: FontWeight.w600),)
                ),
                TextButton(
                    onPressed: (){
                      object.add_item(item_Contoller.text.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Grocery()));
                    },
                    child: Text('OK',style: TextStyle(fontSize: 12,color: Colors.blueGrey.shade600,fontWeight: FontWeight.w600),)
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add,size: 32,),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text('Groceries',style: TextStyle(fontSize: 23),),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  Text(' ( ${object.list_item.length} )',style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 16,fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            Divider(thickness: 1,color: Colors.blueGrey.shade400,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: object.list_item.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 13,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(object.list_item[index].todoTitle,style: TextStyle(color: Colors.blueGrey.shade500,fontSize: 18,fontWeight: FontWeight.w500),),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.blueGrey.shade600,
                                value: object.list_item[index].completed,
                                onChanged: ((_) => object.toggleTask(object.list_item[index]))
                            ),
                            IconButton(onPressed: (){
                              object.deleteTask(object.list_item[index]);
                            },
                                icon: Icon(Icons.delete,color: Colors.blueGrey,)
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }



}