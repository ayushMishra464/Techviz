
# TechViz

TechViz is an innovative application designed to assist visually impaired individuals in navigating their surroundings using a combination of object detection and sensor modes. This app is part of a larger project that includes a wearable wristband equipped with various sensors and a camera module to provide real-time information to the user through audio signals.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [API](#api)
- [Contributing](#contributing)

## Overview

TechViz aims to make daily tasks easier for visually impaired individuals by providing a way to detect objects and obstacles in their environment. The app communicates with a wearable device that uses various sensors and a camera to gather data and relay it to the user via audio signals.

## Features

- **Multiple Modes**: Switch between Object Detection, Sensor Mode, and Object Detection with Sensor Mode.
- **Adjustable Sensor Range**: Customize the sensor detection range to suit different environments.
- **Audio Feedback**: Provides real-time audio feedback about the surroundings.
- **Integration with AI**: Includes integration with ChatGPT and Google Assistant for enhanced interaction.
- **Customizable Settings**: Users can update distance thresholds and other sensor settings through the app.
- **Portable Camera Module**: The camera module can be detached from the device and placed anywhere within a 3-meter range. 

## Usage

### Running the Flask Server

1. Navigate to the server directory:

    ```sh
    cd server
    ```

2. Install the required Python packages:

    ```sh
    pip install -r requirements.txt
    ```

3. Start the Flask server:

    ```sh
    python app.py
    ```

### Using the App

1. Launch the app on your Android device or emulator.
2. Select the desired mode from the dropdown.
3. Adjust the sensor range if in Sensor Mode or Object Detection with Sensor Mode.
4. Press "Start" to begin object detection or sensor-based detection.
5. Press "End" to stop the detection.
6. Use the "Scan Your Room" button to perform a room scan.
7. Access the "About Us" page from the bottom navigation bar for more information about the project and team.

## API

The Flask server exposes a `/execute` endpoint that the app communicates with to execute commands on the server.

### Endpoint

- **POST** `/execute`
    - **Request Body**: JSON object containing the command to be executed and optionally the sensor range.
    - **Response**: JSON object containing the output and error messages from the command execution.

## Contributing

We welcome contributions from the community. Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with descriptive messages.
4. Push your changes to your forked repository.
5. Create a pull request to the main repository.
