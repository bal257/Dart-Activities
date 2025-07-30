import 'dart:io';

void main()
{
  int flag = 0; //for login failure
  String? name , pass; //for username and password

  print('\n\x1B[34m ===REGISTRATION===\x1B[0m\n'); //REGISTRATION message

 do{ //do while loop for username and password
  name = getUsername(name); //calls getUsername function

  if (name == null || name.isEmpty) { //check if username is empty
    print('\x1B[31mUsername cannot be empty!\n\x1B[0m');
    continue; // Prompt for username again
  }

  pass = getPassword(pass); //calls getPassword function

  if (pass == null || pass.isEmpty) { //check if password is empty
    print('\x1B[31mPassword cannot be empty!\n\x1B[0m');
    continue; // Prompt for password again
  }
  else if(pass.length < 8) //check if password length is less than 8
  {
    print("Password must be at least 8 characters long!\n");
    continue;
  }
  else if(!pass.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ) //check if password contains a special character
  {
    print("Password must contain at least one special character!\n");
    continue; // Prompt for password again
  }
  else if(!pass.contains(new RegExp(r'[A-Z]'))) //check if password contains an uppercase letter
  {
    print("Password must contain at least one uppercase letter!\n");
    continue; // Prompt for password again
  }
    else if(!pass.contains(new RegExp(r'[a-z]'))) //check if password contains a lowercase letter
  {
    print("Password must contain at least one lowercase letter!\n");
    continue; // Prompt for password again
  }

  } while (name == null || name.isEmpty || pass == null || pass.isEmpty || pass.length < 8 || !pass.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
 !pass.contains(new RegExp(r'[A-Z]')) || !pass.contains(new RegExp(r'[a-z]'))); // Loop until valid username and password are provided
  
  
  print('\n\x1B[32mRegistration successful for user:\x1B[0m $name'); //Registration successful message

  print('\n\x1B[34m     ===LOGIN===\x1B[0m\n'); //LOGIN message

do{
  stdout.write('\x1B[33mEnter your  username: \x1B[0m'); //Prompt for username
  String? logname = stdin.readLineSync();

  stdout.write('\x1B[33mEnter your password: \x1B[0m'); // Prompt for password
  String? logpass = stdin.readLineSync();

  if(logname == name && logpass == pass) //check if entered username and password match the registered ones
  {
    print('\n\x1B[32mLogin Successfully!\x1B[0m');
    flag = 0;
    break;
  }
  else //if entered username and password do not match
  {
    print('\n\x1B[31mLogin Failed! Please check your username and password.\n\x1B[0m\n');
    flag = 1;
  }
} while (flag == 1);

  print('\nHello, $name!');
}

String? getUsername(String? name) // Function to get username
{
  name = null;
  stdout.write('\x1B[33mEnter your username: \x1B[0m');
  return name = stdin.readLineSync();
}

String? getPassword(String? pass) // Function to get password
{
  pass = null;
  stdout.write('\x1B[33mEnter your password: \x1B[0m');
  return pass = stdin.readLineSync();
}