//
//  Game.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 03.01.20.
//

import Foundation

public struct Game {
	// MARK: - Problem-Based Constants
	/// Simulation's time limit.
	let timeLimit: Int

	/// List of satellites for simulation.
	let satellites: [Satellite]

	/// List of albums containing landmarks for simulation.
	let albums: [Photographs]

	// MARK: - Game Variables
	/// Current timeframe within the game.
	var currentTime: Int = 0
}
