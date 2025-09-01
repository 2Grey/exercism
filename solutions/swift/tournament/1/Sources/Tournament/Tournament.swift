class Team: Hashable {
    let name: String

    var wins = 0
    var losses = 0
    var draws = 0

    var matchPlayed: Int { self.wins + self.losses + self.draws }
    var points: Int { self.wins * 3 + self.draws }

    init(name: String) {
        self.name = name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }

    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }

    func tallyString() -> String {
        var result = self.name
        result.append(String(repeating: " ", count: max(0, 31 - self.name.count)))
        result.append("|  \(self.matchPlayed) |  \(self.wins) |  \(self.draws) |  \(self.losses) |  \(self.points)")
        return result
    }
}

class Tournament {

    private enum Outcome: String {
        case win
        case loss
        case draw
    }

    private var teams = Set<Team>()

    func tally(_ input: String) -> String {
        self.teams.removeAll()

        input.split(separator: "\n").map( { String($0) }).forEach(gameOutcome(for:))

        var result: [String] = [self.tallyHeader()]

        for team in self.teams.sorted(by: { ($0.points, $1.name) > ($1.points, $0.name) }) {
            result.append(team.tallyString())
        }

        return result.joined(separator: "\n")
    }

    private func gameOutcome(for game: String) {
        let split = game.split(separator: ";").map { String($0) }
        guard split.count == 3 else { return }

        let lTeam = self.team(with: split[0])
        let rTeam = self.team(with: split[1])
        let outcome = Outcome(rawValue: split[2])

        switch outcome {
        case .win:
            lTeam.wins += 1
            rTeam.losses += 1
        case .loss:
            lTeam.losses += 1
            rTeam.wins += 1
        case .draw:
            lTeam.draws += 1
            rTeam.draws += 1
        default:
            break
        }

        self.teams.update(with:lTeam)
        self.teams.update(with: rTeam)
    }

    private func team(with name: String) -> Team {
        return self.teams.first(where: { $0.name == name }) ?? Team(name: name)
    }

    private func tallyHeader() -> String {
        return "Team                           | MP |  W |  D |  L |  P"
    }
}
