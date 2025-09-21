//
//  ProjectManager.swift
//  Sounds
//
//  Created by Thomas Gray on 21/09/2025.
//

import Foundation
import SwiftUI

struct Project {
    var name: String
    var sampleRate: Int
    var tempo: Int
}

class ProjectManager: ObservableObject {
    @Published var currentProject: Project?
}
