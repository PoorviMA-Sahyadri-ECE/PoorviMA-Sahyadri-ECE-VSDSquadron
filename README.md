🔁 VSDSquadron FPGA UART Projects
This repository documents a series of UART-based projects implemented on the VSDSquadron FPGA Mini Board, ranging from basic loopback testing to UART-based actuator and display systems.

📦 Projects Overview
Project	Description
uart_loopback	Transmits and instantly receives the same data to test UART connectivity.
uart_tx	Sends data from FPGA to a PC or serial device using UART.
uart_tx_sense	Transmits sensor data through UART based on real-time inputs.
uart_display	Receives serial data and displays it on an output device.
uart_actuator	Receives serial commands and controls actuators like LEDs/motors.

🧠 Learning Outcomes
Verilog-based UART design

Sensor and actuator interfacing

Serial protocol communication

FPGA hardware implementation

System-level integration with peripherals

📁 Project 1: UART Loopback
🔧 Objective
Implement a UART loopback mechanism where transmitted data is received back immediately to validate the UART block.

🔍 Description
Uses a single UART port for both TX and RX.

No external hardware needed other than USB-UART cable.

Loopback logic wires TX directly to RX in code.


📊 Block Diagram
lua
Copy
Edit
     +----------+        +----------+
TX --|          |        |          |-- RX
     |  UART TX |--------|  UART RX |
     +----------+        +----------+
         FPGA UART Loopback Core
🧪 Test Procedure
Connect FPGA via USB.

Open a serial terminal (e.g., PuTTY or screen).

Type characters — same characters should echo back.

📁 Project 2: UART Transmitter
🔧 Objective
Develop a UART TX module that transmits constant or programmed data.

📊 Block Diagram
lua
Copy
Edit
+---------+      +-----------+
|  FPGA   | ---> | Terminal  |
|  UART   |      | (PC/USB)  |
+---------+      +-----------+
🧪 Test Procedure
Serial terminal receives data from FPGA (e.g., “Hello UART”).

Data rate, stop bits, and baud rate must be matched.

📁 Project 3: UART TX from Sensor Input
🔧 Objective
Transmit real-time sensor data via UART.

🧰 Hardware
Sensor (e.g., temperature, light)

FPGA board

USB-UART for monitoring

📊 Block Diagram
lua
Copy
Edit
+--------+     +---------+     +-----------+
| Sensor | --> |  FPGA   | --> | Terminal  |
+--------+     +---------+     +-----------+
🧪 Test
Stimulate sensor.

Observe value changes in terminal (e.g., ADC values or “Temp: 32C”).

📁 Project 4: UART-Controlled Display System
🎯 Goal
Send characters via UART and display them on 7-segment or LCD module.

📊 Architecture
rust
Copy
Edit
Terminal --> FPGA UART RX --> Display Decoder --> 7-Segment/LCD
📁 Project 5: UART-Controlled Actuator System
🎯 Goal
Control physical components like LEDs or motors via UART commands.

Example:
rust
Copy
Edit
Send: "LON"  --> Turns LED ON  
Send: "LOFF" --> Turns LED OFF
🔧 Tools Used
VSDSquadron FPGA Mini

Yosys, NextPNR, icestorm tools

GTKWave for simulation

PuTTY / minicom for serial communication

📽️ Demo Videos & Screenshots

⚙️ How to Run
bash
Copy
Edit
make clean
make build
sudo make flash
Use screen /dev/ttyUSBx 9600 to test UART

Adjust Makefile if device path differs

📌 Challenges & Solutions
Timing mismatch: Ensured UART baud matches PC terminal.

Loopback misread: Added debounce logic.

Sensor noise: Implemented averaging filter before UART TX.

📁 Repository Structure
css
Copy
Edit
├── uart_loopback/
│   ├── top.v
│   ├── Makefile
│   ├── VSDSquadronFM.pcf
├── uart_tx/
│   ├── top.v
...
├── docs/
│   ├── Block_Diagrams/
│   ├── Circuit_Diagrams/
│   ├── README.md
└── thumbnails/
