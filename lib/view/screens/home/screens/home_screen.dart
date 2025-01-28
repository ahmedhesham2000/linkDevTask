import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test/controller/home_cubit/home_cubit.dart';
import 'package:test/core/constants/app_color.dart';
import 'package:test/core/constants/app_themes.dart';
import 'package:test/core/constants/font_styles.dart';
import 'package:test/main.dart';
import 'package:test/model/salons_model.dart';
import 'package:test/view/screens/home/widgets/darwer_widget.dart';
import 'package:test/view/screens/home/widgets/salons_tile_widgets.dart';
import 'package:test/view/screens/salon_details/screens/salon_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetOneSalonsSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SalonDetailsScreen(
                        salon: state.salon!,
                      )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: themeNotifier.value == AppThemes.darkTheme
                        ? AppColor.backgroundLight
                        : Color(0xff002E5B),
                  ),
                  onPressed: () {
                    // cubit.getSalonData();
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
            title: Text(
              'salons'.tr(),
              style: AppStyles.style70016(context: context),
            ),
          ),
          endDrawer: HomeDrawer(),
          body: state is GetSalonsLoading
              ? ListView.separated(
                  itemCount: 10,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 24.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      child: SalonTileWidget(
                        image: 'assets/images/salon1.png',
                        salon: SalonsModel(
                          id: 0,
                          services: [],
                          countRate: 0,
                          desc: 'ahmed hesham',
                          rateAvg: '10',
                          name: 'ahmed hesham',
                          distance: '0',
                        ),
                      ),
                    );
                  },
                )
              : state is GetSalonsError
                  ? Center(
                      child: Text('error'.tr()),
                    )
                  : Stack(
                      children: [
                        ListView.separated(
                          itemCount: cubit.salons.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 24.h,
                            );
                          },
                          itemBuilder: (context, index) {
                            final imageIndex =
                                (index % 5) + 1; // Cycles through 1, 2, 3, 4, 5
                            final imageName =
                                'assets/images/salon$imageIndex.png';
                            log('imageName: $imageName');

                            return InkWell(
                              onTap: () {
                                cubit.getOneSalonData(
                                    id: cubit.salons[index].id);
                              },
                              child: SalonTileWidget(
                                salon: cubit.salons[index],
                                image: imageName,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
