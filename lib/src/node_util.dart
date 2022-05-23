import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:neo4dart/src/entity/entity.dart';
import 'package:neo4dart/src/model/relationship.dart';

import 'model/node.dart';

class EntityUtil {
  static List<Node> convertResponseToNodeList(Response response){
    List<Entity> nodeEntityList = [];

    final jsonResult = jsonDecode(response.body);
    final data = jsonResult["results"].first["data"] as List;

    for (final element in data) {
      nodeEntityList.add(Entity.fromJson(element));
    }

    return nodeEntityList.map((e) => Node(id: e.meta.id, properties: e.row.properties)).toList();
  }

  static List<Relationship> convertResponseToRelationship(Response response){
    List<Relationship> relationshipList = [];

    final jsonResult = jsonDecode(response.body);
    final data = jsonResult["results"].first["data"] as List;

    for (final element in data) {
      relationshipList.add(Relationship.fromJson(element));
    }

    return relationshipList;
  }
}
