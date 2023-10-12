import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:test_project/data/global/global_variables.dart';
import 'package:test_project/domain/models/cocktail_model.dart';
import 'package:test_project/domain/models/error_model.dart';
import 'package:http/http.dart' as http;

class CockTailRepository {
  Future<Either<ErrorModel, List<CockTailModel>>> getCockTailListByName(String name) async {
    try {
      final apiUrl = GlobalVariables.getCockTailByNameAPI + name;
      final list = <CockTailModel>[];

      final request = await http.get(
        Uri.parse(apiUrl),
      );
      if (request.statusCode == 200) {
        final responseData = request.body;
        final Map<String, dynamic> jsonData = jsonDecode(responseData);
        if (jsonData['drinks'] != null) {
          final List<dynamic> cockTails = jsonData['drinks'];
          for (final dynamic cockTail in cockTails) {
            final id = int.tryParse(cockTail["idDrink"].toString()) ?? 0;
            final name = cockTail["strDrink"].toString();
            final tag = cockTail["strTags"].toString();
            final category = cockTail["strCategory"].toString();
            final image = cockTail["strDrinkThumb"].toString();
            list.add(
              CockTailModel(
                id: id,
                name: name,
                tag: tag,
                category: category,
                imageUrl: image,
              ),
            );
          }
        }
      }

      return Right(list);
    } on Exception catch (_) {}
    return const Left(ErrorModel(errorMessage: "Failed to get Cock Tail details"));
  }
}
