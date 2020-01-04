//
//  Error.swift
//  Satellites-terminal
//
//  Created by Kaitachi on 03.01.20.
//

import Foundation

// Errors that could take place whilst loading game file.
enum FileError: Error {
	case missingFile
	case invalidInput(section: String, line: Int)
}
