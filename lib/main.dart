import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OdevProjesi(),
    );
  }
}

class OdevProjesi extends StatefulWidget {
  @override
  _OdevProjesiState createState() => _OdevProjesiState();
}

class _OdevProjesiState extends State<OdevProjesi> {

  final _formAnahtari = GlobalKey<FormState>();

  // Kullanıcının yazdığı bilgileri tutar.
  String? email, sifre;

// Kullanıcı hobilerini seçsin diye.
  bool kitap = false;
  bool spor = false;
  bool muzik = false;

// Tek seçimlik veri tutar.
  String? cinsiyet;

// Açık / kapalı durumu tutar.
  bool bildirim = false;

// Slider’dan gelen sayıyı tutar.
  double yas = 18;

// Kullanıcının seçtiği şehri tutar.
  String? sehir;

// tüm bilgileri birleştirir, ekranda gösterir
  String sonuc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Flutter Widget Ödevi"),
      ),

      body: ListView(
        padding: EdgeInsets.all(15),

        children: [

          Form(
            key: _formAnahtari, 
            // Kullanıcıdan alınan bilgileri kontrol etmek ve yönetmek için kullanılır.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // İçindeki widget’ları alt alta dizer

              children: [

                TextFormField(
  // Klavyeyi email yazımına uygun hale getirir (@, . gibi karakterleri kolaylaştırır)
  keyboardType: TextInputType.emailAddress,

  // Input kutusunun tasarım kısmı
  decoration: InputDecoration(
    // Kutunun içinde görünen başlık
    labelText: "Email",

    // Kullanıcı yazmadan önce görünen açıklama
    hintText: "Email giriniz",

    // Input’un başına mail ikonu ekler
    prefixIcon: Icon(Icons.mail),
  ),

  // Kullanıcıdan gelen veriyi kontrol eder
  validator: (deger) {

    // Eğer alan boşsa hata döndürür
    if (deger!.isEmpty) {
      return "Email boş bırakılamaz";
    }

    // Eğer @ işareti yoksa email geçersizdir
    if (!deger.contains("@")) {
      return "Geçerli email giriniz";
    }

    // Hata yoksa null döner (her şey doğru)
    return null;
  },

  // Form kaydedildiğinde çalışır
  onSaved: (deger) {
    // Girilen emaili değişkene atar
    email = deger;
  },
),

                SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    hintText: "Şifre giriniz",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return "Şifre boş bırakılamaz";
                    }
                    if (deger.length < 6) {
                      return "Şifre en az 6 karakter olmalı";
                    }
                    return null;
                  },
                  onSaved: (deger) {
                    sifre = deger;
                  },
                ),

                SizedBox(height: 25),

                Text("Hobiler"),

                CheckboxListTile(
                  title: Text("Kitap Okumak"),
                  value: kitap,
                  onChanged: (value) {
                    setState(() {
                      kitap = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text("Spor Yapmak"),
                  value: spor,
                  onChanged: (value) {
                    setState(() {
                      spor = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text("Müzik Dinlemek"),
                  value: muzik,
                  onChanged: (value) {
                    setState(() {
                      muzik = value!;
                    });
                  },
                ),

                SizedBox(height: 20),

                Text("Cinsiyet"),

                RadioListTile(
                  title: Text("Kadın"),
                  value: "Kadın",
                  groupValue: cinsiyet,
                  onChanged: (value) {
                    setState(() {
                      cinsiyet = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("Erkek"),
                  value: "Erkek",
                  groupValue: cinsiyet,
                  onChanged: (value) {
                    setState(() {
                      cinsiyet = value.toString();
                    });
                  },
                ),

                SizedBox(height: 20),

                SwitchListTile(
                  title: Text("Bildirimleri Aç"),
                  value: bildirim,
                  onChanged: (value) {
                    setState(() {
                      bildirim = value;
                    });
                  },
                ),

                SizedBox(height: 20),

                Text("Yaş: ${yas.round()}"),

                Slider(
                  min: 0,
                  max: 100,
                  divisions: 100,
                  value: yas,
                  onChanged: (value) {
                    setState(() {
                      yas = value;
                    });
                  },
                ),

                SizedBox(height: 20),

                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Şehir Seçiniz"),
                  value: sehir,
                  items: [
                    DropdownMenuItem(value: "Samsun", child: Text("Samsun")),
                    DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
                    DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                    DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sehir = value;
                    });
                  },
                ),

                SizedBox(height: 30),

               ElevatedButton(

  // Butona basıldığında çalışır
  onPressed: () {

    // Formdaki tüm alanları kontrol eder (validator çalışır)
    if (_formAnahtari.currentState!.validate()) {

      // Eğer form doğruysa değerleri kaydeder (onSaved çalışır)
      _formAnahtari.currentState!.save();

      // Ekranı güncellemek için setState kullanılır
      setState(() {

        // Sonuç metni oluşturulur (artık \n yok, tek satır gibi yazdırır)
        sonuc =
        "Email: $email "
        "Şifre: $sifre "
        "Cinsiyet: $cinsiyet "
        "Bildirim: ${bildirim ? "Açık" : "Kapalı"} "
        "Yaş: ${yas.round()} "
        "Şehir: $sehir";
      });
    }
  },

  // Butonun üstünde görünen yazı
  child: Text("GÖNDER"),
),

                SizedBox(height: 20),

                Text(sonuc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}