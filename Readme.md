# README

## Description
The `main.swift` file contains Swift code for performing OCR (Optical Character Recognition) using the Vision framework. It utilizes the `VNRecognizeTextRequest` class to recognize text in images.

## Prerequisites
- Xcode or Swift toolchain installed
- Basic knowledge of Swift programming language

## Usage
To use the `main.swift` code:
1. Open the file in a Swift-compatible development environment.
2. Ensure that the necessary dependencies and frameworks are imported, especially the Vision framework.
3. Modify the code as needed to specify the input image and customize the OCR process.
4. Run the code to perform OCR on the specified image.

## Generating an Executable
To generate an executable from the `main.swift` file using the Swift compiler (`swiftc`), follow these steps:
1. Open a terminal or command prompt.
2. Navigate to the directory containing the `main.swift` file.
3. Use the following command to compile the Swift code and generate an executable:

```
swiftc -o <executable_name> main.swift
```

   Replace `<executable_name>` with the desired name for the executable file.
4. After successful compilation, an executable file with the specified name will be created in the same directory.

## Running the Executable
Once the executable is generated, it can be run from the terminal or command prompt using the following command:

```./<executable_name> <image_path>```