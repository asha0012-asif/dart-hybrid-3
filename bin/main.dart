import "dart:convert" as convert;

void main(List<String> arguments) {
  String jsonString = """
[
  {"id":1, "firstName":"Asif", "lastName":"Ashadullah", "email":"asif.ashadullah@algonquincollege.com"},
  {"id":2, "firstName":"Ayoub", "lastName":"Sedrine", "email":"ayoub.sedrine@algonquincollege.com"},
  {"id":3, "firstName":"Erencan", "lastName":"Toprak", "email":"erencan.toprak@algonquincollege.com"},
  {"id":4, "firstName":"Edan", "lastName":"Hyde", "email":"edan.hyde@algonquincollege.com"},
  {"id":5, "firstName":"Brodie", "lastName":"Lewis", "email":"brodie.lewis@algonquincollege.com"}
]
""";

  // Decode the JSON string array
  List<dynamic> decodedList = convert.jsonDecode(jsonString);

  // Convert decoded JSON to a List of Maps
  List<Map<String, dynamic>> people =
      List<Map<String, dynamic>>.from(decodedList);

  // Create a Students object
  Students students = Students(people);

  print("Original List (result after output method):\n");
  students.output();

  // Sort by last name
  print("Sorted List By Last Name (result after sort method):\n");
  students.sort("lastName");

  // Add a new student
  Map<String, dynamic> newStudent = {
    "id": 6,
    "firstName": "Berkcan",
    "lastName": "Alankoy",
    "email": "berkcan.alankoy@algonquinlive.com"
  };

  print("Add to List (result after plus method):\n");
  students.plus(newStudent);

  // Remove a field from the list (ex. email)
  print("Remove from List (result after remove method):\n");
  students.remove("email");
}

class Students {
  List<Map<String, dynamic>> people;

  Students(this.people);

  sort(String fieldName) {
    people.sort(
        (personA, personB) => personA[fieldName].compareTo(personB[fieldName]));
    output();
  }

  output() {
    for (var person in people) {
      person.forEach((key, value) {
        print(
            "${key[0].toUpperCase() + key.substring(1)}: $value"); // to format nicely
      });
      print("");
    }
    print("----------------------------------------");
  }

  plus(Map<String, dynamic> person) {
    people.add(person);
    output();
  }

  remove(String field) {
    people
        .forEach((person) => person.removeWhere((key, value) => key == field));

    output();
  }
}
