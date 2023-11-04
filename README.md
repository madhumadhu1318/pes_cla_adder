
![pes logo](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/f4ca13aa-4f7c-4d09-9a3e-bc69b3227269)

## Implementation of Carry Look-Ahead Adder Model Simulation

#### Welcome to the Carry Look-Ahead Adder Design Model Simulation Repository!

# Overview
> This repository is your guide to successfully completing RTL (Register-Transfer Level) and GLS (Gate-Level Simulation) for a binary-to-gray conversion design model. Whether you're a hardware engineer, a student, or a curious tinkerer, this project will help you gain hands-on experience with digital logic design and simulation.

# Purpose
> The primary goal of this project is to provide you with a structured environment for simulating and validating the functionality of a Carry Look-Ahead Adder design at both the RTL and gate-levels. By following the provided instructions, you can gain insights into the workings of digital circuits, test your design, and verify its correctness.

# Introduction to Carry Look-Ahead Adder
> The adder produce carry propagation delay while performing other arithmetic operations like multiplication and divisions as it uses several additions or subtraction steps. This is a major problem for the adder and hence improving the speed of addition will improve the speed of all other arithmetic operations. Hence reducing the carry propagation delay of adders is of great importance. There are different logic design approaches that have been employed to overcome the carry propagation problem. One widely used approach is to employ a carry look-ahead which solves this problem by calculating the carry signals in advance, based on the input signals. This type of adder circuit is called a carry look-ahead adder.

## Prerequisites Installation - For Stage 1 (RTL-GLS Simulation)
Please enter the following commands in the terminal.
```
sudo apt update
sudo apt upgrade
sudo apt-get install gtkwave
git clone https://github.com/YosysHQ/yosys.git
cd yosys
sudo apt install make
sudo apt-get install build-essential clang bison flex  libreadline-dev gawk tcl-dev libffi-dev git  graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev
make config-gcc
make -j 4
```


<a name="Stage-1"></a>

## Stage 1 (RTL-GLS Simulation) - Table of contents

<details>
<summary>Introduction to Yosys , Iverilog , GTKWave</summary>
<br>
  
1) **Yosys** : Yosys is an open-source synthesis tool.
- It converts RTL (Register Transfer Level) descriptions written in HDL (Hardware Description Language) into optimized gate-level netlists for digital circuit designs.
- Inputs to Yosys include a liberty file (.lib), which describes the characteristics of the target technology library, and a design file written in an HDL.
- The output of Yosys is a synthesized netlist mapped with the provided technology library, which is used for further steps in the digital design flow, such as place and route.

2) **Iverilog** : Iverilog is an open-source Verilog simulation and synthesis tool 
- It allows designers to verify their digital designs using simulation and generate netlists for synthesis.
- Inputs to Iverilog include testbench and design files written in Verilog.
- The output of Iverilog is typically a VCD (Value Change Dump) file. VCD files store data related to simulation, such as signal value changes, and are used for waveform visualization and analysis.
  
3) **GTKWave** : GTKWave is an open-source waveform viewer.
- It provides graphical visualization of simulation results produced by digital design simulation tools like Iverilog.
- Inputs to GTKWave include VCD files, which store simulation data.
- The output of GTKWave is a graphical waveform view that helps designers debug and analyze the behavior of digital circuits during simulation.

