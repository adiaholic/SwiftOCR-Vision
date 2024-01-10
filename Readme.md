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

```./<executable_name> <image_path> <box_data_text_file_path>```

Replace <executable_name> with the actual name of the generated executable file, <image_path> with the path to the input image, and <box_data_text_file_path> with the absolute path for the output box data in the appropriate format.

To make the generated executable file executable, you would need to run the following command in the terminal or command prompt:

```chmod +x <executable_name>```

Replace <executable_name> with the actual name of the generated executable file. This command grants the execute permission to the specified file, allowing it to be run as an executable.