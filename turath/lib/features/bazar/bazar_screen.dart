
import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/bazar/item_details_screen.dart';
import 'package:turath/features/components/customappbar.dart';

class BazaarPage extends StatefulWidget {
  @override
  State<BazaarPage> createState() => _BazaarPageState();
}

class _BazaarPageState extends State<BazaarPage> {
  final List<Item> items = [
    Item(
      title: 'SPQR: A History of Ancient Rome',
      price: 100,
      image: Assets.imagesBook,
      description:
          'SPQR هو كتاب تاريخي شهير للمؤرخة البريطانية ماري بيرد. يشرح الكتاب التاريخ الطويل لروما القديمة من بداياتها حتى نهاية الجمهورية الرومانية. يُعتبر هذا الكتاب مرجعًا مهمًا لفهم القوة والسياسة والثقافة في روما القديمة.',
    ),
        Item(
      title: 'Monet The Gare Saint Lazare',
      price: 250,
      image: Assets.imagesMonetTheGareSaintLazare800Jpg,
      description:
          'لوحة The Gare Saint-Lazare هي واحدة من أشهر أعمال الرسام الفرنسي كلود مونيه. تُظهر اللوحة محطة القطار في باريس بأسلوب انطباعي مذهل، حيث تبرز الألوان والدخان في المشهد بشكل فني.',
    ),
    // Item(
    //   title: 'Guns, Germs, and Steel',
    //   price: 250,
    //   image: Assets.imagesBook1,
    //   description:
    //       'Guns, Germs, and Steel هو كتاب للمؤرخ وعالم الجغرافيا جاريد دايموند. يتناول الكتاب كيف ساهمت الأسلحة، الجراثيم، والفولاذ في تشكيل الحضارات والتاريخ العالمي. يشرح دايموند العوامل البيئية والجغرافية التي أثرت في نجاح أو فشل الشعوب عبر التاريخ.',
    // ),
    Item(
      title: 'Team of Rivals',
      price: 250,
      image: Assets.imagesBook2,
      description:
          'Team of Rivals هو كتاب تاريخي كتبه دوريس كيرنز غودوين. يركز على الرئيس الأمريكي أبراهام لينكولن وكيف تمكن من تكوين حكومة من خصومه السياسيين لتوحيد الأمة خلال الحرب الأهلية الأمريكية. الكتاب يُظهر عبقرية لينكولن في القيادة والتعامل مع المعارضة.',
    ),
    Item(
      title: '1776',
      price: 350,
      image: Assets.imagesBook3,
      description:
          '1776 هو كتاب للمؤرخ الأمريكي ديفيد ماكولوغ. يروي الكتاب قصة الحرب الثورية الأمريكية خلال عام 1776، مركزًا على الدور الذي لعبه جورج واشنطن في قيادة الجيش القاري في مواجهة الجيش البريطاني.',
    ),
    Item(
      title: 'Brass compass',
      price: 250,
      image: Assets.imagesAntique,
      description:
          'بوصلة نحاسية أنتيكة تُستخدم للتنقل. تعتبر قطعة رائعة لمحبي جمع الأدوات البحرية القديمة أو للمستكشفين التقليديين. تصميمها الأنيق ودقتها تجعلها قطعة فنية وعملية.',
    ),
    Item(
      title: 'Baltimore Tabletop Press Jammed',
      price: 3250,
      image: Assets.imagesAntique1,
      description:
          'آلة طباعة أنتيكة قديمة من مدينة بالتيمور. قطعة نادرة لهواة جمع الأدوات الميكانيكية القديمة، تتيح هذه الآلة الطباعة اليدوية على الورق والمطبوعات الفنية.',
    ),
    Item(
      title: 'Wooden camel',
      price: 250,
      image: Assets.imagesAntique2,
      description:
          'جمل خشبي منحوت يدوياً يمثل رمزاً ثقافياً في العديد من البلدان العربية. هذه القطعة الفنية تعتبر مثالية لتزيين المنازل أو المكاتب بأجواء تقليدية وجمالية.',
    ),
    Item(
      title: 'World Coins',
      price: 250,
      image: Assets.imagesAntique3,
      description:
          'مجموعة من العملات القديمة من مختلف أنحاء العالم. تحتوي المجموعة على عملات نادرة وأخرى من فترات تاريخية مختلفة، مما يجعلها مثالية لهواة جمع العملات.',
    ),
      Item(
      title: 'Guns, Germs, and Steel',
      price: 250,
      image: Assets.imagesBook1,
      description:
          'Guns, Germs, and Steel هو كتاب للمؤرخ وعالم الجغرافيا جاريد دايموند. يتناول الكتاب كيف ساهمت الأسلحة، الجراثيم، والفولاذ في تشكيل الحضارات والتاريخ العالمي. يشرح دايموند العوامل البيئية والجغرافية التي أثرت في نجاح أو فشل الشعوب عبر التاريخ.',
    ),
    // Item(
    //   title: 'Monet The Gare Saint Lazare',
    //   price: 250,
    //   image: Assets.imagesMonetTheGareSaintLazare800Jpg,
    //   description:
    //       'لوحة The Gare Saint-Lazare هي واحدة من أشهر أعمال الرسام الفرنسي كلود مونيه. تُظهر اللوحة محطة القطار في باريس بأسلوب انطباعي مذهل، حيث تبرز الألوان والدخان في المشهد بشكل فني.',
    // ),
    Item(
      title: 'Scuola di Atene',
      price: 250,
      image: Assets.imagesRenaissanceArt,
      description:
          'لوحة Scuola di Atene هي إحدى أشهر أعمال الرسام رافائيل، تمثل مجموعة من الفلاسفة والعلماء في العصور القديمة. تعتبر هذه اللوحة رمزاً للعصر النهضة وتجمع بين العلم والفن في مشهد واحد.',
    ),
    Item(
      title: 'Oath of the Horatii',
      price: 250,
      image: Assets.imagesTheOathOfHoratiiByJacquesLouisDavidLarge,
      description:
          'لوحة Oath of the Horatii هي عمل فني شهير للفنان الفرنسي جاك لويس ديفيد. تصور اللوحة مشهدًا درامياً من الأسطورة الرومانية حيث يؤدي ثلاثة جنود قسم الولاء للوطن.',
    ),
    Item(
      title: "L'Ultima Cena",
      price: 250,
      image: Assets.imagesTourImg312981148,
      description:
          'لوحة العشاء الأخير (L\'Ultima Cena) هي واحدة من أشهر الأعمال الفنية في العالم للفنان الإيطالي ليوناردو دا فينشي. تصور اللوحة السيد المسيح مع تلاميذه في اللحظات الأخيرة قبل اعتقاله.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappbar(name: "Bazaar"),
      backgroundColor: AppColors.bgColor,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          childAspectRatio: 2 / 2.5,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: items[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.cardBgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // نصف قطر الحواف الدائرية
      child: Image.asset(
        items[index].image,
        height: 120,
        width: 120,
        fit: BoxFit.cover, // لضمان تغطية الصورة بالكامل
      ),
    ),
    Flexible(
      child: Text(
        items[index].title,
        style: AppTextStyle.bodyTextW500S18
            .copyWith(color: AppColors.textColorPrimary),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ),
    Text(
      '${items[index].price} EGP',
      style: AppTextStyle.bodyText.copyWith(
          fontSize: 20, color: AppColors.textColorSecondary),
    ),
  ],
)

            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final int price;
  final String image;
  final String description;

  Item(
      {required this.title,
      required this.price,
      required this.image,
      required this.description});
}
