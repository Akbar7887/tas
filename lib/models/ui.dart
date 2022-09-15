import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

enum Uz_ru { UZ, RU }

class Ui {
  static final String name = "TAS";
  static final String fullname = "ЧП \"TEXNIKA ADVANS SERVIS\"";
  static final String url =
      'https://admin.tascom.uz:8083/api/'; //'';'https://localhost:8083/api/'; //
  static final String urllogin = 'https://admin.tascom.uz:8083';

  // static final String url = 'http://localhost:8083/api/';
  // static final String urllogin = 'http://localhost:8083';
  static final String phone = "+998 78 147 00 80";
  static final String phone1 = "+998 99 802 74 74";
  static final String phone2 = "+998 94 688 00 99";

  static final String textstyle = 'Play'; //'Noto';
  static final String telegram = 't.me/tasuzcom';
  static final String inhstagram =
      'www.instagram.com/p/CfLO258orDI/?igshid=MDJmNzVkMjY=';
  static final String facebook = 'www.facebook.com/tasuzcom/';

  // ================ Lising ==================

  static final Map<dynamic, String> lising = {
    Uz_ru.UZ: "Kredit",
    Uz_ru.RU: "Кредит"
  };

  static final Map<dynamic, String> kalkulyat = {
    Uz_ru.UZ: "Kredit kalkulyatori:",
    Uz_ru.RU: "Кредитный калькулятор:"
  };
  static final Map<dynamic, String> summatexniki = {
    Uz_ru.UZ: "Texnika narxi",
    Uz_ru.RU: "Стоимость техники"
  };
  static final Map<dynamic, String> advonceproc = {
    Uz_ru.UZ: "Avans summasi:",
    Uz_ru.RU: "Сумма аванса:"
  };
  static final Map<dynamic, String> marga = {
    Uz_ru.UZ: "Marja:",
    Uz_ru.RU: "Маржа:"
  };
  static final Map<dynamic, String> srok = {
    Uz_ru.UZ: "Muddati:",
    Uz_ru.RU: "Срок:"
  };
  static final Map<dynamic, String> komissiya = {
    Uz_ru.UZ: "Komissiya:",
    Uz_ru.RU: "Комиссия:"
  };

  static final Map<dynamic, String> kreditsum = {
    Uz_ru.UZ: "Kredit summasi:",
    Uz_ru.RU: "Кредитная сумма:"
  };

  static final Map<dynamic, String> kredirtayausloviya = {
    Uz_ru.UZ: "Kredit shartlari:",
    Uz_ru.RU: "Кредитная условия:"
  };
  static final Map<dynamic, String> kredittable = {
    Uz_ru.UZ: "Kredit grafigi:",
    Uz_ru.RU: "Кредитный график:"
  };

  static final Map<dynamic, String> mes = {Uz_ru.UZ: "Oy", Uz_ru.RU: "Месяц"};
  static final Map<dynamic, String> osndolg = {
    Uz_ru.UZ: "Asosiy qarz \nyopilishi \n(sum)",
    Uz_ru.RU: "Погаш. \n осн. долг. \n (сум)"
  };
  static final Map<dynamic, String> procpog = {
    Uz_ru.UZ: "Oylik foiz \n (sum)",
    Uz_ru.RU: "% Погашения \n (сум)"
  };
  static final Map<dynamic, String> summaplateja = {
    Uz_ru.UZ: "Tulov miqdori \n (sum)",
    Uz_ru.RU: "Сумма платежа \n (сум)"
  };

  static final Map<dynamic, String> remainder = {
    Uz_ru.UZ: "Ostatok dolga \n (sum)",
    Uz_ru.RU: "Остаток долга \n (сум)"
  };
  static final Map<dynamic, String> model = {
    Uz_ru.UZ: "Model",
    Uz_ru.RU: "Модель"
  };

  //=============== Section ===================
  static final Map<dynamic, String> catalogs = {
    Uz_ru.UZ: "Kataloglar",
    Uz_ru.RU: "Каталоги"
  };

  //===============Adress =========================

  static final Map<dynamic, String> title = {
    Uz_ru.UZ: "Uzbekiston учун maxsus texnikalar",
    Uz_ru.RU: "Спецтехника для Узбекистана"
  };

