# Simple Pipelined Processor

This project was originally for the COMP3211 Computer Architecture course at UNSW. 
The aim of the project was to design a simple pipelined processor. Due to the online-transition, currently only three instructions are designed and implemented. These include:

- ```LW Rt, d(Rs)```: Loads a 32-bit word from data memory with address specified by ```d(Rs)``` and store it in ```Rt```

- ```TG Rd, Rs, Rt```: Generates a tag with data (```Rs```) and signals (```Rt```) then stores in ```Rd```
- ```CMP Rd, Rs, Rt```: Compares ```Rs``` with ```Rt``` and stores results in ```Rd```; Result is one when equal, zero otherwise

Project status:
- The processor detects and deals with data hazard by having a forwarding unit used to forward tag_generator’s result and write back result to execution stage and a hazard detection unit to detect LUH and stalls the pipeline.
- Stage registers for the processor include IFID, IDEX, EXMEM, MEMWB