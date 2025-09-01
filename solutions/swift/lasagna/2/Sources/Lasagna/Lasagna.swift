let expectedMinutesInOven = 40

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
  return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int) -> Int {
  return 2 * layers
}

func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
  return preparationTimeInMinutes(layers: layers) + remainingMinutesInOven(elapsedMinutes: elapsedMinutes) 
}
