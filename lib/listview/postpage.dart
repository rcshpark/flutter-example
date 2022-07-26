import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MakePostPage extends StatefulWidget {
  const MakePostPage({Key? key}) : super(key: key);

  @override
  State<MakePostPage> createState() => _MakePostPageState();
}

class _MakePostPageState extends State<MakePostPage> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('post test'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'title',
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'content'),
                maxLines: 20,
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  fireStore.collection('posts').doc('test01').set({
                    'title': title,
                    'content': content,
                  });
                },
                child: const Text('upload'),
              ),
              // crud -create, read, udate, delete
              ElevatedButton(
                onPressed: () {
                  fireStore.collection('posts').doc('test01').update({
                    'title': title,
                    'content': content,
                  });
                },
                child: const Text('update'),
              ),
              ElevatedButton(
                onPressed: () {
                  fireStore
                      .collection('posts')
                      .doc('test01')
                      .delete(); // collection, doc 지정 시 내부 db에 저장되있는 정보 모두 삭제
                },
                child: const Text('delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
