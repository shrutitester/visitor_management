import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../model/getVisitorModel.dart';
import '../../utils/dateFormat.dart';

class UpcomingListItem extends StatefulWidget {
  UpcomingListItem(this.lstParty, {super.key});
  LstParty lstParty;

  @override
  State<UpcomingListItem> createState() => _UpcomingListItemState();
}

class _UpcomingListItemState extends State<UpcomingListItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: (25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          'http://${widget.lstParty.vImg ?? ""}',
                          fit: BoxFit.contain,
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
                                  '${widget.lstParty.vNAME}',
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
                              Text('${widget.lstParty.vMEETTO}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
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
            ],
          ),
        ),
      );
    });
  }
}
