import 'package:allen/secrets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel model = GenerativeModel(
    model: 'models/gemini-2.0-flash',
    apiKey: geminiApiKey, // Save this in your secrets.dart
  );

  final List<Content> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      
      final isImagePrompt = RegExp(r'\b(image|art|picture|draw|paint|photo|generate)\b', caseSensitive: false)
          .hasMatch(prompt);

      if (isImagePrompt) {
        return 'Gemini does not currently support image generation via API. Please use a different prompt.';
      } else {
        return await chatGeminiAPI(prompt);
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<String> chatGeminiAPI(String prompt) async {
    try {
      messages.add(Content.text(prompt));
      final response = await model.generateContent(messages);

      final reply = response.text?.trim() ?? 'No response received';
      messages.add(Content.text(reply));
      return reply;
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
