import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //chooes lang page
          "chooes lang": "أختر لغة",
          "ar": "العربية",
          "en": "الانكليزي",
          "gr": "ألمانية",
          //on boarding
          "1pt": "جواد للحلاقة",
          "1pc":
              "مرحبًا بك في تطبيق الحلاقة الخاص بنا! استمتع بتجربة الراحة المطلقة في الحلاقة من خلال جدولة المواعيد السهلة والخدمات الشخصية والحلاقون المهرة في متناول يدك.",
          "2pt": "خدمات قص الشعر والعناية الأنيقة",
          "2pc":
              "استعد لرحلة عناية سلسة! اكتشف عالمًا من قصات الشعر الأنيقة وخدمات العناية المصممة خصيصًا لك، واستمتع بتجربة رفيعة المستوى.",
          "3pt": "حجز المواعيد دون عناء",
          "3pc":
              "ادخل إلى مستقبل الحلاقة من خلال تطبيقنا المبتكر! احجز المواعيد بسهولة، واستكشف الأنماط الرائجة، واحصل على عروض ترويجية حصرية. قصة شعرك المثالية على بعد بضع نقرات فقط.",
          "btnText1": "التالي",
          "btnText2": " انطلق",
          //login page
          "LoginTitle": "تسجيل الدخول",
          "Login1Text": "مرحباً",
          "Login2Text":
              "قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور",
          "EmailLabel": "بريد إلكتروني",
          "EmailHint": "أدخل بريدك الإلكتروني",
          "PasswordLabel": "كلمة المرور",
          "PasswordHint": "ادخل كلمة المرور",
          "forget": "نسيت كلمة المرور",
          "btnText": "تسجيل الدخول",
          "bottomText": "ليس لديك أي حساب؟",
          "signBtnText": "اشتراك",
          //reset Password
          "RPtitle": 'إعادة تعيين كلمة المرور',
          "RPtext":
              "الرجاء إدخال عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك ",
          "RPbtn": "إعادة تعيين كلمة المرور",
          "SBtitle": "تَحَقّق",
          "SBtext":
              "سيتم إرسال رسالة إلى البريد الإلكتروني الخاص بك. يرجى التحقق من بريدك الإلكتروني لتغيير كلمة المرور الخاصة بك",
          //exite alert
          "EAtitle": "تحذير",
          "EAtext": "هل تريد الخروج من هذا التطبيق",
          "BTNok": "نعم",
          "BTNcancel": "إلغاء",
          //sign up page
          "SignTitle": 'اشتراك',
          "SignText": "ستكون هذه المعلومات مفيدة لإدارة مواعيدك",
          "userNameLabel": "اسم المستخدم",
          "userNameHint": "أدخل اسم المستخدم الخاص بك",
          "phoneLabel": "رقم هاتفك",
          "phoneHint": "أدخل رقم هاتفك",
          "signBottomText": "اذهب لتسجيل الدخول",
          //warrning
          "Warning": "تحذير",
          "error":"بها خطأ",
          "haveAccountWarrning":"عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر",
          "passwordOremail": "البريد الإلكتروني أو كلمة المرور غير صحيح",
          "dontHaveAccountWarrning": "ليس لديك حساب على هذا البريد الإلكتروني",
          //Verification snackbar
          "Verification": "تَحَقّق",
          "VerificationMSG": "تحقق من بريدك الإلكتروني لتأكيد الحساب",
          //success page
          "Success": " نجاح العملية",
          "SuccessMSG":
              "تمت عملية تسجيل الحساب بنجاح يمكنك الان الانتقال الى صفحة تسجيل الدخول",
        },
        "en": {
          //chooes lang page
          "chooes lang": "Chooes Language",
          "ar": "Arabic",
          "en": "English",
          "gr": "German",
          //on boarding
          "1pt": "Jawad barber",
          "1pc":
              "Welcome to our Barber App! Experience the ultimate convenience in grooming with easy appointment scheduling, personalized services, and skilled barbers at your fingertips.",
          "2pt": "stylish haircuts and grooming services ",
          "2pc":
              "Get ready for a seamless grooming journey! Discover a world of stylish haircuts and grooming services tailored just for you , and enjoy a top-notch experience.",
          "3pt": "Effortlessly book appointments",
          "3pc":
              "Step into the future of barbering with our innovative app! Effortlessly book appointments, explore trending styles, and receive exclusive promotions. Your perfect haircut is just a few taps away.",
          "btnText1": "Next",
          "btnText2": "Go",
          //login page
          "LoginTitle": "Login",
          "Login1Text": "Welcome",
          "Login2Text": "Sign in with your email and password",
          "EmailLabel": "Email",
          "EmailHint": "Enter your email",
          "PasswordLabel": "Password",
          "PasswordHint": "Enter your Password",
          "forget": "Forget password",
          "btnText": "Login",
          "bottomText": "Dont have any account? ",
          "signBtnText": "Sign up",
          //reset Password
          "RPtitle": 'Reset Passowrd',
          "RPtext": "Please Enter your email Address to reset your password ",
          "RPbtn": "Reset Passowrd",
          "SBtitle": "Verification",
          "SBtext":
              "A message will be sent to your email. Please check your email for change your password",
          //exite alert
          "EAtitle": "Warning",
          "EAtext": "Do you want to exit this application?",
          "BTNok": "Ok",
          "BTNcancel": "Cancel",
          //sign up page
          "SignTitle": 'Sign Up',
          "SignText":
              "This information will be useful for managing your appointments",
          "userNameLabel": "User Name",
          "userNameHint": "Enter your User Name",
          "phoneLabel": "Phone Number",
          "phoneHint": "Enter your Phone Number",
          "signBottomText": "Go to login",
          //warrning
          "Warning": "Warning",
          "error":"Has error",
          "haveAccountWarrning":
              "The email address is already in use by another account",
          "passwordOremail": "Incorrect email or password",
          "dontHaveAccountWarrning": "Don't have account on this email",
          //Verification snackbar
          "Verification": "Verification",
          "VerificationMSG": "Check your email to confirm the account",
          //success page
          "Success": "Process success",
          "SuccessMSG":
              "The account registration process has been completed successfully. You can now go to the login page",
        },
        "gr": {
          //chooes lang page
          "chooes lang": "Sprache wählen",
          "ar": "Arabisch",
          "en": "Englisch",
          "gr": "Deutsch",
          //on boarding
          "1pt": "Jawad-Friseur",
          "1pc":
              "Willkommen bei unserer Friseur-App! Erleben Sie den ultimativen Komfort bei der Körperpflege mit einfacher Terminvereinbarung, personalisierten Dienstleistungen und kompetenten Friseuren auf Knopfdruck.",
          "2pt": "stilvolle Haarschnitte und Pflegedienste",
          "2pc":
              "Machen Sie sich bereit für eine reibungslose Pflegereise! Entdecken Sie eine Welt stilvoller Haarschnitte und Pflegedienste, die genau auf Sie zugeschnitten sind, und genießen Sie ein erstklassiges Erlebnis.",
          "3pt": "Buchen Sie mühelos Termine",
          "3pc":
              "Betreten Sie die Zukunft des Friseursalons mit unserer innovativen App! Buchen Sie mühelos Termine, entdecken Sie trendige Styles und erhalten Sie exklusive Sonderangebote. Ihr perfekter Haarschnitt ist nur ein paar Fingertipps entfernt.",
          "btnText1": "nächste",
          "btnText2": "Gehen",
          //login page
          "LoginTitle": "Anmeldung",
          "Login1Text": "Willkommen",
          "Login2Text":
              "Melden Sie sich mit Ihrer E-Mail-Adresse und Ihrem Passwort an",
          "EmailLabel": "Email",
          "EmailHint": "Geben sie ihre E-Mail Adresse ein",
          "PasswordLabel": "Passwort",
          "PasswordHint": "Geben Sie Ihr Passwort ein",
          "forget": "Passwort vergessen",
          "btnText": "Anmeldung",
          "bottomText": "Sie haben noch kein Konto?",
          "signBtnText": "Melden Sie sich an",
          //reset Password
          "RPtitle": 'Passwort zurücksetzen',
          "RPtext":
              "Bitte geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen",
          "RPbtn": "Passwort zurücksetzen",
          "SBtitle": "Überprüfung",
          "SBtext":
              "Eine Nachricht wird an Ihre E-Mail-Adresse gesendet. Bitte überprüfen Sie Ihre E-Mails, um Ihr Passwort zu ändern",
          //exite alert
          "EAtitle": "Warnung",
          "EAtext": "Möchten Sie diese Anwendung beenden?",
          "BTNok": "Ok",
          "BTNcancel": "Stornieren",
          //sign up page
          "SignTitle": 'Melden Sie sich an',
          "SignText":
              "Diese Informationen werden Ihnen bei der Verwaltung Ihrer Termine nützlich sein",
          "userNameLabel": "Nutzername",
          "userNameHint": "Geben Sie Ihren Benutzernamen ein",
          "phoneLabel": "Telefonnummer",
          "phoneHint": "Gib deine Telefonnummer ein",
          "signBottomText": "Gehen Sie zum Anmelden",
          //warrning
          "Warning": "Warnung",
          "error":"Hat einen Fehler",
          "haveAccountWarrning":
              "Die E-Mail-Adresse wird bereits von einem anderen Konto verwendet",
          "dontHaveAccountWarrning": "Sie haben kein Konto für diese E-Mail",
          "passwordOremail":"falsche Email oder Passwort",
          //Verification snackbar
          "Verification": "Überprüfung",
          "VerificationMSG":
              "Überprüfen Sie Ihre E-Mails, um das Konto zu bestätigen",
          //success page
          "Success": "Prozesserfolg",
          "SuccessMSG":
              "Der Kontoregistrierungsprozess wurde erfolgreich abgeschlossen. Sie können nun zur Anmeldeseite gehen"
        },
      };
}
