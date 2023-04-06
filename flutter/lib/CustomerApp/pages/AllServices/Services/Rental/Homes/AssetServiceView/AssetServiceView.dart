import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyListTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyStoreTile.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CustomAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class AssetServiceView extends StatefulWidget {
  const AssetServiceView({super.key});

  @override
  State<AssetServiceView> createState() => _AssetServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.assetServiceRoute);
  }
}

class _AssetServiceViewState extends State<AssetServiceView> {
  final List<IconData> priceRangeIcons = [
    Icons.hourglass_top,
    Icons.event,
    Icons.date_range,
    Icons.calendar_month,
  ];
  final List<String> priceRange = [
    "\$25/hour",
    "\$153/day",
    "\$243/week",
    "\$874/month",
  ];

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Home for rent in Av Juan Pablo II, Puerto Escondido",
                          style: style.headlineSmall,
                        ),
                        // Area + Bedrooms
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: [
                              blueText("Surface area 330m²"),
                              smallCircle(),
                              blueText("3 bedrooms"),
                            ],
                          ),
                        ),
                        // Additional Info
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              blueText("2 bathrooms"),
                              smallCircle(),
                              blueText("Central Heating"),
                              smallCircle(),
                              blueText("Garage"),
                            ],
                          ),
                        ),
                        // Price Text +  Price Range Widget
                        title("Price"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int index = 0;
                                  index < priceRange.length;
                                  index++)
                                Column(
                                  children: [
                                    Icon(
                                      priceRangeIcons[index],
                                    ),
                                    Text(
                                      priceRange[index],
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                        // Description title + text
                        title("Description"),
                        subTitle(
                          "3 bedrooms, 2 bathrooms, 3300 m². You will also have a beautiful terrace, central air conditioning and fully equipped kitchen.",
                        ),
                        // Localtion title + text
                        title("Location"),
                        subTitle(
                          "Rinconada, 71980 Puerto Escondido, Oaxaca, Mexico, South America",
                        ),
                        // Google map location view
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Placeholder(),
                        ),
                        // Agency title + agency list tile
                        title("Agency"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: AgencyListTile(
                            titleText: "Puerto Estate",
                            rating: "4.9",
                            onClick: () {},
                            iconsList: [
                              Icons.payments,
                              Icons.credit_card,
                            ],
                            needMessageButton: true,
                            onMessageClick: () {},
                            image: NetworkImage(customImageUrl),
                          ),
                        ),
                        // Start date title + picker
                        title("Start Date"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MezCard(
                            content: Text("Select Time"),
                          ),
                        ),
                        // Duration title + picker
                        title("Duration"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MezCard(
                            content: Text("Duration"),
                          ),
                        ),
                        // Payment method title + card details
                        title("Payment Method"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MezCard(
                            content: Text("Visa ************4470"),
                          ),
                        ),
                        // Notes
                        title("Notes"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MezCard(
                            contentPadding: EdgeInsets.all(4.0),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "Write your notes here.",
                                  fillColor: Colors.transparent,
                                ),
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MezButton(
                label: "Book now",
                withGradient: true,
                onClick: () async {
                  return;
                },
              ),
            ],
          )),
    );
  }

  Widget title(String text) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        );
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget subTitle(String text) {
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget blueText(String text) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: primaryBlueColor,
          fontWeight: FontWeight.w600,
        );
    return Text(
      text,
      style: style,
    );
  }

  Widget smallCircle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
        Icons.circle,
        color: primaryBlueColor,
        size: 8,
      ),
    );
  }
}
