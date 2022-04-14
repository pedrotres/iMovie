//
//  String.swift
//  iMovie
//
//  Created by pedro tres on 14/04/22.
//

import Foundation

extension String {
    func returnYear() -> String {
        return String(self.dropLast(6))
    }
}
