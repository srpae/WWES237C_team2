
Lab: Pynq Memory Mapped IO (s_axilite)
=====================================

This lab describes how to use Pynq to develop an application on the Zynq SoC. The application performs a simple hardware accelerated function on the programmable logic. We first create the IP core that performs the function :math:`f(x) = 2x` using high level synthesis. We synthesize it to the programmable logic using the Vivado tools.  Using the PYNQ infrastructure, we talk to the IP core from ARM processor using memory mapped I/O. We develop a Pynq notebook that sends data to the IP core, executes the core, and receives the computed results. 

1) Vitis HLS: C/C++ to RTL
---------------------------

In this section, you will write your code in C/C++, test it, and convert it to RTL using Vitis HLS.

1.1) Write your code
~~~~~~~~~~~~~~~~~~~~

Open Vivado HLS, create a new project, and name it **pynq_mul**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq27.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq28.png

Set top function name to **mul_test**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq29.png

Do not add any files to your project and proceed to **part selection** and select **xc7z020clg400-1**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq30.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq31.png

In **Explorer** section, right click on **Source**, select **New file** and create **mul_test.cpp**. Complete the body of **mul.cpp** as following:

.. code-block:: c++

  void mul_test(int* out, int in){
	*out = 2*in;
  }

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq32.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq33.png


Create a test bench file by right clicking on **Test Bench** in **Explorer** section and create a new file named **mul_tb.cpp**. Complete the body of this file as following:

.. code-block:: c++

  #include <iostream>

  using namespace std;

  void mul_test(int* out, int in);

  int main(int argc, char *argv[]){
	int x=5;
	int y;
	mul_test(&y, x);
	if(y!=2*x){
		cout << "Test Failed: output(" << y << ") is not equal to 2x" << x << endl;
	}else{
		cout << "Test Passed" << endl;
	}
	return 0;
  }

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq34.png

1.2) Test your code
~~~~~~~~~~~~~~~~~~~

Run C simulation and make sure your code passes your test bench. 

1.3) Set port types
~~~~~~~~~~~~~~~~~~~

Make sure that **mul_test.cpp** is open. Open **Directive** and right click on the options and select **Modify Directive** . In the drop down, select **INTERFACE** and set all the ports to **s_axilite** by right clicking on available options. Repeat the same for all the options.

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq36.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq37.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq38.png

1.4) Synthesis and export your design
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run C Synthesis. After the synthesis is complete, you should see the following synthesis summary report-

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq35.png

and after finished, click on **export RTL** and export your design.

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq39.png

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq40.png

At this point, you can exit and close Vitis HLS.

2) Vivado: RTL to bitstream
---------------------------

In this section, you will import your RTL code to Vivado and generate a bitstream.

2.1) Create a new project
~~~~~~~~~~~~~~~~~~~~~~~~~

Open Vivado and create a new project and Name your project as **mul_test**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq6.png

Select **RTL Project** and check **Do not specify sources at this time**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq7.png

Set default part to **xc7z020clg400-1**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq8.png

Under **IP Integrator**, click on **Create Block Design**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq9.png

2.2) Import your design
~~~~~~~~~~~~~~~~~~~~~~~

Under **Project Manager**, click on **IP Catalog**. Right click inside the newly open 'IP Catalog' tab and select **Add Repository**. In the open window navigate to your Vivado HLS project folder and select **<pass_to_vivado_hls_folder>\solution1\impl\ip**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq10.png

In **IP Catalog** search for **mul_test**, double click on it and add it to your block design

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq11.png

2.3) Add connections
~~~~~~~~~~~~~~~~~~~~

Go back to **IP Catalog** and add **ZYNQ7 Processing System** to your block design.

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq12.png

Your diagram should look like the following:

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq13.png

On top of **Diagram** window, first click and complete **Run Block Automation** and then **Run Connection Automation** with default settings. Your diagram should change and show connections and a couple of extra IPs:

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq14.png

2.4) Generate bitstream
~~~~~~~~~~~~~~~~~~~~~~~

In **Sources**, right click on **design_1** and select **Create HDL Wrapper**

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq15.png

Under **Project Manager**, click on **Generate Bitstream** to build the .bit and .hwh files.

2.5) Bitstream, .hwh, and addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before closing Vivado, we need to note our IP and its ports addresses. 

Under **Sources**, open **mul_test_mul_io_s_axi.v**, scroll down and note addresses for in and out ports. We need these addresses for our host program.

In the example below for the streamMul, the addresses to pay attention to are 0x00 (control bus ap_ctrl), 0x10 (output), and 0x18 (input). These are the addresses you will need to use to write data to the fabric from the ARM core, start the fabric to run your design and generate your outputs, and then read your outputs from the fabric into the ARM core on the Pynq board.


.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq16.png

Under **Address Editor** note IP's address

.. image:: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq17.png

3) PYNQ board and Host program
------------------------------

Using SMB or SCP or the Jupyter interface, copy **design_1_wrapper.bit** from **vivado_project_path/mul_test.runs/impl1** and copy **design_1.hwh** from **vivado_project_path/mul_test.srcs/sources_1/bd/design_1/hw_handoff** to your PYNQ board at **/home/xilinx/jupyter_notebooks/mul_test**.

Make sure to name the .bit file and the .hwh file with the same name. In this case, we name them "design_1_wrapper.bit" and "design_1_wrapper.hwh".

Open a new Notebook and run the following code to test your IP

.. code-block:: python

	from pynq import Overlay
	from pynq import MMIO

	ol = Overlay("/home/xilinx/jupyter_notebooks/mul_test/design_1_wrapper.bit") # designate a bitstream to be flashed to the FPGA
	ol.download() # flash the FPGA

	mul_ip = MMIO(0x43C00000, 0x10000) # (IP_BASE_ADDRESS, ADDRESS_RANGE), told to us in Vivado
	inp = 5 # number we want to double

	mul_ip.write(0x18, inp) # write input value to input address in fabric
	print("input:", mul_ip.read(0x18)) # confirm that our value was written correctly to the fabric
	mul_ip.write(0x00, 1) # set ap_start to 1 which initiates the process we wrote to the fabric
	print("output:", mul_ip.read(0x10)) # read corresponding output value from the output address of the fabric 


