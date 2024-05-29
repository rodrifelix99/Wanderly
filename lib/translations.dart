import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Global strings
      'app_name': 'Wanderly',
      'error': 'Error',
      'error_subtitle': 'Something went wrong',
      'no_places_found': 'No places found',
      'next': 'Next',

      // Login strings
      'welcome_1': 'Welcome to Wanderly',
      'welcome_1_subtitle': 'Have we met before?\nIf not, let\'s get to know each other',
      'welcome_2': 'Scan your clothes',
      'welcome_2_subtitle': 'The AI will try to sort your clothes by type and color',
      'welcome_3': 'Let the AI do the work',
      'welcome_3_subtitle': 'When your clothes are sorted, the AI will create outfits for you',
      'error_sign_in': 'Error signing in',
      'get_started': 'Get started',
      'sign_in_with_google': 'Sign in with Google',
      'sign_in_with_apple': 'Sign in with Apple',
      'slogan': 'Your personal stylist',
      'terms_and_conditions': 'Terms and Conditions',

      // Permission strings
      'location_permission': 'Location Permission',
      'location_permission_title': 'Let\'s get started',
      'location_permission_message': 'We need your location to unlock the full experience, like weather-based outfit suggestions',
      'location_permission_request': 'Request Location Permission',

      // Add page strings
      'capture': 'Capture',
      'add_page_title': 'Add Clothes',
      'error_capture_image': 'Error capturing image',
      'error_camera_not_available': 'Camera not available',
      'wanderly_ai_notice': 'Wanderly AI already filled in the details for you but you can edit them if needed',
      'title': 'Title',
      'description': 'Description',
      'category': 'Category',
      'color': 'Color',
      'sub_categories': 'Sub Categories',
      'add_to_wardrobe': 'Add to Wardrobe',
    },
  };
}