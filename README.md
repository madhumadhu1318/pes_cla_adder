
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
   
7) **Checks**
   1. **CVC** - CVC is a tool primarily used for verification and debugging of digital designs.
   2. **Netgen** - Netgen is an open-source digital netlist comparison and LVS (Layout vs. Schematic) tool.

[Back to Stage-2](#Stage-2)
</details>

<details>
<summary>Creating folder and adding files</summary>
<br>

Create a new folder within OpenLane with the same name as your design file `pes_cla_adder`.

Note `pes_cla_adder` folder should have [config.json](https://github.com/madhumadhu1318/pes_cla_adder/blob/main/config.json), `pes_cla_adder.v` and the `src` folder.

Make sure `src` folder should have these 

The `pdks` folder must have this [File](https://github.com/madhumadhu1318/pes_cla_adder/blob/main/sky130_fd_sc_hd.v)

![Screenshot 2023-11-04 163829](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/e3fe8e44-d3cf-4ec5-a9ee-81a796cebd89)


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
prep -design pes_cla_adder
```
![0 001](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/128e3204-49b9-4f42-ba29-e22151ddafd1)



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
![0 1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/43aad3aa-2f65-4cfe-9f79-5b345bedca31)
![1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/e05e68fe-43a3-496d-9f1f-641791cd5e94)
![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/4e2d721c-eafa-4728-9353-035d99a8cf89)
![3](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/bf68593e-065b-4133-9545-db068a0c41e4)
![4](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/76f8313e-c870-4919-9af8-2006933d0ecc)
![5](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/90e2c9d0-05fb-45ec-8ef7-817c702d8560)




**Floorplan**
+ Command to exectue
```
run_floorplan
```
![0 1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/bc00abd2-849f-474a-8a6d-4e82b97ed7e2)


**Note we need to use libs.tech file so we need to gitclone this https://github.com/hwiiiii/sky130A into pdks folder**
```
git clone https://github.com/hwiiiii/sky130A
```

```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/7f59908a-f564-486e-8e07-70a018d131b8)
![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/04760473-f635-4c13-97a5-247d77cd2cf4)
![3](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/dde636b4-f62f-4a5a-8e93-5cab4a8c90ca)


**Placement**
+ Command to exectue
```
run_placement
```
![1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/d72f9b99-b275-4842-908c-018f75cd7ab1)


```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/699e6bf8-7d5f-4b5a-8af9-2bbb3e09b0e6)


**CTS**
+ Command to exectue
```
run_cts
```
![1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/eba23bde-dc04-426d-992c-09cd50efbbda)


**These reports generated are given below , after executing run_cts command**

![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/0ea355f5-c806-4f5c-a277-96f792be9c52)
![3](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/a928190d-1ff0-4b8b-8896-692a689b0a52)
![4](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/94c16ed9-8ab0-4401-ab3b-7da50bc93f21)
![5](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/08517ba2-78c0-480c-90f1-63e37b25961c)
![6](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/6ca0542e-4292-46c9-a8ce-f033b4f0b1a7)
![7](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/fb281634-820e-4b6b-9a90-00a873ec2fe3)
![8](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/4ec3ea05-d316-4038-b148-f96d2f998e79)
![9](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/3171e245-274b-4c27-8f68-d795423ba1a9)

**Routing**
+ Command to exectue
```
run_routing
```
![1](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/d31a1a6c-9e4c-4c70-aa41-a37b80e38c2c)


```
magic -T /home/pavanstalegaon/OpenLane/pdks/sky130A/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_binary_to_gray_converter.def &
```

![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/5e0dbc4e-b355-48dc-b2e6-3a20b5533cde)
![3](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/9b706289-1e7e-47da-bdfc-4ee088c3bf3d)


#### Statistics
- Internal Power = 7.12e-06 W  [43.4%]
- Switching Power = 9.27e-06 W [56.6%]
- Leakage Power = 5.90e-10  W  [0.0%]
- Total Power = 1.64e-10 W     [100%]

[Back to Stage-2](#Stage-2)
</details>
