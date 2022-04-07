//
//  ContentView.swift
//  CSAgent
//
//  Created by Adel Chaibi on 01/03/2022.
//

import SwiftUI
import CoreData
import SpriteKit

struct ContentView: View {
    
    
    var scene: SKScene {
        let scene = SnakeScene()
        scene.size = CGSize(width: 630, height: 631)
       // scene.scaleMode = .fill
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 630, height: 631)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
