# KADINA ŞİDDETE HAYIR
**1.PROJENİN AMACI**

Bu proje Android ve Ios işletim sistemine sahip kullanıcılara yönelik olup, şiddete maruz kalan kadınların şiddet anında kendilerini savunabilmeleri ve yakınlarını bilgilendirebilmeleri amacıyla geliştirildi.

**2.PROJENİN TASARIMI**

Uygulamada ilk olarak giriş yapma ve kayıt olma ekranıyla açılmaktadır.Daha önce sisteme kayıtlı kişi bilgileriyle giriş yapabilir ve ana sayfaya yönlendirilir aynı şekilde yeni kayıt olup giriş yapan kullanıcılarda ana sayfa ile karşılaşacaklardır.

<img src="https://user-images.githubusercontent.com/74072821/123165366-d042bd00-d47c-11eb-9889-2bd703d8bfc6.jpg" height="400">

Ana sayfada 6 adet icon buton , 3 adet raised buton bulunmakta ve her birinin ayrı özellikleri vardır. Kullanıcılar ana sayfadaki yakınlar bölümünde yeni yakınlar ekleyerek arama,mesaj gönderme,konum gönderme icon butonlarını kullanabilecektir.Ayrıca sayfada ses, fener ve güvenlik icon butonları ile gerekli sayfalara giderek kullanılacaktır. Sayfanın en aşağısında bulunan sağdaki 2 raised butonlar ile bilgilendirici yazılar ve video sayfasına yönlendirileceklerdir.

<img src="https://user-images.githubusercontent.com/74072821/123166150-c2da0280-d47d-11eb-9bd5-b2b3c66fba39.jpg" height="400">


**3.PROJENİN ÇALIŞMA YAPISI**

**3.1 Kayıt-Giriş Ekranı**

Uygulama başlatıldıgında kullanıcı daha önce kayıt olmadıysa kayıt ekranından bilgilerini doldurarak firebase authentication yapısıyla sisteme kayıt olur ve giriş ekranına yönlendirilir. Aynı şekilde daha önceden sisteme kayıtlı kişi bilgileriyle de giriş yapabilir.

<img src="https://user-images.githubusercontent.com/74072821/123167612-7099e100-d47f-11eb-8dba-8a93379797fd.jpg" height="400">

**3.2 Yakınlar Ekranı**

Kullanıcıların uygulamanın arama, mesaj gönderme, konum gönderme gibi özelliklerinden yararlanabilmesi için ilk olarak yakınlar bölümüne kişi eklemeleri gerekmektedir

<img src="https://user-images.githubusercontent.com/74072821/123168617-e488b900-d480-11eb-99ac-6da506fc9fd6.jpg" height="400">

**3.3 Yakınları Arama Ekranı**

Kullanıcının yakınlara kaydettigi kişileri aramak istediğinde şekilde görüldüğü gibi arama butonuna bastığı anda arama işlemi hızlıca gerçekleştirilmektedir.

<img src="https://user-images.githubusercontent.com/74072821/123168988-65e04b80-d481-11eb-8067-8a0c91a1f862.jpg" height="400">

**3.4 Yakınlara Mesaj Gönderme Ekranı**

Kullanıcının acil bir durum anında mesaj yazmakla vakit kaybetmeden kayıtlı mesajı şekilde görüldügü gibi mesaj butonuna basarak yardım mesajını atabilmektedir.

<img src="https://user-images.githubusercontent.com/74072821/123169180-9cb66180-d481-11eb-85a7-3ed4563f6fa8.jpg" height="400">

**3.5 Yakınlara Konum Gönderme**

Kullanıcının kendini güvende hissetmedigi her bölgede yakınlarına anlık konumunu başka bir applikasyon kullanmadan tek tuşla mesaj olarak gönderebilmektedir.

<img src="https://user-images.githubusercontent.com/74072821/123169341-d8512b80-d481-11eb-960a-2ecb35f79071.jpg" height="400">

**3.6 112 Acil Çağrı Merkezi Arama Ekranı**

Kullanıcının en çok ihtiyaç duyabilecegi şeylerden bazılarıda polis, jandarma, ambulansdır. Ülkemizde bu numaraların hepsi 112 numarasında acil arama olarak birleştirilmiştir.Kullanıcı ihtiyaç duydugu her an butona basarak otomatik olarak 112’yi arayabilmektedir.
Not:112 numarasını proje testlerinde arayıp meşgul etmemek için backendde +90-112 diye tutulmaktadır.

<img src="https://user-images.githubusercontent.com/74072821/123169616-32ea8780-d482-11eb-9328-acd5d5dcf800.jpg" height="400">

**3.7 Fener Ekranı**

Kullanıcı karanlık alanlarda ihtiyaç duyduğunda slider buton ile feneri açabilir.Aynı zamanda S.O.S. acil yardım ışıgınıda kullanabilir. S.O.S. acil yardım ışığı saniyede bir yanıp sönmektedir.

<img src="https://user-images.githubusercontent.com/74072821/123169831-7513c900-d482-11eb-8fbd-a2d4bbcf085e.jpg" height="400">

**3.8 Önemli Bilgiler Ekranı**

Kullanıcı boş zamanlarında aklına takılan sorulara cevap bulabilecek veya kendini güvene almak için bilmesi gereken bilgileri okuyabilecektir.

<img src="https://user-images.githubusercontent.com/74072821/123170077-c1f79f80-d482-11eb-828b-10a0fd15771c.jpg" height="400">

**3.9 Kendini Koru Ekranı**

Kullanıcının kendini savunabilmesi, cesaretlenebilmesi ve koruyabilmesi için izleyebileceği videolara buradan ulaşabilir. Videolarda ses, hız ayarı ve ekran büyütme özellikleri bulunmaktadır.

<img src="https://user-images.githubusercontent.com/74072821/123170278-01be8700-d483-11eb-9f57-14e2345d1643.jpg" height="400">
















