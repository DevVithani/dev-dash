import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {

  String url = 'https://www.youtube.com/watch?v=ktTajqbhIcY';

  YoutubePlayerController? controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(url);

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        loop: true,
        forceHD: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Table',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: controller!,
              progressColors: const ProgressBarColors(
                backgroundColor: Colors.black,
                handleColor: Colors.white,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              filePath: 'lib/widgets/table_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class DataTableExample extends StatefulWidget {
              const DataTableExample({super.key});
            
              @override
              State<DataTableExample> createState() => _DataTableExampleState();
            }
            
            class _DataTableExampleState extends State<DataTableExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [     
                Center(
                  child: Card(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("State")),
                        DataColumn(label: Text("Year")),
                        DataColumn(label: Text("age")),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(Text("AbCd")),
                            DataCell(Text("-")),
                            DataCell(Text("2018")),
                            DataCell(Text("35")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text("LoPt")),
                            DataCell(Text("Punjab")),
                            DataCell(Text("2014")),
                            DataCell(Text("28")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text("GbNh")),
                            DataCell(Text("-")),
                            DataCell(Text("2019")),
                            DataCell(Text("32")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text("putrefy")),
                            DataCell(Text("-")),
                            DataCell(Text("2021")),
                            DataCell(Text("37")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text("GbNh")),
                            DataCell(Text("Gujarat")),
                            DataCell(Text("2024")),
                            DataCell(Text("26")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Example 2 Code
                
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black, style: BorderStyle.solid, width: 2),
                    children: const [
                      TableRow(children: [
                        Column(children: [
                          Text('Website', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Tutorial', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Review', style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Flutter')]),
                        Column(children: [Text('Flutter')]),
                        Column(children: [Text('5*')]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('AndroidStudio')]),
                        Column(children: [Text('Kotlin')]),
                        Column(children: [Text('5*')]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('StackOverFlow')]),
                        Column(children: [Text('ReactJS')]),
                        Column(children: [Text('5*')]),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: DataTableExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Properties of DataTable Widget:',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              '1.DataColumn\n'
              '2.DataRow\n'
              '3.DataRowHeight\n'
              '4.DataRowMaxHeight\n'
              '5.DataRowMinHeight\n'
              '6.decoration\n'
              '7.dataRowColor\n'
              '8.headingRowColor\n'
              '9.border\n'
              '10.clipBehavior\n'
              '11.columnSpacing\n'
              '12.onSelectAll\n'
              '13.dividerThickness\n'
              '14.headingTextStyle\n'
              '15.horizontalMargin\n'
              '16.checkboxHorizontalMargin\n',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Card(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("State")),
                  DataColumn(label: Text("Year")),
                  DataColumn(label: Text("age")),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text("AbCd")),
                      DataCell(Text("-")),
                      DataCell(Text("2018")),
                      DataCell(Text("35")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("LoPt")),
                      DataCell(Text("Punjab")),
                      DataCell(Text("2014")),
                      DataCell(Text("28")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("GbNh")),
                      DataCell(Text("-")),
                      DataCell(Text("2019")),
                      DataCell(Text("32")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("putrefy")),
                      DataCell(Text("-")),
                      DataCell(Text("2021")),
                      DataCell(Text("37")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("GbNh")),
                      DataCell(Text("Gujarat")),
                      DataCell(Text("2024")),
                      DataCell(Text("26")),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: const [
                TableRow(children: [
                  Column(children: [
                    Text('Website', style: TextStyle(fontSize: 20.0))
                  ]),
                  Column(children: [
                    Text('Tutorial', style: TextStyle(fontSize: 20.0))
                  ]),
                  Column(children: [
                    Text('Review', style: TextStyle(fontSize: 20.0))
                  ]),
                ]),
                TableRow(children: [
                  Column(children: [Text('Flutter')]),
                  Column(children: [Text('Flutter')]),
                  Column(children: [Text('5*')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('AndroidStudio')]),
                  Column(children: [Text('Kotlin')]),
                  Column(children: [Text('5*')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('StackOverFlow')]),
                  Column(children: [Text('Flutter')]),
                  Column(children: [Text('4.5*')]),
                ]),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
        ],
      ),
    );
  }
}
