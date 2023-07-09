import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'topic_provider.dart';
import 'TopicDetailsPage.dart';

class TopicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: Consumer<TopicProvider>(
        builder: (context, provider, child) {
          if (provider.topics.isEmpty) {
            provider.fetchTopics();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.topics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.topics[index].name),
                  onTap: () async {
                    await provider.fetchTopic(provider.topics[index].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicDetailsPage(),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
