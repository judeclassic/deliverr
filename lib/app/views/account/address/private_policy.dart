import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

class PrivatePolicyPage extends StatefulWidget {
  const PrivatePolicyPage({ Key? key }) : super(key: key);

  @override
  _PrivatePolicyPageState createState() => _PrivatePolicyPageState();
}

class _PrivatePolicyPageState extends State<PrivatePolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Pages(
                      initialIndex: 3,
                    )),
            (route) => false),
        text: 'Private Policy',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('This Privacy Policy describes how your personal information is collected, used, and shared when you visit or make a purchase from https://www.alakba.com (the “Site”).',
                style: TextStyle(
                ),
              ),
        
              SizedBox(height: 10,),
        
              Text(
                "Protecting your private information is our priority. This Statement of Privacy applies to https://www.alakba.com and governs data collection and usage. We have developed this policy in order for you to understand how we collect, use, communicate and make use of personal information. The following outlines our privacy policy."
              ),
        
              SizedBox(height: 10,),
        
              Text(
                "Similar to other commercial websites, our website utilizes a standard technology called 'cookies' (see our cookies policy page for more information) and server logs to collect information about how our site is used. Information gathered through cookies and server logs may include the date and time of visits, the pages viewed, time spent at our site, and the websites visited just before and just after our own, as well as your IP address."
              ),
        
              SizedBox(height: 10,),
        
              Text(
                "INTRODUCTION",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),
        
              Text(
                """
        This Policy sets out the conditions under which we may process any information that we collect from you, or that you provide to us. It covers information that could identify you (“personal information”) and information that could not. In the context of the law and this notice, “process” means collect, store, transfer, use or otherwise act on information.
        
        1.    We take seriously the protection of your privacy and confidentiality. We understand that all visitors to our website are entitled to know that their personal data will not be used for any purpose unintended by them, and will not accidentally fall into the hands of a third party.
        
        2.    eMakity Inc undertakes to preserve the confidentiality of all information you provide to us, and hope that you reciprocate.
        
        3.    The law requires us to tell you about your rights and our obligations to you in regards to the processing and control of your personal data.
        """
              ),
        
              Text(
                "COLLECTION OF YOUR PERSONAL INFORMATION",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),
        
              Text(
"""
eMakity Inc may collect personally identifiable information when you purchase any product on https://alakba.com which might be subject to delivery to your designated address provided. We collect information such as your: Name, Address, E-mail Address, and Phone Number. https://alakba.com may also collect anonymous demographic information, which is not unique to you.

eMakity Inc encourages you to review the privacy statements of websites you choose to link to from eMakity Inc so that you can understand how those websites collect, use and share your information. We are not responsible for the privacy statements or other content on websites outside of the eMakity Inc website
"""
              ),
        
              Text(
                "WHAT INFORMATION WE COLLECT AND WHY?",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),
        
              Text(
"""
We may collect information about you directly from you, as well as automatically through your use of our Site or Services. 

·         Information We Collect Directly from You: Certain areas and features of our Site and Services require product purchase. For the purpose of the purchase, you will provide your name, email address, delivery address, payment details, and IP address. This information may include identifiable data based upon biometric information including age, gender, geolocation, clothes style and size, accessories, body type, and time.

·         Information We Collect Automatically: We may automatically collect the following information about your use of our Site via some software analytics including the length of time you visit our Site and your movement through our Site. 

·         We may also collect the following information: device ID; location and language information. 


"""
              ),

              Text(
                "WE DO NOT SELL, RENT OR LEASE ITS CUSTOMER LISTS TO THIRD PARTIES.",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
"""
eMakity Inc may share data with trusted partners to help perform statistical analysis, send you email or postal mail, provide customer support, or arrange for deliveries. All such third parties are prohibited from using your personal information except to provide these services to eMakity Inc, and they are required to maintain the confidentiality of your information.

eMakity Inc will disclose your personal information, without notice, only if required to do so by law or in the good faith belief that such action is necessary to (a) conform to the edicts of the law or comply with legal process served on eMakity Inc or the site; (b) protect and defend the rights or property of eMakity Inc; and, (c) act under exigent circumstances to protect the personal safety of users of EMakity Inc, or the public.
"""
              ),

              Text(
                "INFORMATION WE PROCESS BECAUSE WE HAVE A CONTRACTUAL OBLIGATION WITH YOU",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
"""

When you use eMakity Inc website, you agree to our terms and conditions, a contract is formed between you and us.

In order to carry out our obligations under that contract, we must process the information you give us. Some of this information may be personal information.

We may use it in order to:

1.    verify your identity for security purposes

2.    sell products to you

3.    provide you with our services

4.    provide you with suggestions and advice on services and how to obtain the most from using our website.

eMakity Inc may aggregate this information in a general way and use it to provide class information, for example, to monitor our performance with respect to a particular service we provide. If we use it for this purpose, you as an individual will not be personally identifiable. eMakity Inc shall continue to process this information until the contract between us ends or is terminated by either party under the terms of the contract.

Except where you have consented to our use of your information for a specific purpose, we do not use your information in any way that would identify you personally. eMakity Inc may aggregate it in a general way and use it to provide class information, for example, to monitor the performance of a particular page on our website.

You may withdraw your consent at any time by instructing us (info@alakba.com) However, if you do so, you may not be able to use our website or our services further

"""
              ),

              Text(
                "RETENTION PERIOD FOR PERSONAL DATA",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
"""
Except as otherwise mentioned in this privacy notice, eMakity Inc keeps your personal information only for as long as required by us:

1.    To provide you with the services you have requested;

2.    To comply with other law, including for the period demanded by our tax authorities;

3.    To support a claim or defense in court.  
"""
              ),

              Text(
                "OPT-OUT & UNSUBSCRIBE",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                """
We provide users the opportunity to opt-out of receiving communications from us by reading the unsubscribe instructions located at the bottom of any e-mail they receive from us at any time. Users who no longer wish to receive our newsletter or promotional materials may opt-out of receiving these communications by clicking on the unsubscribe link in the e-mail.

We respect your privacy and give you an opportunity to opt-out of receiving announcements of certain information. Users may opt-out of receiving any or all communications from eMakity Inc by contacting us here:
"""
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  """
              
              Web page: https://www.alakba.com
              
              Email:  info@alakba.com
              
                  """,
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
                ),
              ),

              Text(
                "YOUR RIGHTS",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
You are entitled to the following rights under applicable laws:

·         The right to access: you may at any time request to access your personal data. Upon request, we will provide a copy of your personal data in a commonly used electronic form.

·         The right to rectification: you are entitled to obtain rectification of inaccurate personal data and to have incomplete personal data completed.

·         The right to erasure: under certain circumstances (including processing on the basis of your consent), you may request us to delete your User Data. Please note that this right is not unconditional. Therefore, an attempt to invoke the right might not lead to an action from us.

·         The right to object: to certain processing activities conducted by us in relation to your personal data, such as our processing of your personal data based on our legitimate interest. The right to object also applies to the processing of your personal data for direct marketing purposes.

·         The right to data portability: you are entitled to receive your personal data (or have your personal data directly transmitted to another data controller) in a structured, commonly used and machine-readable format.

                """
              ),

              Text(
                "INTELLECTUAL PROPERTY RIGHTS",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """

All copyrights, trademarks, patents and other intellectual property rights in and on our website and all content and software located on the site shall remain the sole property of eMakity Inc or its licensors. The use of our trademarks, content and intellectual property is forbidden without the express written consent from us.

You must not:

·         Republish material from our website without prior written consent.

·         Sell or rent material from our website.

·         Reproduce, duplicate, create derivative, copy or otherwise exploit material on our website for any purpose.

·         Redistribute any content from our website, including onto another website.

                """
              ),

              Text(
                "ACCEPTABLE USE",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
You agree to use our website only for lawful purposes and in a way that does not infringe the rights of, restrict or inhibit anyone else's use and enjoyment of the website. Prohibited behavior includes harassing or causing distress or inconvenience to any other user within our website. You must not use our website to send unsolicited commercial communications. You must not use the content on our website for any marketing related purpose without our express written consent.

                """
              ),

              Text(
                "THIRD-PARTY ANALYTICS",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
We use automated devices and applications, to evaluate usage of our Site and, to the extent permitted, our Services. We also may use other analytic means to evaluate our Services. We use these tools to help us improve our Services, performance and user experiences. These entities may use tracking technologies to perform their services.

                """
              ),

              Text(
                "VERIFICATION OF YOUR INFORMATION",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),


              Text(
                """
When we receive any request to access, edit or delete personal identifiable information we shall first take reasonable steps to verify your identity before granting you access or otherwise taking any action. This is important to safeguard your information.

                """
              ),

              Text(
                "ENCRYPTION OF DATA SENT BETWEEN US",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
eMakity Inc website uses Secure Sockets Layer (SSL) certificates to verify our identity to your browser and to encrypt any data you give us. Whenever information is transferred between us, you can check that it is done so using SSL by looking for a closed padlock symbol or another trust mark in your browser`s URL bar or toolbar.

                """
              ),

              Text(
                "HOW YOU CAN COMPLAIN",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
If you are not happy with our privacy policy or if any complaints, then you should tell us by email. Our e-mail address is info@alakba.com

                """
              ),

              Text(
                "REVIEW/MODIFICATION OF THIS PRIVACY POLICY",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
eMakity Inc may update this privacy notice from time to time as necessary. The terms that apply to you are those posted here on our website on the day you use our website. We solely advise you to print a copy for your records.

If you have any question regarding our privacy policy, please contact us through:

                """
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "E-mail:  info@alakba.com",
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    )
                ),
              ),

              Text(
                "COOKIES POLICY",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
              ),

              Text(
                """
The eMakity Inc website uses cookies. They are placed by software that operates on our servers, and by software operated by third parties whose services we use. When you first visit our website, we ask you whether you wish us to use cookies. If you choose not to accept them, we shall not use them for your visit except to record that you have not consented to their use for any other purpose.

If you choose not to use cookies or you prevent their use through your browser settings, you will not be able to use all the functionality of our website.

                """,
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                "We use cookies in the following ways:",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                """
·         To track how you use our website

·         To record whether you have seen specific messages we display on our website

·         To keep you signed in our site

·         To record your answers to surveys and questionnaires on our site while you complete them

·         To record the conversation thread during a live chat with our support team

                """
              ),

              Text(
                "WHY WE USE COOKIES ON OUR WEBSITE",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                """
Cookies are pieces of information that a website transfers to an individual’s computer hard drive for record-keeping purposes. Cookies make using our Site easier by, among other things, saving your passwords and preferences for you. These cookies are restricted for use only on our Site and do not transfer any personal information to any other party.

Most browsers are initially set up to accept cookies. You can, however, reset your browser to refuse all cookies or indicate when a cookie is being sent. Please consult the technical information relevant to your browser for instructions. If you choose to disable your cookies setting or refuse to accept a cookie, some parts of the Site may not function properly or may be considerably slower.

                """
              ),

              Text(
                "PERSONAL IDENTIFIERS FROM YOUR BROWSING ACTIVITY",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                """
Information about your computer hardware and software may be automatically collected by eMakity Inc This information can include your IP address, browser type, domain names, access times and referring website addresses. This information is used for the operation of the service, to maintain quality of the service, and to provide general statistics regarding use of the eMakity Inc website.

Requests by your web browser to our servers for web pages and other content on our website are recorded.

Our website records information such as your geographical location, your Internet service provider and your IP address. We also record information about the software you are using to browse our websites, such as the type of computer or device and the screen resolution.

eMakity Inc uses this information in aggregate to assess the popularity of the webpages on our website and how we perform in providing content to you.

                """
              ),

              Text(
                "USE OF RE-MARKETING",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),

              Text(
                """
Re-marketing involves placing a cookie on your computer when you browse our website in order to be able to serve to you an advert for our products or services when you visit some other website.

eMakity Inc may use a third party to provide us with re-marketing services from time to time. If so, then if you have consented to our use of cookies, you may see advertisements for our products and services on other websites.

                """
              ),

              
            ],
            
          ),
        ),
      ),
    );
  }
}