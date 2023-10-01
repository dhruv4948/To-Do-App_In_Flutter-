import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widgets/todo_items.dart';

class MyWidget extends StatefulWidget {

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

@override
  void initState() {
_foundToDo = todosList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'All ToDos',
                          style:
                              TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                      ),

                      for(ToDo todo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todo,onTodoChanged: _handleTodoChange,onDeleteItem: _deleteTodoItem, Function: (ToDo todo) {  },
),
                      
                    ],
                  ),
                )
              ],
            ), 
          ),
          Align(
            alignment:Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: const[ BoxShadow(color: Colors.grey, offset: Offset(0.0,0.0),blurRadius: 10.0,spreadRadius: 0.0)],
                borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                    hintText: 'add new notes',
                    border: InputBorder.none
                  ),
                ),
              )),
              Container(
                margin: EdgeInsets.only(bottom: 30,top: 10,right: 20),
                child: ElevatedButton(child: Text("+",style:TextStyle(fontSize: 40)), onPressed: () {_addTodoItem(_todoController.text);},
                style: ElevatedButton.styleFrom(primary: tdBlue,minimumSize: Size(50,50),elevation: 10,))
              )
            ]),
          )
        ],
      ),
    );
  }


void _handleTodoChange(ToDo todo){
setState(() {
  todo.isDone = !todo.isDone;

});
}

void _deleteTodoItem(String id){
  setState(() {
    todosList.removeWhere((item) => item.id==id);
  });
}

void _addTodoItem(String toDo){
  setState(() {
    todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString() , todoText: toDo));
  });
  _todoController.clear();
}

void _runFilter(String enteredKeyword){
  List<ToDo> results = [];
  if(enteredKeyword.isEmpty){
    results = todosList;
  }else{
    results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  }

  setState(() {
    _foundToDo = results;
  });
}




  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        onChanged: (value)=> _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            // contentPadding: EdgeInsets.only(left: 300),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'search',
            hintStyle: TextStyle(color: tdGray)), 
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/image/d.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
