# keyboardio-model01-firmware
My Model01 firmware sketch

## Build instructions
1. Ensure you have cloned this repo **recursively**:
    ```powershell
    git clone --recursive https://github.com/dbjorge/keyboardio-model01-firmware
    ```
1. The Kaleidoscope build tools are not Windows-friendly, so install WSL and open a WSL prompt
1. Install system deps
    ```bash
    sudo apt update
    sudo apt install make arduino
    ```
1. Navigate to the repo
    ```bash
    cd /mnt/c/repos/keyboardio-model01-firmware
    ```
1. Build options are `make help`, `make build`, `make flash`
