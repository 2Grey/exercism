func dartScore(x: Double, y: Double) -> Int {
  let d = (x * x + y * y).squareRoot()
  if d <= 1 { return 10; }
  if d <= 5 { return 5; }
  if d <= 10 { return 1;}
  return 0;
}