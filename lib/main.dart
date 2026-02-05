import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ────────────────────────────────
//           HOME PAGE
// ────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submitted App',
          style: TextStyle(fontSize: (screenWidth * 0.048).clamp(18.0, 22.0)),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profil Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(padding * 1.25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: (screenWidth * 0.12).clamp(45.0, 65.0),
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.person,
                            size: (screenWidth * 0.144).clamp(52.0, 76.0),
                            color: Colors.blue.shade700,
                          ),
                        ),
                        SizedBox(height: padding * 0.8),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Selamat Datang!',
                            style: TextStyle(
                              fontSize: (screenWidth * 0.055).clamp(22.0, 28.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: padding * 0.4),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Flutter Developer',
                            style: TextStyle(
                              fontSize: (screenWidth * 0.042).clamp(16.0, 20.0),
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: padding * 1.2),

                // Section Fitur
                Padding(
                  padding: EdgeInsets.only(
                      left: padding * 0.5, bottom: padding * 0.6),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Fitur Aplikasi',
                      style: TextStyle(
                        fontSize: (screenWidth * 0.052).clamp(19.0, 24.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 195,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(width: padding * 0.5),
                      _buildHorizontalFeatureCard(
                        icon: Icons.widgets,
                        title: 'Stateless Widget',
                        description: 'Halaman ini menggunakan Stateless Widget',
                        color: Colors.green,
                        screenWidth: screenWidth,
                        padding: padding,
                      ),
                      SizedBox(width: padding * 0.5),
                      _buildHorizontalFeatureCard(
                        icon: Icons.auto_awesome,
                        title: 'Stateful Widget',
                        description:
                            'Halaman kedua menggunakan Stateful Widget',
                        color: Colors.orange,
                        screenWidth: screenWidth,
                        padding: padding,
                      ),
                      SizedBox(width: padding * 0.5),
                      _buildHorizontalFeatureCard(
                        icon: Icons.navigation,
                        title: 'Navigation',
                        description: 'Navigasi antar halaman yang smooth',
                        color: Colors.purple,
                        screenWidth: screenWidth,
                        padding: padding,
                      ),
                      SizedBox(width: padding * 0.5),
                      _buildHorizontalFeatureCard(
                        icon: Icons.edit,
                        title: 'Edit Tugas',
                        description: 'Edit tugas di halaman terpisah',
                        color: Colors.red,
                        screenWidth: screenWidth,
                        padding: padding,
                      ),
                      SizedBox(width: padding * 0.5),
                    ],
                  ),
                ),

                SizedBox(height: padding * 1.2),

                // Tombol ke TaskPage
                SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskPage()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward,
                        size: (screenWidth * 0.055).clamp(20.0, 26.0)),
                    label: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Buka Halaman Tugas',
                        style: TextStyle(
                          fontSize: (screenWidth * 0.044).clamp(16.0, 20.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: padding * 1.2, vertical: padding * 0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                SizedBox(height: padding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required double screenWidth,
    required double padding,
  }) {
    final cardWidth = screenWidth * 0.44;
    final iconSize = (screenWidth * 0.08).clamp(28.0, 36.0);
    final titleSize = (screenWidth * 0.042).clamp(15.0, 19.0);
    final descSize = (screenWidth * 0.038).clamp(13.0, 16.0);

    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(padding * 0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(padding * 0.7),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: iconSize),
              ),
              SizedBox(height: padding * 0.5),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      height: 1.2),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: padding * 0.35),
              Flexible(
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: descSize,
                      color: Colors.grey.shade600,
                      height: 1.3),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────
