# keyboardio-model01-firmware
My Model01 firmware sketch

## Build instructions
1. Ensure you have cloned this repo **recursively** into *a directory undery C:/*:
    ```powershell
    git clone --recursive https://github.com/dbjorge/keyboardio-model01-firmware
    ```
    
1. The Kaleidoscope build tools require a POSIX-like environment, so install Cygwin with at least:
    * bash
    * make
    * wget
    * unzip
1. Install local deps (including Arduino stuff)
    ```bash
    cd /cygdrive/c/repos/keyboardio-model01-firmware
    make setup
    ```
1. Build options are `make help`, `make build`, `make flash`
