import 'package:my_encryptor/my_encryptor.dart';
import 'package:test/test.dart';

void main() {

  test('Encoded message should be different from message when some letters in message is upper case', () {

    final message = 'SUPERSECRETmEssAge';

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    final encodedMessage = encryptor.encode(message: message, key: key);

    expect(message, isNot(encodedMessage));
    
  });

  test('Message should be equal to decoded message when all letters are upper case', () {

    final message = 'SUPERSECRETMESSAGE';

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    final encodedMessage = encryptor.encode(message: message, key: key);

    final decodedMessage = encryptor.decode(encodedMessage: encodedMessage, key: key);

    expect(message, equals(decodedMessage));
    
  });

   test('Message should be equal to decoded message when some letter are upper case and others lower case', () {

    final message = 'SUPERsecretMESSAGE';

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    final encodedMessage = encryptor.encode(message: message, key: key);

    final decodedMessage = encryptor.decode(encodedMessage: encodedMessage, key: key);

    expect(message, equals(decodedMessage));
    
  });


  test('Lower case in message should not be modified', () {

    final message = 'SUPERsECRETMESSAGE';

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    final encodedMessage = encryptor.encode(message: message, key: key);

    expect(encodedMessage[5], equals('s'));
    
  });

  test('Message should be equal to encoded message when all letters in message are not upper case letters [A-Z]', () {

    final message = 'abcd13435{};';

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    final encodedMessage = encryptor.encode(message: message, key: key);

    expect(message, equals(encodedMessage));
    
  });
}
