enum Bearing {
    case north, east, south, west
}

class SimulatedRobot {
    var bearing: Bearing
    var x: Int
    var y: Int

    var state: (x: Int, y: Int, bearing: Bearing) {
        return (x, y, bearing)
    }

    init(x: Int, y: Int, bearing: Bearing) {
        self.x = x
        self.y = y
        self.bearing = bearing
    }

    func move(commands: String) {
        for command in commands {
            switch command {
            case "L":
                switch bearing {
                case .north: bearing = .west
                case .west:  bearing = .south
                case .south: bearing = .east
                case .east:  bearing = .north
                }
            case "R":
                switch bearing {
                case .north: bearing = .east
                case .east:  bearing = .south
                case .south: bearing = .west
                case .west:  bearing = .north
                }
            case "A":
                switch bearing {
                case .north: y += 1
                case .south: y -= 1
                case .east:  x += 1
                case .west:  x -= 1
                }
            default:
                continue
            }
        }
    }
}