**Simple block diagram for Iverilog Based Simulation Flow**
![iv](https://github.com/Pavan2280/pes_asic_class/assets/131603225/da9c25d9-c1dd-4f47-8e2e-edd5a839e3c8)

**Simple block diagram for Yosys and Logic Synthesis**
![y](https://github.com/Pavan2280/pes_asic_class/assets/131603225/96f84104-686e-4497-8c35-352a29b36268)

**Simple block diagram to Verify Synthesis**
![y2](https://github.com/Pavan2280/pes_asic_class/assets/131603225/5a3c649c-50c6-4795-8175-866ecd2e82a8)
[Back to Stage-1](#Stage-1)
</details>


<details>
<summary>RTL Simulation</summary>
<br>
  
> RTL simulation is primarily used for verifying the correctness of a digital design. It allows designers to test and debug their designs before they are implemented in hardware. This helps in catching and rectifying design errors early in the development process, which can save time and resources.

+ Command to exectue
```
iverilog pes_cla_adder.v pes_cla_adder_tb.v                                                                                                      
./a.out                                                                                                                                            
gtkwave pes_cla_adder_tb.vcd
```
![Screenshot 2023-10-18 182122](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/23377204-9df6-48a4-9c66-913708100a59)

![waveform final](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/1d5e537f-3aec-4a42-8dfe-4ab71fdff666)

[Back to Stage-1](#Stage-1)
</details>

<details>
<summary>RTL Synthesis</summary>
<br>
  
> RTL synthesis, which stands for Register-Transfer Level synthesis, is a crucial phase in the digital design process, specifically within the field of electronic design automation (EDA). RTL synthesis involves translating a high-level RTL description of a digital circuit (usually described in languages like VHDL or Verilog) into a gate-level representation that can be implemented in hardware.

+ Command to exectue
```
yosys                                                                                                                                                 
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog pes_cla_adder.v                                                                                                                   
synth -top pes_cla_adder                                                                                                                           
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib                                                                
write_verilog -noattr pes_cla_adder_net.v
show
```
![yosys](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/8def6204-6f3c-4f8a-a9c3-f0c2c1034899)
![yosys1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/f384ccba-2505-4523-b6ae-195a2fe1e9ba)
![yosys2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/51b687fd-c14b-4075-ba79-470232c1c506)
![wave](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/e3567ffe-d7b3-4d05-b0c8-52a8ba32e360)

[Back to Stage-1](#Stage-1)
</details>

<details>
<summary>GLS Simulation</summary>
<br>

> Gate Level Simulation (GLS) is a crucial step in the electronic design verification process, especially in the context of digital integrated circuits. It is used for post-synthesis verification to ensure that the synthesized design meets the desired functionality and timing requirements.

+ Command to exectue
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v pes_cla_adder_net.v pes_cla_adder_tb.v
./a.out
gtkwave pes_cla_adder_tb.vcd
```
![gls1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/ef5ccb1f-4a7c-4ca5-88b2-a4cb2f68f3af)
![gls2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/9ef4b9b5-35f3-4d95-b0a7-9a924b01fbe7)


[Back to Stage-1](#Stage-1)
</details>

## Prerequisites Installation - For Stage 2 (RTL2GDSII - OPENLANE)

#### Magic Installation
For magic installation please enter the following commands in the terminal.
```
sudo apt-get install m4
sudo apt-get install tcsh
sudo apt-get install csh
sudo apt-get install libx11-dev
sudo apt-get install tcl-dev tk-dev
sudo apt-get install libcairo2-dev
sudo apt-get install mesa-common-dev libglu1-mesa-dev
sudo apt-get install libncurses-dev
git clone https://github.com/RTimothyEdwards/magic
cd magic
./configure
sudo make
sudo make install
```
#### Ngspice Installation
For ngspice installation please enter the following commands in the terminal.
```
sudo apt install ngspice
```

#### Openlane-2 Installation

The original Documentation can be found here [OpenLane Installation](https://openlane.readthedocs.io/en/latest/getting_started/installation/installation_ubuntu.html)

For Opelane-2 installation please enter the following commands in the terminal.

#### Installing the pre-requisites
```
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git
```

#### Uninstall conflicting packages of docker if present
```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Install Docker using apt repository
+ Setup Docker's apt repository
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
+ Install other packages
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
+ Verify that the Docker Engine installation is successful by running the hello-world image.
```
sudo docker run hello-world
```
```
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot # REBOOT!
```
+ Checking the docker installation after reboot
```
docker run hello-world
```
```
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
```
#### Download and Install Openlane
Run these one after the other
```
git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
make
make test
```

<b name="Stage-2"></b>

## Stage 2 (RTL2GDSII - OPENLANE) - Table of contents

<details>
<summary>Introduction to Openlane ASIC Design Flow</summary>
<br>

![image](https://github.com/Pavan2280/pes_pd/assets/131603225/24e63c09-da0d-4da6-943c-f54d6abbda85)

#### Design Stages

1) **Synthesis**
   1. **yosys** - Yosys performs RTL synthesis, converting high-level RTL descriptions into gate-level netlists.
   2. **abc** - ABC is used for further optimization and technology mapping to enhance the gate-level design.
   3. **OpenSTA** - OpenSTA conducts static timing analysis to verify if the synthesized design meets timing constraints in the OpenLane flow.

2) **Floorplan & PND**
   1. **init_fp (Initial Floorplan)** - Floorplanning involves determining the initial placement and arrangement of various functional blocks or cells within the chip's       
   layout area.
   2. **ioplacer** - ioplacer is a tool used in the physical design process to place Input/Output (I/O) pads or pins on the chip's boundary.
   3. **pdn** - The PDN is responsible for distributing power (supply voltage) and ground (reference voltage) throughout the chip, ensuring that all components receive the       necessary power supply and maintain stable electrical operation.
   4. **tapcell** - A "tapcell" is a special type of cell used in digital integrated circuit design, particularly in standard cell libraries.It is typically used to create 
   tap connections for the bulk terminals in digital CMOS (Complementary Metal-Oxide-Semiconductor) designs.

3) **Placement**
   1. **Replace** - RePlace is a tool used in the OpenLane flow for cell placement optimization.It focuses on optimizing the placement of standard cells within the chip's   
   layout to achieve better area utilization, timing, and power efficiency.
   2. **Resizer** - Resizer is a tool employed during the physical design process to perform cell resizing and optimization.
   3. **OpenDP (Open Detailed Placement)** - OpenDP, or Open Detailed Placement, is a detailed placement tool used in OpenLane.It is responsible for the fine-grained 
   placement of cells, ensuring that they are precisely positioned within rows and tracks while adhering to design constraints and achieving optimal utilization of the chip's 
   layout area.
   4. **OpenPhysyn (Open Physical Synthesis)** - OpenPhysyn is a tool within OpenLane that performs physical synthesis tasks.It optimizes the logical and physical aspects of 
   the design simultaneously, improving the placement, power, area, and timing by considering both logic and physical information during the optimization process.

4) **CTS**
   1. **TritonCTS** - TritonCTS generates a clock distribution network.

5) **Routing**
   1. **FastRoute** - FastRoute is a global routing tool used in the physical design stage of ASIC chip design.
   2. **TritonRoute** - TritonRoute is a detailed or global routing tool used in the later stages of ASIC chip design, following placement and initial global routing.
   
6) **GDSII Generation**
   1. **Magic** - Magic is primarily a layout tool used for creating and editing IC layouts, and it is often used for digital CMOS design.
   2. **KLayout** - KLayout is primarily used for viewing, editing, and analyzing IC layouts but is not a layout creation tool like Magic.
   
8) **Checks**
   1. **CVC** - CVC is a tool primarily used for verification and debugging of digital designs.
   2. **Netgen** - Netgen is an open-source digital netlist comparison and LVS (Layout vs. Schematic) tool.

