class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image,
   required this.title,required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      image: "assets/images/sammy-delivery.png",
      title: 'Get food delivery to your doorstep asap',
      discription: 'we have young and professional delivery team that will bring your food as soon as'

  ),
  UnbordingContent(
      image: 'assets/images/sammy-delivery.png',
      title: 'Fast Delevery',
      discription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
  ),
  UnbordingContent(
      image: 'assets/images/sammy-delivery.png',
      title: 'Buy Any food from your favorite restaurant',
      discription: "simply dummy text of the printing and typesetting industry."
  ),
];