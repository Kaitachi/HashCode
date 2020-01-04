//
//  Satellite.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 02.01.20.
//

import Foundation

struct Satellite {
	// MARK: - Problem-Based Constants
	/// Satellite's current latitude and longitude (measured in arcseconds).
	var location: Coordinate

	/// Satellite's velocity (measured in arcseconds per turn).
	let velocity: Int

	/// Satellite's maximum orientation change in each dimension (measured in arcseconds per turn).
	let maxDelta: Int

	/// Satellite's maximum orientation value in each dimension (measured in arcseconds).
	let maxOrient: Int
}
