//
//  LoadFile.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 02.01.20.
//

import Foundation

public func LoadFile(_ file: String) throws -> Game {
	do {
		let contents = try String(contentsOfFile: file)
		var lines = contents.components(separatedBy: "\n")
		let lineCount = lines.count

		// NOTE: This section is game-specific and should be revised for subsequent games.
		// It loads up the game according to the specifications of how the file should be structured.

		// SECTION 1 - Loading time limit for simulation.

		// Time limit
		guard let timeLimit = Int(lines.removeFirst()) else {
			throw FileError.invalidInput(section: "Time", line: lineCount - lines.count)
		}

		// SECTION 2 - Loading Satellites.

		var satellites = [Satellite]()

		// Satellite count
		guard let satelliteCount = Int(lines.removeFirst()) else {
			throw FileError.invalidInput(section: "Satellites", line: lineCount - lines.count)
		}

		// For each satellite...
		for _ in (0 ..< satelliteCount) {
			let l = lines.removeFirst().split(separator: " ").map({ Int($0)! })
			let satellite = Satellite(location: (lat: l[0], lon: l[1]), velocity: l[2], maxDelta: l[3], maxOrient: l[4])

			satellites.append(satellite)
		}

		// SECTION 3 - Loading image collections.

		var albums = [Photographs]()

		// Collections count
		guard let albumCount = Int(lines.removeFirst()) else {
			throw FileError.invalidInput(section: "Collections", line: lineCount - lines.count)
		}

		// For each collection...
		for _ in (0 ..< albumCount) {
			var landmarks = [Landmark]()
			var timeframes = [Timeframe]()

			// Collection metadata
			let l = lines.removeFirst().split(separator: " ").map({ Int($0)! })

			// For each Landmark...
			for _ in (0 ..< l[1]) {
				let line = lines.removeFirst().split(separator: " ").map({ Int($0)! })
				let landmark = Landmark(location: (lat: line[0], lon: line[1]))

				landmarks.append(landmark)
			}

			// For each Timeframe...
			for _ in (0 ..< l[2]) {
				let line = lines.removeFirst().split(separator: " ").map({ Int($0)! })
				let timeframe = (start: line[0], end: line[1])

				timeframes.append(timeframe)
			}

			let album = Photographs(value: l[0], locations: landmarks, timings: timeframes)

			albums.append(album)
		}

		// Wrap-up & Go
		return Game(timeLimit: timeLimit, satellites: satellites, albums: albums)
	} catch {
		throw error
	}
}
