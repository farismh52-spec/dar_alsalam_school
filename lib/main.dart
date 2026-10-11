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

/// عنصر القائمة (بديل آمن عن Records)
class MenuItem {
  final String title;
  final IconData icon;
  final String subtitle;

  const MenuItem(this.title, this.icon, this.subtitle);
}

class SchoolHome extends StatelessWidget {
  const SchoolHome({super.key});

  @override
  Widget build(BuildContext context) {
    const items = <MenuItem>[
      MenuItem('سجل الطلاب', Icons.people_alt, 'إضافة وبحث عن الطلاب'),
      MenuItem('الحضور والغياب', Icons.fact_check, 'تسجيل الغياب اليومي'),
      MenuItem('الدرجات والنتائج', Icons.school, 'إدارة درجات الطلبة'),
      MenuItem('الملاك التدريسي', Icons.badge, 'بيانات المدرسين'),
      MenuItem('الجداول الأسبوعية', Icons.calendar_month, 'توزيع الحصص'),
      MenuItem('التقارير والإحصائيات', Icons.bar_chart, 'تقارير المدرسة'),
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
          // ===== البطاقة العلوية =====
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

          // ===== قائمة الأقسام =====
          ...items.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFE2ECFA),
                  child: Icon(
                    item.icon,
                    color: const Color(0xFF123A70),
                  ),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.subtitle),
                trailing: const Icon(Icons.arrow_back_ios_new),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('سنجهز قسم ${item.title} في الخطوة التالية'),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ===== التوقيع =====
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