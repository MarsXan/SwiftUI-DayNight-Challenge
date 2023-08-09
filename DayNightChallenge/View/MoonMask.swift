//
//  MoonMask.swift
//  DayNightChallenge
//
//  Created by mohsen mokhtari on 8/9/23.
//

import SwiftUI

struct MoonMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        path.addPath(Circle().path(in: rect.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
            .offsetBy(dx: -50, dy: -10)))
        return path
    }
}
