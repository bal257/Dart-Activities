import 'dart:io';
Map<String, List<String>> assignments = {};
void main()
{
  int? num;
  List<String> teamMembers = [];
  Set<String> roles = {'UI Design', 'API Development', 'Database Setup', 'System Development', 'Testing'};
  int choice = 0;
  print('\n\x1B[34m=== Scrum Logic in Dart ===\x1B[0m\n');
  
  stdout.write('How many team members (3-5)?: '); 
  num = int.parse(stdin.readLineSync()!);

  for(int x = 1; x <= num; x++)
  {
    stdout.write('Enter the name of team member $x: '); 
    teamMembers.add(stdin.readLineSync()!);
  }

  do
  {
    print('\n\x1B[34m=== Scrum Logic Menu ===\x1B[0m\n');
    print('1. View Team Members');
    print('2. View Roles');
    print('3. Assign Roles');
    print('4. View Role Assignments');
    print('5. Exit');

    stdout.write('\nEnter your choice: '); 
    choice = int.parse(stdin.readLineSync()!);

    switch(choice)
    {
      case 1:
        print("\nTeam Members:\n");
        for(int x = 0; x < teamMembers.length; x++)
        {
          print('- ' + teamMembers[x]);
        }
        break;
      case 2: 
        viewRoles(roles);
        break;
      case 3:
        assignRoles(teamMembers, roles);
        break;
      case 4:
        viewAssignments(teamMembers);
        break;
      case 5:
        print('\n\x1B[33mExiting...\x1B[0m');
        exit(0);
      default:
        print('\n\x1B[31mInvalid choice! Please try again.\x1B[0m');
    }
  }while (choice != 5);
}

void viewRoles(roles)
{
  print('\nAvailable Roles:');
  for(String role in roles)
  {
    print('- $role');
  }
  return;
}

void assignRoles(List<String> teamMembers, Set<String> roles) {
  // lagyan value members
  for (var member in teamMembers) {
    assignments[member] = [];
  }

  int i = 0;
  for (var role in roles) {
    String member = teamMembers[i % teamMembers.length];
    assignments[member]!.add(role);
    i++;
  }
  print("\nAll roles have been assigned successfully.");
}

void viewAssignments(List<String> teamMembers) {
  print('\n===Role Assignments===\n');
  for (var member in teamMembers) {
    if (assignments[member] == null || assignments[member]!.isEmpty) {
      print('$member: No roles assigned');
    } else {
      for (var role in assignments[member]!) {
        print('$member is assigned to:\n $role ${roleDescription(role)}');
      }
    }
  }
}

String roleDescription(String role) {
  if (role == 'UI Design') {
    return '- Design the user interfaces and user experience.';
  } else if (role == 'API Development') {
    return '- Develops the backend APIs and server logic.';
  } else if (role == 'Database Setup') {
    return '- Configures and manages the database';
  } else if (role == 'System Development') {
    return '- Implements the core system functionality.';
  } else if (role == 'Testing') {
    return '- Ensures product quality through testing.';
  } else {
    return 'No description available.';
  }
}