[Back to Stage-2](#Stage-2)
</details>

<details>
<summary>Creating folder and adding files</summary>
<br>

Create a new folder within OpenLane with the same name as your design file `pes_binary_to_gray_converter`.

Note `pes_binary_to_gray_converter` folder should have [config.json](https://github.com/Pavan2280/pes_binary_to_gray/blob/main/config.json), `pes_binary_to_gray_converter.v` and the `src` folder.

Make sure `src` folder should have these [Files](https://github.com/Pavan2280/pes_binary_to_gray/tree/main/src)

The `pdks` folder must have this [File](https://github.com/Pavan2280/pes_binary_to_gray/blob/main/sky130_fd_sc_hd.v)

![Screenshot from 2023-10-31 21-30-11](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/98f84586-8ac3-4e9c-afeb-583c57c075c0)

[Back to Stage-2](#Stage-2)
</details>

<details>
<summary>Interactive OpenLane flow</summary>
<br>

Open terminal and type the following commands.
```
cd OpenLane/ 
make mount 
./flow.tcl -interactive
package require openlane 0.9
prep -design pes_binary_to_gray_converter
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/d834210a-c527-4a73-85e2-937b7d7ffdf0)

[Back to Stage-2](#Stage-2)
</details>

<details>
<summary>Synthesis,Floorplan,Placement,CTS,Routing</summary>
<br>

**Synthesis**
+ Command to exectue
```
run_synthesis
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/f00db54b-1364-4534-be3d-49a99b4e1787)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/ea8c0ff0-879a-4b7e-a0e9-a117631c9ec2)

**Floorplan**
+ Command to exectue
```
run_floorplan
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/e7192afb-3c6e-49a3-b675-6a763883d5f1)

**Note we need to use libs.tech file so we need to gitclone this https://github.com/hwiiiii/sky130A into pdks folder**
```
git clone https://github.com/hwiiiii/sky130A
```

```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/2e13e098-36ee-4237-b77f-f86d0330b965)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/80d19995-0338-4577-b98d-402cff16c955)
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/27b8b2dc-2933-4e68-9919-5b9895a9fe86)

