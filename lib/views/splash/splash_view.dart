import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/controllers/splash_controller.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/views/globals_components/logo_portal_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (context, _auth, widget) {
      print(_auth.isBioSetup);
      print(_auth.stayLoggedIn);
      print(_auth.savedEmail);
      print(_auth.cliente);
      if (_auth?.cliente != null) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          MyNavigator.goToHome(context);
        });
      } else {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          MyNavigator.goToLogin(context);
          //Timer(Duration(seconds: 6), () => MyNavigator.goToLogin(context));
        });
      }
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: kBackgroundColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        getLogoPortal(context),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                            "Bem Vindo", FontWeight.w400, kPrimaryColor, 30),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      CustomText(
                          "Carregando", FontWeight.w400, kPrimaryColor, 20),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
//   }
// }

// class SplashView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class SplashView extends StatefulWidget {
//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   SplashController _splashController = SplashController();
//   @override
//   void initState() {
//     super.initState();
//     _splashController.isLogged().then((value) {
//       if (value == true) {
//         Timer(Duration(seconds: 2), () => MyNavigator.goToHome(context));
//       } else {
//         Timer(Duration(seconds: 2), () => MyNavigator.goToLogin(context));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(color: kBackgroundColor),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       getLogoPortal(context),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CustomText(
//                           "Bem Vindo", FontWeight.w400, kPrimaryColor, 30),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(top: 20.0),
//                     ),
//                     CircularProgressIndicator(
//                       valueColor:
//                           new AlwaysStoppedAnimation<Color>(kPrimaryColor),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 20.0),
//                     ),
//                     CustomText(
//                         "Carregando", FontWeight.w400, kPrimaryColor, 20),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
