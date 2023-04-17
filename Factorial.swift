import Foundation
import Glibc
//
//  FileIO.swift
//
//  Created by Alex De Meo
//  Created on 2023/02/11
//  Version 1.0
//  Copyright (c) 2023 Alex De Meo. All rights reserved.
//
// This program calculates reverses a string

// creating constants and variables
var errorMessage = ""

// Defining the file paths
let inputFile = "input.txt"
let outputFile = "output.txt"

// opening the input file for reading
guard let input = FileHandle(forReadingAtPath: inputFile) else {
    print("Error: Cannot open input file.")
    exit(1)
}

// opening the output file for writing
guard let output = FileHandle(forWritingAtPath: outputFile) else {
    print("Error: Cannot open output file.")
    exit(1)
}

// Reading contents of input file
let inputData = input.readDataToEndOfFile()

// Converting data to a string
guard let inputString = String(data: inputData, encoding: .utf8) else {
    print("Error: Cannot convert data to string.")
    exit(1)
}

// Splitting string into separate lines
let lines = inputString.components(separatedBy: .newlines)

for line in lines{
    if let number = Int(line) {
        let outputData = String("\(line)! = \(recFactorial(number))\n")
        output.write(outputData.data(using: .utf8)!)
    } else {
        let outputData = String("Error: \(line) is not valid for this program\n")
        output.write(outputData.data(using: .utf8)!)
    }
}

func recFactorial(_ num: Int) -> Int {
    if (num <= 1) {
        return 1
    } else {
        return num * recFactorial(num - 1) 
    }
}