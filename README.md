# VHDL-Learning

## Open Source Tool Chain

### Installing GHDL
GHDL is opensource VHDL simulator.

Run below commands to install GHDL on ubuntu 18.4 machine.

```
sudo apt install -y git make gnat zlib1g-dev
git clone https://github.com/ghdl/ghdl
cd ghdl
./configure --prefix=/usr/local
make
sudo make install
```

### Simulating using GHDL

* check the syntax using below command

```
ghdl -s adder.vhd
```

* analyze the design file by running below command

```
ghdl -a adder.vhd
```

* analyze the test bench file by running below command

```
ghdl -a adder_tb.vhd
```

* run the test bench and generate the vcd file

```
ghdl -r adder_tb --vcd=adder_tb.vcd
```

* Display the waveform using gtkwave

```
gtkwave adder_tb.vcd
```

## HDLs for FPGA Design

This section documents learning from Hardware Description Languages for FPGA Design course. The directory `HDLs_For_FPGA_Design` contains all RTL files along with schematic and simulation waveforms.

* comparator - Example demonstrating structural, dataflow and behavioural modelling
* multiplexer - Example demonstrating Selected signal assignment, conditional assignment and process assignment
* good_if, bad_if - Example demonstratig inferred latch due to improper if condition
* d_latch, d_ff, shift_reg, counter - demonstrates sequential logic design
