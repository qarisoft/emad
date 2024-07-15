
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, this.titles = const [], this.data = const []});

  final List<String> titles;
  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    if (titles.isEmpty || data.isEmpty) {
      return const SizedBox(height: 0,);
    }

    return Scrollbar(
      thickness: 5,
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      radius: const Radius.circular(10),
      child: SingleChildScrollView(

        reverse: true,
        child: Table(

          columnWidths: const {
            0: FlexColumnWidth(0.4),
          },
          border: TableBorder.all(color: Colors.black54),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(decoration: const BoxDecoration(color: Colors.redAccent), children: [
              const TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('#'),
                ),
              ),
              ...List.generate(
                titles.length,
                    (index) => TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(titles[index] ?? ''),
                    ),
                  ),
                ),
              ),
            ]),
            ...List.generate(
              data.length,
                  (rIndex) => TableRow(
                children: [
                  TableCell(child: Padding(padding: const EdgeInsets.all(5), child: Text(rIndex.toString()))),
                  ...List.generate(
                    titles.length,
                        (cIndex) =>
                        TableCell(child: Padding(padding: const EdgeInsets.all(5), child: Text(data[rIndex][cIndex]))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class TableWidget2 extends StatelessWidget {
  const TableWidget2({super.key, this.titles = const [], this.data = const []});

  final List<String> titles;
  final List<List<Widget>> data;

  @override
  Widget build(BuildContext context) {
    if (titles.isEmpty || data.isEmpty) {
      return const SizedBox(height: 0,);
    }

    return Scrollbar(
      thickness: 5,
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      radius: const Radius.circular(10),
      child: SingleChildScrollView(

        reverse: true,
        child: Table(

          columnWidths: const {
            0: FlexColumnWidth(0.4),
          },
          border: TableBorder.all(color: Colors.black54),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(decoration: const BoxDecoration(color: Colors.redAccent), children: [
              const TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('#'),
                ),
              ),
              ...List.generate(
                titles.length,
                    (index) => TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(titles[index] ?? ''),
                    ),
                  ),
                ),
              ),
            ]),
            ...List.generate(
              data.length,
                  (rIndex) => TableRow(
                children: [
                  TableCell(child: Padding(padding: const EdgeInsets.all(5), child: Text(rIndex.toString()))),
                  ...List.generate(
                    titles.length,
                        (cIndex) =>
                        TableCell(child: Padding(padding: const EdgeInsets.all(5), child: data[rIndex][cIndex])),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
