import 'dart:io';
import 'dart:math';


void main() {
 print('Pick a program:');
 print('1) Day Planner');
 print('2) Square Finder');
 print('3) Shopping List');
 print('4) Guess Game');
 stdout.write('Enter 1-4: ');
 final choice = int.parse(stdin.readLineSync()!);
 if (choice == 1) dayPlanner();
 if (choice == 2) squareFinder();
 if (choice == 3) shoppingList();
 if (choice == 4) guessGame();
}


void dayPlanner() {
 stdout.write('Enter a day of the week: ');
 String day = (stdin.readLineSync() ?? '').toLowerCase();
 switch (day) {
   case 'monday':
     print('Plan: Do homework after school.');
     break;
   case 'tuesday':
     print('Plan: Sports practice in the afternoon.');
     break;
   case 'wednesday':
     print('Plan: Study group in the library.');
     break;
   default:
     print('Plan: Free day.');
 }
}


void squareFinder() {
 stdout.write('Enter a number: ');
 int x = int.parse(stdin.readLineSync()!);
 int result = getSquare(x);
 if (result > 100) {
   print('The square is pretty big: $result');
 } else {
   print('The square is $result');
 }
}


int getSquare(int n) {
 return n * n;
}


void shoppingList() {
 List<String> items = [];
 print('Type items for your shopping list. Type "done" to finish.');
 while (true) {
   stdout.write('Item: ');
   String input = stdin.readLineSync() ?? '';
   if (input.toLowerCase() == 'done') break;
   if (items.contains(input)) {
     print('Already in the list.');
   } else {
     items.add(input);
   }
 }
 print('Your list has ${items.length} item(s):');
 for (int i = 0; i < items.length; i++) {
   print('${i + 1}. ${items[i]}');
 }
}


void guessGame() {
 final random = Random();
 int secret = random.nextInt(10) + 1;
 print('Guess the number between 1 and 10. You have 3 tries.');
 for (int i = 1; i <= 3; i++) {
   stdout.write('Guess $i: ');
   int guess = int.parse(stdin.readLineSync()!);
   if (guess == secret) {
     print('Correct! You guessed it in $i tries.');
     return;
   } else if (guess < secret) {
     print('Too low.');
   } else {
     print('Too high.');
   }
 }
 print('Out of tries. The number was $secret.');
}


