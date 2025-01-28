import 'package:flutter/material.dart';
import '../../../model/getVisitorModel.dart';
import '../../../utils/dateFormat.dart';

class RejectListItem extends StatefulWidget {
  RejectListItem(this.lstParty, {super.key});
  LstParty lstParty;
  @override
  State<RejectListItem> createState() => _RejectListItemState();
}

class _RejectListItemState extends State<RejectListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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
                  borderRadius:BorderRadius.circular(25),
                  child: Image.network('http://${widget.lstParty.vImg ?? ""}',fit: BoxFit.contain,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return Image.asset("assets/images/user.png",fit: BoxFit.fill,);
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
      )
    );
  }
}
