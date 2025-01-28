import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:visitor_management/controller/addProductController.dart';
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
                          QrImageView(
                            data: widget.lstParty.vAPPROVALID ?? '',
                            version: QrVersions.min,
                            size: 200.0,
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
                    radius: 24,
                    child: Image.network(
                      'http://${widget.lstParty.vImg}',
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
                          SizedBox(
                              child: Text(
                            '${widget.lstParty.vNAME} (${widget.lstParty.vPURPOSE})',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          )),
                          SizedBox(
                            child: Text(
                              ConvertFormat.convertDTFormat(
                                  '${widget.lstParty.visitDATE}'),
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: Text('${widget.lstParty.vMEETTO}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300))),
                          Text(
                            '${widget.lstParty.visitOUTTIME}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
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
