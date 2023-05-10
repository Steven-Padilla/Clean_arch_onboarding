class OnBoardContent {
  String image;
  String text;
  String descp;
  OnBoardContent(
      {required this.image, required this.text, required this.descp});
}

List<OnBoardContent> contents = [
  OnBoardContent(
      image: "assets/images/B1.png",
      text: "ESPARCIMIENTO",
      descp: "Brindamos todos los servicios para consentir a tu mascota."),
  OnBoardContent(
      image: "assets/images/B2.png",
      text: "ADOPCION",
      descp:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat."),
  OnBoardContent(
      image: "assets/images/B3.png",
      text: "Hospitalidad",
      descp:
          "Nulla faucibus tellus ut odio scelerisque, vitar lectus feugiat."),
  OnBoardContent(
      image: "assets/images/B4.png",
      text: "VETERINARIA",
      descp:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat."),
  OnBoardContent(
      image: "assets/images/B5.png",
      text: "TIENDA",
      descp:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat.")
];
