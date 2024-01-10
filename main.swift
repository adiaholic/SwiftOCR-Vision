import Foundation
import Vision
import CoreGraphics

// Access command line arguments
let arguments = CommandLine.arguments

// Skip the first argument, which is the path to the executable
guard arguments.count > 1, let imagePath = arguments.dropFirst().first else {
    print("Please provide the path to the image as an argument.")
    exit(0)
}

// Load the image from the provided path
let imageURL = URL(fileURLWithPath: imagePath)
guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, nil),
      let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
    print("Failed to load the image from the provided path.")
    exit(0)
}

// Perform text recognition using Apple's Vision framework
let request = VNRecognizeTextRequest { request, error in
    guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
        print("Text recognition failed with error: \(error?.localizedDescription ?? "Unknown error")")
        exit(0)
    }

    var boundingBoxData: [[String: Any]] = []
    
    for (_, observation) in observations.enumerated() {
        guard let topCandidate = observation.topCandidates(1).first else { continue }
        print(topCandidate.string)

        // Extract bounding box data
        let boundingBox = observation.boundingBox

        let data: [String: Any] = [
            "word_num": topCandidate.string.split(separator: " ").count,
            "left": (boundingBox.origin.x),
            "top": (boundingBox.origin.y),
            "width": (boundingBox.size.width),
            "height": (boundingBox.size.height),
            "conf": observation.confidence, // Replace with actual confidence value if available
            "text": topCandidate.string
        ]
        
        boundingBoxData.append(data)
    }
    
    // Write bounding box data to file
    let boxDataFileURL = URL(fileURLWithPath: "box_data.txt")
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: boundingBoxData, options: .prettyPrinted)
        try jsonData.write(to: boxDataFileURL, options: .atomic)
    } catch {
        print("Failed to write bounding box data to file: \(error.localizedDescription)")
    }
}


let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
do {
    try handler.perform([request])
} catch {
    print("Failed to perform text recognition with error: \(error.localizedDescription)")
    exit(0)
}