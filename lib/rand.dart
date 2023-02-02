import 'dart:math';
void main() {
  Random random = new Random();
  int randomNumber = random.nextInt(20); // from 0 to 9 included
  print("Generated Random Number Between 0 to 9: $randomNumber");
}