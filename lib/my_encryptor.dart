import 'dart:math';

abstract class Encryptor {
  String generateKey({required int keyLength});
  String encode({required String message, required String key});
  String decode({required String encodedMessage, required String key});
}

class VigenereEncryptor implements Encryptor {
  
  @override
  String generateKey({required int keyLength}) {
    String key = '';
    for (int i = 0; i < keyLength; i++) {
      final nextKeyLetterCharCode = Random().nextInt(26) + 'A'.codeUnitAt(0);
      key += String.fromCharCode(nextKeyLetterCharCode);
    }

    return key;
  }

  @override
  String encode({required String message, required String key}) {
    String encodedMessage = '';
    for (int i = 0; i < message.length; i++) {
      if (message[i].contains(RegExp('[A-Z]'))) {
        final nextEncodedLetterCharCode =
            ((message.codeUnitAt(i) + key.codeUnitAt(i)) % 26) +
                'A'.codeUnitAt(0);
        encodedMessage += String.fromCharCode(nextEncodedLetterCharCode);
      } else {
        encodedMessage += message[i];
      }
    }

    return encodedMessage;
  }

  @override
  String decode({required String encodedMessage, required String key}) {

    String decodedMessage = '';

    for (int i = 0; i < encodedMessage.length; i++) {

      if (encodedMessage[i].contains(RegExp('[A-Z]'))) {
        final nextDecodedLetterCharCode =
            (((encodedMessage.codeUnitAt(i) - key.codeUnitAt(i)) + 26) % 26) +
                'A'.codeUnitAt(0);

        decodedMessage += String.fromCharCode(nextDecodedLetterCharCode);
     
      } else {
        decodedMessage += encodedMessage[i];
      }
    }

    return decodedMessage;
  }
}
