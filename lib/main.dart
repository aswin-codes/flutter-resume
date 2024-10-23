import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(MaterialApp(
    home: ResumeViewer(),
    debugShowCheckedModeBanner: false,
  ));
}

class ResumeViewer extends StatelessWidget {
  Future<Uint8List> generateResume() async {
    final pdf = pw.Document();

    // Define colors for headings and subheadings
    const PdfColor headingColor = PdfColors.blue;
    const PdfColor subHeadingColor = PdfColors.lightBlue;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
          // Background color
          padding: const pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Aswin Raaj P S',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Text(
                'Email: aswinraaj.ps@gmail.com | Phone: +91 9566875400',
                style: pw.TextStyle(color: PdfColors.black),
              ),
              pw.Text(
                'Location: Chennai',
                style: pw.TextStyle(color: PdfColors.black),
              ),
              pw.SizedBox(height: 20),

              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Bullet(
                text: 'B.Tech - VIT Chennai (2022 - 2026)',
                bulletColor: subHeadingColor,
              ),
              pw.SizedBox(height: 10),

              pw.Text(
                'WORK EXPERIENCE',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Bullet(
                text: 'Flutter Development, Paynav (May 2024 - Present): '
                    'Adding new features to an existing fintech app.',
                bulletColor: subHeadingColor,
              ),
              pw.Bullet(
                text: 'Flutter Development, Cehpoint (May 2023 - Jul 2023): '
                    'Built a social media and e-commerce app.',
                bulletColor: subHeadingColor,
              ),
              pw.SizedBox(height: 10),

              pw.Text(
                'PROJECTS',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Bullet(
                text: 'ICRTAC-24 Conference Website (May 2024 - Jun 2024)\n'
                    'https://icrtac.vercel.app\n'
                    'Developed the official conference site using React JS, Tailwind CSS, and Scroll Reveal.',
                bulletColor: subHeadingColor,
              ),
              pw.Bullet(
                text: 'Laundry Management Software (Nov 2023)\n'
                    'https://wazhine.vercel.app\n'
                    'Built a platform to manage laundries with email notifications for completed orders.',
                bulletColor: subHeadingColor,
              ),
              pw.Bullet(
                text: 'ZenChat (Jun 2023 - Jul 2023)\n'
                    'https://github.com/aswin-codes/ZenChat\n'
                    'A full-stack chat app built with Flutter, Express, and PostgreSQL.',
                bulletColor: subHeadingColor,
              ),
              pw.Bullet(
                text: 'Wish Reminder App (Apr 2023)\n'
                    'https://github.com/aswin-codes/Wisher1\n'
                    'An app that sends reminders and notifications for wishing friends on social media.',
                bulletColor: subHeadingColor,
              ),
              pw.Bullet(
                text: 'Bisine (Jan 2024 - Present)\n'
                    'https://bisinevite.vercel.app/\n'
                    'Full-stack e-commerce app where users can create shops, manage orders, and payments.',
                bulletColor: subHeadingColor,
              ),
              pw.SizedBox(height: 10),

              pw.Text(
                'SKILLS',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Wrap(
                children: [
                  pw.Text('Flutter, ReactJS, React Native, Figma, GitHub, Git, JavaScript, '
                      'HTML, CSS, MySQL, Android, UI/UX Design, Node.js, Express.js, '
                      'Tailwind CSS, Next.js',
                    style: pw.TextStyle(color: PdfColors.black),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),

              pw.Text(
                'WORK SAMPLES',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: headingColor,
                ),
              ),
              pw.Bullet(
                text: 'GitHub: https://github.com/aswin-codes',
                bulletColor: subHeadingColor,
              ),
            ],
          ),
        ),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Resume')),
      body: FutureBuilder<Uint8List>(
        future: generateResume(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PdfPreview(
              build: (format) => snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
