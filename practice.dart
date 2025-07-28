import 'dart:io';

void main()
{
  int flag = 0;
  print('\n\x1B[34m===REGISTRATION===\x1B[0m\n');

  stdout.write('\x1B[33mEnter your username: \x1B[0m');
  String? name = stdin.readLineSync();

  stdout.write('\x1B[33mEnter your password: \x1B[0m');
  String? pass = stdin.readLineSync();

  print('\n\x1B[32mRegistration successful for user:\x1B[0m $name');

  print('\n\x1B[34m===LOGIN===\x1B[0m\n');

do{
  stdout.write('\x1B[33mEnter your  username: \x1B[0m');
  String? logname = stdin.readLineSync();

  stdout.write('\x1B[33mEnter your password: \x1B[0m');
  String? logpass = stdin.readLineSync();

  if(logname == name && logpass == pass)
  {
    print('\x1B[32mLogin Successfully!\x1B[0m');
    flag == 0;
    break;
  }
  else
  {
    print('\n\x1B[31mLogin Failed! Please check your username and password.\x1B[0m\n');
    flag = 1;
  }
} while (flag == 1);

  print('\nHello, $name!');
} 