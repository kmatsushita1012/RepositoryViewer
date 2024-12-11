import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/page/detail.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';

class RepositoryTile extends StatelessWidget {
  final int index;

  const RepositoryTile({super.key, required this.index});

  void _onTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(index: index)));
  }

  @override
  Widget build(BuildContext context) {
    final RepositoryProvider state = Provider.of<RepositoryProvider>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 50,
        child: Row(
          children: [
            Text(
              state.items[index].name,
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
      onTap: () => _onTap(context),
    );
  }
}
