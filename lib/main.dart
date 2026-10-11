
import 'package:flutter/material.dart';

void main() {
  runApp(const DarSalamApp());
}

class DarSalamApp extends StatelessWidget {
  const DarSalamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الإدارة المدرسية',
      locale: const Locale('ar'),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123A70),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F6FA),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SchoolHome(),
      ),
    );
  }
}

class SchoolHome extends StatelessWidget {
  const SchoolHome({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('سجل الطلاب', Icons.people_alt, 'إضافة وبحث عن الطلاب'),
      ('الحضور والغياب', Icons.fact_check, 'تسجيل الغياب اليومي'),
      ('الدرجات والنتائج', Icons.school, 'إدارة درجات الطلبة'),
      ('الملاك التدريسي', Icons.badge, 'بيانات المدرسين'),
      ('الجداول الأسبوعية', Icons.calendar_month, 'توزيع الحصص'),
      ('التقارير والإحصائيات', Icons.bar_chart, 'تقارير المدرسة'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF123A70),
        foregroundColor: Colors.white,
        title: const Text('الإدارة المدرسية'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF123A70),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'متوسطة دار السلام للبنين',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'نظام إدارة شؤون الطلبة والمدرسة',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'أقسام الإدارة',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE2ECFA),
                    child: Icon(
                      item.$2,
                      color: const Color(0xFF123A70),
                    ),
                  ),
                  title: Text(
                    item.$1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(item.$3),
                  trailing: const Icon(Icons.arrow_back_ios_new),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('سنجهز قسم ${item.$1} في الخطوة التالية'),
                      ),
                    );
                  },
                ),
              )),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'تصميم معاون المدرسة فارس محمد حسين',
              style: TextStyle(color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}