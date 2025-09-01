let animals = [ "cow", "goat", "dog", "cat", "bird", "spider", "fly" ]
let seconds = [
    "I don't know how she swallowed a cow!",
    "Just opened her throat and swallowed a goat!",
    "What a hog, to swallow a dog!",
    "Imagine that, to swallow a cat!",
    "How absurd to swallow a bird!",
    "It wriggled and jiggled and tickled inside her.",
]

func verse(_ count: Int) -> String {
    if count == 8 { return horseSong() }

    var results: [String] = []

    let firstCount = animals.count - count
    var animal = animals[firstCount]
    results.append("I know an old lady who swallowed a \(animal).")

    let isNeedToPreLast = count > 2
    if count > 1 {
        results.append(seconds[firstCount])
        for idx in 2...count {
            let newAnimal = animals[firstCount + idx - 1]
            if isNeedToPreLast, idx + 1 == count {
                results.append("She swallowed the \(animal) to catch the \(newAnimal) that wriggled and jiggled and tickled inside her.")
            } else {
                results.append("She swallowed the \(animal) to catch the \(newAnimal).")
            }
            animal = newAnimal
        }
    }

    results.append("I don't know why she swallowed the \(animals.last!). Perhaps she'll die.")

    return results.joined(separator: "\n")
}

func song() -> String {
    Array(1...8).map({ verse($0) }).joined(separator: "\n\n")
}

private func horseSong() -> String {
    "I know an old lady who swallowed a horse.\n" + "She's dead, of course!"
}
