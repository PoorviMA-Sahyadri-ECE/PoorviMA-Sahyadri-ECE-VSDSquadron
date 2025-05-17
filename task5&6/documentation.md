Theme 1: FPGA-Based UART-Controlled Display System

Project Overview
This project focuses on designing and implementing a real-time data visualization system using an FPGA. The primary goal is to receive serial data through UART from a host device (like a PC or microcontroller), process the data, and display it on an output device, such as a 7-segment display or an LCD. The project emphasizes reliable UART communication, efficient data decoding, and real-time display updates.

Objectives

Implement a UART receiver logic on an FPGA (Rx-only).

Decode incoming data (ASCII/hex) to displayable characters.

Interface with a 7-segment display or LCD module.

Optionally, develop a user interface on a PC terminal.

Achieve reliable real-time data reception and display.


System Requirements

Hardware:

VSDSquadron FPGA mini

7-segment display module or LCD


Software:

Ubuntu

Docklight


Functional Description

1. The UART module receives serial data from a host device.


2. The received data is buffered and checked for validity.


3. ASCII characters (like '0'–'9') are decoded into binary format.


4. The converted data is sent to the display driver.


5. The display driver updates the output in real time on the 7-segment display or LCD.



Architecture Diagram

[PC/Microcontroller] -> [UART TX] -> [FPGA UART RX] -> [Data Decoder] -> [Display Driver] -> [7-Segment/LCD Display]

Design Process

1. Requirements Analysis: Identify UART communication parameters, such as baud rate and data format (8 data bits, no parity, 1 stop bit - 8N1). Choose a suitable display device (7-segment or LCD).


2. Hardware Setup: Select the VSDSquadron FPGA mini as the platform. Establish a pipeline consisting of a UART receiver, data decoder, and display driver.


3. UART Receiver Implementation: Develop the UART module in Verilog or VHDL to receive data, convert it into parallel format, and ensure timing accuracy with start bit detection and bit sampling.


4. Data Decoding and Display Logic: Translate ASCII input into binary or segment patterns, which are then displayed using a controller. Integrate all components into a top-level module.


5. Testing and Validation: Connect the FPGA to a PC via a USB-to-UART converter. Use a serial terminal application (Docklight) to send data and verify real-time display updates.



Theme 2: UART-Controlled Actuator System using FPGA

Project Overview

This project aims to develop an FPGA-based system that receives control commands via UART and operates actuators like LEDs, motors, or relays. The primary objective is to interpret serial command strings and trigger the corresponding physical actions through FPGA GPIO pins, making it useful for automation and embedded prototyping.

Objectives

Implement a UART receiver on the FPGA.

Decode control commands (e.g., 'LED ON', 'MOTOR OFF').

Develop an FSM for command-based GPIO control.

Integrate and test actuators like LEDs, relays, or motors.

Enable real-time command execution through a serial interface.


System Requirements

Hardware:

VSDSquadron FPGA mini

Actuators: LEDs, relay module, DC motor with driver

UART interface via FTDI USB-to-Serial module

Breadboard and wires


Software:

Ubuntu

Docklight


Functional Description

1. Setup and Verification: Test the FPGA board with basic LED blinking to verify correct pin mapping.


2. UART Receiver Development: Implement a UART module to capture serial data with accurate baud rate handling and bit synchronization.


3. Command Decoding Logic: Develop an FSM to recognize valid command strings and generate control signals accordingly.


4. Actuator Control: Integrate GPIO control based on parsed commands, driving LEDs, relays, or motors.


5. Testing and Validation: Send control commands through a serial terminal and verify actuator responses in real time.



Architecture Diagram

[PC/Microcontroller] -> [UART TX] -> [FPGA UART RX] -> [Command Decoder (FSM)] -> [GPIO Control] -> [Actuators: LEDs/Motors/Relays]
