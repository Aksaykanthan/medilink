import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_01/components/home_controller.dart';
import 'package:project_01/components/round_cont.dart';
import 'package:project_01/components/round_img.dart';

class imgSlider extends StatelessWidget {
  const imgSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds:3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
            ),
          items: [
          RoundImg("https://s2.dmcdn.net/v/SkSN51W6T_fWoxS8f/x1080"),
          RoundImg(
              "https://tvseriesfinale.com/wp-content/uploads/2022/10/gooddoctor18-scaled.jpg"),
          RoundImg(
              "https://bloximages.chicago2.vip.townnews.com/sfexaminer.com/content/tncms/assets/v3/editorial/7/02/702a76f4-196d-58bf-8aad-eed68e7304de/628e37e1c6681.image.jpg?resize=1200%2C800")
        ]),
        Obx(
          () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  RoundCont(
                    width: 20,
                    height: 5,
                    bgColor: controller.carouselCurrentIndex.value == i? Colors.green : Colors.black,
                    margin: const EdgeInsets.only(right: 8),
                  ),
              ],
            ),
        )
      ],
    );
  }
}
