enum NucleotideCountErrors: Error {
    case invalidNucleotide
}

class DNA {
    let strand: String

    init(strand: String) throws {
        for char in strand {
            if !"ACGT".contains(char) {
                throw NucleotideCountErrors.invalidNucleotide
            }
        }
        self.strand = strand
    }

    func counts() -> [String: Int] {
        var counts = ["A": 0, "C": 0, "G": 0, "T": 0]
        for nucleotide in self.strand {
            counts[String(nucleotide)]? += 1
        }
        return counts
    }
}