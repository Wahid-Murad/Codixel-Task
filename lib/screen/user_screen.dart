import 'package:codixel_task/api/user_api.dart';
import 'package:codixel_task/model/user_model.dart';
import 'package:codixel_task/riveanimation/rive_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLoading = false;
  UserModel? userModelData;

  String? apiDate;
  DateTime? date;
  String? formattedDate;

  void fetchRandomUserData() async {
    setState(() {
      isLoading = true;
      userModelData = null;
    });

    try {
      final userApiClient = UserApi();
      final fetchedData = await userApiClient.fetchRandomUserData();

      setState(() {
        isLoading = false;
        userModelData = fetchedData;
        apiDate = userModelData!.dateOfBirth;
        date = DateTime.parse(apiDate!);
        formattedDate = DateFormat('MMM d, yyyy').format(date!);
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        userModelData = null;
      });

      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: isLoading
              ? RiveLoadingAnimation()
              : userModelData != null
                  ? Container(
                      color: Colors.grey,
                      height: 300,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              userModelData!.avatar,
                              width: 150,
                              height: 150,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                           const SizedBox(height: 40),
                            Text(
                              '${userModelData!.firstName} ${userModelData!.lastName}',
                              style: ThemeData().textTheme.labelLarge
                            ),
                            //Text('Last Name: ${userData!.lastName}'),
                            Text(
                              '${userModelData!.phoneNumber}',
                              style: ThemeData().textTheme.labelLarge
                            ),
                            Text(
                              '$formattedDate',
                              style: ThemeData().textTheme.labelLarge
                            ),
                          ],
                        ),
                      ),
                    )
                  : Text('No data'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchRandomUserData,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
