import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';

const mypadding = const EdgeInsets.symmetric(horizontal: 10);

// this class contains all the components that mezAdimn needs
class MezAdminOrdersComponents {
  static Widget ordersCumOnDayComponent(
      OrdersStates state, String title, String count) {
    LinearGradient? mygradient = null;
    switch (state) {
      case OrdersStates.Finished:
        mygradient = LinearGradient(
          colors: [
            Color.fromRGBO(25, 165, 53, 1),
            Color.fromRGBO(13, 83, 27, 0.8)
          ],
          begin: Alignment(0.0, 0.7),
          end: Alignment(0.7, 0.2),
        );
        break;
      case OrdersStates.Cancelled:
        mygradient = LinearGradient(
          colors: [
            Color.fromRGBO(217, 28, 28, 0.9),
            Color.fromRGBO(109, 14, 14, 0.9)
          ],
          begin: Alignment(0.0, 0.9),
          end: Alignment(0.9, 0.0),
        );
        break;
      case OrdersStates.Expired:
        mygradient = LinearGradient(
          colors: [
            //Color.fromRGBO(161, 163, 153, 0.9),
            Colors.grey.withOpacity(0.9),
            Color.fromRGBO(81, 82, 77, 0.9)
          ],
          begin: Alignment(0.0, 0.7),
          end: Alignment(0.7, 0.2),
        );
        break;
      case OrdersStates.InProccess:
        mygradient = LinearGradient(
          colors: [
            Color.fromRGBO(1226, 156, 75, 0.9),
            Color.fromRGBO(113, 78, 38, 1)
          ],
          begin: Alignment(0.0, 0.7),
          end: Alignment(0.7, 0.2),
        );
        break;
      case OrdersStates.IsLooking:
        mygradient = LinearGradient(
          colors: [
            Color.fromRGBO(132, 139, 230, 1),
            Color.fromRGBO(52, 58, 199, 0.9)
          ],
          begin: Alignment(0.0, 0.7),
          end: Alignment(0.7, 0.2),
        );
        break;
      default:
    }
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: mygradient),
          child: Container(
            padding: mypadding,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "$title",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.9568627450980393),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$count",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9568627450980393),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// buildWidgets for Orders in table
  static Widget buildTableWidget(OrdersStates states, String time,
      String driverImg, String custImg, String s, String r, String o) {
    var mytextStyle = TextStyle(
        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600);
    LinearGradient? myColors = null;
    switch (states) {
      case OrdersStates.Cancelled:
        myColors = LinearGradient(
          colors: [
            Color.fromRGBO(242, 83, 62, 1),
            Color.fromRGBO(160, 106, 90, 1)
          ],
          begin: Alignment(0.0, 0.5),
          end: Alignment(0.5, 0.3),
        );
        break;
      case OrdersStates.Expired:
        myColors = LinearGradient(
          colors: [
            Color.fromRGBO(134, 136, 127, 1),
            Color.fromRGBO(119, 120, 117, 1)
          ],
          begin: Alignment(0.0, 0.5),
          end: Alignment(0.5, 0.3),
        );
        break;
      case OrdersStates.Finished:
        myColors = LinearGradient(
          colors: [
            Color.fromRGBO(116, 196, 132, 1),
            Color.fromRGBO(97, 162, 111, 1)
          ],
          begin: Alignment(0.0, 0.5),
          end: Alignment(0.5, 0.3),
        );
        break;
      case OrdersStates.InProccess:
        myColors = LinearGradient(
          colors: [
            Color.fromRGBO(239, 132, 26, 1),
            Color.fromRGBO(166, 152, 102, 1),
          ],
          begin: Alignment(0.0, 0.5),
          end: Alignment(0.5, 0.3),
        );
        break;
      case OrdersStates.IsLooking:
        myColors = LinearGradient(
          colors: [
            Color.fromRGBO(68, 74, 205, 1),
            Color.fromRGBO(18, 122, 211, 1),
          ],
          begin: Alignment(0.0, 0.5),
          end: Alignment(0.5, 0.3),
        );
        break;
      default:
    }
    return Container(
      // color: myColor,
      decoration: BoxDecoration(gradient: myColors),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "${time}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: (driverImg != null)
                ? Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      child: ClipOval(
                        child: Image.network(
                          "${driverImg}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      height: 30,
                      width: 30,

                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.white,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //add mezcalmos icon
                    ),
                  ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: Center(
              child: Container(
                  height: 30,
                  width: 30,
                  child: ClipOval(
                    child: Image.network(
                      "${custImg}",
                      fit: BoxFit.cover,
                    ),
                  )),
            )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${s}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${r}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${o}",
                style: mytextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
