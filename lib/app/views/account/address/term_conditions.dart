import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

class TermsConditionPage extends StatefulWidget {
  const TermsConditionPage({Key? key}) : super(key: key);

  @override
  _TermsConditionPageState createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
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
        text: 'Terms And Conditions',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '''
Please read these terms and conditions carefully before using https://alakba.com. This website is operated and managed by eMakity Inc in the whole extent of this website, every point the terms “we”, “us” or “our” is used, it refers to eMakity Inc.

By purchasing goods from us, you involve in our “Service” and agree to be bound by the following terms and conditions stated, including the policies referenced herein and/or available by hyperlink. These Terms and Conditions are applicable to all users of the site, including without limitation every user who is browsers, customers and merchants. If you disagree with all or any of the terms of use in this agreement, then you may consider not to access the website or use any of the services.
                    ''',
                style: TextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Protecting your private information is our priority. This Statement of Privacy applies to https://www.alakba.com and governs data collection and usage. We have developed this policy in order for you to understand how we collect, use, communicate and make use of personal information. The following outlines our privacy policy."),
              SizedBox(
                height: 10,
              ),
              Text("CHANGES TO TERMS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
We are committed to ensuring that our online store is as useful and efficient as possible. For that reason, we reserve the right to make changes to the services, at any time. We will never charge you for any service without making it very clear to you precisely what you're paying for.

Any features or product(s) which are added to the current store shall also be subject to this Terms and condition. You can always review the most current version of the Terms and conditions at any time on this page. We reserve the right to update, change or retrieve any part of these Terms and conditions by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.
 
                """),
              Text("PLACING AN ORDER",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
When you place an order through the Website, we will send an email to confirm that we have received the order. All orders are subject to these terms and conditions. Orders placed through the Website represent an offer to purchase a product. It is accepted for each product when we send you an email to confirm that the order has been received. We reserve the right to reject any order for any reason.

It is important that you enter the correct e-mail address when placing your order. We also recommend that you save your order confirmation email to facilitate any contact with customer service or for future references. The order confirmation (receipt) also serves as a guarantee of proof of purchase.

"""),
              Text("PRICES, TAXES, AND PAYMENT TERMS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Prices and payment details of products are specified on the website. Payment can be made by credit card, Debit card, and/or as further described in the store. Prices are shown exclusive of VAT, import duties and other government-imposed taxes, duties, and levies. You will be responsible for the payment of such import duties and taxes. It should be noted that eMakity Inc has no control over these charges.

The User guarantees that the information submitted when using the Service, including without limitation, its payment details, shall be complete, correct, truthful and up to date. 

The User must inform eMakity Inc immediately about any inaccuracies in the offer provided, including the price. Our banking services and payment gateways manage all of our banking transactions. We don’t store any credit card numbers. Your payment is handled by the payment gateways with secure encryption and under strict banking standards. Your card details are sent directly to them and cannot be read or accessed by anyone.

During the period of validity indicated in the offer for the product, the prices of the product will not be increased, except for price changes in VAT-tariffs. After such a period, we are entitled to adjust the price for any product(s). In such cases, eMakity Inc shall notify the User in advance. Such notice may be provided at any time by posting the changes to the Website or via the product itself.


"""),
              Text("OUR RIGHTS TO CANCEL/REJECT ORDERS.",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
We reserve the right to decline any order you place with us. We may, in our exclusive discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, or orders that use the same billing and/or shipping address. If we make a change to or cancel an order, we may attempt to notify you by contacting the e­mail and billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors. You agree to provide current, complete and accurate purchase and account information for all purchases made at our store.

"""),
              Text("PRODUCT AVAILABILITY, ERRORS, INACCURACIES AND OMISSIONS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Products on our online store through https://alakba.com are subject to change without notice. Errors will be corrected when discovered. Our Site contains a large number of products and it is always possible that, despite our best efforts, some of the products listed on our Site may be incorrectly priced, the quantity or availability of a product may have changed just prior to you placing your order or other errors may be displayed on the product page. We will normally verify prices, availability and confirm there are no errors on the product page as part of our dispatch procedures.

Where a product's correct price is less than our stated price, we will charge the lower amount when dispatching the product to you. If a product's correct price is higher than the price stated on our Site, we will normally, at our discretion, either contact you for instructions before dispatching the Product, or reject your order and notify you of such rejection. We are under no obligation to provide the product to you at the incorrect (lower) price, even after we have sent you an Order Confirmation.

Also, there may be information on our site or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions on a product page. We reserve the right to rescind our acceptance and cancel your order without penalty in the event there is an obvious and unmistakable error on the product page, in our reasonable discretion.

"""),
              Text("VENDOR TERMS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("Fees and Billing",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Joining and listing of products on Alakba is free. Alakba charges a fee and a percentage of the sale price when the item sells. When you list an item, you have an opportunity to review and accept the fees that you will be charged. Alakba’s Fees Policy, which is subject to change, is incorporated into this Agreement by reference. Changes to the Fees Policy and the fees for Alakba ‘s services are effective after Alakba provides you with at least fourteen (14) days’ notice by posting the changes on the Site. However, Alakba may choose to temporarily change the Fees Policy and the fees for Alakba ‘s services for promotional events. Such changes are effective when Alakba posts the temporary promotional event on the Site. Alakba may, at Alakba ‘s sole discretion, change some or all of Alakba ‘s services at any time. In the event Alakba introduces a service, the fees for that service are effective at the launch of the service.

"""),
              Text("Fees and termination",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
If Alakba terminates a listing or your account, if you close your account, or if the payment of your Alakba fees cannot be completed for any reason, you remain obligated to pay Alakba for all unpaid fees plus any penalties, if applicable. If the seller’s account is not paid in full and becomes past due, the seller risks penalties such as the suspension of privileges and/or termination of the account and other collection mechanisms (including retaining collection agencies and legal counsel). If you have a question or wish to dispute a charge, contact Alakba.

"""),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Listing and selling",
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              Text("""
By listing an item on the website, you warrant that you and all aspects of the item comply with Alakba’s published policies. You also warrant that you may legally sell the item. You must accurately describe your item and all terms of sale in your Alakba profile. Your listings may only include text descriptions, graphics, pictures and other content relevant to the sale of that item. All items must be listed in an appropriate category with appropriate tags. Each listing must accurately and completely describe the item/items for sale in that listing. If the “in stock” quantity is more than one, all items in that listing must be identical. Each unique item must have its own listing.

"""),
              Text("Restricted activities: ",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Your Content and your use of ALAKBA shall not:

Be false, inaccurate or misleading
Be fraudulent or involve the sale of illegal, counterfeit or stolen items
Infringe upon any third-party’s copyright, patent, trademark, trade secret or other proprietary or intellectual property rights or rights of publicity or privacy
Violate this Agreement, any site policy, or any applicable law, ordinance or regulation (including, but not limited to, those governing export control, consumer protection, unfair competition, anti-discrimination or false advertising)
Furthermore, you may not list any item on ALAKBA (or consummate any transaction that was initiated using ALAKBA’s service) that, by paying to ALAKBA the listing fee or the final value fee, could cause ALAKBA to violate any applicable law, statute, ordinance or regulation, or that violates the Terms of Use.

                """),
              Text("PRICING POLICY",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""

Please note that faith is the most important aspect of trade between buyers and sellers in a business place and one of the key aspects of faith is fair pricing. For healthy transaction flow at Alakba.com, we ask you to price your items responsibly and reasonably.

Please note that we are constantly monitoring prices for each merchant at various channels and do not allow you to price your items at higher prices at Alakba vs. other channels such as your own retail store, your own Website (if any) or any other 3rd party retail stores or Websites. You should price your items sold at Alakba to be same as the lowest rate you are selling at elsewhere or even lower but it should not be more. Violation of our pricing policy will result into warning notices and can also result into account suspension and/or store suspension.

                """),
              Text("BUYER PROTECTION",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
As an online market place, Alakba runs a very supportive Buyer security program so that buyer is totally protected dealing with Alakba.com. At Alakba, trust is the biggest thing for each dealing. To extend this trust to buyers, we offer Buyer security, which is based on four trust pillars i.e.

Payment Security - Your payment is not released to merchant unless you have received your item

Product Guarantee - All products sold at Alakba are new, 100% genuine and manufacturer warranty wherever applicable

Easy Replacement - For wrong size, color, quantity, style, manufacturing, defects, damaged or significantly different from product listing

Reliable Merchants - All the merchants go through a rigorous verification process before having their online store at Alakba.com

All the merchants selling at Alakba.com are very well observed and then they are allowed to business on our site. We see to it that all the products you buy from our website are genuine, authentic, products being sold by well reputed and tested merchants at the best prices possible. Of course, we also offer all the warranties, guarantees as entailed by the product, all this at a great price and with the best customer service in the industry.

At Alakba.com, we believe that customer satisfaction is key- therefore we stand behind all merchandise bought at our site. We will replace any order within 7 days of delivery, with free return shipping if you receive a product which is not as per the specifications ordered by you:

Wrong colour
Wrong size
Wrong style
Wrong quantity
Missing parts/accessories
Defective
Dead on arrival
Damaged
Significantly different from the description given by the merchant
However, do make sure that the product has not been used/worn or altered/tampered with, as well as is accompanied by its original price tag and packing slip. Please contact our customer care team, so we can help facilitate your return.

In case of pre-shipment delays, Alakba also offers you choice to cancel an order prior to its shipment by contacting us at Customer care team. Our trust policies define who we are and we promise the best online shopping experience to our customers.

PROMO CODES AND OFFERS

Promo Codes and Offers are made at our sole discretion and are subject to time validity, a valid Promotional Code should be entered during the checkout process for a product to be valid. Attempting to add a promo code after purchase or after the expiration of the code will not be acknowledged.

                """),
              Text("AGE OF CONSENT",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
By agreeing to these Terms of Use, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence. You may not use/access our products for any illegal or unauthorized purpose nor may you, in the use of the Service or online store, violate any laws in your jurisdiction (including but not limited to copyright laws). A breach or violation of any of the Terms will result in an immediate termination of your access to our products or services.

                """),
              Text("SERVICE TERMS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
1.    eMakity Inc at this moment grants the User a non-exclusive, non-transferable, limited right to access and use the Service, under the conditions of these Terms & Conditions and for the duration of the Agreement.

2.    The use of the Service is at the User's own expense and risk. The User is responsible for meeting the technical and functional requirements and using the electronic communication facilities that are necessary to be able to access and use the Service. The User will at all times bear the risk of loss, theft or damage to any of its data.

3.    eMakity Inc will have the right (but not the obligation), at its sole discretion, to review, edit, limit, refuse or remove Content, products or to limit or refuse the User access to the Service. More specifically in the event the use of the Service, according to us, violates these Terms of Use.

4.    We may disclose the User's Personal Data or Content, or other data relating to the use of the Service, to third parties where it believes, in good faith, that it is necessary to comply with a court order, ongoing judicial proceeding, criminal or civil subpoena, or other legal process or request by law enforcement authorities, or to exercise its constitutional rights of defense against legal claims.

                """),
              Text("THIRD-PARTY LINKS",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Certain content and services available via our website may include materials from third-parties. Third-party links on this site may direct you to third-party websites or applications that are not affiliated with us. eMakity Inc is not responsible for examining or evaluating the content or accuracy of such website or application and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties. We are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites.

You're obliged to review carefully the third-party's policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.

                """),
              Text("PERSONAL INFORMATION",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Your submission of personal information through the store is regulated by our Privacy Policy. You are to view our Privacy Policy.

                """),
              Text("USER CONTENT",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Our website may contain user-generated content, for example, social media applications. we do not claim any ownership of such contents (images, photos, and videos, etc.) and take no legal responsibility for it. In case you suspect a violation of copyright or any other right, or otherwise is offended by such content, please contact our customer support.

                """),
              Text("DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
We, therefore, underwrite in no pledge or represent or warrant that your use of our service will be uninterrupted, timely, assured, secure or error-free. We do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.

You agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you. You expressly agree that your use of, or inability to use, the service is at your volition and sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided 'as is' and 'as available' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.

In no case shall eMakity Inc, our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, manufacturers, service providers or licensors be responsible or liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility.

Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.

                """),
              Text("INDEMNIFICATION",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
In the event that any provision of these Terms and conditions is discovered to be unlawful, null or unenforceable, such provision shall notwithstanding be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be viewed to be cut off from these Terms of Use, such determination shall not affect the credibility and enforceability of any other remaining provisions.

"""),
              Text("TERMINATION",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
The obligations and liabilities of the parties obtained prior to the termination date shall survive the termination of this agreement for all purposes.

These Terms and conditions are effective except and until terminated by either you or us. You may terminate these Terms of Service at any time by informing us that you no longer wish to use our Services, or when you cease using our site.

If in our sole judgment you fail, or we suspect that you have failed, to abide by any term or provision of these Terms of Use, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; or accordingly may withhold you of access to our Services (or any part thereof).

                """),
              Text("ENTIRE AGREEMENT",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
Our inability to exercise or enforce any right or provision of these Terms of Service shall not constitute a discharge of such right or provision.

These Terms of Use and any policies or operating rules posted by us on this website or in respect to the Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, pre-empt any prior or synchronous agreements, communications and proposals, whether oral or written, between you and us.

Any ambiguities in the interpretation of these Terms of Use shall not be construed against the drafting party.

                """),
              Text("CONTACT INFORMATION",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text("""
If you would like to: access, correct, register a complaint, or simply want more information please contact us directly Via:

Email: business@alakba.com

                """),
            ],
          ),
        ),
      ),
    );
  }
}
