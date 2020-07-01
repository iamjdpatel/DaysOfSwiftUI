//
//  MissionView.swift
//  Moonshot
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [CrewMember]

    init(mission: Mission, astronauts: [Astronaut]) {
        
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
        
    }
    
    var body: some View {
    
        GeometryReader { geometry in
        
            ScrollView(.vertical) {
            
                VStack {
                    
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)

                    Text(self.mission.description)
                        .padding()

                    ForEach(self.astronauts, id: \.role) { crewMember in
                        
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            
                            HStack {
                                
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.primary, lineWidth: 1))
                                    .padding(.vertical, 8)
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                                
                            }
                            .padding(.horizontal)

                        }.buttonStyle(PlainButtonStyle())
                        
                    }
                    
                    Spacer(minLength: 25)
                    
                }
                
            }
            
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
        
    }
    
}


