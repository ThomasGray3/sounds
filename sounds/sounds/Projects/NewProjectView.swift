//
//  NewProjectView.swift
//  Sounds
//
//  Created by Thomas Gray on 21/09/2025.
//

import SwiftUI

struct NewProjectView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var projectName: String = "Untitled Project"
    @State private var sampleRate: Int = 44100
    @State private var tempo: Int = 120
    
    var onCreate: (Project) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Project")
                .font(.title)
            
            TextField("Project Name", text: $projectName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 250)
            
            Picker("Sample Rate", selection: $sampleRate) {
                Text("44.1 kHz").tag(44100)
                Text("48 kHz").tag(48000)
                Text("96 kHz").tag(96000)
            }
            .frame(width: 250)
            
            HStack {
                Text("Tempo:")
                TextField("", value: $tempo, format: .number)
                    .frame(width: 60)
                    .textFieldStyle(.roundedBorder)
                Text("BPM")
            }
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Create") {
                    onCreate(Project(name: projectName, sampleRate: sampleRate, tempo: tempo))
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
            }
            .frame(width: 250)
        }
        .padding()
        .frame(width: 300)
    }
}

#Preview {
    NewProjectView() { _ in 
        
    }
}
