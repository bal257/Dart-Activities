import 'dart:io';

List<TeamMember> teamMembers = [];

List<Role> roles = [
  Role("UI Design", "Design the user interfaces and user experience."),
  Role("API Development", "Develops the backend APIs and server logic."),
  Role("Database Setup", "Configures and manages the database"),
  Role("System Development", "Implements the core system functionality."),
  Role("Testing", "Ensures product quality through testing.")
];

StorageBox<String> lastAssigned = StorageBox<String>();

void main() 
{
  inputTeamMembers();
  showMenu();
}

class Role 
{
  String title;
  String description;

  Role(this.title, this.description);

  String toString() => '$title: $description';
}

class TeamMember 
{
  String name;
  List<Role> assignedRoles = [];

  TeamMember(this.name);

  void clearRoles() => assignedRoles.clear();
}

class StorageBox<T>
{
  T? data;

  T store(T item)
  {
    data = item;
    return data as T;
  }

  T? retrieve()
  {
    return data;
  }
}

void inputTeamMembers()
{
  int num = 0;
  
   while (num < 3 || num > 5) 
   {
    stdout.write('How many team members (3-5)?: ');
    var input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) 
    {
      num = int.parse(input);
      if (num < 3 || num > 5) 
      {
        print('Number must be between 3 and 5!');
      }
    } 
    else 
    {
      print("You must enter a number.");
    }
  }

  for (int i = 1; i <= num; i++) 
  {
    String name = "";

    while (name.trim().isEmpty) 
    {
      stdout.write('Enter the name of team member $i: ');
      var nameInput = stdin.readLineSync();
      name = (nameInput ?? "");
      if (name.trim().isEmpty) 
      {
        print("Name cannot be empty.");
      }
    }
    teamMembers.add(TeamMember(name));
  }
}

void viewTeamMembers() 
{
  print("\nTeam Members:");
  for (var member in teamMembers) 
  {
    print("${member.name}");
  }
}

void viewRoles() 
{
  print("\nRoles:");
  for (var role in roles) 
  {
    print("- ${role.title}: ${role.description}");
  }
}

void assignRoles() 
{
  for (int i = 0; i < roles.length; i++) 
  {
    var member = teamMembers[i % teamMembers.length];
    var role = roles[i];
    member.assignedRoles.add(role);
    String assignmentMsg = "${role.title} assigned to ${member.name}";
    lastAssigned.store(assignmentMsg);
    print(assignmentMsg);
  }
}

void viewRoleAssignments() 
{
  print("\nRole Assignments:");
  for (var member in teamMembers) 
  {
    if (member.assignedRoles.isEmpty) 
    {
      print("${member.name}: No roles assigned");
    } 
    else 
    {
      for (var role in member.assignedRoles) 
      {
        print("${member.name} is assigned to: ${role.title} - ${role.description}");
      }
    }
  }
}

void viewLastAssigned() 
{
  print("\nLast Role Assigned:");
  final value = lastAssigned.retrieve();
  if (value == null) 
  {
    print('No role has been assigned yet.');
  } 
  else 
  {
    print(value);
  }
}

void showMenu()
{
  while (true) 
  {
    print('\n===Scrum Logic Menu===');
    print('1. View Team Members');
    print('2. View Roles');
    print('3. Assign Roles');
    print('4. View Role Assignments');
    print('5. View Last Role Assigned');
    print('6. Exit');
    
    stdout.write('Enter your choice: ');
    int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (choice) 
    {
      case 1:
        viewTeamMembers();
        break;
      case 2:
        viewRoles();
        break;
      case 3:
        assignRoles();
        break;
      case 4:
        viewRoleAssignments();
        break;
      case 5:
        viewLastAssigned();
        break;
      case 6:
        print("Goodbye!");
        return;
      default:
        print("Invalid choice.");
    }
  }
}