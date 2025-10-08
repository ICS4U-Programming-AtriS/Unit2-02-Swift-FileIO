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

// Access the output file
guard let outputFile = FileHandle(forReadingAtPath: outputFilePath) else {
    print("CANNOT OPEN OUTPUT FILE")
    exit(1)
}

// Read the contents of the input file
let inputData = 1
// Create a list of all available lines
