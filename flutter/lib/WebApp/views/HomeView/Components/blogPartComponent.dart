import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/controllers/blogController.dart';
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'package:mezcalmos/WebApp/services/Models/blogModle.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/views/HomeView/Components/blogCardShimmerComponent.dart';
import 'package:sizer/sizer.dart';

class BlogPartComponent extends StatelessWidget {
  BlogPartComponent({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getSpaceOnTop(context),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(
                () => Text(
                  "${langController.strings["WebApp"]["blogTitle"]}",
                  style: txt.headline1!.copyWith(
                      fontSize: getSizeForTitle(context),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      color: Colors.black),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: (() {
                  Get.toNamed(blogsView);
                }),
                child: Obx(
                  () => Text(
                    "${langController.strings["WebApp"]["showAll"]}",
                    style: txt.headline1!.copyWith(
                        fontSize: getSizeShowMoreText(context),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        fontFamily: "Montserrat",
                        color: Color.fromRGBO(103, 121, 254, 1)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 11.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context))
                  ? MezCalmosResizer.getWepPageHorizontalPadding(context)
                  : (MezCalmosResizer.getWepPageHorizontalPadding(context) -
                      20)),
          child: GetBolgsGridList(context, null),
        ),
      ],
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15.sp;
    }
  }

  double getSizeShowMoreText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }

  double getSpaceOnTop(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 15.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 14.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 25.sp;
    }
  }
}

// List<BlogModel> blogs = <BlogModel>[
//   BlogModel(
//     date: "8 June",
//     img: "https://images.pexels.com/photos/45980/pexels-photo-45980.jpeg",
//     title: "6 REASONS WHY YOU SHOULD SWITCH TO A WASH AND FOLD SERVICE",
//     durationOfReding: "Read in 15 minutes",
//   ),
//   BlogModel(
//     date: "25 May",
//     img: "https://images.pexels.com/photos/5317182/pexels-photo-5317182.jpeg",
//     title: "SPRING SALAD WITH HOMEMADE GREEN GODDESS DRESSING",
//     durationOfReding: "Read in 15 minutes",
//   ),
//   BlogModel(
//     date: "15 May",
//     img: "https://images.pexels.com/photos/6461325/pexels-photo-6461325.jpeg",
//     title: "LAUNDRY TIPS TO KEEP YOUR CLOTHES LAST-LONG & LOOKING THEIR BEST",
//     durationOfReding: "Read in 15 minutes",
//   )
// ];
Widget GetBolgsGridList(BuildContext context, int? lenght) {
  return LayoutBuilder(builder: (context, constraints) {
    return FutureBuilder<List<BlogModel>>(
        future: Get.find<BolgController>().getFeeds(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Container(
              child: MezCalmosResizer.isSmallMobile(context)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlogCardComponent(
                          blog: snapshot.data![index],
                        );
                      },
                      itemCount: lenght ?? snapshot.data!.length,
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MezCalmosResizer.isMobile(context) ? 2 : 3,
                      ),
                      itemCount: lenght ?? snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogCardComponent(
                          blog: snapshot.data![index],
                        );
                      },
                    ),
            );
          } else {
            return MezCalmosResizer.isSmallMobile(context)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return BlogCardShimmerComponent();
                    },
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MezCalmosResizer.isMobile(context) ? 2 : 3,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BlogCardShimmerComponent();
                    },
                  );
          }
        });
  });
}

class BlogCardComponent extends StatelessWidget {
  BlogCardComponent({Key? key, required this.blog}) : super(key: key);
  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return InkWell(
      onTap: (() {
        Get.toNamed(blogDetails + "?index=${blog.index}&name=${blog.title}");
      }),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: MezCalmosResizer.isSmallMobile(context) ? 11.sp : 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: getHeightOfImage(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    blog.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              blog.date,
              style: txt.subtitle1!.copyWith(
                fontSize: getSizeForDateText(context),
                color: Colors.grey,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(
              height: MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context)
                  ? 10
                  : 15,
            ),
            Flexible(
              child: Text(
                blog.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: txt.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                    fontSize: getSizeForTitle(context)),
              ),
            ),
            SizedBox(
              height: MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context)
                  ? 15
                  : 20,
            ),
            Text(
              "${blog.durationOfReding}",
              style: txt.bodySmall!.copyWith(
                  color: Color.fromRGBO(103, 121, 254, 1),
                  fontSize: getSizeForTimeOrReadingText(context),
                  fontFamily: "Nunito",
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 9.sp;
    } else {
      return 12.sp;
    }
  }

  double getHeightOfImage(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 42.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 75.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 130.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 45.sp;
    } else {
      return 50.sp;
    }
  }

  double getSizeForDateText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 6.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 9;
    } else {
      return 6.sp;
    }
  }

  double getSizeForTimeOrReadingText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 11;
    } else {
      return 0;
    }
  }
}