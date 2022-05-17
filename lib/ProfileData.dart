import 'package:flutter/material.dart';
import 'package:sample_profile/API/httpService.dart';

import 'Model/profile.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  late Future<Profile> profileData;

  @override
  void initState() {
    super.initState();
    profileData = fetchProfileData();
  }

  @override
  List personalDetails = [
    {'Fname': 'Ziya', 'bDate': '26-may', 'Lname': 'Shah'},
    {'Fname': 'Keta', 'bDate': '21-feb', 'Lname': 'Modi'},
    {'Fname': 'Mona', 'bDate': '16-jan', 'Lname': 'Mehta'},
    {'Fname': 'Riya', 'bDate': '06-jun', 'Lname': 'Sharma'},
    {'Fname': 'Sia', 'bDate': '09-may', 'Lname': 'Shah'},
    {'Fname': 'Keta', 'bDate': '21-feb', 'Lname': 'Modi'},
    {'Fname': 'Mona', 'bDate': '16-jan', 'Lname': 'Mehta'},
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Profile "),
      ),
      body:
          // SingleChildScrollView(
          //   child:
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 70,
            width: width / 1,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
              style: const TextStyle(
                fontSize: 14.0,
              ),
              onChanged: (value) {},
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Serach',
                contentPadding:
                    EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 0),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: FutureBuilder<Profile>(
                    future: profileData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        // return Container(
                        //     child: ListView.builder(
                        //         itemCount: snapshot.toString().length,
                        //         scrollDirection: Axis.vertical,
                        //         itemBuilder: (BuildContext context, int index) {
                        //           return Text('${snapshot.data!.name!}');
                        //         }));
                        return ListView.builder(
                            key: UniqueKey(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.toString().length,
                            itemBuilder: (context, int index) {
                              return Card(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  // color: Colors.pink,
                                  height: height / 7,
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.yellow,
                                        padding: EdgeInsets.only(left: 10),
                                        width: 90,
                                        height: 90,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Stack(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  snapshot.data!.image!,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // ),
                                      Container(
                                        width: width / 1.7,
                                        // color: Colors.yellow,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            // Padding(padding: EdgeInsets.on)
                                            Text(
                                                "Name : ${snapshot.data!.name!}"),
                                            Text(
                                                "Gender : ${snapshot.data!.gender!}"),
                                            Text(
                                                "Birth_Date : ${snapshot.data!.dateOfBirth!}"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Center(
                          child: Container(
                              height: 30, child: CircularProgressIndicator()));
                    },
                  )))
        ],
      ),
      // ),
    );
  }
}
