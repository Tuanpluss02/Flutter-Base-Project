import 'package:base/domain/entities/todo.dart';
import 'package:base/presentation/modules/todo/cubit/todo_cubit.dart';
import 'package:base/presentation/modules/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  context.read<TodoCubit>().fetchTodos();
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (todos) => _buildTodosList(context, todos),
            updating: (todos, updatingTodoId) =>
                _buildTodosList(context, todos, updatingTodoId),
            error: (message) => _buildErrorWidget(context, message),
          );
        },
      ),
    );
  }

  Widget _buildTodosList(
    BuildContext context,
    List<Todo> todos, [
    int? updatingTodoId,
  ]) {
    if (todos.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.checklist, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No todos found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TodoCubit>().fetchTodos();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          final isUpdating = updatingTodoId == todo.id;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: isUpdating
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Checkbox(
                      value: todo.completed,
                      onChanged: (value) {
                        context.read<TodoCubit>().toggleTodoCompletion(todo);
                      },
                    ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: todo.completed ? Colors.grey : null,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: todo.completed
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: todo.completed ? Colors.green : Colors.orange,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        todo.completed ? 'Completed' : 'Pending',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: todo.completed ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'ID: ${todo.id}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      'User: ${todo.userId}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              onTap: isUpdating
                  ? null
                  : () {
                      _showTodoDetails(context, todo);
                    },
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                context.read<TodoCubit>().fetchTodos();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showTodoDetails(BuildContext context, Todo todo) {
    // Capture the cubit instance before showing the dialog
    final todoCubit = context.read<TodoCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: todoCubit,
        child: AlertDialog(
          title: Text('Todo #${todo.id}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title:',
                style: Theme.of(
                  dialogContext,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(todo.title),
              const SizedBox(height: 16),
              Text(
                'Status:',
                style: Theme.of(
                  dialogContext,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: todo.completed
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: todo.completed ? Colors.green : Colors.orange,
                    width: 1,
                  ),
                ),
                child: Text(
                  todo.completed ? 'Completed' : 'Pending',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: todo.completed ? Colors.green : Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'User ID: ${todo.userId}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                todoCubit.toggleTodoCompletion(todo);
              },
              child: Text(todo.completed ? 'Mark Incomplete' : 'Mark Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
