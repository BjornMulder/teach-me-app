import 'package:flutter/material.dart';
import 'api.dart';
import 'models.dart';

class TopicProvider with ChangeNotifier {
  List<Topic> _topics = [];
  Topic? _selectedTopic;

  List<Topic> get topics => _topics;
  Topic? get selectedTopic => _selectedTopic;

  Future<void> fetchTopics() async {
    _topics = await API.getTopics();
    notifyListeners();
  }

  Future<void> fetchTopic(int id) async {
    _selectedTopic = await API.getTopic(id);
    notifyListeners();
  }
}
