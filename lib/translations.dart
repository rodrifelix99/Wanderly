import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_name': 'Wanderly',
      'location_permission': 'Location Permission',
      'location_permission_title': 'Let\'s get started',
      'location_permission_message': 'We need your location to unlock the full experience',
      'location_permission_request': 'Request Location Permission',
      'error': 'Error',
      'error_subtitle': 'Something went wrong',
      'no_places_found': 'No places found',
      'next': 'Next',

      // Login strings
      'welcome_1': 'Welcome',
      'welcome_1_subtitle': 'Have we met before?\nIf not, let\'s get to know each other',
      'welcome_2': 'Wanderly is a game',
      'welcome_2_subtitle': 'We give you a quest for you and your friends based on places around you and the vibe you\'re in',
      'welcome_3': 'Take your quest and go wander',
      'welcome_3_subtitle': 'Visit the place you got and take a photo with your friends to complete the quest.\nComplete quests to earn rewards and unlock new tiers.',
      'error_sign_in': 'Error signing in',

      // Home page titles
      'home_page_title_1': 'Hey there!',
      'home_page_title_2': 'So what\'s the plan?',
      'home_page_title_3': 'Where to next?',
      'home_page_title_4': 'Let\'s go!',
      'home_page_title_5': 'Where to?',
      'home_page_title_6': 'What\'s the vibe?',
      'home_page_title_7': 'What are you in the mood for?',
      'home_page_title_8': 'What are you looking for?',
      'home_page_title_9': 'What are you craving?',
      'home_page_title_10': 'What are you feeling?',

      // Activity categories
      'party': 'Party',
      'food': 'Food',
      'knowledge': 'Knowledge',
      'culture': 'Culture',
      'sport': 'Sport',
      'music': 'Music',
      'art': 'Art',
      'nature': 'Nature',
      'other': 'Other',
      'other_activities': 'Other activities',
      'more_activities': 'More activities',
    },
  };
}