import 'package:base_flutter_project/model/activity_history.dart';
import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/model/project.dart';
import 'package:base_flutter_project/model/role.dart';
import 'package:base_flutter_project/screens/manager_employee/employee_controller.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:base_flutter_project/widgets/dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          Employee? employee = _controller.employee.value;
          if (employee == null) {
            return Container();
          }
          return Row(
            children: [
              Expanded(child: _buildItemInformationEmployee(employee)),
              Expanded(flex: 2, child: _buildActivityHistoryWidget()),
              Expanded(child: _buildItemLeft())
            ],
          );
        },
      ),
    );
  }

  Widget _buildItemInformationEmployee(Employee employee) {
    return Container(
      color: AppColors.azure,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.dp, top: 20.dp),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    employee.avatar ?? "",
                    width: 100.dp,
                    height: 100.dp,
                  ),
                ),
                SizedBox(
                  width: 20.dp,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        employee.fullName ?? "",
                        style: AppTextStyle.t24w700(),
                      ),
                      SizedBox(height: 10.dp,),
                      Text(
                        employee.roles?[0].name ?? "",
                        style: AppTextStyle.t14w400(),
                      ),
                      SizedBox(
                        width: 300.dp,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Đang hoạt động",
                                style: AppTextStyle.t14w400(),
                              ),
                            ),
                            Expanded(child: _buildOptionButton()),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.dp),
            child: const Divider(height: 0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.dp, vertical: 10.dp),
            child: Text(
              "Thông tin nhân viên",
              style: AppTextStyle.t20w700(),
            ),
          ),
          _buildChildItem("Mã nhân viên", employee.employeeId),
          _buildChildItem("Tên đăng nhập", employee.username),
          _buildChildItem("Email", employee.email),
          _buildChildItem("Số điện thoại", employee.phoneNumber.toString()),
          _buildChildItem("Ngày sinh", employee.birthday),
          _buildChildItem("Giới tính", employee.gender),
          _buildChildItem("Địa chỉ", employee.address),
          _buildChildItem(
              "CMND/CCCD/Hộ chiếu", employee.citizenIdentification?.number),
          _buildChildItem("Ngày cấp", employee.citizenIdentification?.created),
          _buildChildItem(
              "Nơi cấp", employee.citizenIdentification?.addressCreated),
          _buildChildItem("Ghi chú", employee.note),
        ],
      ),
    );
  }

  Widget _buildOptionButton() {
    return DropdownButton<String>(
      hint: Text(
        "Tuỳ chọn",
        style: AppTextStyle.t16w700(AppColors.sangria),
      ),
      dropdownColor: AppColors.white,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.sangria,
      ),
      iconSize: 24,
      elevation: 16,
      isExpanded: false,
      borderRadius: BorderRadius.circular(10),
      style: AppTextStyle.t18w400(AppColors.black),
      onChanged: (data) {},
      underline: const Divider(
        color: Colors.transparent,
      ),
      items: [
        DropdownMenuItem(
          value: "Stop",
          child: Text(
            "Dừng hoạt động",
            style: AppTextStyle.t14w700(),
          ),
        ),
        DropdownMenuItem(
          value: "Reset pass",
          child: Text(
            "Đặt lại mật khẩu",
            style: AppTextStyle.t14w700(),
          ),
        ),
        DropdownMenuItem(
          value: "Delete",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Divider(
                  height: 0,
                ),
              ),
              Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Xoá Nhân sự",
                    style: AppTextStyle.t14w700(AppColors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChildItem(String title, String? desc) {
    return Padding(
      padding: EdgeInsets.only(top: 20.dp, left: 20.dp, right: 20.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.t16w400(),
          ),
          SizedBox(
            height: 5.dp,
          ),
          Text(
            desc ?? "",
            style: AppTextStyle.t16w700(),
          )
        ],
      ),
    );
  }

  Widget _buildActivityHistoryWidget() {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.grey, width: 0.5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(30.dp),
          child: Text(
            "Lịch sử hoạt động",
            style: AppTextStyle.t24w700(),
          ),
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.dp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tìm kiếm theo hành động",
                style: AppTextStyle.t18w400(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    maxLength: 3,
                    scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: AppColors.azure,
                      counterText: "",
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      border: border,
                    ),
                    style: AppTextStyle.t18w700(),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Thời gian",
                      style: AppTextStyle.t14w400(),
                    ),
                    SizedBox(
                      width: 10.dp,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Row(
                          children: [
                            Text(
                              "Tất cả",
                              style: AppTextStyle.t16w700(AppColors.red),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        Expanded(flex: 9, child: _buildListActivity())
      ],
    );
  }

  Widget _buildListActivity() {
    return Obx(
      () {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 50.dp,
            );
          },
          itemBuilder: (context, index) {
            final activityHistory =
                _controller.activityHistory.values.toList()[index];
            final date = _controller.activityHistory.keys.toList()[index];
            return _buildItemActivityHistory(date, activityHistory);
          },
          itemCount: _controller.activityHistory.length,
        );
      },
    );
  }

  Widget _buildItemActivityHistory(
    String date,
    List<ActivityHistory> activityHistory,
  ) {
    DateTime datetime = DateFormat("yyyy/MM/dd").parse(date);
    String datetimeDisplay = DateFormat("EEEE, dd/MM/yyyy").format(datetime);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined),
              SizedBox(
                width: 10.dp,
              ),
              Text(
                datetimeDisplay,
                style: AppTextStyle.t20w700(),
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItemDetailsActivityHistory(activityHistory[index]);
            },
            itemCount: activityHistory.length,
          )
        ],
      ),
    );
  }

  Widget _buildItemDetailsActivityHistory(ActivityHistory activityHistory) {
    DateTime created =
        DateFormat("yyyy/MM/dd HH:mm:ss").parse(activityHistory.createdAt);
    String dateTimeDisplay = DateFormat("HH:mm:ss dd/MM/yyyy").format(created);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            dateTimeDisplay,
            style: AppTextStyle.t14w400(),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.dp),
          decoration: BoxDecoration(
              color: AppColors.azure, borderRadius: BorderRadius.circular(10)),
          child: Text(
            activityHistory.description,
            style: AppTextStyle.t16w700(),
          ),
        )
      ],
    );
  }

  Widget _buildItemLeft() {
    return Container(
      color: AppColors.azure,
      padding: EdgeInsets.symmetric(horizontal: 20.dp),
      child: ListView.builder(
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  "Thông tin công việc",
                  style: AppTextStyle.t18w700(),
                ),
              );
            case 1:
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Bộ phận",
                          style: AppTextStyle.t12w700(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Phân quyền",
                          style: AppTextStyle.t12w700(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: DashWidget(),
                  )
                ],
              );
            case 2:
              return _buildListViewRoles();
            case 3:
              return const Divider(
                height: 0,
              );
            case 4:
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  "Phụ trách dự án và phân quyền",
                  style: AppTextStyle.t18w700(),
                ),
              );
            default:
              return _buildListViewProject();
          }
        },
        itemCount: 6,
      ),
    );
  }

  Widget _buildListViewRoles() {
    return Obx(
      () {
        final roles = _controller.roles.toList();
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Role role = roles[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      role.department ?? "",
                      textAlign: TextAlign.start,
                      style: AppTextStyle.t14w400(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      role.name ?? "",
                      textAlign: TextAlign.start,
                      style: AppTextStyle.t14w400(),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: roles.length,
        );
      },
    );
  }

  Widget _buildListViewProject() {
    return Obx(
      () {
        final projects = _controller.projects.toList();
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.dp,
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Project project = projects[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dự án ${index + 1}",
                  style: AppTextStyle.t14w400(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                  child: Text(
                    project.name ?? "",
                    style: AppTextStyle.t16w400(),
                  ),
                ),
                Text(
                  "Phân quyền",
                  style: AppTextStyle.t14w400(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    project.rolePermission ?? "",
                    style: AppTextStyle.t16w400(),
                  ),
                ),
                _buildDropdown()
              ],
            );
          },
          itemCount: projects.length,
        );
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      hint: Text(
        "Các module, tính năng được phép truy cập",
        style: AppTextStyle.t16w700(AppColors.sangria),
      ),
      dropdownColor: AppColors.white,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.sangria,
      ),
      iconSize: 24,
      elevation: 16,
      style: AppTextStyle.t18w400(AppColors.black),
      onChanged: (data) {},
      underline: const Divider(
        color: Colors.transparent,
      ),
      items: _controller.modules.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            margin: EdgeInsets.only(left: 10.dp),
            child: Text(
              value,
              style: AppTextStyle.t18w700(AppColors.black),
            ),
          ),
        );
      }).toList(),
    );
  }
}
