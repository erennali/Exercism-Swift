enum TranslationError: Error {
  case invalidCodon
}

func translationOfRNA(rna strand: String) throws -> [String] {
  let codonMap: [String: String] = [
    "AUG": "Methionine",
    "UUU": "Phenylalanine", "UUC": "Phenylalanine",
    "UUA": "Leucine", "UUG": "Leucine",
    "UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
    "UAU": "Tyrosine", "UAC": "Tyrosine",
    "UGU": "Cysteine", "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"
  ]

  var proteins: [String] = []

  for startPosition in stride(from: 0, to: strand.count, by: 3) {
    let endPosition = min(startPosition + 3, strand.count)
    let codon = String(strand[strand.index(strand.startIndex, offsetBy: startPosition)..<strand.index(strand.startIndex, offsetBy: endPosition)])

    guard codon.count == 3, let aminoAcid = codonMap[codon] else {
      throw TranslationError.invalidCodon
    }

    if aminoAcid == "STOP" { break }
    proteins.append(aminoAcid)
  }

  return proteins
}
