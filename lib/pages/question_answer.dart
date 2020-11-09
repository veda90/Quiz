import 'package:flutter/material.dart';
import '../Controller/QuizManager.dart';
import '../Model/QuestionOption.dart';

class QuestionAnswer extends StatefulWidget {
  @override
  _QuestionAnswerState createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  QuestionOption currentQuestion;
  QuizManager helper;

  _QuestionAnswerState() {
    helper = QuizManager();
    this.currentQuestion = helper.fetchInitialQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Thunder Quiz..'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.blue[50], width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: Offset(0, 3),
                )
              ]),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
              top: 0.05 * MediaQuery.of(context).size.height,
              bottom: 0.3 * MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 0.5 * MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blue[200], width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  currentQuestion.question,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 0.4 * MediaQuery.of(context).size.height,
                width: 0.5 * MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                      child: ListTile(
                        title: Text(
                          currentQuestion.options[index].title,
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                        tileColor:
                            currentQuestion.options[index].isSelected == true
                                ? currentQuestion.options[index].isValid == true
                                    ? Colors.green[200]
                                    : Colors.red[200]
                                : Colors.transparent,
                        trailing: IconButton(
                          icon: currentQuestion.options[index].isValid == null
                              ? Visibility(
                                  visible: false, child: Icon(Icons.check))
                              : currentQuestion.options[index].isValid == true
                                  ? Visibility(
                                      visible: true, child: Icon(Icons.check))
                                  : Visibility(
                                      visible: true, child: Icon(Icons.close)),
                          iconSize: 20,
                          color: currentQuestion.options[index].isValid == null
                              ? Colors.black
                              : currentQuestion.options[index].isValid == true
                                  ? Colors.green
                                  : Colors.red,
                          onPressed: () {},
                        ),
                        hoverColor: Colors.lightBlue[200],
                        contentPadding: EdgeInsets.only(left: 15),
                        enabled: true,
                        selected: false,
                        isThreeLine: false,
                        dense: false,
                        onTap: () {
                          setState(() {
                            currentQuestion = helper.fetchAnswer(index);
                          });
                        },
                        // shape: ShapeBorder.lerp(1, 2, 1),
                      ),
                    );
                  },
                  itemCount: currentQuestion.options.length,
                ),
              ),
              Container(
                height: 0.04 * MediaQuery.of(context).size.height,
                width: 0.5 * MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      currentQuestion = helper.fetchNextQuestion();
                    });
                  },
                  child: Text('Next..'),
                  color: Colors.purple[500],
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
