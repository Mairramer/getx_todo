import 'dart:convert';

import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;
  const TaskModel({
    required this.title,
    required this.icon,
    required this.color,
    this.todos,
  });

  TaskModel copyWith({
    String? title,
    int? icon,
    String? color,
    List<dynamic>? todos,
  }) {
    return TaskModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      todos: todos ?? this.todos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'color': color,
      'todos': todos,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      icon: map['icon']?.toInt() ?? 0,
      color: map['color'] ?? '',
      todos: List<dynamic>.from(map['todos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(title: $title, icon: $icon, color: $color, todos: $todos)';
  }

  @override
  List<Object> get props => [title, icon, color];
}
