import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../../constants/colorConstants.dart';
import '../../../constants/stringConstants.dart';
import '../../../constants/stylesConstants.dart';
import '../../../model/getVisitorModel.dart';
import '../../../utils/dateFormat.dart';

class ApprovedListItem extends StatefulWidget {
  LstParty lstParty;
  ApprovedListItem(this.lstParty, {super.key});

  @override
  State<ApprovedListItem> createState() => _ApprovedListItemState();
}

class _ApprovedListItemState extends State<ApprovedListItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            StringConstants.areYouSureForLogOut,
                            style: AppStyles.boldText(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: ColorsConstants.blackColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    await controller.getOutTiming(
                                        widget.lstParty.vAPPROVALID ?? '',
                                        'OUT');
                                    Get.back();
                                    Get.showSnackbar(
                                      GetSnackBar(
                                        title: controller.outTiming ?? 'value',
                                        message:
                                            controller.outTiming ?? 'qwerty',
                                        duration: const Duration(seconds: 4),
                                      ),
                                    );
                                  },
                                  child: const Text(StringConstants.yes)),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(StringConstants.no)),
                            ],
                          )
                        ],
                      ),
                    ));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: (25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        'http://${widget.lstParty.vImg ?? ""}',
                        fit: BoxFit.contain,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            "assets/images/user.png",
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.lstParty.vNAME}',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ConvertFormat.convertDTFormat(
                                '${widget.lstParty.visitDATE}'),
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.lstParty.vMEETTO}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300)),
                          Text(
                            '${widget.lstParty.visitOUTTIME}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
