import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_spaces.dart';
import '../../constants/text_styles.dart';
import '../../utils/card/custom_card.dart';
import '../../utils/gesture/custom_inkwell.dart';
import '../helpline_numbers_screen.dart';
import '../safety_tips_screen.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          // Using SafeArea to avoid overlapping with system UI
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpaces.largeSpace,
              children: [
                Builder(
                  builder:
                      (BuildContext context) => CustomInkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.largeIconSize),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondary.withValues(alpha: 0.5),
                            image: DecorationImage(
                              image: AssetImage('assets/images/logoo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Text(
                            "LOGO",
                            style: TextStyle(
                              color: AppColors.secondary.withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                      ),
                ),

                // User Card
                CustomCard(
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary,
                      child: Icon(Icons.person),
                    ),
                    title: Text('Prasamsha Thapa', style: TextStyles.medium18),
                    subtitle: Text(
                      '+977 9840777666',
                      style: TextStyles.medium14,
                    ),
                  ),
                ),

                Expanded(
                  //makes gridview take available space and cover the screen
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildFeatureCard(
                        icon: Iconify(
                          Bi.people_fill,
                          size: 40,
                          color: AppColors.secondary,
                        ),
                        title: 'Trusted Contacts Management',
                        onTap: () {},
                      ),
                      _buildFeatureCard(
                        icon: Iconify(Logos.google_maps, size: 40),
                        title: 'Maps',
                        onTap: () {},
                      ),
                      _buildFeatureCard(
                        icon: Iconify(
                          AntDesign.safety_certificate_twotone,
                          size: 40,
                          color: AppColors.secondary,
                        ),
                        title: 'Safety Tips',
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SafetyTipsScreen(),
                              ),
                            ),
                      ),
                      _buildFeatureCard(
                        icon: Iconify(
                          Mdi.phone_dial,
                          size: 40,
                          color: AppColors.secondary,
                        ),
                        title: 'Helpline Numbers',
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HelplineNumbersScreen(),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required Widget icon,
    required String title,
    required Function onTap,
  }) {
    return CustomInkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            AppSpaces.small,
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
