import 'package:flutter/cupertino.dart';
import 'package:palimpsest/resources/io_resource.dart';

class IOResourceWidget extends StatelessWidget {
  final IOResource resource;

  const IOResourceWidget({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return ListenableBuilder(
      listenable: resource,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'I/O BUFFER',
                    style: theme.textTheme.textStyle.copyWith(
                      fontSize: 11.0,
                      letterSpacing: 2.0,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  Text(
                    '${resource.value.toInt()} / ${resource.cap.toInt()}',
                    style: theme.textTheme.textStyle.copyWith(
                      fontSize: 11.0,
                      color: Color(0xFF00FF41),
                    ),
                  ),
                ],
              ),
              Container(
                height: 3.0,
                width: double.infinity,
                color: Color(0xFF1A1A1A),
                child: FractionallySizedBox(
                  widthFactor: (resource.value / resource.cap).clamp(0.0, 1.0),
                  alignment: Alignment.centerLeft,
                  child: Container(color: Color(0xFF00FF41)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
