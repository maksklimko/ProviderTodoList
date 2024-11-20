import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider_todo_list/features/todo_list/models/task.dart';
import 'package:provider_todo_list/features/todo_list/models/task_status.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';

import 'mocks/task_mocks.dart';

void main() {
  late MockTaskRepository tasksRepository;
  late TaskProvider taskProvider;

  final List<Task> fakeTasks = [
    Task(id: "1", title: "Task 1"),
    Task(id: "2", title: "Task 2"),
    Task(id: "3", title: "Task 3"),
  ];

  setUp(() {
    tasksRepository = MockTaskRepository();
    taskProvider = TaskProvider(tasksRepository: tasksRepository);

    registerFallbackValue(fakeTasks[0]);
    registerFallbackValue(fakeTasks);
    registerFallbackValue(TaskStatus.todo);

    when(() => tasksRepository.fetchTasks()).thenAnswer((_) async => fakeTasks);

    when(() => tasksRepository.deleteTask(any())).thenAnswer((_) async {});

    when(() => tasksRepository.changeTaskStatus(any(), any()))
        .thenAnswer((invocation) async {
      final Task task = invocation.positionalArguments[0];
      final TaskStatus status = invocation.positionalArguments[1];
      return fakeTasks
          .map((t) => t.id == task.id ? t.copyWith(status: status) : t)
          .toList();
    });
  });

  test('Test initial values', () {
    expect(taskProvider.tasks, []);
    expect(taskProvider.tasks.runtimeType, List<Task>);
  });

  test('Test fetching tasks', () async {
    await taskProvider.fetchTasks();
    expect(taskProvider.tasks, fakeTasks);
    verify(() => tasksRepository.fetchTasks()).called(1);
  });

  test('Test toggling task completion', () async {
    final taskToToggle = fakeTasks[0];
    await taskProvider.toggleTaskCompletion(taskToToggle);

    expect(
      taskProvider.tasks.firstWhere((t) => t.id == taskToToggle.id).status,
      taskToToggle.status == TaskStatus.todo
          ? TaskStatus.completed
          : TaskStatus.todo,
    );
    verify(() => tasksRepository.changeTaskStatus(taskToToggle, any()))
        .called(1);
  });

  test('Test deleting a task', () async {
    final taskToDelete = fakeTasks[1];
    await taskProvider.deleteTask(taskToDelete);

    verify(() => tasksRepository.deleteTask(taskToDelete)).called(1);

    taskProvider.fetchTasks();
    expect(taskProvider.tasks.contains(taskToDelete), false);
  });

  test('Test listening to task changes', () async {
    when(() => tasksRepository.addTasksChangesListener(
        onChange: any(named: 'onChange'))).thenAnswer((invocation) {
      final onChangeCallback =
          invocation.namedArguments[Symbol('onChange')] as Function(List<Task>);
      onChangeCallback(fakeTasks);
    });

    taskProvider.listenToTaskChanges();

    expect(taskProvider.tasks, fakeTasks);
    verify(() => tasksRepository.addTasksChangesListener(
        onChange: any(named: 'onChange'))).called(1);
  });
}
