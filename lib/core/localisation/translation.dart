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
          "tr": "التركية",
          //"calenderLocal"
          "calenderLocal":'ar',
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
          "error": "بها خطأ",
          "haveAccountWarrning":
              "عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر",
          "passwordOremail": "البريد الإلكتروني أو كلمة المرور غير صحيح",
          "dontHaveAccountWarrning": "ليس لديك حساب على هذا البريد الإلكتروني",
          //Verification snackbar
          "Verification": "تَحَقّق",
          "VerificationMSG": "تحقق من بريدك الإلكتروني لتأكيد الحساب",
          //success page
          "Success": " نجاح العملية",
          "SuccessMSG":
              "تمت عملية تسجيل الحساب بنجاح يمكنك الان الانتقال الى صفحة تسجيل الدخول",
          ///////////////////////////////////////////////////////////////
          "Alert": "تنبيه",
          "blockinError":
              "لديك مواعيد في هذا اليوم، يجب إلغاء هذا الموعد قبل الحجب",
          "blockingSuccess": "تم الحجب بنجاح",
          "waiting": "يجب عليك الانتظار لبضع ثوانٍ لتحميل المواعيد",
          "haveAppoint": "لديك بالفعل موعد",
          "requiredTime1": "الخدمات التي اخترتها تتطلب وقتًا",
          "requiredTime2":
              "دقائق. يرجى اختيار وقت غير محجوز لحجز موعد لمدة ساعة.",
          "appointBlocked": "هذا الموعد محجوز، يرجى اختيار موعد آخر",
          "appointBooked": "هذا الموعد محجوز، يرجى اختيار موعد آخر",
          "AppointConfermied": "تم تأكيد الموعد",
          "notifRimening1": "عزيزي",
          "notifRimening2": "لديك موعد غدًا",
          "notifRimening3": "لا تنسَ حجز موعد للحلاقة",
          "chooseAtLeastOne": "يجب اختيار خدمة واحدة على الأقل",
          "emptyValue": "لا يمكن إدخال قيمة فارغة",
          "NoUserFound": "لم يتم العثور على مستخدم بهذا البريد الإلكتروني",
          "canselMsg1": "عزيز الزبون:",
          "canselMsg2": "نعتذر عن إلغاء موعدك المجدول في تاريخ",
          "canceled": "تم إلغاء موعدك",
          "PostDeleted": "تم حذف المنشور",
          "error1": "حدث خطأ ما",
          "error2": "كلمة المرور غير صحيحة",
          "error3": "لم يتم العثور على المستخدم",
          "emptyComment": "هذا التعليق فارغ",
          "Cant enter empty value": "لا يمكن إدخال قيمة فارغة",
          "Not Valid User Name": "اسم المستخدم غير صالح",
          "Not Valid Phone Number": "رقم الهاتف غير صالح",
          "Not Valid text": "النص غير صالح",
          "Not Valid number": "الرقم غير صالح",
          "Value Cant be less than": "القيمة لا يمكن أن تكون أقل من",
          "Value Cant be larger than": "القيمة لا يمكن أن تكون أكبر من",
          "Add Post": "إضافة منشور",
          "Camera": "الكاميرا",
          "Gallery": "المعرض",
          "Post": "نشر",
          "write a captions": "اكتب التسمية...",
          "Chooes Date": "اختر التاريخ",
          "Are you sure you need blocking this day":
              "هل أنت متأكد أنك تريد حظر هذا اليوم",
          "Confirme": "تأكيد",
          "Detail": "التفاصيل",
          "Time": "الوقت",
          "Date": "التاريخ",
          "Your Apointment": "موعدك",
          "Your Apointment has been confermide": "تأكيد موعدك",
          "Special services": "الخدمات الخاصة",
          "Next": "التالي",
          "Blocked for a whole day": "محظور لمدة يوم كامل",
          "Add": "إضافة",
          "Cancel": "إلغاء",
          "note":
              "ملاحظة: ستظهر هذه الخدمة التي ستضيفها للعميل باللغة التي تمت إضافتها بها. نقترح عليك إضافتها بهذه الطريقة مثال: حلاقة شعر(Haircut)",

          "Add time for this service": "إضافة وقت لهذه الخدمة",
          "write your service": "اكتب الخدمة الخاصة بك",
          "Write label for your service": "اكتب تسمية لخدمتك",
          "Are you sure you need to delete this service":
              "هل أنت متأكد أنك تريد حذف هذه الخدمة",
          "User Name": "اسم المستخدم",
          "minute": "دقيقة",
          "Blocking": "حجب",
          "Block": "حظر",
          "Available": "متاح",
          "Call him": "اتصل به",
          "Send mail": "إرسال بريد",
          "You need to tell the customer": "تحتاج إلى إبلاغ العميل",
          "Do you want to make this appointment available to another customer or do you want to block the appointment completely?":
              "هل تريد جعل هذا الموعد متاحًا لعميل آخر أم تريد حظر الموعد بشكل كامل؟",
          "Holiday": "عطلة",
          "Customers": "العملاء",
          "Special services list": "قائمة الخدمات الخاصة",
          "Special Appointment": "موعد خاص",
          "To book a": "لحجز",
          "call my": "اتصل بي",
          "Telephon NO": "رقم الهاتف",
          "discrabtion": """ما أقدمه
أنا ملتزم بتقديم تجربة تصفيف شعر شخصية لا مثيل لها. بفضل سنوات الخبرة وشغفي بحرفتي، أسعى جاهدًا لتقديم خدمة متميزة تناسب احتياجاتك.
من خلال تطبيق BarberBook، يمكنك بسهولة جدولة قص شعرك القادم معي في أي وقت يناسبك. من القصات الكلاسيكية إلى الأنماط الحديثة، أنا هنا لمساعدتك على تحقيق الإطلالة التي ترغب فيها.""",
          "Hair Salon": "صالون الشعر",
          "Are you sure you want to cancel your appointment?":
              "هل أنت متأكد أنك تريد إلغاء موعدك؟",
          "You don't have any appointments.": "ليس لديك أي مواعيد.",
          "this comment is empty": "هذا التعليق فارغ",
          "Write your comment": "اكتب تعليقك",
          "Add Comment": "إضافة تعليق",
          "Commentis": "التعليقات",
          "Email": "البريد الإلكتروني",
          "Change Language": "تغيير اللغة",
          "Log out": "تسجيل الخروج",
          "Enter new phone number": "أدخل رقم هاتف جديد",
          "Phone number": "رقم الهاتف",
          "Change phone number": "تغيير رقم الهاتف",
          "Enter new user name": "أدخل اسم مستخدم جديد",
          "Change User Name": "تغيير اسم المستخدم",
          "Full Name": "الاسم الكامل",
          "Select": "اختيار",
          "Normal services ": "الخدمات العادية",
          "view all comment": "عرض كل التعليقات",
          "likes": "إعجاب",
          "Special": "خاص",
          "Normal": "عادي",
          "is blocked": "تم حظره",
          "Activeti": "نشط",
          "State": "الحالة",
          "Are you need delete this post": "هل ترغب في حذف هذا المنشور؟",
          "Logout": "تسجيل الخروج",
          "Edit Profile": "تعديل الملف الشخصي",
          "Add Service": "إضافة خدمة",
          "Enter how long the service takes in minutes":
              "أدخل مدة الخدمة بالدقائق",
          "Enter service details": "أدخل تفاصيل الخدمة",
          "Select Costumer": "اختر العميل",
          "Duration": "المدة",
          "Booked Appointments": "المواعيد المحجوزة",
          "Add Appointment": "إضافة موعد",
          "About Us": "معلومات عنا",
          "Profile": "الملف الشخصي",
          "My Appointment": "موعدي",
          "Yaman Jawad": "يمان جواد",
        },
        "en": {
          //chooes lang page
          "chooes lang": "Chooes Language",
          "ar": "Arabic",
          "en": "English",
          "gr": "German",
          "tr": "Turkish",
          //"calenderLocal"
          "calenderLocal":"en_US",
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
          "error": "Has error",
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
          /////////////////////////////////////////////////////////////////
          ////////snackBar
          //blocking controller
          "Alert": "Alert",
          "blockinError":
              "you are have appointments in this day you need cancel this appointment before blocking",
          "blockingSuccess": "Blocking success",
          //calender controller
          "waiting":
              "You have to wait for a few seconds to load the appointments",
          "haveAppoint": "you are onready have a appointment ",
          "requiredTime1": "The services you have chosen require time",
          "requiredTime2":
              "minutes. Please choose a time that follows is empty so that we can book a 1-hour appointment for you.",
          "appointBlocked":
              "This appointment is blocked select another appointment",
          "appointBooked":
              "This appointment is booked select another appointment",
          //confire controller
          "AppointConfermied": "Appointment Confermied ",
          "notifRimening1": "Dear",
          "notifRimening2": "you are have appointment tomorrow",
          "notifRimening3": "dont forget booked appointment for haircut",
          //normal service controller
          "chooseAtLeastOne": "You must choose at least one service",
          //special service controller
          "emptyValue": "Cant entre empty value",
          //forget paaword controller
          "NoUserFound": "No user found with this email address",
          //booked appoint controller
          "canselMsg1": """Dear customer:
        we apologize for canceling your scheduled appointment on the date of
        """,
          "canselMsg2": "due to an emergency",
          //my appoint controller
          "canceled": "Your appointment is canceled",
          //post controller
          "PostDeleted": "Post deleted",
          //auth function
          "error1": "An error occurred",
          "error2": "Incorrect password",
          "error3": "User not found",
          //comment method
          "emptyComment": "this comment is empty",
          //valid functoin
          "Cant enter empty value": "Cant enter empty value",
          "Not Valid User Name": "Not Valid User Name",
          "Not Valid Phone Number": "Not Valid Phone Number ",
          "Not Valid text": "Not Valid text",
          "Not Valid number": "Not Valid number",
          "Value Cant be less than": "Value Cant be less than",
          "Value Cant be larger than": "Value Cant be larger than",
          //AddPostFirstView
          "Add Post": "Add Post",
          "Camera": "Camera",
          "Gallery": "Gallery",
          //AddPostSecoundView
          "Post": "Post",
          "write a captions": "write a captions.......",
          //BlockingCalender
          "Chooes Date": "Chooes Date",
          "Are you sure you need blocking this day":
              "Are you sure you need blocking this day",
          //ConfirmeView
          "Confirme": "Confirme",
          "Detail": "Detail",
          "Time": "Time",
          "Date": "Date",
          "Your Apointment": "Your Apointment",
          "Your Apointment has been confermide":
              "Your Apointment has been confermide",
          //"Special services"
          "Special services": "Special services",
          "Next": "Next",
          "Blocked for a whole day": "Blocked for a whole day",
          //OwnerNormalAddServiceView
          "Add": "Add",
          "Cancel": "Cancel",
          "note":
              "Note: This service that you will add will appear to the customer in the language in which it is added. We suggest that you add it in this way Example:  حلاقة شعر (haircut)",
          "Add time for this service": "Add time for this service",
          "write your service": "write your service",
          "Write label for your service": "Write label for your service",
          "Add Service": "Add Service",
          "Are you sure you need to delete this service":
              "Are you sure you need to delete this service",
          //BookedCard
          "User Name": "User Name",
          "minute": "minute",
          //BookedAppointmentsView
          "Blocking": "Blocking",
          "Block": "Block",
          "Available": "Available",
          "Call him": "Call him",
          "Send mail": "Send mail",
          "You need to tell the customer": "You need to tell the customer",
          "Do you want to make this appointment available to another customer or do you want to block the appointment completely?":
              "Do you want to make this appointment available to another customer or do you want to block the appointment completely?",
          "Holiday": "Holiday",
          //CostumerView
          "Customers": "Customers",
          //SpecialServiceView
          "Special services list": "Special services list",
          "Special Appointment": "Special Appointment",
          "To book a": "To book a",
          "call my": "call my",
          "Enter how long the service takes in minutes":
              "Enter how long the service takes in minutes",
          "Enter service details": "Enter service details",
          "Select Costumer": "Select Costumer",
          "Duration": "Duration",
          //AboutView
          "Telephon NO": "Telephon NO",
          "discrabtion": """What I Offer
         I'm dedicated to providing you with a personalized grooming experience like no other. With years of experience and a passion for my craft, I strive to deliver top-notch service tailored to your needs.         
         Using the BarberBook app, you can easily schedule your next haircut with me at your convenience. From classic cuts to modern styles, I'm here to help you achieve the look you desire .""",
          "Hair Salon": "Hair Salon",
          //MyAppointView
          "Are you sure you want to cancel your appointment?":
              "Are you sure you want to cancel your appointment?",
          "You don't have any appointments.":
              "You don't have any appointments.",
          //CommentPage
          "this comment is empty": "this comment is empty",
          "Write your comment": "Write your comment",
          "Add Comment": "Add Comment",
          "Commentis": "Commentis",
          //UserProfileView
          'Email': 'Email',
          "Change Language": "Change Language",
          "Log out": "Log out",
          "Enter new phone number": "Enter new phone number",
          "Phone number": "Phone number",
          "Change phone number": "Change phone number",
          "Enter new user name": "Enter new user name",
          "Change User Name": "Change User Name",
          'Full Name': 'Full Name',
          "Select": "Select",
          // "Normal services "
          "Normal services ": "Normal services ",
          //PostDesign
          "view all comment": "view all comment",
          "likes": "likes",
          //DoubleButton
          "Special": "Special",
          "Normal": "Normal",
          //AppointCard
          "is blocked": "is blocked",
          "Activeti": "Activeti",
          "State": "State",
          //OwnerProfileView
          "Are you need delete this post": "Are you need delete this post",
          "Logout": "Logout",
          "Edit Profile": "Edit Profile",
          ////
          "Booked Appointments": "Booked Appointments",
          "Add Appointment": "Add Appointment",
          "About Us": "About Us",
          "Profile": "Profile",
          "My Appointment": "My Appointment",
          "Yaman Jawad": "Yaman Jawad",
        },
        "gr": {
          //chooes lang page
          "chooes lang": "Sprache wählen",
          "ar": "Arabisch",
          "en": "Englisch",
          "gr": "Deutsch",
          "tr": "Türkisch",
          //"calenderLocal"
          "calenderLocal":'de_DE',
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
          "error": "Hat einen Fehler",
          "haveAccountWarrning":
              "Die E-Mail-Adresse wird bereits von einem anderen Konto verwendet",
          "dontHaveAccountWarrning": "Sie haben kein Konto für diese E-Mail",
          "passwordOremail": "falsche Email oder Passwort",
          //Verification snackbar
          "Verification": "Überprüfung",
          "VerificationMSG":
              "Überprüfen Sie Ihre E-Mails, um das Konto zu bestätigen",
          //success page
          "Success": "Prozesserfolg",
          "SuccessMSG":
              "Der Kontoregistrierungsprozess wurde erfolgreich abgeschlossen. Sie können nun zur Anmeldeseite gehen",
          "Alert": "Warnung",
          "blockinError":
              "Sie haben an diesem Tag Termine. Sie müssen diesen Termin vor dem Blockieren stornieren.",
          "blockingSuccess": "Blockieren erfolgreich",
          "waiting":
              "Sie müssen einige Sekunden warten, um die Termine zu laden",
          "haveAppoint": "Sie haben bereits einen Termin",
          "requiredTime1": "Die von Ihnen gewählten Dienste benötigen Zeit",
          "requiredTime2":
              "Minuten. Bitte wählen Sie eine Zeit, die frei ist, damit wir einen einstündigen Termin für Sie buchen können.",
          "appointBlocked":
              "Dieser Termin ist blockiert. Wählen Sie einen anderen Termin aus.",
          "appointBooked":
              "Dieser Termin ist gebucht. Wählen Sie einen anderen Termin aus.",
          "AppointConfermied": "Termin bestätigt",
          "notifRimening1": "Liebe/r",
          "notifRimening2": "Sie haben morgen einen Termin.",
          "notifRimening3":
              "Vergessen Sie nicht, Ihren Haarschnitttermin zu buchen.",
          "chooseAtLeastOne": "Sie müssen mindestens einen Service auswählen.",
          "emptyValue": "Kein leerer Wert möglich.",
          "NoUserFound": "Kein Benutzer mit dieser E-Mail-Adresse gefunden.",
          "canselMsg1": """Sehr geehrter Kunde:
Wir entschuldigen uns für die Stornierung Ihres vereinbarten Termins am Datum von""",
          "canselMsg2": "aufgrund eines Notfalls.",
          "canceled": "Ihr Termin wurde storniert.",
          "PostDeleted": "Beitrag gelöscht",
          "error1": "Ein Fehler ist aufgetreten.",
          "error2": "Falsches Passwort.",
          "error3": "Benutzer nicht gefunden.",
          "emptyComment": "Dieser Kommentar ist leer.",
          "Cant enter empty value": "Leerer Wert nicht möglich.",
          "Not Valid User Name": "Ungültiger Benutzername.",
          "Not Valid Phone Number": "Ungültige Telefonnummer.",
          "Not Valid text": "Ungültiger Text.",
          "Not Valid number": "Ungültige Nummer.",
          "Value Cant be less than": "Wert darf nicht kleiner sein als.",
          "Value Cant be larger than": "Wert darf nicht größer sein als.",
          "Add Post": "Beitrag hinzufügen",
          "Camera": "Kamera",
          "Gallery": "Galerie",
          "Post": "Beitrag",
          "write a captions": "Schreiben Sie eine Bildunterschrift...",
          "Chooes Date": "Datum wählen",
          "Are you sure you need blocking this day":
              "Sind Sie sicher, dass Sie diesen Tag blockieren möchten?",
          "Confirme": "Bestätigen",
          "Detail": "Detail",
          "Time": "Zeit",
          "Date": "Datum",
          "Your Apointment": "Ihr Termin",
          "Your Apointment has been confermide": "Ihr Termin wurde bestätigt.",
          "Special services": "Spezielle Dienste",
          "Next": "Weiter",
          "Blocked for a whole day": "Für einen ganzen Tag blockiert",
          "Add": "Hinzufügen",
          "Cancel": "Abbrechen",
          "note":
              "Hinweis: Dieser Service wird dem Kunden in der Sprache angezeigt, in der er hinzugefügt wurde. Wir empfehlen, ihn auf diese Weise hinzuzufügen: Beispiel: Haarschnitt",
          "Add time for this service": "Zeit für diesen Service hinzufügen",
          "write your service": "Schreiben Sie Ihren Service",
          "Write label for your service":
              "Beschriftung für Ihren Service schreiben",
          "Are you sure you need to delete this service":
              "Sind Sie sicher, dass Sie diesen Service löschen möchten?",
          "User Name": "Benutzername",
          "minute": "Minute",
          "Blocking": "Blockieren",
          "Block": "Blockieren",
          "Available": "Verfügbar",
          "Call him": "Anrufen",
          "Send mail": "E-Mail senden",
          "You need to tell the customer": "Sie müssen dem Kunden mitteilen",
          "Do you want to make this appointment available to another customer or do you want to block the appointment completely?":
              "Möchten Sie diesen Termin einem anderen Kunden zur Verfügung stellen oder den Termin vollständig blockieren?",
          "Holiday": "Feiertag",
          "Customers": "Kunden",
          "Special services list": "Liste spezieller Dienste",
          "Special Appointment": "Spezieller Termin",
          "To book a": "Um einen Termin zu buchen",
          "call my": "Rufen Sie mich an",
          "Duration": "Dauer",
          "Telephon NO": "Telefonnummer",
          "discrabtion": """Was ich anbiete
Ich bin darauf spezialisiert, Ihnen eine individuelle Pflegeerfahrung zu bieten wie keine andere. Mit jahrelanger Erfahrung und Leidenschaft für mein Handwerk bemühe ich mich, einen erstklassigen Service anzubieten, der auf Ihre Bedürfnisse zugeschnitten ist.
Mit der BarberBook-App können Sie ganz einfach Ihren nächsten Haarschnitt bei mir nach Ihren Wünschen planen. Von klassischen Schnitten bis zu modernen Stilen bin ich hier, um Ihnen zu helfen, den gewünschten Look zu erreichen.""",
          "Hair Salon": "Friseursalon",
          "Are you sure you want to cancel your appointment?":
              "Sind Sie sicher, dass Sie Ihren Termin absagen möchten?",
          "You don't have any appointments.": "Sie haben keine Termine.",
          "this comment is empty": "Dieser Kommentar ist leer.",
          "Write your comment": "Schreiben Sie Ihren Kommentar",
          "Add Comment": "Kommentar hinzufügen",
          "Commentis": "Kommentar",
          "Email": "E-Mail",
          "Change Language": "Sprache ändern",
          "Log out": "Abmelden",
          "Enter new phone number": "Neue Telefonnummer eingeben",
          "Phone number": "Telefonnummer",
          "Change phone number": "Telefonnummer ändern",
          "Enter new user name": "Neuen Benutzernamen eingeben",
          "Change User Name": "Benutzernamen ändern",
          "Full Name": "Vollständiger Name",
          "Select": "Auswählen",
          "Normal services ": "Normale Dienste",
          "view all comment": "Alle Kommentare anzeigen",
          "likes": "Gefällt mir",
          "Special": "Spezial",
          "Normal": "Normal",
          "is blocked": "ist blockiert",
          "Activeti": "Aktivität",
          "State": "Zustand",
          "Are you need delete this post":
              "Möchten Sie diesen Beitrag löschen?",
          "Logout": "Abmelden",
          "Edit Profile": "Profil bearbeiten",
          "Booked Appointments": "Gebuchte Termine",
          "Add Appointment": "Termin hinzufügen",
          "About Us": "Über uns",
          "Profile": "Profil",
          "My Appointment": "Mein Termin",
          "Yaman Jawad": "Yaman Jawad",
        },
        "tr": {
          //chooes lang page
          "chooes lang": "Dil Seç",
          "ar": "Arapça",
          "en": "İngilizce",
          "gr": "Almanca",
          "tr": "Türkiş",
          //"calenderLocal"
          "calenderLocal":'tr',
//on boarding
          "1pt": "Jawad berber",
          "1pc":
              "Berber Uygulamamıza Hoş Geldiniz! Kolay randevu planlama, kişiselleştirilmiş hizmetler ve becerikli berberlerin parmaklarınızın ucunda olduğu en üstün konforu yaşayın.",
          "2pt": "Şık saç kesimleri ve bakım hizmetleri",
          "2pc":
              "Dikişsiz bir bakım yolculuğuna hazırlanın! Sadece sizin için özel olarak tasarlanmış şık saç kesimleri ve bakım hizmetlerinin dünyasını keşfedin ve üstün bir deneyimin keyfini çıkarın.",
          "3pt": "Randevuları kolayca rezerve edin",
          "3pc":
              "Yenilikçi uygulamamızla berberlik alanının geleceğine adım atın! Randevuları kolayca rezerve edin, trend olan stilleri keşfedin ve özel promosyonlardan yararlanın. Mükemmel saç kesiminiz sadece birkaç dokunuş uzakta.",
          "btnText1": "İleri",
          "btnText2": "Git",
//login page
          "LoginTitle": "Giriş Yap",
          "Login1Text": "Hoş geldiniz",
          "Login2Text": "E-posta adresiniz ve şifrenizle oturum açın",
          "EmailLabel": "E-posta",
          "EmailHint": "E-posta adresinizi girin",
          "PasswordLabel": "Şifre",
          "PasswordHint": "Şifrenizi girin",
          "forget": "Şifrenizi mi unuttunuz?",
          "btnText": "Giriş Yap",
          "bottomText": "Hesabınız yok mu? ",
          "signBtnText": "Kaydol",
//reset Password
          "RPtitle": 'Şifreyi Sıfırla',
          "RPtext": "Şifrenizi sıfırlamak için lütfen e-posta adresinizi girin",
          "RPbtn": "Şifreyi Sıfırla",
          "SBtitle": "Doğrulama",
          "SBtext":
              "Bir mesaj e-posta adresinize gönderilecek. Şifrenizi değiştirmek için e-postanızı kontrol edin",
//exite alert
          "EAtitle": "Uyarı",
          "EAtext": "Bu uygulamadan çıkmak istiyor musunuz?",
          "BTNok": "Tamam",
          "BTNcancel": "İptal",
//sign up page
          "SignTitle": 'Kaydol',
          "SignText":
              "Bu bilgiler randevularınızı yönetmek için faydalı olacaktır",
          "userNameLabel": "Kullanıcı Adı",
          "userNameHint": "Kullanıcı adınızı girin",
          "phoneLabel": "Telefon Numarası",
          "phoneHint": "Telefon numaranızı girin",
          "signBottomText": "Giriş yapın",
//warrning
          "Warning": "Uyarı",
          "error": "Hata",
          "haveAccountWarrning":
              "E-posta adresi zaten başka bir hesap tarafından kullanılıyor",
          "passwordOremail": "Yanlış e-posta veya şifre",
          "dontHaveAccountWarrning": "Bu e-postada hesap yok",
//Verification snackbar
          "Verification": "Doğrulama",
          "VerificationMSG": "Hesabı doğrulamak için e-postanızı kontrol edin",
//success page
          "Success": "İşlem başarılı",
          "SuccessMSG":
              "Hesap kayıt işlemi başarıyla tamamlandı. Şimdi giriş sayfasına gidebilirsiniz",
/////////////////////////////////////////////////////////////
////////snackBar
//blocking controller
          "Alert": "Uyarı",
          "blockinError":
              "Bu günde randevularınız var, engellemeden önce bu randevuları iptal etmelisiniz.",
          "blockingSuccess": "Engelleme başarılı",
//calender controller
          "waiting": "Randevuları yüklemek için birkaç saniye beklemelisiniz",
          "haveAppoint": "Zaten bir randevunuz var",
          "requiredTime1": "Seçtiğiniz hizmetler zaman gerektirir",
          "requiredTime2":
              "dakika. Size bir saatlik bir randevu ayarlayabilmemiz için lütfen boş bir zaman seçin.",
          "appointBlocked": "Bu randevu engellendi, başka bir randevu seçin",
          "appointBooked": "Bu randevu zaten alındı, başka bir randevu seçin",
//confire controller
          "AppointConfermied": "Randevu Onaylandı",
          "notifRimening1": "Sayın",
          "notifRimening2": "Yarın bir randevunuz var",
          "notifRimening3": "Unutmayın, randevu almayı unutmayın.",
//normal service controller
          "chooseAtLeastOne": "En az bir hizmet seçmelisiniz",
//special service controller
          "emptyValue": "Boş değer girilemez",
//forget paaword controller
          "NoUserFound": "Bu e-posta adresiyle ilişkili kullanıcı bulunamadı",
//booked appoint controller
          "canselMsg1": """Sayın müşteri:
Tarihte planlanmış randevunuzu iptal ettiğimiz için özür dileriz""",
          "canselMsg2": "acil bir durumdan dolayı",
//my appoint controller
          "canceled": "Randevunuz iptal edildi",
//post controller
          "PostDeleted": "Gönderi silindi",
//auth function
          "error1": "Bir hata oluştu",
          "error2": "Yanlış şifre",
          "error3": "Kullanıcı bulunamadı",
//comment method
          "emptyComment": "Bu yorum boş",
//valid functoin
          "Cant enter empty value": "Boş değer girilemez",
          "Not Valid User Name": "Geçersiz kullanıcı adı",
          "Not Valid Phone Number": "Geçersiz telefon numarası",
//Not Valid text
          "Not Valid text": "Geçersiz metin",
          "Not Valid number": "Geçersiz sayı",
          "Value Cant be less than": "Değer daha az olamaz",
          "Value Cant be larger than": "Değer daha büyük olamaz",
//AddPostFirstView
          "Add Post": "Gönderi Ekle",
          "Camera": "Kamera",
          "Gallery": "Galeri",
//AddPostSecoundView
          "Post": "Gönder",
          "write a captions": "bir başlık yazın.......",
//BlockingCalender
          "Chooes Date": "Tarih Seç",
          "Are you sure you need blocking this day":
              "Bu günü engellemek istediğinizden emin misiniz",
//ConfirmeView
          "Confirme": "Onayla",
          "Detail": "Detay",
          "Time": "Zaman",
          "Date": "Tarih",
          "Your Apointment": "Randevunuz",
          "Your Apointment has been confermide": "Randevunuz onaylandı",
//"Special services"
          "Special services": "Özel hizmetler",
          "Next": "İleri",
          "Blocked for a whole day": "Tüm gün engellendi",
//OwnerNormalAddServiceView
          "Add": "Ekle",
          "Cancel": "İptal",
          "note":
              "Not: Ekleyeceğiniz bu hizmet müşteriye eklenen dilde görünecektir. Önerilen şekilde eklemenizi öneririz: Örnek: حلاقة شعر (saç kesimi)",
          "Add time for this service": "Bu hizmet için zaman ekleyin",
          "write your service": "hizmetinizi yazın",
          "Write label for your service": "Hizmetiniz için etiket yazın",
          "Add Service": "Hizmet Ekle",
          "Are you sure you need to delete this service":
              "Bu hizmeti silmek istediğinizden emin misiniz",
//BookedCard
          "User Name": "Kullanıcı Adı",
          "minute": "dakika",
//BookedAppointmentsView
          "Blocking": "Engelleme",
          "Block": "Engelle",
          "Available": "Uygun",
          "Call him": "Arayın",
          "Send mail": "E-posta gönder",
          "You need to tell the customer": "Müşteriye söylemeniz gerekiyor",
          "Do you want to make this appointment available to another customer or do you want to block the appointment completely?":
              "Bu randevuyu başka bir müşteriye uygun hale getirmek mi yoksa randevuyu tamamen engellemek mi istiyorsunuz?",
          "Holiday": "Tatil",
//CostumerView
          "Customers": "Müşteriler",
//SpecialServiceView
          "Special services list": "Özel hizmetler listesi",
          "Special Appointment": "Özel Randevu",
          "To book a": "Bir tane ayırtmak için",
          "call my": "beni ara",
          "Enter how long the service takes in minutes":
              "Hizmetin kaç dakika sürdüğünü girin",
          "Enter service details": "Hizmet detaylarını girin",
          "Select Costumer": "Müşteri seç",
          "Duration": "Süre",
//AboutView
          "Telephon NO": "Telefon NO",
          "discrabtion": """Neler Sunuyorum
    Size benzersiz bir tıraş deneyimi sunmaktan gurur duyuyorum. Yılların tecrübesi ve zanaatkarlık tutkusuyla, ihtiyaçlarınıza özel üst düzey hizmet sunmaya çalışıyorum.
    BarberBook uygulamasını kullanarak bir sonraki saç kesiminizi kolayca planlayabilirsiniz. Klasik kesimlerden modern stillere kadar, istediğiniz görünüme ulaşmanıza yardımcı olmak için buradayım.""",
          "Hair Salon": "Kuaför Salonu",
//MyAppointView
          "Are you sure you want to cancel your appointment?":
              "Randevunuzu iptal etmek istediğinizden emin misiniz?",
          "You don't have any appointments.": "Hiçbir randevunuz yok.",
//CommentPage
          "this comment is empty": "bu yorum boş",
          "Write your comment": "Yorumunuzu yazın",
          "Add Comment": "Yorum Ekle",
          "Commentis": "Yorum",
//UserProfileView
          'Email': 'E-posta',
          "Change Language": "Dili Değiştir",
          "Log out": "Çıkış Yap",
          "Enter new phone number": "Yeni telefon numarasını girin",
          "Phone number": "Telefon numarası",
          "Change phone number": "Telefon numarasını değiştir",
          "Enter new user name": "Yeni kullanıcı adını girin",
          "Change User Name": "Kullanıcı Adını Değiştir",
          'Full Name': 'Tam Adı',
          "Select": "Seç",
// "Normal services "
          "Normal services ": "Normal hizmetler",
//PostDesign
          "view all comment": "tüm yorumları görüntüle",
          "likes": "beğeniler",
//DoubleButton
          "Special": "Özel",
          "Normal": "Normal",
//AppointCard
          "is blocked": "engellendi",
          "Activeti": "Aktivite",
          "State": "Durum",
//OwnerProfileView
          "Are you need delete this post":
              "Bu gönderiyi silmek istiyor musunuz?",
          "Logout": "Çıkış",
          "Edit Profile": "Profili Düzenle",
////
          "Booked Appointments": "Rezervasyon Yapılan Randevular",
          "Add Appointment": "Randevu Ekle",
          "About Us": "Hakkımızda",
          "Profile": "Profil",
          "My Appointment": "Randevularım",
          "Yaman Jawad": "Yaman Jawad",
        }
      };
}
