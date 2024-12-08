import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseUrl = dotenv.get('SERVER_URL', fallback: '');