  static final Map<dynamic, String> adress = {
    Uz_ru.UZ:
        "Manzil: Toshkent shaxar, Yunusobod tumani, A.Temur 95 uy («UzOman Tower»), 5 qavat, 504 offis",
    Uz_ru.RU:
        "Адрес: Ташкент, 100084, Юнусабадский район, ул. А.Тимура 95А, «UzOman Tower», 5 этаж, 504 оффис"
  };
  static final Map<dynamic, String> adressfix = {
    Uz_ru.UZ: "Манзилимиз",
    Uz_ru.RU: "Адреса"
  };

  //=========about_company=============================

  static final Map<dynamic, String> tab = {
    Uz_ru.UZ: "Kompanya haqida",
    Uz_ru.RU: "О Компании"
  };
  static final Map<dynamic, String> choose = {
    Uz_ru.UZ: "Tanlovingiz",
    Uz_ru.RU: "Ваше выбор!"
  };

  static final Map<dynamic, String> applyphone = {
    Uz_ru.UZ: "Qo'ng'iroq buyurtma berish",
    Uz_ru.RU: "Заказать звонок"
  };

  static final Map<dynamic, String> news = {
    Uz_ru.UZ: "Yangiliklar",
    Uz_ru.RU: "Новости"
  };

  static final Map<dynamic, String> sertifikat = {
    Uz_ru.UZ: "Sertifikatlar",
    Uz_ru.RU: "Сертификаты"
  };

  static final Map<dynamic, String> description = {
    Uz_ru.UZ:
        "TEXNIKA ADVANS SERVIS Kompaniyasi 2009-yilda tashkil etilgan va XXR dan maxsus texnikalar, uskunalar hamda ehtiyot qismlar yetkazib berish bo‘yicha eng ishonchli kompaniyalardan biri hisoblanadi.\nKompaniyamiz tomonidan yetkazib beriladigan maxsus texnika, uskunalar va ehtiyot qismlari eksport variantida ishlab chiqarilgan bo'lib, yuqori sifat standartlariga to'la javob beradi.\n● 20 000 dan ziyod texnika va jihozlarni yetkazib berilishi.\n● 12 yildan buyon bozorda.\n● 12 oy (1 yil yoki 2000 motosoat kafolat).\nBugungi kunda TEXNIKA ADVANS SERVIS kompaniyasi jahon standartlari darajasida qurilish, yo‘l, kon-qazish maxsus texnikalari shuningdek, beton-asfalt zavodlarining barcha turlarini ishlab chiqaruvchi XCMG, SHACMAN, SHANTUI kabi jahon brendlarini O‘zbekiston bozorida rasman taqdim etadi.",
    Uz_ru.RU:
        "Компания \"TEXNIKA ADVANS SERVIS\" была основана в 2009 году и является одной из надежных компаний по осуществлению поставок спецтехники, оборудования и запчастей из KHP\. \n Спецтехника, оборудование и запчасти, поставляемые нашей компанией, выполнены в экспортном варианте и соответствуют высоким стандартам качества. \n●  Более 20 000 поставок техники и оборудования. \n●  12 лет на рынке.\n● 12 месяцев  (гарантия 1 год или 2000 моточасов). \n На сегодняшний день компания TEXNIKA ADVANS SERVIS официально представляет на рынке Узбекистана такие мировые бренды как XCMG, SHACMAN, SHANTUI, которые производят весь спектр строительной, дорожной, карьерной спецтехники и заводов по производству бетона и асфальта на уровне мировых стандартов."
  };

  static final Map<dynamic, String> tema1 = {
    Uz_ru.UZ: "Dunyo brendlarini rasmiy vakili",
    Uz_ru.RU: "Официальный представитель мировых брендов"
  };

  static final Map<dynamic, String> descriptionservice = {
    Uz_ru.UZ:
        "● Dvigatellar turli tizimlarini samarali diagnostika qilish uchun diagnostika uskunalari hamda rasmiy dasturiy ta'minot.\n● Xizmat ko'rsatish markazi bazasida texnik mutaxassislarning doimiy bor bo'lishi va uskunani ekspluatatsiya qilsh jarayonida yuzaga keladigan texnik muammolarni bartaraf etish bo'yicha birgalikda ish olib borish.",
    Uz_ru.RU:
        "●  Диагностическое оборудование и официальное программное обеспечение для эффективной диагностики различных систем двигателей.\n●  Постоянное присутствие технических специалистов на базе сервисного центра  и совместная работа по устранению возникающих технических проблем во время эксплуатации техники."
  };
  static final Map<dynamic, String> tema2 = {
    Uz_ru.UZ:
        "Avtorizatsiyalashgan xizmat ko'rsatish markazining afzalliklari:",
    Uz_ru.RU: "Преимущества авторизованного сервисного центра:"
  };
  static final Map<dynamic, String> descriptionf = {
    Uz_ru.UZ:
        "Biz qurilish, yo‘l, karyerli maxsus texnikaning to‘liq ko‘lamini ishlab chiqaruvchi kompaniyalar va yuqori jahon standartlari darajasida beton va asfaltni ishlab chiqaruvchi zavodlar bilan hamkorlik qilamiz.",
    Uz_ru.RU:
        "Мы сотрудничаем с компаниями, которые производят весь спектр строительной, дорожной, карьерной спецтехники и заводов по производству бетона и асфальта на уровне высших мировых стандартов."
  };

