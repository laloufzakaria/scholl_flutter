import 'package:emploi/model/timetable_model.dart';
import 'package:emploi/provider/timetable_provider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin<DashboardScreen> {
  TimetablesProvider _timetablesProvider = TimetablesProvider();
  final _scrollController = ScrollController();
  Stream<List<Timetable>> _stream;

  @override
  void initState() {
    super.initState();
    _timetablesProvider.index();
    _stream = _timetablesProvider.timetableStream;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              final timetable = snapshot.data;
              return Container(
                  child: GridView.builder(
                      controller: _scrollController,
                      itemCount: timetable.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(

                        );
                      }));
            }));
  }


  @override
  bool get wantKeepAlive => true;
}
