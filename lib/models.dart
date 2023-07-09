import 'dart:convert';

class Topic {
  final int id;
  final String name;
  final String description;
  final List<LearningBlock> learningBlocks;

  Topic({required this.id, required this.name, required this.description, required this.learningBlocks});

  factory Topic.fromJson(Map<String, dynamic> json) {
    var list = json['learning_blocks'] as List;
    List<LearningBlock> learningBlocksList = list.map((i) => LearningBlock.fromJson(i)).toList();
    
    return Topic(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      learningBlocks: learningBlocksList
    );
  }
}

class LearningBlock {
  final int id;
  final int topicId;
  final String title;
  final String content;
  final int order;

  LearningBlock({required this.id, required this.topicId, required this.title, required this.content, required this.order});

  factory LearningBlock.fromJson(Map<String, dynamic> json) {
    return LearningBlock(
      id: json['id'],
      topicId: json['topic_id'],
      title: json['title'],
      content: json['content'],
      order: json['order']
    );
  }
}
