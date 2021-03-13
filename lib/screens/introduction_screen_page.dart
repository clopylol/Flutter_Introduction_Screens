import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors
          .green[600], //PageView'ın bittiği en sol ve en sağ kısımın rengi
      dotsDecorator: _dotsDecoratorPage, //Noktaların Tasarımı
      //Sayfalarımız
      pages: [
        PageViewModel(
          title: 'Lezzet Kapında !', //Başlık
          body:
              'Birbirinden farklı yemekler arasından dilediğini seç.', //Gövde Kısmı
          image: _showImageWidget('assets/images/img_food.png'), //Resim
          decoration: _decorationPage, //Page View Tasarımı
        ),
        PageViewModel(
          title: 'Dilediğin Gibi Öde !',
          body: 'İstersen online, istersen kapıda ödemeni yapabilirsin.',
          image: _showImageWidget('assets/images/img_cash.png'),
          decoration: _decorationPage,
        ),
        PageViewModel(
          title: 'Anında Kapında !',
          body: 'Siparişin en geç 30 dakikada kapında.',
          image: _showImageWidget('assets/images/img_cargo.png'),
          decoration: _decorationPage,
          footer: Text(
            '(Sipariş Yola Çıktıktan Sonra)',
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
      ],
      showSkipButton: true, //Sayfalarda Atla Buttonu gözüksün mü ?
      //Skip: Tüm PageViewları bakmadan direk istediğimiz yere bizi yönlendiriyor.
      skip: _bottomText("ATLA"),
      //Next: PageView'lar arasında geçiş yapmayı sağlıyor.
      next: Icon(
        Icons.arrow_right_alt_rounded,
        size: 35,
        color: Colors.white,
      ),
      //Done: Son PageView sayfasında gözüküyor, bizi istediğimiz yere yönlendirir.
      done: _bottomText("TAMAM"),
      //En Son Sayfaya Gelip Tamam'a tıklandığında
      onDone: () => _changePage(context, '/home'),
      //Herhangi bir sayfada Atla'ya tıklandığında.
      onSkip: () => _changePage(context, '/home'),
    );
  }

  //Resmin Sayfadaki Konumu
  Widget _showImageWidget(String imgPath) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(imgPath),
      ),
    );
  }

  //Skip ve Done Kısımlarının Text Tasarımları
  Widget _bottomText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 3, //Harfler arası boşluk
        fontSize: 15,
      ),
    );
  }

  //Page View Sayfa Tasarımı
  final _decorationPage = PageDecoration(
      pageColor: Colors.green[700],
      titleTextStyle: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
      bodyTextStyle: TextStyle(fontSize: 25, color: Colors.white),
      descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      imagePadding: EdgeInsets.zero);

  //Alt kısımdaki noktaların tasarımı
  final _dotsDecoratorPage = DotsDecorator(
    color: Colors.white60, //Noktaların Rengi
    size: Size(10.0, 10.0), //Noktaların Boyutu
    activeSize: Size(13.0, 13.0), //Geçerli Sayfanın Noktasının Boyutu
    activeColor: Colors.white, //Geçerli Sayfanın Noktasının Rengi
  );

  //İstediğimiz bir sayfaya gitmek için kullandık.
  void _changePage(BuildContext context, String path) =>
      Navigator.pushNamed(context, path);

  //Diğer sayfaya gittikten sonra geri buttonunun gözükmemesi için;
  //Navigator.pushReplacementNamed(context, path);
}
