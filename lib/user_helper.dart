import 'package:estado/domain/entities/profesion.dart';

import '../domain/entities/user.dart';
import 'features/utils/fake_profession.dart';

List<Profession> getUserProfessions(User user) {
  return fakeProfession
      .where((p) => user.professionsId.contains(p.id))
      .toList();
}
