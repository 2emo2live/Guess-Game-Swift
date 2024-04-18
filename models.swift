struct Database {
    var embeddings: [String: [Double]]
    
    func loadData(filename: String) {
        //TODO: write loading
    }    

    func getWord(ind: Int) -> String {
        let keys = [String](embeddings.keys) 
        return keys[ind]
    }

    func computeDistance(word1: String, word2: String) -> Double {
        //Returns cosine similarity
        let vec1 = embeddings[word1], vec2 = embeddings[word2]

        return { (a: [Double], b:[Double]) -> Double in
            var dot = 0.0, normA = 0.0, normB = 0.0
            for i in 0..<a.count {
                dot += a[i]*b[i]
                normA += a[i]*a[i]
                normB += b[i]*b[i]
            } 
            normA = normA.squareRoot()
            normB = normB.squareRoot()
            return dot / (normA * normB)
        } (vec1!, vec2!)
    }
}

struct GameInfo {
    let hiddenWord: String
    var attempts: [String: Double]
}

struct Statistics {
    var prevGames: [String: String]
    var stat: [String: String] {
        //just for trying to implement computed property; not sure if necessary
        get {
            return prevGames //TODO: return only part
        }
        set(newGame) {
            for (key, val) in newGame {
                prevGames[key] = val
            }
        }
    }
}