  //======= first_page ========================
  static final Map<dynamic, String> f1 = {
    Uz_ru.UZ: "Bugun savdoda:",
    Uz_ru.RU: "Сегодня на продаже:"
  };
  static final Map<dynamic, String> excchange = {
    Uz_ru.UZ: "so'm",
    Uz_ru.RU: "сум"
  };

  static final Map<dynamic, String> cena = {
    Uz_ru.UZ: "boshlang'ich narxi:",
    Uz_ru.RU: "цены от:"
  };

  // ==========description_page =============
  static final Map<dynamic, String> d1 = {
    Uz_ru.UZ: "Tavsifi:",
    Uz_ru.RU: "Описание:"
  };

  static final Map<dynamic, String> d2 = {
    Uz_ru.UZ: "Xarakteristikasi:",
    Uz_ru.RU: "Характеристика:"
  };
  static final Map<dynamic, String> d3 = {
    Uz_ru.UZ: "Buyurtma berish!",
    Uz_ru.RU: "Заказ звонка!"
  };

  //=========== Home =============

  static final Map<dynamic, String> h1 = {
    Uz_ru.UZ: "Ostatok",
    Uz_ru.RU: "Остаток"
  };

  static final Map<dynamic, String> h2 = {
    Uz_ru.UZ: "Buyurtma qilish",
    Uz_ru.RU: "Далее (Заказать)"
  };

  static final Map<dynamic, String> h3 = {
    Uz_ru.UZ: "Manzil",
    Uz_ru.RU: "Адрес"
  };

  //========= Customer form ==================

  static final Map<dynamic, String> c1 = {
    Uz_ru.UZ: "F.I.Sh.",
    Uz_ru.RU: "Ф.И.О."
  };

  static final Map<dynamic, String> c2 = {
    Uz_ru.UZ: "F.I.Sh. tuldirilmagan",
    Uz_ru.RU: "Не заполнено поле ФИО"
  };

  static final Map<dynamic, String> c3 = {
    Uz_ru.UZ: "Telefon raqamingiz",
    Uz_ru.RU: "Номер телефона"
  };

  static final Map<dynamic, String> c4 = {
    Uz_ru.UZ: "Telefon raqami tuldirilmagan",
    Uz_ru.RU: "Не заполнено поле телефона"
  };

  static final Map<dynamic, String> c5 = {
    Uz_ru.UZ: "E-mail",
    Uz_ru.RU: "Эл.почта"
  };

  static final Map<dynamic, String> c6 = {
    Uz_ru.UZ: "E-mail nomini tekshiring",
    Uz_ru.RU: "проверьте правильность почты!"
  };

  static final Map<dynamic, String> c7 = {
    Uz_ru.UZ:
        "Sizning murojatingiz qabul qilindi! Siz bilan yaqin orada menegerimiz bog'lanadi",
    Uz_ru.RU: "Ваше заявка принята Менеджеры свяжутся с Вами !"
  };

  static final Map<dynamic, String> c8 = {
    Uz_ru.UZ:
        "YUQ! setda muammo borligi sababli, Sizning murojatingiz qabul qilinmadi!",
    Uz_ru.RU: "Просим повторить заказ из за не поладки в сети!"
  };

  static final Map<dynamic, String> exit = {
    Uz_ru.UZ: "Chiqish",
    Uz_ru.RU: "Выход"
  };

  static callInstagram() async {
    String url = "https://${Ui.inhstagram}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callFacebook() async {
    String url = "https://${Ui.facebook}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callTelegram() async {
    String url = "https://${Ui.telegram}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callNumber(phone) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
  }
}
