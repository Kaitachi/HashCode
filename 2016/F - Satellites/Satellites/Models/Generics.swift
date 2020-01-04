//
//  Generics.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 02.01.20.
//

import Foundation

// MARK: - Custom data types
/// Used to represent a physical coordinate around the planet (as latitude/longitude ordered pair).
typealias Coordinate = (lat: Int, lon: Int)

/// Starting and ending time range used to enable/disable certain features.
typealias Timeframe = (start: Int, end: Int)

// MARK: - Custom extensions
extension Int {
	// TODO: Need to implement functions that will take care of handling addition/subtraction for Coordinates!
}

extension Int {
	// TODO: Take care of things that would simplify time calculations with Timeframe?
}
