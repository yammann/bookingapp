import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/core/constants/colors.dart';
import 'package:e_store/view/screen/Auth/widget/auth_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentPage extends StatelessWidget {
  CommentPage({
    super.key,
  });

  final commentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnBoardingBG,
      appBar: AppBar(
        backgroundColor: kOnBoardingBG,
        centerTitle: true,
        title: const Text("Commentis"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 20,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey),
                                child: const CircleAvatar(
                                  radius: 33,
                                  backgroundImage: AssetImage(
                                      "assets/images/onboarding.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Yaman Jawad",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Text(
                                      "Nice!",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(DateFormat.yMMMMd()
                                        .format(DateTime.now())),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite))
                        ],
                      ),
                    );
                  },
                  // children:
                  //     snapshot.data!.docs.map((DocumentSnapshot document) {
                  //   Map<String, dynamic> data =
                  //       document.data()! as Map<String, dynamic>;
                  //   return
                  // }).toList(),
                ),
              ),
            ),
            // StreamBuilder<QuerySnapshot>(
            //   stream: FirebaseFirestore.instance
            //       .collection("posts")
            //       .doc(widget.data["postId"])
            //       .collection("comments")
            //       .orderBy("datePublished")
            //       .snapshots(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }
        
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(
            //         child: CircularProgressIndicator(color: Colors.white),
            //       );
            //     }
        
            //     if (!snapshot.hasData || snapshot.data == null) {
            //       // Handle the case where the data is null.
            //       return Text('No data available');
            //     }
            //     return
            //   },
            // ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/logo.jpeg")),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: const AuthTextFiled(
                      label: "Add Comment",
                      hint: "Write your comment",
                      icon: Icon(Icons.send)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//  TextField(
//                     controller: commentTextController,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                             onPressed: () async {
//                               // await FirestoreMethods().Commenting(
//                               //     commentTextController:
//                               //         commentTextController.text,
//                               //     postId: widget.data["postId"],
//                               //     url: commenterData.url,
//                               //     username: commenterData.username,
//                               //     uID: commenterData.uID,
//                               //     context: context);
//                               // commentTextController.clear();
//                             },
//                             icon: const Icon(Icons.send)),
//                         fillColor: kOnBoardingBG,
//                         filled: true,
//                         hintText: "Comment as UserName",
//                         hintStyle: const TextStyle(color: Colors.black),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: kOnBoardingP,
//                             width: 2,
//                           ),
//                         ),
//                         enabledBorder:
//                             const OutlineInputBorder(borderSide: BorderSide.none)),
//                   ),
