import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kagit_katlama/oyun_kagit_katlama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kagitKatlamaConfig.title.length, 33);
    expect(kagitKatlamaConfig.tagline.length, 33);
    for (final s in kagitKatlamaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kagitKatlamaConfig.gameId, kagitKatlamaId);
    expect(kagitKatlamaRules.gameId, kagitKatlamaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kagitKatlamaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kagitKatlamaId, optionalMechanics: kagitKatlamaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kagitKatlamaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
