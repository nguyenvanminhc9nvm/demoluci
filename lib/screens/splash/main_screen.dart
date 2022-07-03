import 'package:base_flutter_project/routes/routes.dart';
import 'package:base_flutter_project/screens/splash/main_controller.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey<NavigatorState>();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildNavBarWidget(),
          Container(
            height: 50.dp,
            padding: EdgeInsets.symmetric(horizontal: 20.dp),
            child: Obx(
              () {
                final titles = _controller.titles.toList();
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "/",
                          style: AppTextStyle.t18w700(AppColors.grey),
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    Color color = Colors.grey;
                    String title = titles[index];
                    if (index == 0) {
                      color = AppColors.sangria;
                    }
                    return InkWell(
                      onTap: () {
                        _controller.removeTitles();
                        rootNavigator.currentState?.pop();
                      },
                      child: Center(
                        child: Text(
                          title,
                          style: AppTextStyle.t18w700(color),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: titles.length,
                );
              },
            ),
          ),
          const Divider(
            height: 0,
          ),
          Expanded(
            flex: 10,
            child: Navigator(
              key: rootNavigator,
              initialRoute: RouteName.employeeDetails,
              onGenerateRoute: AppRoutes.generateRoute,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavBarWidget() {
    return Container(
      color: AppColors.sangria,
      padding: EdgeInsets.symmetric(vertical: 8.dp, horizontal: 19.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.bostonBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 5)
              ]
            ),
            margin: EdgeInsets.all(10.dp),
            width: 59.dp,
            height: 37.dp,
            child: Center(
              child: Text(
                "Logo",
                style: AppTextStyle.t14w400(AppColors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Quản lý dự án",
              style: AppTextStyle.t18w400(AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              rootNavigator.currentState?.pushNamed(RouteName.listEmployee);
            },
            child: Text(
              "Quản lý bộ phận cấp tập trung",
              style: AppTextStyle.t18w400(AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Quản lý bộ phận nhân sự cấp tập trung",
              style: AppTextStyle.t18w400(AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Cấu hình",
              style: AppTextStyle.t18w400(AppColors.white),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.dp),
            child: Obx(
              () {
                final user = _controller.user.value;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        AppImages.avatar,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 10.dp),
                      child: Text(
                        user?.name ?? "",
                        style: AppTextStyle.t14w400(AppColors.white),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppColors.white,
                      size: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
