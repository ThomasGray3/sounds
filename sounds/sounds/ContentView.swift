//
//  ContentView.swift
//  Sounds
//
//  Created by Thomas Gray on 21/09/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var projectManager = ProjectManager()
    @State private var showingNewProjectDialog = false
    
    var body: some View {
        Group {
            if let project = projectManager.currentProject {
                VStack {
                    Text("🎶 Project: \(project.name)")
                        .font(.title2)
                    Text("Sample Rate: \(project.sampleRate) Hz")
                    Text("Tempo: \(project.tempo) BPM")
                }
            } else {
                Text("No project open")
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    showingNewProjectDialog = true
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)   // matches Safari size
                }
                .help("New Project")
            }
        }
        .sheet(isPresented: $showingNewProjectDialog) {
            NewProjectView { newProject in
                projectManager.currentProject = newProject
                
            }
        }
    }
}

#Preview {
    ContentView()
}
