//
//  Prospect.swift
//  HotProspects
//
//  Created by JD on 03/07/20.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false

}

class Prospects: ObservableObject {
    
    @Published private(set) var people: [Prospect]

    static let saveKey = "SavedData"

    init() {
//        if let data = UserDefaults.standard.data(forKey: "SavedData") {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }

        self.people = []
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: "SavedData")
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
}

