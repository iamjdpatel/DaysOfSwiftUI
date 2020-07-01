//
//  ContentView.swift
//  Shared
//
//  Created by JD on 01/07/20.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {

        NavigationView {
            
            List(missions) { mission in
                
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                  
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()    //.aspectRatio(contentMode: .fit)         //Both are same
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                    
                }
                
            }
            .navigationBarTitle("Moonshot")
            
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
