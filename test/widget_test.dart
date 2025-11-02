// ✅ Widget test for WanderMapApp
//
// This test ensures that the main parts of the WanderMap UI
// render correctly when the app starts.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wander_map/main.dart';

void main() {
  testWidgets('WanderMap renders main UI elements correctly', (
    WidgetTester tester,
  ) async {
    // 🔹 Bangun aplikasi dan tunggu semua frame selesai
    await tester.pumpWidget(const WanderMapApp());
    await tester.pumpAndSettle(); // memastikan semua widget muncul

    // 🔹 Pastikan AppBar berjudul "WanderMap" tampil
    expect(find.text('WanderMap'), findsOneWidget);

    // 🔹 Pastikan judul bagian utama tampil
    expect(find.text('Popular Destinations'), findsOneWidget);
    expect(find.text('Explore More'), findsOneWidget);

    // 🔹 Cek salah satu nama destinasi (contoh: Bali Island)
    expect(find.text('Bali Island'), findsOneWidget);

    // 🔹 Pastikan terdapat widget gambar (network image)
    expect(find.byType(Image), findsWidgets);

    // 🔹 Pastikan ListView untuk destinasi populer muncul
    expect(find.byType(ListView), findsWidgets);

    // 🔹 Tes tambahan: ada ikon lokasi di daftar destinasi
    expect(find.byIcon(Icons.location_on), findsWidgets);
  });
}
