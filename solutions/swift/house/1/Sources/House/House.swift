struct Action {
    let who: String
    let what: String
}

let actions = [
    Action(who: "horse and the hound and the horn", what: "belonged to"),
    Action(who: "farmer sowing his corn", what: "kept"),
    Action(who: "rooster that crowed in the morn", what: "woke"),
    Action(who: "priest all shaven and shorn", what: "married"),
    Action(who: "man all tattered and torn", what: "kissed"),
    Action(who: "maiden all forlorn", what: "milked"),
    Action(who: "cow with the crumpled horn", what: "tossed"),
    Action(who: "dog", what: "worried"),
    Action(who: "cat", what: "killed"),
    Action(who: "rat", what: "ate"),
    Action(who: "malt", what: "lay in"),
    Action(who: "house", what: "")
    ]

func verse(_ count: Int) -> String {
    var verse = actions[(actions.count - count - 1)...]
        .reduce("") { $0 + "the \($1.who)\nthat \($1.what) " }
    verse.removeLast(7)
    return "This is \(verse) that Jack built."
}

func recite() -> String {
    (0..<actions.count).map(verse).joined(separator: "\n\n")
}
