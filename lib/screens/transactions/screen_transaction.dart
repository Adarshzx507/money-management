import 'package:flutter/material.dart';

class screentransactions extends StatelessWidget {
  const screentransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        return const Card(
          elevation: 1000,
          child: ListTile(
            leading: CircleAvatar(
                radius: 50,
                child: Text(
                  '12\ndec',
                  textAlign: TextAlign.center,
                )),
            title: Text('RS 10000'),
            subtitle: Text('travel'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return SizedBox(
          height: 5,
        );
      },
      itemCount: 10,
    );
  }
}
