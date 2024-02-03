import 'package:flutter/material.dart';

class TodoTaskApp extends StatefulWidget {
  const TodoTaskApp({super.key});

  @override
  State<TodoTaskApp> createState() => _TodoTaskAppState();
}

class _TodoTaskAppState extends State<TodoTaskApp> {

  final TextEditingController _controller = TextEditingController();

  final List<String> _task = [];

  void _addTask(String task)
  {
  setState(() {
    _task.add(task);
  });
  _controller.clear();
}

void _deleteTask(int index)
{
  setState(() {
    _task.removeAt(index);
  });
}

void _toggleTaskCompletion(int index)
{
  setState(() {
    _task[index] = "✅ ${_task[index]}";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.tealAccent,Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
        ),
        title:const Text("ToDo Task App"),
        centerTitle: true,
      ),
      body: Container(
        decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent,Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const   Text(
                  "Click Add A New Task",
                style: TextStyle(fontSize: 18.0),
                ),
            const   SizedBox(height: 10,),
               TextFormField(
                 controller: _controller,
                 onFieldSubmitted:(value)
                 {
                   if(value.isNotEmpty)
                     {
                       _addTask(value);
                     }
                 },
               ),
            const   SizedBox(height: 20,),
            const   Text(
                "Tasks: ",
                style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                     itemCount: _task.length,
                     itemBuilder: (context, index)
                  {
                    return ListTile(
                      title: Text(_task[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: (){
                          _toggleTaskCompletion(index);
                        },
                      ),
                      onLongPress: ()
                      {
                        _deleteTask(index);
                      }
                    );
                  },
              ))
            ],
          ),
        ),
      )
    );
  }
}
