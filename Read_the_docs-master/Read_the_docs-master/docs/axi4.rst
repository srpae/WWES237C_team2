Lab: AXI4-Burst Mode (m_axi)
============================

Simple example of AXI4-Burst Mode
***********************************

This lab is an example of AXI4 data transfer in burst mode. It takes in a given sample of values and provides the square root. 

1) Vivado HLS: Generating RTL code from C/C++ code
--------------------------------------------------

In this section you learn how to create a project in Vivado HLS, synthesis your code, and generate RTL.

1.1) Download code and create a Vivado HLS project
##################################################

This is the code we will be using:

.. code-block :: c++

	#include "axi4_sqrt.hpp"
	#include <string.h>
	#include <math.h>

	void axi4_sqrt(float *in, float *out, int len)
	{
	#pragma HLS INTERFACE s_axilite port=return bundle=sqrt
	#pragma HLS INTERFACE s_axilite port=len bundle=sqrt
	#pragma HLS INTERFACE m_axi depth=50 port=out offset=slave bundle=output
	#pragma HLS INTERFACE m_axi depth=50 port=in offset=slave bundle=input
	#pragma HLS INTERFACE s_axilite port=in
	#pragma HLS INTERFACE s_axilite port=out

		float buff[100];
		memcpy(buff, (const float*) in, len * sizeof(float));

		for(int i = 0; i < len; i++)
			buff[i] = sqrt(buff[i]);

		memcpy(out, (const float*) buff, len * sizeof(float));
	}
	
Note that we had to include `string.h` to be able to use `memcopy`. Additionally, we use `memcopy` instead of a for-loop (as used in AXI-streaming) to force Vivado HLS to infer an AXI4-Burst. Sometimes Vivado HLS will not infer this from a for-loop, but will for `memcopy`.

Download and unzip `axi4_burst.zip <https://bitbucket.org/akhodamoradiUCSD/237c_data_files/downloads/axi4_burst.zip>`_ that contains the above code. Generate your project using the provided script.tcl file:

Linux: open a terminal, make sure your environment is set, navigate to streamMul folder, and run the following ::

    $ vivado_hls -f script.tcl

Windows: open vivado_hls command line and run the following ::

    $ vivado_hls -f script.tcl

Now you can open your project in Vivado HLS. It should look like this:

.. image :: https://i.imgur.com/iHkVmWE.png

1.2) Generate RTL code and export it
####################################

Click on Run **C Synthesis** to generate RTL code. After it is done, you can check your resource utilization and timing report. Your latency is unknown (?) because your loop size (*len*) is a variable.

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq19.png

Now you can export your RTL code by clicking on **Export RTL**:

.. image :: https://bitbucket.org/repo/x8q9Ed8/images/582121524-pynq3.png

After exporting is done, you can close and exit from Vivado HLS.

2) Vivado: Generating bitstream from RTL code
---------------------------------------------

In this section we import our RTL code from last section, add some required IPs, and generate our bitstream.

2.1) Create a new Vivado project
################################

Open your Vivado tool and create a new project. Select an appropriate location for your project and leave the default project name as is (**project_1**).

Select **RTL Project** and check **Do specify not sources** at this time.

Select **xc7z020clg400-1** for your part:

.. image :: https://bitbucket.org/repo/x8q9Ed8/images/3090594305-pynq4.png

2.2) Import RTL code
####################

Under **Flow Navigator**, click on **IP Catalog**. Right click on the opened window and select **Add Repository**. Navigate to your **Vivado HLS project > solution1 > impl > ip** and select it:

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq20.png


2.3) Add IPs to your design
###########################
Under **Flow Navigator**, click on **Create Block Design**. Leave the design name as is (*design_1*). In the newly opened window you can add IPs by clicking on the plus sign.

Add **ZYNQ7 Processing System** to your design:

.. image :: https://bitbucket.org/repo/x8q9Ed8/images/3814633603-pynq6.png

Double click on **ZYNQ7 IP** to customize it. In the opened window, double click on **High Performance AXI 32b/64b Slave Parts**:

.. image :: https://bitbucket.org/repo/x8q9Ed8/images/148617913-pynq7.png

Select and check **S AXI HP0 interface**:

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq21.png

Add the **axi4_sqrt** IP to the design.

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq22.png


2.4) Automatic connections
##########################

1. Click on **Run Block Automation**

2. Click on **Run Connection Automation** and select all. Click OK.

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq23.png

3. Click on **Run Connection Automation** again and select all. Click OK.

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq24.png

This is how the final design should look

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq25.png

2.5) Generate bitstream
#######################

1. Save your design **CTRL+S** or **File > Save Block Design**

2. Validate your design: **Tools > Validate Design**

3. In Sources, right click on **design_1**, and **Create HDL Wrapper**. Now you should have **design_1_wrapper**

4. Generate bitstream by clicking on **Generate Bitstream** in **Program and Debug**

2.6) Post bitstream Generation
##############################

In sources, expand **design_1_wrapper::design_1_i::design_1::axi4_sqrt_0::design_1_axi4_sqrt_0_0::inst : axi4_sqrt**, double click on **axi4_sqrt_sqrt_s_axi_U** , and note the address for **in_r** , **out_r** , **len** as **0x10** , **0x18** and **0x20** respectively. We need this address in our host program.

.. image :: https://github.com/KastnerRG/pp4fpgas/raw/master/labs/images/pynq26.png

You can close and exit from Vivado tool.

Copy your **project directory > project_1 > project_1.runs > impl_1 > design_1_wrapper.bit** to your **project directory > project_1** and rename it to **axi4_sqrt.bit**

Copy your **project directory > project_1 > project_1.srcs > sources_1 > bd > design_1 > hw_handoff > design_1.hwh** to your **project directory > project_1** and rename it to **axi4_sqrt.hwh**

These files need to have the same name (except for their file extension).

3) Host program
---------------

In this section we use Python to test our design.

3.1) Move your files
####################

Create a new folder in your PYNQ board and move both **axi4_sqrt.hwh** and **axi4_sqrt.bit** into it.

3.2) Python code
################

Create a new Jupyter notebook and run the following code to test your design:

.. code-block :: python3

	from pynq import Overlay
	from pynq import Xlnk # replace with allocate for Pynq >= 2.7
	import numpy as np

	ol = Overlay('axi4_sqrt.bit')
	sqrt_ip = ol.axi4_sqrt_0 // if you can't find the IP, type 'ol.' and hit Tab to see what options are available
	
.. code-block :: python3

	length = 40
	inpt = Xlnk().cma_array(shape=(length,), dtype=np.float32)
	outpt = Xlnk().cma_array(shape=(length,), dtype=np.float32)
	a = [i*i for i in range(length)]
	np.copyto(inpt, a)
	soft_op = np.sqrt(inpt)

	sqrt_ip.write(0x20, length)
	sqrt_ip.write(0x10, inpt.physical_address)
	sqrt_ip.write(0x18, outpt.physical_address)
	sqrt_ip.write(0x00, 1)

	print("Hardware Output", "Software Output \n")
	for i in range(length):
	    print(outpt[i], "\t\t  ", soft_op[i])











