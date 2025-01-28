import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../model/getVisitorModel.dart';
import '../../utils/dateFormat.dart';

class HistoryListItem extends StatefulWidget {
  HistoryListItem(this.lstParty, {super.key});
  LstParty lstParty;

  @override
  State<HistoryListItem> createState() => _HistoryListItemState();
}

class _HistoryListItemState extends State<HistoryListItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: widget.lstParty.visitDATE!.isNotEmpty
            ? InkWell(
                onLongPress: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 25,
                          child: Image.network(
                            'http://${widget.lstParty.vImg}',
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
                                Expanded(
                                  child: Text(
                                    '${widget.lstParty.vNAME} (${widget.lstParty.vPURPOSE})',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  ConvertFormat.convertDTFormat(
                                      '${widget.lstParty.visitDATE}'),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      '${widget.lstParty.vMEETTO}(${widget.lstParty.vSTATUS})',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                ),
                                Text(
                                  '${widget.lstParty.visitOUTTIME}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
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
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