//             MODEL
// ────────────────────────────────
class Task {
  String id;
  String title;
  bool completed;
  DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
    required this.createdAt,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

// ────────────────────────────────
//           TASK PAGE
// ────────────────────────────────
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<Task> _tasks = [
    Task(
        id: '1',
        title: 'Belajar Flutter',
        completed: false,
        createdAt: DateTime.now()),
    Task(
        id: '2',
        title: 'Membuat Stateless Widget',
        completed: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1))),
    Task(
        id: '3',
        title: 'Membuat Stateful Widget',
        completed: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2))),
    Task(
        id: '4',
        title: 'Implementasi Navigation',
        completed: false,
        createdAt: DateTime.now().subtract(const Duration(days: 3))),
  ];

  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.trim().isEmpty) return;

    setState(() {
      _tasks.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _taskController.text.trim(),
        completed: false,
        createdAt: DateTime.now(),
      ));
    });

    _taskController.clear();
    FocusScope.of(context).unfocus();
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index] =
          _tasks[index].copyWith(completed: !_tasks[index].completed);
    });
  }

  void _deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Tugas'),
        content: const Text('Apakah Anda yakin ingin menghapus tugas ini?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          TextButton(
            onPressed: () {
              setState(() => _tasks.removeAt(index));
              Navigator.pop(context);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _editTask(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskPage(
          task: _tasks[index],
          onSave: (updated) {
            setState(() => _tasks[index] = updated);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _tasks.where((t) => t.completed).length;
    final total = _tasks.length;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Daftar Tugas',
            style: TextStyle(fontSize: (screenWidth * 0.048).clamp(18.0, 22.0)),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: _tasks.isNotEmpty
            ? [
                Padding(
                  padding: EdgeInsets.only(right: padding * 1.2),
                  child: Center(
                    child: Text(
                      '$completedCount/$total',
                      style: TextStyle(
                        fontSize: (screenWidth * 0.04).clamp(15.0, 18.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ]
            : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Progress Card
              Padding(
                padding: EdgeInsets.all(padding * 0.8),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(padding * 0.9),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Progress Tugas',
                                  style: TextStyle(
                                    fontSize:
                                        (screenWidth * 0.042).clamp(16.0, 19.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(height: padding * 0.25),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  total > 0
                                      ? '${(completedCount / total * 100).toStringAsFixed(0)}% Selesai'
                                      : 'Belum ada tugas',
                                  style: TextStyle(
                                      fontSize: (screenWidth * 0.038)
                                          .clamp(14.0, 17.0),
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.blue.shade300, width: 2.5),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  total > 0
                                      ? '${(completedCount / total * 100).toStringAsFixed(0)}%'
                                      : '0%',
                                  style: TextStyle(
                                    fontSize:
                                        (screenWidth * 0.045).clamp(17.0, 22.0),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Input Area
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding * 0.8),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(padding * 0.7),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _taskController,
                            style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.04).clamp(14.0, 17.0)),
                            decoration: const InputDecoration(
                              hintText: 'Tambah tugas baru...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onSubmitted: (_) => _addTask(),
                          ),
                        ),
                        SizedBox(width: padding * 0.5),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: _addTask,
                            icon: Icon(Icons.add,
                                color: Colors.white,
                                size: (screenWidth * 0.055).clamp(20.0, 26.0)),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: padding * 0.4),

              // Header Daftar Tugas
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding * 0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Daftar Tugas',
                        style: TextStyle(
                            fontSize: (screenWidth * 0.045).clamp(17.0, 21.0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Total: ${_tasks.length}',
                        style: TextStyle(
                          fontSize: (screenWidth * 0.038).clamp(14.0, 17.0),
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: padding * 0.25),

              // Task List dengan shrinkWrap
              _tasks.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: padding * 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.task_alt,
                              size: (screenWidth * 0.18).clamp(65.0, 90.0),
                              color: Colors.grey.shade300),
                          SizedBox(height: padding * 1.0),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Belum ada tugas',
                              style: TextStyle(
                                  fontSize:
                                      (screenWidth * 0.05).clamp(19.0, 24.0),
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: padding * 0.5),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Tambahkan tugas pertama Anda!',
                              style: TextStyle(
                                  fontSize:
                                      (screenWidth * 0.04).clamp(15.0, 18.0),
                                  color: Colors.grey.shade400),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(
                          padding * 0.8, 0, padding * 0.8, padding),
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return Card(
                          margin: EdgeInsets.only(bottom: padding * 0.4),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: padding * 0.7,
                                vertical: padding * 0.3),
                            leading: SizedBox(
                              width: 26,
                              child: Checkbox(
                                value: task.completed,
                                onChanged: (_) => _toggleTask(index),
                                activeColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.04).clamp(15.0, 17.0),
                                decoration: task.completed
                                    ? TextDecoration.lineThrough
                                    : null,
                                color:
                                    task.completed ? Colors.grey : Colors.black,
                                fontWeight: task.completed
                                    ? FontWeight.normal
                                    : FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: task.completed
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: padding * 0.15),
                                    child: Text(
                                      'Selesai',
                                      style: TextStyle(
                                        fontSize: (screenWidth * 0.033)
                                            .clamp(12.0, 14.0),
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                : null,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit,
                                      color: Colors.blue,
                                      size: (screenWidth * 0.05)
                                          .clamp(18.0, 22.0)),
                                  onPressed: () => _editTask(index),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.all(padding * 0.4),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.red,
                                      size: (screenWidth * 0.05)
                                          .clamp(18.0, 22.0)),
                                  onPressed: () => _deleteTask(index),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.all(padding * 0.4),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────
//         EDIT TASK PAGE
// ────────────────────────────────
class EditTaskPage extends StatefulWidget {
  final Task task;
  final Function(Task) onSave;

  const EditTaskPage({super.key, required this.task, required this.onSave});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _titleController;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _completed = widget.task.completed;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_titleController.text.trim().isEmpty) return;

    final updated = widget.task.copyWith(
      title: _titleController.text.trim(),
      completed: _completed,
    );

    widget.onSave(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Edit Tugas',
            style: TextStyle(fontSize: (screenWidth * 0.048).clamp(18.0, 22.0)),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon:
                Icon(Icons.save, size: (screenWidth * 0.065).clamp(22.0, 28.0)),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(padding * 1.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info Card
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(padding * 1.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID Tugas:',
                            style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.04).clamp(15.0, 17.0),
                                color: Colors.grey.shade600)),
                        SizedBox(height: padding * 0.2),
                        Text(widget.task.id,
                            style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.042).clamp(16.0, 18.0),
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: padding * 0.8),
                        Text('Dibuat pada:',
                            style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.04).clamp(15.0, 17.0),
                                color: Colors.grey.shade600)),
                        SizedBox(height: padding * 0.2),
                        Text(
                          '${widget.task.createdAt.day}/${widget.task.createdAt.month}/${widget.task.createdAt.year} '
                          '${widget.task.createdAt.hour}:${widget.task.createdAt.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                              fontSize: (screenWidth * 0.042).clamp(16.0, 18.0),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: padding * 1.2),

                // Judul
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(padding * 1.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Judul Tugas',
                          style: TextStyle(
                              fontSize: (screenWidth * 0.042).clamp(16.0, 18.0),
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700),
                        ),
                        SizedBox(height: padding * 0.6),
                        TextField(
                          controller: _titleController,
                          maxLines: 4,
                          minLines: 1,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: 'Masukkan judul tugas...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2)),
                            contentPadding: EdgeInsets.all(padding * 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: padding * 1.2),

                // Switch Status
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding * 1.1, vertical: padding * 0.9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status Tugas',
                          style: TextStyle(
                              fontSize: (screenWidth * 0.042).clamp(16.0, 18.0),
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700),
                        ),
                        Switch(
                          value: _completed,
                          onChanged: (v) => setState(() => _completed = v),
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: padding * 1.2),

                // Status Indicator
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(padding * 1.1),
                  decoration: BoxDecoration(
                    color:
                        _completed ? Colors.green.shade50 : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: _completed
                            ? Colors.green.shade200
                            : Colors.blue.shade200,
                        width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _completed ? Icons.check_circle : Icons.access_time,
                        color: _completed ? Colors.green : Colors.blue,
                        size: (screenWidth * 0.065).clamp(24.0, 30.0),
                      ),
                      SizedBox(width: padding * 0.9),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _completed
                                  ? 'Tugas Selesai'
                                  : 'Tugas Belum Selesai',
                              style: TextStyle(
                                fontSize:
                                    (screenWidth * 0.042).clamp(16.0, 18.0),
                                fontWeight: FontWeight.bold,
                                color: _completed ? Colors.green : Colors.blue,
                              ),
                            ),
                            SizedBox(height: padding * 0.2),
                            Text(
                              _completed
                                  ? 'Tugas ini telah diselesaikan'
                                  : 'Tugas ini masih dalam proses',
                              style: TextStyle(
                                  fontSize:
                                      (screenWidth * 0.04).clamp(15.0, 17.0),
                                  color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom > 0
                        ? padding
                        : padding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
