.. OFDM_Receiver documentation master file, created by
   sphinx-quickstart on Sat Mar 23 13:02:50 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Project: Matrix Multiplication on Intel DevCloud Using DPC++
============================================================

1) Introduction
---------------

This project provides an introduction to hardware acceleration using Intel `DevCloud <https://devcloud.intel.com/>`_. DevCloud provides access to Intel `oneAPI <https://www.oneapi.com/>`_ - a set of hardware acceleration development tools. We focus on the Data Parallel C++ (DPC++) programming methodology that is a core part of oneAPI. DevCloud provides access to different Intel hardware platforms including multicore CPUs, GPUs, and FPGAs. DPC++ aims to provide a single source programming methodology that covers these different hardware accelerators.

Matrix multiplication is a canonical example in parallel computing due to its widespread usage in linear algebra, statistics, machine learning, and other applications. Furthermore, its computational pattern is amenable to parallelization across different architectures. It is well-studied in the hardware acceleration literature with a substantial number of examples, technical reports, and research papers.

2) Project Goal
---------------

The project aims to perform a series of basic optimizations for general matrix multiply (GEMM). This starts with some straightforward parallelizations and continues on to introduce block matrix multiplication architecture. The project aims to introduce the user to DevCloud and DPC++, present fundamental GEMM parallelization techniques, and enable a design space exploration process to determine the best architecture.

3) Tasks and Questions
----------------------

Baseline GEMM architecture
#######################

Complete :doc:`DPC++ on Intel DevCloud Lab <devcloud>`. We will use this code as your baseline architecture.

Optimize Load Transfers
#######################

The load-store unit (LSU) in the baseline implementation requires hundreds of cycles and is the major bottleneck in the ``c_calc`` kernel. The :doc:`DPC++ on DevCloud lab<devcloud>` illustrates this clearly. DPC++ uses a Burst/Coalesced LSU by default. Burst/Coalesced buffers contiguous memory requests until it reaches the maximum burst size. It is possible to direct the dpcpp compiler to use other LSU types.

* Modify the **LD** operation to a different LSU style to achieve a lower latency for your ``c_calc`` kernel.

* **Question 1: Load-Store Unit:** What are the different options for the Load-Store Units? Describe how the LSU style affects the ``c_calc`` latency. Which LSU style provides the lowest latency? Why?

References:

* `DPC++FPGA LSU Unit Control Tutorial <https://github.com/oneapi-src/oneAPI-samples/tree/master/DirectProgramming/DPC%2B%2BFPGA/Tutorials/Features/lsu_control>`_

* `oneAPI FPGA Optimization Guide : Load-Store Unit Styles <https://www.intel.com/content/www/us/en/develop/documentation/oneapi-fpga-optimization-guide/top/optimize-your-design/throughput-1/memory-accesses/load-store-units/load-store-unit-styles.html>`_

Loop Unrolling
##############

Loop unrolling is a common optimization to expose parallelism across iterations of a loop.

* Perform loop unrolling using ``#pragma unroll`` directive. Change the unroll factor by 2, 4, and 8. You will need to change the widths and heights of the matrices to be powers of two; the default values are multiples of 150, which are not cleanly divisible by every unroll factor stated. Mention the matrix sizes in your report.

* Question 2: What are the effects and general trends of performing unrolling using the pragma? Are the results as expected?

Manually unroll the loop by replicating the reductions into separate variables.

* Perform loop unrolling manually. Change the unroll factor by 2, 4, and 8. You will need to use the same change as in the previous question.

* Question 3: What are the effects and general trends of performing manual unrolling? Are the results as expected?

References:

* The *Schedule Viewer* typically provides good insight about how DPC++ synthesizes the code.

* `oneAPI FPGA Optimization Guide <https://software.intel.com/content/www/us/en/develop/documentation/oneapi-fpga-optimization-guide/top.html>`_

* `dpcpp FPGA loop unroll example <https://github.com/oneapi-src/oneAPI-samples/tree/master/DirectProgramming/DPC++FPGA/Tutorials/Features/loop_unroll>`_

4) Block Matrix Multiplication (BMM)
------------------------------------

Block matrix multiplication is a common optimization to expose parallelism by loading and operating on blocks of the A and B matrices. Here is a repository for a block matrix multiplication implemented in DPC++ <https://github.com/KastnerRG/Read_the_docs/tree/master/project_files/matrix_mul_dpcpp/block_matrix_mul>`_. It is based on this `OpenCL implementation <https://www.intel.com/content/www/us/en/programmable/support/support-resources/design-examples/design-software/opencl/matrix-multiplication.html>`_, which provides good background on blocking and how the design leverages it for parallel execution. This is different from the implementation you were using earlier; it has the additional ability to change the block size and unrolling factor. We call these "knobs" since they can be changed to "tune" the design to the problem at hand. You can upload the zip file to DevCloud using the Jupyter interface and unzip it via the Jupyter terminal.

