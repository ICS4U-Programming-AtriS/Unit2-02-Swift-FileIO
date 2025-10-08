//
//  FileIO.swift
//
//  Created by Atri Sarker
//  Created on 2025-10-07
//  Version 1.0
//  Copyright (c) 2025 Atri Sarker. All rights reserved.
//
// Programs that reads integers from a file.
// For each line,
// it sums up all the integers
// and writes the sum to an output file.

import Foundation

// Constant for the file path of the input file.
let inputFilePath = "./input.txt"
// Constant for the file path of the output file.
let outputFilePath = "./output.txt"

// Access the input file
guard let inputFile = FileHandle(forReadingAtPath: inputFilePath) else {
    print("CANNOT OPEN INPUT FILE")
    exit(1)
}

// Access the output file for writing
guard let outputFile = FileHandle(forWritingAtPath: outputFilePath) else {
    print("CANNOT OPEN OUTPUT FILE FOR WRITING")
    exit(1)
}

// Helper function for writing data
func writeToOutputFile(_ text: String) {
    if let data = text.data(using: .utf8) {
        outputFile.write(data)
    } else {
        print("Error: WRITING FAILED")
    }
}

// Read the contents of the input file
let inputData = inputFile.readDataToEndOfFile()

// Convert the data to a string
guard let inputString = String(data: inputData, encoding: .utf8) else {
    print("CANNOT CONVERT FILE DATA TO A STRING")
    exit(1)
}

// Create a list of all available lines
let listOfLines = inputString.components(separatedBy: .newlines)

// Loop through all the lines in the list
for line in listOfLines {
    // Check if the line is empty
    if line == "" {
        // If so, write an error message and continue
        writeToOutputFile("Error: No integers were found on this line.\n")
        continue
    }
    // Split the line into individual tokens
    let lineTokens = line.split(separator: " ")
    // Variable to store the sum of the integers
    var sum = 0
    // Initialize a flag variable
    // If it's "none",
    // it means that the line was processed without any errors.
    var errorFlagString = "none"

    // Loop through all the tokens in the line
    for token in lineTokens {
        // Convert the token to an integer and add it to the sum
        if let number = Int(token) {
            sum += number
        } else {
            // If the token is not an integer, break out of the loop
            // Activate the flag to write an error instead of the sum
            errorFlagString = "Error: \(token) is not an integer."
            break
        }
    }

    // Write the result
    if errorFlagString == "none" {
        // Write the sum if there were no errors
        writeToOutputFile("\(sum)\n")
    } else {
        // Write the error message if there was an error
        writeToOutputFile("\(errorFlagString)\n")
    }
}
