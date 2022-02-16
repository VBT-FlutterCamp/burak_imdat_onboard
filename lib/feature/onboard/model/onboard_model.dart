class OnboardModel {
  final String title;
  final String description;
  final String image;

  OnboardModel({required this.title, required this.description, required this.image});
  static List<OnboardModel> dummyList = [
    OnboardModel(
      title: 'Symptoms Of Covid-19',
      description: 'COVID-19 affects different people in defferent ways. Most infected people will develop mild to moderate illness',
      image: 'assets/images/image-1.svg',
    ),
    OnboardModel(
      title: 'Covid-19 Information',
      description: 'Most people who fall sic with COVID-19 will experience mild to moderate symptoms',
      image: 'assets/images/image-2.svg',
    ),
    OnboardModel(
      title: 'Just Stay at Home',
      description: 'Stay at home to self quarantine ourself from covid-19, hopefully everything gonna be fine soon',
      image: 'assets/images/image-3.svg',
    )
  ];
}
