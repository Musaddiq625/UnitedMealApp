import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //HEADINGS
          'convenience_grocery_more': 'Convenience, Grocery & More',

          ///TEMP DATA
          'temp_name': 'Duane Reade',
          'temp_time_in_min': '16',


          /// ERRORS
          'error':'Error',
          'error_sign_up':'Some Error occurred in sign up',


          'delivery': 'Delivery',
          //TAB NAMES
          'home': 'Home',
          'pickup': 'Pickup',
          'offers': 'Offers',
          'search': 'Search',
          'orders': 'Orders',

          //CHIPS DATA
          'over': 'Over',
          'under': 'Under',
          'min': 'min',
          'cuisines': 'Cuisines',
          'offer_type': 'Offer Type',

          //DIALOGS
          'delivering_to': 'Delivering To',
          'introducing_offers': 'Introducing Offers',
          'introducing_offers_details':
              'Savings on meals and free delivery fees from great local and national restaurants, updated for you each week.',
          'delivery_fee': 'Delivery Fee',

          //GET STARTED PAGE
          'log_in': 'Log In',
          'get_started': 'Get Started',
          'why_delivery_with_door_dash': 'Why delivery with DoorDash',
          'sign_up_details': 'Sign up details',
          'error_please_fill':'Please Fill in all the fields to Continue',
          'error_pw_not_matched':'Password not matched',

          //LOGIN PAGE
          'email': 'Email',
          'password': 'Password',
          'login': 'Login',
          'guest': 'Guest',
          'not_a_user': 'Not a User',
          'error_password':'Incorrect Email or Password',

          //SIGN UP PAGE
          're_password': 'Re-enter Password',
          'sign_up': 'SignUp',
          'register': 'Register',
          'success':'Success',
          'successfully_signed_up':'Successfully Signed Up',

          //NEAR BY
          'restaurants_nearby': 'Restaurants Nearby',
          'ready_in': 'Ready in',

          //SEARCH
          'cancel': 'Cancel',
          'ratings': 'Ratings',

          //ACCOUNT
          'account': 'Account',
          'uniting_meals': 'Uniting Meals',
          'change_your_account_information': 'Change your account information',
          'payment': 'Payment',
          'manage_payment_methods_and_door_dash_credits':
              'Manage payment methods and DoorDash Credits',
          'name':'Name',
          'address': 'Address',
          'addresses': 'Addresses',
          'add_or_remove_a_delivery_address': 'Add or remove a delivery address',
          'privacy': 'Privacy',
          'manage_your_privacy_settings': 'Manage your privacy settings',
          'delivery_fee_with_dash_pass': 'delivery fees with DishPass',
          'link_facebook': 'Link Facebook',
          'delivery_support': 'Delivery Support',
          'gift_card': 'Gift Card',

          'faq': 'FAQ',
          'notifications': 'Notifications',
          'refer_friends': 'Refer Friends',
          'delivery_push_notifications': 'Delivery Push Notifications',
          'delivery_sms_notifications': 'Delivery SMS Notifications',
          'promotional_push_notifications': 'Promotional Push Notifications',
          'more': 'More',
          'become_a_dasher': 'Become a Dasher',
          'become_a_partner_restaurant': 'Become a Partner Restaurant',
          'legal': 'Legal',
          'logout': 'Log Out',
          //ORDERS
          'no_previous_orders': 'No Previous Orders',

          //ORDER DETAILS
          'order_details': 'Order Details',
          'order_no':'Order No',
          'order_from':'Order from',
          'delivery_address':'Delivery Address',
          'order_date':'Order date',


          //PAYMENT
          'add_payment_method': 'Add Payment Method',
          'credit_debit_card': 'Credit/Debit Card',
          'pay_pal': 'PayPal',
          'door_dash_credits': 'DoorDash Credits',
          'your_usd_credit_will_be_automatically_applied_to_your_next_order':
              'Your USD credit will be automatically applied to next order.',
          'usd': 'USD',
          'can_be_applied_only_in_usa': 'Can be applied only in USA',
          'redeem_gift_card': 'Redeem Gift Card',
          'invite_friends_on_earn_credits': 'Invite friends to earn credits',

          'get': 'Get',
          'stores': 'Stores',
          'items': 'Items',
          'free_delivery': 'Free Delivery',

          ///FOOD
          'available_quantity':'Available Quantity',
          'item':'Item',

          //ALERT DIALOG - DIALOGS
          'are_you_sure_you_want_to_logout': 'Are you sure you want\nto Logout?',
          'please_login_first_to_continue': 'Please Login First to continue',

          //CART
          'cart':'Cart',
          'you_saved': 'You saved',
          'with_new_user_promotion': 'with New User Promotion',
          'add_more_items': 'Add more items',
          'people_also_ordered': 'People also ordered',
          'total': 'Total',
          'incl_GST': 'incl. GST',
          'promo_code': 'Promo code',
          'subtotal': 'Subtotal',
          'fees_and_estimated_tax': 'Fees & Estimated Tax',
          'continue': 'Continue',
          '4242_hint': '4242 4242 4242 4242',
          'scan_card_info_text':
              'This will update your existing payment card. This card will only be charged when you place an order.',
          'scan_card': 'Scan Card',
          'cart_empty':'Cart is Empty',


          //CHECKOUT
          'my_cart':'My Cart',
          'checkout':'Checkout',
          'delivery_details':'Delivery Details',
          'delivery_instruction':'Delivery Instruction',
          'eta':'ETA',
          'dasher_tip':'Dasher Tip',

          //SCAN CARD
          'save': 'Save',

          //RESTAURANT DETAILS
          'back': 'Back',
          'newly_added': 'Newly Added',
          'this_is_a_pickup_order': 'This is a Pickup Order',
          'you_ll_need_to_go_to': 'You\'ll need to go to',
          'to_pickup_this_order': 'to pick up this order',
          'featured_items': 'Featured Items',
          'full_menu': 'Full Menu',
          'fees': 'fees',
          'miles': 'miles',
          'switch_menu': 'Switch Menu',
          'popular_items': 'Popular Items',
          'weekend_special': 'Weekend Special',

          //POPULAR ITEMS
          'popular_items_tagline': 'The most commonly ordered items and dishes from this store',

          //ADD TO ORDER
          'add_special_instruction': 'Add Special Instruction',
          'add_to_order': 'Add to Order',

          //SPECIAL INSTRUCTION
          'special_instruction': 'Special Instruction',
          'done': 'Done',
          'special_instruction_hint':
              'Sauce on the side, no cilantro, extra spicy.. (500 characters max)',
          'if_item_is_unavailable':'If Item is Unavailable',
          'contact_me':'Contact me',


          //PAYMENTS
          'apple_pay':'Apple Pay',
          'buy_with_pay':'Buy With Pay',
          'processing_order':'Processing Order',

          //LIVE MAP
          'heading_to_you':'Heading to you',
          'arrives_in':'Arrives in',



        },
        'es': {'': ''},
      };
}
