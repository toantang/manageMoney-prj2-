import 'package:dynamic_treeview/dynamic_treeview.dart';

class DataModel implements BaseData {
  final int id;
  final int parentId;
  String name;

  ///Any extra data you want to get when tapped on children
  Map<String, dynamic> extra;

  DataModel({this.id, this.parentId, this.name, this.extra});

  @override
  String getId() {
    return this.id.toString();
  }

  @override
  Map<String, dynamic> getExtraData() {
    return this.extra;
  }

  @override
  String getParentId() {
    return this.parentId.toString();
  }

  @override
  String getTitle() {
    return this.name;
  }
}