import '../../core/constants/app_constants.dart';
import '../../core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/utilities.dart';
import '../../core/widgets/common_loading_indicator.dart';
import 'components/all_countries_list.dart';
import 'controllers/home_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppUtilities().onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: Text(
            AppConstans.appName,
            style: AppTextStyles.work25Black,
          ),
          centerTitle: true,
          leading: IconButton(
            color: AppColors.black,
            icon: const Icon(
              Icons.power_off_rounded,
            ),
            onPressed: () => AppUtilities().onWillPop(context),
          ),
        ),
        body: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const CommonLoadingIndicator();
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: AllUserList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
