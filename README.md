# 8-Point FFT Verilog

This repository provides a Verilog HDL implementation of an 8-point Fast Fourier Transform (FFT) for low-resource FPGAs, designed for signal processing tasks such as audio and speech analysis. The FFT is implemented with 8-bit fixed-point arithmetic.

## Project Overview
The 8-point FFT uses a radix-2 Decimation-in-Time (DIT) algorithm with a three-stage butterfly network. It processes 8-bit complex inputs to generate frequency-domain outputs, verified with impulse and sinusoidal test inputs.

### Modules
- `src/butterfly_twiddle.v`: Twiddle factors for FFT.
- `src/butterfly.v`: Single butterfly stage.
- `src/fft_8point.v`: 8-point FFT implementation.
- `testbenches/fft_8point_tb.v`: Testbench with impulse (127 at first sample) and sinusoidal inputs.

## Getting Started
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/fft-8point-verilog.git
   ```
2. **Add Modules**: Place Verilog files in `src/` and testbenches in `testbenches/`.
3. **Simulate**: Run `fft_8point_tb.v` in Vivado.
4. **Synthesize**: Target a low-resource FPGA.

## Directory Structure
```plaintext
fft-8point-verilog/
├── src/
│   ├── butterfly_twiddle.v
│   ├── butterfly.v
│   ├── fft_8point.v
├── testbenches/
│   ├── fft_8point_tb.v
├── README.md
├── .gitignore
```

## Contributing
Submit issues or pull requests for improvements or bug fixes.
