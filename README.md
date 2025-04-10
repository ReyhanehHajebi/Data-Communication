# Data-Communication
📚 Overview: Data Communication Course Summary
The Data Communication course introduces the foundational principles and practical techniques used in modern digital communication systems. It focuses on how data is encoded, transmitted over channels, and decoded on the receiving end—often in the presence of noise or transmission errors.

Key concepts covered in the course include:

Data Encoding & Compression: Efficiently representing information for transmission.

Error Detection & Correction: Ensuring accurate data reception.

Noise Modeling: Simulating real-world imperfections in transmission.

Transmission Protocols: Simulating sender-receiver behavior.

This repository contains two coursework assignments—CA1 and CA2—each targeting different aspects of data communication.

🧪 DC-CA1: Using Lloyds algorithm for source quantization with Gaussian distribution(Python)
This assignment provides a simple simulation of data transmission using Python. It introduces the core structure of digital communication:

A sender that prepares data for transmission.

A simulated channel that may modify the data.

A receiver that interprets the received bits.

While basic, this simulation teaches important concepts such as bitwise operations, manual protocol design, and simulating communication between two endpoints.

💡 This is often the first step toward understanding how actual network protocols operate.

🧪 DC-CA2: Source coding and network coding (MATLAB)
The second assignment is a comprehensive simulation of an advanced digital communication system using MATLAB. It integrates three key components of reliable data transmission:

Convolutional Encoding (convolutional_encoder.m):
Adds redundancy to the data to help detect and correct errors at the receiver end.

Viterbi Decoding (viterbi_decoder.m):
A dynamic programming algorithm that recovers the most likely original message from a noisy transmission.

Huffman Coding (huffman_coding.m):
A compression method that reduces the size of the message by assigning shorter codes to more frequent symbols.

Noise Simulation (noise.m) & Final Integration (last_part.m):
Adds artificial noise to test how robust the encoding/decoding process is and demonstrates the full transmission pipeline.

💡 This assignment mimics how real-world systems (like mobile phones or satellite communication) transmit data while minimizing errors and bandwidth.

🎓 Educational Value
These projects together illustrate the end-to-end lifecycle of data in a communication system, from encoding and compression to transmission, error correction, and decoding.

By completing both, students gain practical understanding of:

Building basic transmission models

Protecting data using error-correcting codes

Compressing and encoding data for efficiency

Handling real-world challenges like noise and limited bandwidth

