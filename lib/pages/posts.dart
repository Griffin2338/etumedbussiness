// Copyright 2021 The Etumed Bussiness Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String description;
  TaskWidget({required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color(0xff211551),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: 16, color: Color(0xff868290), height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String title;
  final bool isdone;
  TodoWidget({required this.title, required this.isdone});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color:
                        isdone ? const Color(0xff7349fe) : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    border: isdone
                        ? null
                        : Border.all(
                            color: const Color(0xff86829d), width: 1.5)),
                child: const Icon(Icons.check_circle),
              ),
              Text(
                title,
                style: TextStyle(
                    color: isdone
                        ? const Color(0xff211551)
                        : const Color(0xff86829d)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 6),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(24),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter Task Title',
                                border: InputBorder.none),
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff211551)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter Description for the task....',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24)),
                  ),
                  TodoWidget(
                    title: 'Create a new task',
                    isdone: true,
                  ),
                  TodoWidget(
                    title: 'Create a todoo',
                    isdone: false,
                  ),
                  TodoWidget(
                    title: 'Delete this default task',
                    isdone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskPage()),
                    );
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xfffe3577),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.delete,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: const Text('Posts'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          color: Color(0xfff6f6f6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        TaskWidget(
                          title: 'Get started!',
                          description:
                              'Hello user! Welcome to etumed bussines app, this is default task.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskPage()),
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff7349fe), Color(0xff643fdb)],
                            begin: Alignment(0, -1),
                            end: Alignment(0, 1)),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
