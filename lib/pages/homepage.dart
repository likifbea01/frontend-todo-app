import 'package:flutter/material.dart';
import 'package:todo_app/models/todoModel.dart';
import 'package:todo_app/pages/createTODo.dart';
import 'package:todo_app/pages/deleteAlert.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
 
  @override
  Widget build(BuildContext context) {
    int _curentIndex = 0;
    late final Datum todo;
    void _isSelected(index) {
      setState(() {
        _curentIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentIndex,
        onTap: (index) {
          setState(() {
            _curentIndex = index;
            ;
          });
        },
        elevation: 30,

        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,

        // backgroundColor: Colors.amberAccent,
        selectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle_outline,
                color: Colors.black54,
                size: 30,
              ),
              label: "Completed ToDo"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check_box_outline_blank_sharp,
                color: Colors.black54,
                size: 30,
              ),
              label: "Uncompleted"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black54,
                size: 30,
              ),
              label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black54,
                size: 30,
              ),
              label: "User")
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 30,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 100,
        title: Text("ToDo App",
            style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 35,
              ))
        ],
      ),
      body: FutureBuilder(
        future: _todoController.getAlltodos() ,
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting && snapshot.data ==null){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.connectionState ==ConnectionState.done && snapshot.data ==null{
            return Text("Something went wrong");
          })
        
            return ListView.separated(
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(index),
              direction: DismissDirection.startToEnd,
              confirmDismiss: (direction) async {
                var result = await showDialog(
                    context: context, builder: (builder) => DeleteAlert());
                return result;
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete_forever),
              ),
              child: ListTile(
                title: Text(
                  todo.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(todo.body,
                    style: Theme.of(context).textTheme.bodyText2),
                trailing: IconButton(
                  onPressed: () {},
                  icon: todo.status == false
                  ? Icon(Icons.check_circle)
                  : Icon(Icons.check_circle, color: Colors.red,)
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Theme.of(context).dividerTheme.color,
          ),
          itemCount: 10,
        ),
      ),
      drawer: Drawer(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.1DBna0sw-uwcvfzt9xf5gAHaEK?pid=ImgDet&rs=1"),
                ),
                accountEmail: Text("fatima@gmail.com"),
                accountName: Text("K Fati"),
              ),
              ListTile(leading: Icon(Icons.add), title: Text("Add members")),
              ListTile(
                  leading: Icon(Icons.message_rounded),
                  title: Text("Messages")),
              ListTile(
                  leading: Icon(Icons.camera_alt_rounded),
                  trailing: Icon(Icons.select_all_rounded),
                  title: Text("Open Camera")),
              ListTile(
                  leading: Icon(Icons.verified_user_rounded),
                  title: Text("Security")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //highlightElevation: 10,
        elevation: 20,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateToDo(),
          ));
        },
        // child: Text("Click"),
        child: Icon(Icons.add),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
    );
  }
}
