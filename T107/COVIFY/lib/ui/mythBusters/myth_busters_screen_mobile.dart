import 'package:flutter/material.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/data/myth_buster_data.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/res/asset_images.dart';
import 'package:covid19/ui/mythBusters/widgets/myth_card_widget_mobile.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';

/// [MythBustersMobileScreen] Displays the list of Symptoms for Covid-19
/// Supports Mobile Screen Sizes
class MythBustersMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // [AppBar] with 0 size used to set the statusbar background color and
      // statusbat text/icon color
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: AppColors.transparentColor,
          brightness: Brightness.light,
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding / 0.75,
            Dimens.horizontalPadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Icon
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Covid19Icons.keyboardArrowLeft,
                        size: screenHeight / 45,
                        color: AppColors.blackColor,
                      ),
                    ),

                    // Vertical Spacing
                    SizedBoxHeightWidget(screenHeight / 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Page Title
                        Text(
                          Strings.mythBusterTitle,
                          style: TextStyles.statisticsHeadingTextStlye.copyWith(
                            fontSize: screenHeight / 35,
                          ),
                        ),

                        // Horizontal Spacing
                        SizedBoxWidthWidget(screenWidth / 25),
                        // Myth Busters Icon
                      ],
                    ),
                  ],
                ),
              ),

              // Myth Buster Items
              // Wrapping the contents in a [Expanded] to make sure that the remaining space
              // in the screen is filled
              Expanded(
                flex: 5,
                    child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 50,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mythBusterData.length,
                      itemBuilder: (context, index) {
                        // Adding Padding to the first item for the top shadow to be visible
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(top: screenHeight / 200),
                            child: MythCardMobileWidget(
                              myth: mythBusterData[index].myth,
                              fact: mythBusterData[index].fact,
                            ),
                          );
                        }

                        // Adding extra padding at the bottom in case of the last element
                        if (index == mythBusterData.length - 1) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: Dimens.verticalPadding / 0.2,
                            ),
                            child: MythCardMobileWidget(
                              myth: mythBusterData[index].myth,
                              fact: mythBusterData[index].fact,
                            ),
                          );
                        }
                        // Returning the normal widget in other cases
                        else {
                          return MythCardMobileWidget(
                            myth: mythBusterData[index].myth,
                            fact: mythBusterData[index].fact,
                          );
                        }
                      },
                    ),
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
