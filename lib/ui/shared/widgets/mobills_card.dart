import 'package:flutter/material.dart';
import 'package:mobills_flutter/ui/shared/widgets/mobills_button.dart';

class MobillsCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String description;
  final MobillsButton button;

  MobillsCard({
    @required this.icon,
    @required this.text,
    this.description,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Icon(
                  icon,
                  color: Colors.grey.shade600,
                  size: 36.0,
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: 8.0),
              description != null
                  ? Text(
                      description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    )
                  : Container(),
              button != null ? SizedBox(height: 20.0) : Container(),
              button != null ? button : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
