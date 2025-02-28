import 'package:flutter/material.dart';

void main(){
  void fun(bool visiblity){
     Visibility(
                        visible: !visiblity,
                      child: Column(
                      children: [
                       Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "R",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Ruchika Dhakate",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "G",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Gauri Kisan dagle",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "B",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Babasaheb Shinde",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey.shade600,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange.shade800,
                            ),
                            alignment: Alignment.center,
                            child:const Text(
                              "M",
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Monika",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              visiblity=false;
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.grey.shade600,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.green,
                              ),
                              alignment: Alignment.center,
                              child:const Icon(
                                Icons.arrow_upward,
                                size: 20,
                                color:Color.fromARGB(255, 32, 74, 191),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width:100,
                          // color: Colors.green,
                            alignment: Alignment.center,
                            child: const Text(
                              "Less",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ],
                  ),
                  );
  }
}