**Placement**
+ Command to exectue
```
run_placement
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/77dc5322-9815-452f-abd3-9a84d73fe1e2)

```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/79866612-19bf-49ed-8873-555fbd5c282e)

**CTS**
+ Command to exectue
```
run_cts
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/0f5f9ab2-d8f4-480f-afc3-a0dff3fed912)

**These reports generated are given below , after executing run_cts command**

![WhatsApp Image 2023-11-03 at 18 45 54_26baa361](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/de120007-2765-49a1-83c1-e188e784460d)

![WhatsApp Image 2023-11-03 at 18 45 55_db237259](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/4ca78b94-4070-4a14-800c-80afe1563e4c)

![WhatsApp Image 2023-11-03 at 18 45 55_f26bce5c](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/d2e83b70-4015-494d-b0e3-3fa22884fb61)

![WhatsApp Image 2023-11-03 at 18 45 55_e586ad61](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/34d9d341-e4b8-464f-b4a5-1ba37bf40674)

![WhatsApp Image 2023-11-03 at 18 45 56_96e020b8](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/483fa9f7-754a-41b1-8bce-1d588b4f5fb7)

![WhatsApp Image 2023-11-03 at 18 45 56_4c8b1dce](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/8083ed33-59d9-4c0c-8b27-fae5f7652061)

![WhatsApp Image 2023-11-03 at 18 45 56_a7f194f7](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/805faf92-eb03-43cf-93c3-d3022d94cec1)

![WhatsApp Image 2023-11-03 at 18 45 57_a033e87e](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/061941d1-bb0f-4918-af78-dd110656717d)

**Routing**
+ Command to exectue
```
run_routing
```
![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/65a665bf-d5ac-4d53-b207-1e2b5ef1c278)

```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![image](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/38a61ce2-30f4-4ab2-b970-b2cb9496a32e)

**These reports generated are given below , after executing run_routing command**

![WhatsApp Image 2023-11-03 at 18 07 23_0c24b3ce](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/b3adcca1-6916-42cf-b54d-311a0df3aa53)

![WhatsApp Image 2023-11-03 at 18 07 55_6d2c2127](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/ed50e830-5873-4f60-ab9b-d7e572856087)

![WhatsApp Image 2023-11-03 at 18 08 03_a453f791](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/ed55bf13-f553-4d13-ba35-d4c52a996e26)

![WhatsApp Image 2023-11-03 at 18 08 17_1775bd3d](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/26a7ee4c-dcf9-4463-8388-6264eef46cb0)

![WhatsApp Image 2023-11-03 at 18 10 53_57884b22](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/276452bd-3bda-481e-8a94-e6c8da972785)

![WhatsApp Image 2023-11-03 at 18 12 26_768d16e9](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/d104783c-0dc9-4064-ac68-9e45214fb9d7)

![WhatsApp Image 2023-11-03 at 18 12 37_b8e2f46b](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/9b4a4a07-95ee-4e13-9305-7538afffebd4)

![WhatsApp Image 2023-11-03 at 18 12 58_294b5666](https://github.com/Pavan2280/pes_binary_to_gray/assets/131603225/f369388f-dafa-4c67-946c-17a5a8739d29)

#### Statistics
- Internal Power = 1.39e-04 W
- Switching Power = 3.00e-05
- Leakage Power = 3.35e-10
- Total Power = 1.69e-04

[Back to Stage-2](#Stage-2)
</details>
