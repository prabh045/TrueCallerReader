//
//  RequestViewModel.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 02/09/21.
//

import Foundation

class RequestViewModel {
    var tenthCharacter = Box("")
    var everyTenthCharacter = Box("")
    var wordCount = Box(-1)
    var requestRepo: TenthCharRequestable
    var everyTenthCharRepo: EveryTenthRequestable
    var wordCountRepo: WordCountable
    
    init(requestRepo: TenthCharRequestable, everyTenthCharRepo: EveryTenthRequestable,  wordCountRepo: WordCountable) {
        self.requestRepo = requestRepo
        self.everyTenthCharRepo = everyTenthCharRepo
        self.wordCountRepo = wordCountRepo
    }
    
    func fetchTenthCharacter() {
        requestRepo.fetchTenthCharacter { (result) in
            switch result {
            case .success(let char):
                self.tenthCharacter.value = char
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchEveryTenthCharacter() {
        everyTenthCharRepo.fetchEveryTenthCharacter { (result) in
            switch result {
            case .success(let char):
                self.everyTenthCharacter.value = char
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchWordCount() {
        wordCountRepo.fetchWordCount { (result) in
            switch result {
            case .success(let wordCount):
                self.wordCount.value = wordCount
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
