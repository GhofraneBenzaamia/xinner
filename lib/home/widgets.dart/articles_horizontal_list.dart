import 'package:flutter/material.dart';

class ArticlesHorizontalList extends StatelessWidget {
  const ArticlesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          articleItem(
            context,
            picture: 'assests/images/article1.jpg',
            date: "May 1, 2024",
            text: "Digitalizing Radiology Appointments",
            content: "In recent years, radiology appointment booking has undergone a significant transformation with the advent of digital platforms. Gone are the days of lengthy phone calls and inconvenient scheduling. Now, patients can simply log onto a website or mobile app to book their appointments with ease. This digitalization not only offers convenience for patients but also streamlines administrative tasks for clinics. Automated systems help in managing appointments efficiently, reducing wait times, and improving overall patient satisfaction. With digital platforms, the future of radiology appointment booking looks promising, as advancements like telemedicine integration and predictive analytics continue to enhance the patient experience.",
          ),
          articleItem(
            context,
            picture: 'assests/images/article2.jfif',
            date: "May 2, 2024",
            text: "Radiology Imaging: A Primer",
            content: "Radiology imaging technologies play a crucial role in modern healthcare, enabling clinicians to visualize internal structures for diagnostic purposes. X-rays, MRI, CT scans, and ultrasounds are among the commonly used imaging modalities, each with its own unique principles and applications. X-rays, for example, utilize ionizing radiation to produce images of bones and tissues, while MRI uses magnetic fields and radio waves to create detailed images of soft tissues. Understanding these imaging technologies is essential for patients and healthcare professionals alike, as it helps in making informed decisions about diagnostic procedures and treatment plans.",
          ),
          articleItem(
            context,
            picture: 'assests/images/article3.jpg',
            date: "May 3, 2024",
            text: "Radiology Screening for Prevention",
            content: "Early detection is key to preventing and managing various health conditions, and radiology screening plays a vital role in this regard. From detecting breast cancer with mammograms to identifying cardiovascular disease risk factors with CT scans, radiology screening helps in identifying health issues at their earliest stages when treatment is most effective. Regular screenings, guided by recommended guidelines and protocols, can significantly improve health outcomes and reduce mortality rates. By prioritizing preventive care and early detection through radiology screening, individuals can take proactive steps towards maintaining their health and well-being.",
          ),
          articleItem(
            context,
            picture: 'assests/images/article4.jfif',
            date: "May 4, 2024",
            text: "Patient Comfort in Radiology",
            content: "Ensuring patient comfort is crucial during radiology procedures. Radiology facilities are increasingly focusing on measures such as patient-centered amenities, optimized imaging techniques, and compassionate care from healthcare staff to enhance the imaging experience. Prioritizing patient comfort can improve satisfaction, adherence to imaging protocols, and overall healthcare outcomes.",
          ),
        ],
      ),
    );
  }

  Widget articleItem(BuildContext context,
      {required String picture,
      required String text,
      required String date,
      required String content}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(
              title: text,
              content: content,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 280,
                height: 130,
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ArticlePage extends StatelessWidget {
  final String title;
  final String content;

  ArticlePage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              content,
              style: TextStyle(fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
