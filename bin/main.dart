
import 'package:my_encryptor/my_encryptor.dart';

void main() {

    final message = 'ANDRE É LEGAL :)';

    print('Mensagem: $message');

    final encryptor = VigenereEncryptor();

    final key = encryptor.generateKey(keyLength: message.length);

    print('Chave gerada: $key');

    final encodedMessage = encryptor.encode(message: message, key: key);

    print('Mensagem criptografada: $encodedMessage');

    final decodedMessage = encryptor.decode(encodedMessage: encodedMessage, key: key);

    print('Mensagem Descriptografada: $decodedMessage');


}
