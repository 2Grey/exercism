struct BeerSong {
    let numberOfBeerBottles: Int

    func generateVersesOfBeerSong() -> String {
        var result: [String] = []
        if numberOfBeerBottles > 0 {
            for count in (1...self.numberOfBeerBottles).reversed() {
                if count == 1 {
                    result.append("\(count) bottle of beer on the wall, \(count) bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.")
                } else {
                    let elapsed = count - 1
                    let elapsedText = (elapsed == 1) ? "\(elapsed) bottle" : "\(elapsed) bottles"
                    result.append("\(count) bottles of beer on the wall, \(count) bottles of beer.\nTake one down and pass it around, \(elapsedText) of beer on the wall.")
                }
            }
        }

        result.append("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")
        return result.joined(separator: "\n\n")
    }
}
