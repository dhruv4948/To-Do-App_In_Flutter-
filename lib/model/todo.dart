class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Hello Dhruv', isDone: true),
      ToDo(
        id: '02',
        todoText: 'Flutter ',
      ),
      ToDo(id: '03', todoText: 'Android', isDone: true),
      ToDo(id: '04', todoText: 'iOS', isDone: true),
      ToDo(
        id: '05',
        todoText: 'Isolated',
      ),
      ToDo(id: '06', todoText: 'Phycho',),
      ToDo(id: '07', todoText: 'Dhruv'),
      ToDo(id: '08', todoText: 'Priya'),
      ToDo(id: '09', todoText: 'Aalu'),
    ];
  }
}
