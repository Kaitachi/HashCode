Practice challenges for [HashCode](https://codingcompetitions.withgoogle.com/hashcode/archive).

Notes to self:
==============

How to create new framework / executable:

```
$ mkdir CommandLineTool
$ cd CommandLineTool
$ swift package init --type executable
$ cd Sources
$ mkdir CommandLineToolCore
```

```
# You should manually do this command to make sure nothing breaks...
$ mv input/* CommandLineTool/input/*
```

In /Package.swift:
```
let package = Package(
    name: "CommandLineTool",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CommandLineTool",
            dependencies: ["CommandLineToolCore"]
        ),
        .target(
            name: "CommandLineToolCore"
        ),
        .testTarget(
            name: "CommandLineToolTests",
            dependencies: ["CommandLineTool"]
        ),
    ]
)
```

In /Sources/CommandLineToolCore/CommandLineTool.swift:
```
import Foundation

public final class Hello {
	private let arguments: [String]

	public init(arguments: [String] = CommandLine.arguments) {
		self.arguments = arguments
	}

	public func run() throws {
		let file: String

		switch (arguments.count != 2) ? "a" : arguments[1] {
		case "b":
			file = "Sources/HelloCore/Rank.swift"
		case "c":
			file = "Sources/HelloCore/Suit.swift"
		default:
			file = "input/a_easy.in"
		}

		print("Will work with file: \(file)\n> Handing over to main...")

		readFile(file: file)

		// if let contents = try? String(contentsOfFile: file) {
		// 	print(contents)
		// }
	}
}
```


In /Sources/CommandLineTool/main.swift:
```
import CommandLineToolCore

let tool = CommandLineTool()

do {
    try tool.run()
} catch {
    print("Something went awfully wrong: \(error)")
}
```

```
$ swift build
```

Run this line whenever updating any package dependencies:
```
$ swift package update
```

Optional:
```
# Run this line if you want to generate an Xcode project:
$ swift package generate-xcodeproj
```

Function format:
```
/**
Summary goes here.

Discussion goes here.

- Author:
Kaitachi

- Important:
Important?

- Version:
0.0

- Parameters:
    - param1: Description for param1.
    - param2: Description for param2.

- Returns:
Returns?

- Throws:
Throws?

Detailed description goes here.
 */
```

Show TODO and ERROR comments in Xcode:
Under Project > Build Phases > New Run Script Phase, paste the following command:
```
TAGS="TODO:|FIXME:"
ERRORTAG="ERROR:"
find "${SRCROOT}" \( -name "*.h" -or -name "*.m" -or -name "*.swift" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$|($ERRORTAG).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/" | perl -p -e "s/($ERRORTAG)/ error: \$1/"
```


*Remember to replace `CommandLineTool` with the desired filename!

HUGE thanks to John Sundell from [Swift by Sundell](https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager) for his awesome walkthrough.
