func toRna(_ dna: String) -> String {
  var rna = ""
  for letter in dna {
    switch letter {
    case "C":
      rna += "G"
    case "G":
      rna += "C"
    case "T":
      rna += "A"
    case "A":
      rna += "U"
    default:
      return ""
  }
    
  }
  
  return rna
}
