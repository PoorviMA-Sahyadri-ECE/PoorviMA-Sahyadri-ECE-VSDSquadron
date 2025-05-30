# VSDSquadron FPGA Mini Board Projects

 This project showcases various experiments and digital designs implemented on the open-source VSDSquadron FPGA Mini Board. The aim is to explore FPGA development hands-on, deepen understanding of digital design concepts, and practice using both proprietary and open-source EDA tools.

---

##  About the Project

This repository contains RTL designs, simulations, and programming tasks created for the VSDSquadron FPGA Mini Board. It serves as a learning resource and playground for FPGA enthusiasts to experiment with logic circuits, simulation, synthesis, and programming.

---

## ✅ Current Focus

- Understanding the architecture of the VSDSquadron FPGA Mini Board  
- Implementing basic and intermediate logic circuits  
- Performing simulations and verifying design functionality  
- Flashing synthesized designs onto the FPGA board for real-world testing  

---

## 🛠️ Hardware Specifications

| Component       | Details                       |
| --------------- | -----------------------------|
| **FPGA**        | Gowin GW1N-LV1QN48C6/I5       |
| **Logic Cells** | 1,152                         |
| **Block RAM**   | 72 Kbits                      |
| **GPIO Pins**   | 34                            |
| **LEDs**        | 8 (including RGB support)     |
| **Switches**    | 4 Push Buttons                |
| **Clock**       | 27 MHz Crystal Oscillator     |
| **Programmer**  | Onboard USB to SPI/I2C Programmer |
| **USB Type**    | 2.0                           |

---

## 📝 Repository Structure
VSDSquadron-FPGA-Mini-board/

├── Part 1 Setup.md # Instructions for initial board setup
├── Part 2 First project.md # Steps for your first FPGA project
├── Part 3 Task given through Gmail.md # Additional task descriptions and implementations
└── README.md # Main project overview

Follow the instructions in Part 1 Setup.md to configure your development environment.

Proceed to Part 2 First project.md to create and run your first FPGA design.

Use Part 3 Task given through Gmail.md for additional tasks and exercises to enhance your skills.

System-level integration with peripherals.

---

#Project 1: UART Loopback
---
Objective
Implement a UART loopback mechanism where transmitted data is received back immediately to validate the UART block.

Description
Uses a single UART port for both TX and RX

No external hardware needed other than a USB-UART cable

![WhatsApp Image 2025-05-18 at 12 35 19 PM](https://github.com/user-attachments/assets/5b1f3a27-776b-475c-87cc-cda3bae35c73)


![photo of board](https://github.com/user-attachments/assets/b972e11a-5843-4319-8759-b9a3023e4086)

![image](https://github.com/user-attachments/assets/255d0845-7820-4f52-8c4c-f15b117fad59)


Loopback logic wires TX directly to RX in code
---
Test Procedure
Connect FPGA via USB

Open a serial terminal (e.g., PuTTY, screen)


Type characters — same characters should echo back

---

Project 2: UART Transmitter
---
Objective

Develop a UART TX module that transmits constant or programmed data.

Test Procedure
Serial terminal receives data from FPGA (e.g., “Hello UART”)

Ensure data rate, stop bits, and baud rate are matched


---

#Project 3: UART TX from Sensor Input
---
Objective
Transmit real-time sensor data via UART.

Hardware
Sensor 
FPGA board

USB-UART interface
Test
Stimulate the sensor
Observe terminal output

---

Project 4: UART-Controlled Display System
---
Goal

Send characters via UART and display them on a 7-segment or LCD module.
Architecture
Copy
Edit
Terminal --> FPGA UART RX --> Display Decoder --> 7-Segment/LCD

Project 5: UART-Controlled Actuator System
---
Goal
Control physical components like LEDs or motors via UART commands.

Example Commands
rust
Copy
Edit

Send: "LON"  --> Turns LED ON 

Send: "LOFF" --> Turns LED OFF

Tools Used

VSDSquadron FPGA Mini Board

PuTTY  for UART communication


---
.

🙌 Acknowledgements
---
Thanks to VLSI System Design for providing the FPGA board and learning resources.

👨‍💻 Author
---
Poorvi MA

Email: poorvii533@gmail.com

GitHub: https://github.com/PoorviMA-Sahyadri-ECE/PoorviMA-Sahyadri-ECE-VSDSquadron.git










