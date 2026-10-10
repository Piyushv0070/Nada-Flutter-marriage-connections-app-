import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile.dart';

class ProfileRepository {
  static const String datasetUrl = 'https://gist.githubusercontent.com/.../profiles.json';

  Future<List<Profile>> fetchProfiles() async {
    try {
      final response = await http.get(Uri.parse(datasetUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> profilesJson = data['profiles'] ?? [];
        return profilesJson.map((json) => Profile.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load profiles (Status code: ${response.statusCode})');
      }
    } catch (e) {
      // Fallback to the exact provided dataset so the app works offline & instantly
      return _getProvidedDataset();
    }
  }

  List<Profile> _getProvidedDataset() {
    final Map<String, dynamic> data = json.decode(_jsonString);
    final List<dynamic> profilesJson = data['profiles'] ?? [];
    return profilesJson.map((json) => Profile.fromJson(json)).toList();
  }

  static const String _jsonString = '''
  {
    "profiles": [
      {
        "id": 1,
        "name": "Ananya Sharma",
        "age": 27,
        "gender": "F",
        "city": "Noida",
        "community": "Brahmin",
        "profession": "Product designer at a fintech",
        "education": "B.Des, NIFT Delhi",
        "degree": 1,
        "connected_through": "Your cousin Nikhil knows her brother.",
        "about": "Reads a book a week, runs on Sundays, wants to stay in NCR."
      },
      {
        "id": 2,
        "name": "Rohan Agarwal",
        "age": 29,
        "gender": "M",
        "city": "Delhi",
        "community": "Agarwal",
        "profession": "Chartered accountant",
        "education": "CA",
        "degree": 2,
        "connected_through": "Your uncle Rajesh knows his father from the Lajpat Nagar traders' association.",
        "about": "Joint family in Lajpat Nagar, plays badminton, vegetarian."
      },
      {
        "id": 3,
        "name": "Meera Gupta",
        "age": 26,
        "gender": "F",
        "city": "Ghaziabad",
        "community": "Vaishya",
        "profession": "Schoolteacher, primary",
        "education": "B.Ed",
        "degree": 1,
        "connected_through": "Her mother and your mother were in college together.",
        "about": "Teaches at a CBSE school, paints on weekends, open to moving within NCR."
      },
      {
        "id": 4,
        "name": "Kabir Khanna",
        "age": 30,
        "gender": "M",
        "city": "Gurugram",
        "community": "Punjabi Khatri",
        "profession": "Software engineer at a product company",
        "education": "B.Tech, NIT Kurukshetra",
        "degree": 3,
        "connected_through": "A friend of your office friend Priya.",
        "about": "Works hybrid from Gurugram three days a week, cooks dal makhani better than most restaurants, has driven to Spiti twice, and wants a partner who likes to travel, read, and argue about films without taking it personally."
      },
      {
        "id": 5,
        "name": "Isha Verma",
        "age": 25,
        "gender": "F",
        "city": "Lucknow",
        "community": "Kayastha",
        "profession": "Doctor, junior resident",
        "education": "MBBS, KGMU",
        "degree": 2,
        "connected_through": "Your bua's neighbour in Gomti Nagar.",
        "about": "Finishing residency in 2027, prefers a doctor or engineer family."
      },
      {
        "id": 6,
        "name": "Dev Chaudhary",
        "age": 28,
        "gender": "M",
        "city": "Faridabad",
        "community": "Jat",
        "profession": "Runs the family transport business",
        "degree": 1,
        "connected_through": "His sister was at school with you.",
        "about": "Family business in Faridabad, early riser, into cricket."
      },
      {
        "id": 7,
        "name": "Sanya Malhotra",
        "age": 27,
        "gender": "F",
        "city": "Delhi",
        "community": "Punjabi",
        "profession": "Marketing manager",
        "education": "MBA, FMS Delhi",
        "degree": 2,
        "connected_through": "Your friend Aman's cousin.",
        "about": "Works in South Delhi, likes theatre, open to moving abroad."
      },
      {
        "id": 8,
        "name": "Arjun Rathore",
        "age": 31,
        "gender": "M",
        "city": "Jaipur",
        "community": "Rajput",
        "profession": "Civil engineer with the state PWD",
        "education": "B.Tech, MNIT Jaipur",
        "degree": 3,
        "connected_through": "Your father's colleague knows his family.",
        "about": "Posted in Jaipur, family in Jodhpur, plays the harmonium."
      },
      {
        "id": 9,
        "name": "Priya Maheshwari",
        "age": 26,
        "gender": "F",
        "city": "Indore",
        "community": "Maheshwari",
        "profession": "Data analyst",
        "education": "M.Sc Statistics",
        "degree": 2,
        "connected_through": "Her father and your mama are business partners.",
        "about": "Works for a Pune firm from Indore, wants to stay in a city with family nearby."
      },
      {
        "id": 10,
        "name": "Nikhil Yadav",
        "age": 29,
        "gender": "M",
        "city": "Varanasi",
        "community": "Yadav",
        "profession": "Assistant professor of history",
        "education": "PhD, BHU",
        "degree": null,
        "connected_through": null,
        "about": "Teaches at BHU, writes for a Hindi magazine, no plans to leave Varanasi."
      },
      {
        "id": 11,
        "name": "Tanvi Sinha",
        "age": 24,
        "gender": "F",
        "city": "Patna",
        "community": "Kayastha",
        "profession": "Lawyer",
        "education": "LLB, NLU Patna",
        "degree": 2,
        "connected_through": "Her uncle is your neighbour's cousin.",
        "about": "Junior at a Patna High Court chamber, wants to practise in Delhi later."
      },
      {
        "id": 12,
        "name": "Vikram Chopra",
        "age": 32,
        "gender": "M",
        "city": "Chandigarh",
        "community": "Punjabi Khatri",
        "profession": "Army officer, major",
        "education": "NDA",
        "degree": 1,
        "connected_through": "Your brother's batchmate.",
        "about": null
      },
      {
        "id": 13,
        "name": "Rajeshwari Nandini Mishra Chaturvedi",
        "age": 28,
        "gender": "F",
        "city": "Kanpur",
        "community": "Brahmin",
        "profession": "Architect",
        "education": "B.Arch",
        "degree": 3,
        "connected_through": "Your dadi knows her grandmother from Kanpur.",
        "about": "Own practice in Kanpur, sketches, wants a partner from UP."
      },
      {
        "id": 14,
        "name": "Saurabh Jain",
        "age": 30,
        "gender": "M",
        "city": "Noida",
        "community": "Jain",
        "profession": "Founder of a logistics startup",
        "education": "B.Tech, DTU",
        "degree": 1,
        "connected_through": "Works in the same building as your sister.",
        "about": "Startup in Sector 62, vegetarian, no onion or garlic at home."
      },
      {
        "id": 15,
        "name": "Ritika Bansal",
        "age": 25,
        "gender": "F",
        "city": "Gurugram",
        "community": "Agarwal",
        "profession": "HR associate",
        "education": "MBA",
        "degree": 2,
        "connected_through": "Her brother plays cricket with your cousin.",
        "about": "Works in Cyber City, learns Kathak, close to her parents."
      },
      {
        "id": 16,
        "name": "Aditya Tiwari",
        "age": 27,
        "gender": "M",
        "city": "Lucknow",
        "community": "Brahmin",
        "profession": "Bank probationary officer",
        "education": "B.Com",
        "degree": 2,
        "connected_through": "आपके मौसा जी के बैंक के सहकर्मी।",
        "about": "लखनऊ में बैंक में पीओ, तबादले वाली नौकरी है, प्रेमचंद पढ़ते हैं।"
      },
      {
        "id": 17,
        "name": "Kritika Sethi",
        "age": 29,
        "gender": "F",
        "city": "Delhi",
        "community": "Punjabi Khatri",
        "profession": "Dentist",
        "education": "BDS",
        "degree": 1,
        "connected_through": "Your mother's friend from the kitty group.",
        "about": "Own clinic in Rajouri Garden, loves dogs, open to NCR or Chandigarh."
      },
      {
        "id": 18,
        "name": "Harshit Goel",
        "age": 26,
        "gender": "M",
        "city": "Greater Noida",
        "community": "Agarwal",
        "profession": "Interior designer",
        "education": "B.Des",
        "degree": 3,
        "connected_through": "A client of your uncle's firm.",
        "about": "Designs homes in Indirapuram, photography on weekends."
      },
      {
        "id": 19,
        "name": "Pooja Thakur",
        "age": 28,
        "gender": "F",
        "city": "Jaipur",
        "community": "Rajput",
        "profession": "Assistant professor of chemistry",
        "education": "M.Sc, NET",
        "degree": 2,
        "connected_through": "Her father and your father were in the same hostel.",
        "about": "Teaches at a Jaipur college, classical singer, prefers Rajasthan or NCR."
      },
      {
        "id": 20,
        "name": "Mohit Saxena",
        "age": 31,
        "gender": "M",
        "city": "Noida",
        "community": "Kayastha",
        "profession": "Product manager",
        "education": "B.Tech, MBA",
        "degree": 1,
        "connected_through": "Your office friend Rahul's cousin.",
        "about": "Works at an edtech in Noida, plays guitar, wants to settle in NCR."
      },
      {
        "id": 21,
        "name": "Divya Singh",
        "age": 27,
        "gender": "F",
        "city": "Varanasi",
        "community": "Rajput",
        "profession": "Journalist",
        "education": "MA Journalism",
        "degree": 3,
        "connected_through": "Your friend's colleague at the newspaper.",
        "about": "Reports for a Hindi daily, travels for work, open to Lucknow or Delhi."
      },
      {
        "id": 22,
        "name": "Ankit Mittal",
        "age": 28,
        "gender": "M",
        "city": "Faridabad",
        "community": "Agarwal",
        "profession": "Runs a chain of hardware stores",
        "education": "B.Com",
        "degree": 2,
        "connected_through": "Your bua's husband's nephew.",
        "about": "Three stores in Faridabad, joint family, drives to Rishikesh when he can."
      },
      {
        "id": 23,
        "name": "Shreya Dubey",
        "age": 26,
        "gender": "F",
        "city": "Kanpur",
        "community": "Brahmin",
        "profession": "Software engineer at a services firm",
        "education": "B.Tech",
        "degree": 1,
        "connected_through": "Your sister's roommate in Bengaluru.",
        "about": "Works from Kanpur now, wants to move back to Bengaluru after marriage."
      },
      {
        "id": 24,
        "name": "Rahul Bhatia",
        "age": 30,
        "gender": "M",
        "city": "Delhi",
        "community": "Punjabi Khatri",
        "profession": "Airline pilot",
        "education": "B.Sc Aviation",
        "degree": 2,
        "connected_through": "His mother and your mother are in the same RWA.",
        "about": "Flies domestic routes, home in Dwarka, into fitness."
      }
    ]
  }
  ''';
}