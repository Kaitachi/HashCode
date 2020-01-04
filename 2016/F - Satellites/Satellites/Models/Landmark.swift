//
//  Landmark.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 03.01.20.
//

import Foundation

struct Landmark {
	// MARK: - Problem-Based Constants
	/// Landmark's latitude and longitude.
	let location: Coordinate

	// MARK: - Game Variables
	/// Landmark's photographed status.
	var isPhotographed: Bool = false
}