Your goal is to change these knobs and observe their effects. After a few steps, you should see trends for each knob. You should use the results from previous steps to make *better* adjustments. You may want to adjust the LSU to something appropriate for the knobs you adjust, like you did for the previous questions. By focusing on a particular knob, try to maximize throughput (while adjusting the other knobs as necessary to help achieve this maximum). After you have done this for a few designs for each knob, you should be able to gain an understanding of which knobs are important in this design, how they effect the results, and why this is occurring. With this knowledge, we ask you to find points on the Pareto frontier (if you didn't already find them from the experimentation earlier). However, you don't have to achieve the absolute best maximum throughput for any particular knob; this is a design-space exploration problem and the goal is to gain an understanding of what possibilities for improvements exist and what trade-offs come with them. Briefly discuss these trends you noticed and what your thought process was as you moved from one design to another in your report, and reference the chart to explain your thoughts.

You also have to show the result of each knob adjustment in a normalized throughput vs. normalized hardware utilization plot. Data points in that plot with the maximum throughput and minimum resource utilization are your plateau points (red dots in the following example). At minimum, we ask for just 1 plot for all of the tuning experiments, preferably annotate each point with the knobs you used to produce that design (maybe even with color coding the points to classify them). You may, however, want to plot a separate chart for each knob that you adjust so you can identify the trends for yourself. But the idea of question 4 is to compare every design you synthesize to find the Pareto frontier (in the example chart below, draw a line between the red points to roughly visualize the frontier), so ideally that would be by being able to compare every design on a single chart. Do whatever helps you best distinguish the trends.

After you decide on a design you think is best, try this design with different matrix sizes: 128, 256, 512, 1024, 2048, 4096. Report the performance of your design on these input sizes. You can report additional sizes if you like.

		.. image :: https://i.imgur.com/l9a1mRh.png

Note: Notice that the provided code prints throughput in kb/s on the command line output. This number is dependent on the fact that the code is running on a server, sharing resources with other programs submitted by other users. Therefore, multiple runs of the same program will print different throughputs, depending on who is running what and when. To avoid this, there are a few strategies you can choose from. You could run the program multiple times and take the average of throughputs over runs, or (preferably) you can use the normalized 1/(loop latency) from the synthesis report as a proxy for throughput.

Requirements
############

1. **Design Space Exploration**: You should define a set of variables (knobs) to change your optimizations for monitoring their effects on your design's performance and hardware utilization. You should use the following knobs:

	* Block size

	* Matrix size (we use square matrices)

	* Unrolling factor for the unroll pragma

	* Unrolling factor for the manual unrolling

References: Spector provides a DSE for OpenCL FPGA-based `matrix multiplication code <https://github.com/KastnerRG/spector/tree/master/mm>`_.

Bonus
#####

The `OpenCL implementation <https://www.intel.com/content/www/us/en/programmable/support/support-resources/design-examples/design-software/opencl/matrix-multiplication.html>`_ is simpler than the matrix multiply implementation used in Spector. As a bonus, you can implement the matrix multiply implementation used in Spector, in DPC++. A functionally correct code is enough for this section; you do not need to optimize it.

5) Submission Procedure
-----------------------

You must also submit your code (and only your code, not other files). Your code should have everything in it so that we can synthesize it directly. We must be able to only import your source file and directly synthesize it. You can assume that we have correctly set up the design environment.

You must follow the file structure below. We use automated scripts to pull your data, so **DOUBLE CHECK** your file/folder names to make sure it corresponds to the instructions.

Your repo must contain a folder named "matrix_multiplication" at the top-level. This folder must be organized as follows (similar to previous projects):

**Contents:**

* **Report.pdf**

* Folder **mm_optimized1**

  - Source code (``matrix_mul_dpcpp.cpp``) and reports (screenshots).

* Folder **mm_optimized2**

  - Source code (``matrix_mul_dpcpp.cpp``) and reports (screenshots).

* Folder **mm_optimized3**

  - Source code (``matrix_mul_dpcpp.cpp``) and reports (screenshots).

* Folder **bmm_optimized**

  - Source code (``block_matrix_mul_dpcpp.cpp``) and reports (screenshots).


**Report:** For this project, you must submit a report that answers the questions on this page. You may add figures, diagrams, tables, or charts to describe your architectures with a sufficient explanation of how they were achieved and what they demonstrate. You can submit the synthesized report screenshots as image files or include them as (properly labeled) figures in your report.

6) Grading Rubric
-----------------

Your grade will be determined by your answers to the questions. Your answers should be well written and clearly delineated, e.g., by copying the questions into the report before answering them, or placing each question under a separate subheading. Points will be subtracted for poor formatting and/or answers that are hard to understand. Examples of issues include any spelling errors, multiple/egregious grammar errors, poor presentation of results, and lack of written comparison of the results. Report throughput and resource usage for each design you discuss in your report, and include the files for these designs in your submission. We encourage the use of tables for stating results and the changes that produced them, and figures to draw comparisons between different designs. A well-written report is informative but not overly verbose. You will be deducted points if you do not follow the instructions on directory naming and file structure.
