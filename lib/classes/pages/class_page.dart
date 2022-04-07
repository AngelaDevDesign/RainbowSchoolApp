import 'package:flutter/material.dart';
import 'package:lista_clase_colegio/home/pages/home_page.dart';
import 'package:lista_clase_colegio/shared/widgets/icon_button.dart';
import 'package:lista_clase_colegio/shared/widgets/style/text.dart';
import '../../shared/domains/class_students.dart';
import '../../shared/utils/global_variables/icons.dart';
import '../../shared/utils/global_variables/style.dart';
import '../../shared/utils/global_variables/text.dart';
import '../../shared/utils/global_variables/theme.dart';
import '../../shared/widgets/class_category_box.dart';
import '../../shared/widgets/image_box.dart';
import '../domain/student.dart';
import '../widgets/list_view.dart';

class ClassPage extends StatefulWidget {
  ClassStudents classStudent;

  ClassPage({Key? key, required this.classStudent}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {

  List<Student>? studentsList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${widget.classStudent.className}_background.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(PAGEMARGIN),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    iconButton(icon: BACK, color: Colors.black87, page: const HomePage(), context: context),
                  ],
                ),
                ImageBox(img: widget.classStudent.img, size: 0.15),
                textStyle(
                    text: '${widget.classStudent.className.toUpperCase()} CLASS',
                    fontSize: BIGHEADERSIZE,
                    fontColor: TEXTCOLOR,
                    fontFamily: TITLEFONT,
                    weight: FontWeight.bold),
                const SizedBox(height: ELEMENTMARGIN),
                classCategoryBox(widget.classStudent.classCategory, context),
                const SizedBox(height: ELEMENTMARGIN),
                ListViewStudents(classStudent: widget.classStudent)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
