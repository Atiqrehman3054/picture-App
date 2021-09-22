import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picture_app/UI%20Firebase/components/cards/completed_courses_card.dart';
import 'package:picture_app/UI%20Firebase/model/course.dart';

class CompletedCoursesList extends StatefulWidget {
  @override
  _CompletedCoursesListState createState() => _CompletedCoursesListState();
}

class _CompletedCoursesListState extends State<CompletedCoursesList> {
  var CompleteCourse = [];
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: completedCourses.map((course) {
        var index = completedCourses.indexOf(course);
        return Container(
          width: 7.0,
          height: 3.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompletedCourse();
  }

  getCompletedCourse() {
    _firestore
        .collection("user")
        .doc(_auth.currentUser.uid)
        .get()
        .then((snapshot) {
      for (var Course  in snapshot.data()["complete"]) {
        _firestore
            .collection("user")
            .doc(_auth.currentUser.uid)
            .get()
            .then((courseSnapshot) {
          CompleteCourse.add(Course(
              courseSubtitle: courseSnapshot["courseSubtitle"],
              courseTitle: courseSnapshot["courseTitle"],
              logo: courseSnapshot["logo"],
              illustration: courseSnapshot["illustration"],
              background: LinearGradient(colors: [
                Color(int.parse(courseSnapshot["color"][0])),
                Color(int.parse(courseSnapshot["color"][1])),
              ])));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.5,
                  child: CompletedCoursesCard(
                    course: completedCourses[index],
                  ));
            },
            itemCount: completedCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
