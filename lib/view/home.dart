import 'package:banyuwangikuliner/model/resep_model.dart';
import 'package:flutter/material.dart';
import 'package:banyuwangikuliner/service/resep_card.dart';
import 'package:hexcolor/hexcolor.dart';



import '../service/resep_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AssetImage('lib/images/makan2.png'),
            Image.asset('lib/images/makan2.png', width: 45,),
             const Text('Banyuwangi Kuliner'),
          ],
        ),
        // title: 
        // const Text('Banyuwangi Kuliner'),
        backgroundColor: HexColor('522206'),
      ),
      body: FutureBuilder<List<Data>>(
          future: Resep1.getDataResep(),
          builder: (context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Masih Loading...');
            } else {
              //error
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                //berhasil
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage("${snapshot.data![index].img}"),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Center(
                          child:  Text('${snapshot.data![index].nama}',
                          style: TextStyle(
                            color: HexColor('FFFFFF'),
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                          ) 
                       
                      );                    
                    },
                    )
                  // GridView.builder(
                  //     itemCount: snapshot.data!.length,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 16,
                  //       mainAxisSpacing: 16,
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       return Stack(
                  //         children: [
                  //           Container(
                  //             width: double.infinity,
                  //             height: double.infinity,
                  //             child: Image.network(
                  //               "${snapshot.data![index].img}",
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.end,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 width: double.infinity,
                  //                 color: Color.fromARGB(255, 168, 111, 12),
                  //                 child: Text(
                  //                   "${snapshot.data![index].nama}",
                  //                   textAlign: TextAlign.center,
                  //                   style: const TextStyle(
                  //                     // color: HexColor('522206'),
                  //                   ),
                  //                 ),
                  //               ),
                  //               Container(
                  //                 width: double.infinity,
                  //                 color: Color.fromARGB(255, 168, 111, 12),
                  //                 child: Text(
                  //                   "${snapshot.data![index].resep}",
                  //                   textAlign: TextAlign.center,
                  //                   style: const TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       );
                  //     }),
                );
              }
            }
          }),
    );
  }
}