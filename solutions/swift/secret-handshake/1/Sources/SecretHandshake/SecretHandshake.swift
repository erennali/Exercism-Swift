func commands(number: Int) -> [String] {
    var actions: [String] = []

    if (number & 1) != 0 {
        actions.append("wink")
    }
    if (number & 2) != 0 {
        actions.append("double blink")
    }
    if (number & 4) != 0 {
        actions.append("close your eyes")
    }
    if (number & 8) != 0 {
        actions.append("jump")
    }
    if (number & 16) != 0 {
        actions.reverse()
    }

    return actions
}