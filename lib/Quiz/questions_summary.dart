import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  // ignore: prefer_typing_uninitialized_variables
  //var backgroundColor;
  // ignore: non_constant_identifier_names
  Color checkcolor(Map<String, Object> data) {
    if (data['chosen-answer'] == data['crt-answer']) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  IconData checkicons(Map<String, Object> data) {
    if (data['chosen-answer'] == data['crt-answer']) {
      return Icons.check;
    } else {
      return Icons.close;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          //color: Colors.blueAccent,
          // border: Border.all(
          //   width: 2.0,
          // ),
          ),
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: checkcolor(data),
                  radius: 20,
                  child: Text(
                    ((data['Question-index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.tryParse('270'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          //color: const Color.fromARGB(139, 23, 225, 4),
                          color: Color.fromARGB(226, 248, 224, 5),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    checkicons(data),
                                    size: 25,
                                    weight: 100,
                                    color: checkcolor(data),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: data['chosen-answer'] as String,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Text(
                      //   data['chosen-answer'] as String,
                      //   style: const TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.tryParse('270'),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(139, 23, 225, 4),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(Icons.checklist_rounded,
                                      color: Colors.white),
                                ),
                              ),
                              TextSpan(
                                text: data['crt-answer'] as String,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // child: Center(
                        //   child: Text(
                        //     data['crt-answer'] as String,
                        //     style: const TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white),
                        //   ),
                        // ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
