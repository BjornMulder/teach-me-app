import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'topic_provider.dart';

class TopicDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topic Details'),
      ),
      body: Consumer<TopicProvider>(
        builder: (context, provider, child) {
          if (provider.selectedTopic == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Text(provider.selectedTopic!.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(provider.selectedTopic!.description, style: TextStyle(fontSize: 16)),
                Divider(color: Colors.grey),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.selectedTopic!.learningBlocks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(provider.selectedTopic!.learningBlocks[index].title),
                        subtitle: Text(provider.selectedTopic!.learningBlocks[index].content),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
