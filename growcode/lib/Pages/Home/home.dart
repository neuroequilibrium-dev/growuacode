import 'package:flutter/material.dart';
import '../../Class/user.dart';
import 'homeBLoC.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  buildBody(List<user> data){
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return buildUserCard(data[index]);
        }
    );
  }

  buildUserCard(user data){
    return ListTile(
      title: Text(data.name.toString()),
      subtitle: Text(data.address!.city.toString()+', '+data.address!.zipcode.toString()),
      leading: CircleAvatar(child: Text(data.name!.substring(0,1))),
    );
  }


  buildAppBar(){
    return AppBar(
      title: const Text('Users'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder<List<user>>(
        future: getUserData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.done) {
            return buildBody(snapshot.data);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
