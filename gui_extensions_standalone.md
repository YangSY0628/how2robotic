**Author:** Shiyuan Yang  
**Email:** shiyuanyang0628@hotmail.com  

## Introduction
This markdown is talking about three different work styles comparison of isaac-sim

A enlightening [video](https://bili2233.cn/tT2hplL)

Three different work styles of isaac-sim:
1. **GUI**: Mouse interaction for scene control and object manipulation.
2. **Extension**: Similar to using plugins, allows asynchronous interaction with the stage and supports hot reloading.
3. **Standalone**: Runs independent Python scripts from the terminal with minimal interaction, suitable for tasks like training.

## Standalone setup

### Option 1: Source the Python Environment
1. Source the Python environment:
    ```sh
    . ~/.local/share/ov/pkg/isaac-sim-4.2.0/setup_python_env.sh
    ```
2. Run your program:
    ```sh
    python your_program.py
    ```

### Option 2: Directly Use the Provided Script
1. Run your program using the provided script:
    ```sh
    ./python.sh your_program.py
    ```
2. To make this easier, add the following to your `~/.bashrc`:
    ```sh
    export SIM_PATH=~/.local/share/ov/pkg/isaac-sim-4.2.0
    alias sim_python="$SIM_PATH/python.sh"
    ```


### Troubleshooting

Here are a few things you can check:

- **Isaac Sim Installation**: Ensure that Isaac Sim is correctly installed. You can verify this by launching Isaac Sim and checking if it runs without any issues.
- **Python Environment**: When you run the `source setup_python_env.sh` command, it sets up the Python environment for Isaac Sim. Make sure this command runs without any errors. If there are errors, they need to be resolved for the Python API to work correctly.
- **Running Python Scripts**: When running Python scripts for Isaac Sim, you should use the `./python.sh` script provided by Isaac Sim, as you’re doing. This script sets up the necessary environment variables for the Python API.
- **Module Installation**: The `omni.isaac` module is not a standalone Python package that can be installed with pip. It’s part of the Isaac Sim Python API and is available when the Isaac Sim Python environment is correctly set up. Therefore, running `./python.sh -m pip install omni.isaac` will not work and is not necessary.
- If you encounter the error `No module named 'omni.isaac.core'`, you’ll probably have to start the `SimulationApp()` before importing those packages.

## Extension(waiting to update)