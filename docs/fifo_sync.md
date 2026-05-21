# Synchronous FIFO Design

## Overview
A parameterizable synchronous FIFO with configurable depth and data width.

## Parameters
| Parameter  | Default | Description          |
|------------|---------|----------------------|
| FIFO_DEPTH | 8       | Number of storage locations |
| DATA_WIDTH | 32      | Bit width per location |

## Ports
| Port     | Direction | Width      |   Description      |
|----------|-----------|------------|--------------------|
| clk      | input     | 1          | Clock              |
| rst_n    | input     | 1          | Active low reset   |
| cs       | input     | 1          | Chip select        |
| wr_en    | input     | 1          | Write enable       |
| rd_en    | input     | 1          | Read enable        |
| data_in  | input     | DATA_WIDTH | Write data         |
| data_out | output    | DATA_WIDTH | Read data          |
| empty    | output    | 1          | FIFO empty flag    |
| full     | output    | 1          | FIFO full flag     |

## Architecture
- Pointer width: clog2(FIFO_DEPTH) + 1 extra MSB for full/empty detection
- Full:  read_pointer == {~write_pointer[MSB], write_pointer[MSB-1:0]}
- Empty: read_pointer == write_pointer

## Simulation Results
| Scenario | Description              | Result |
|----------|--------------------------|--------|
| 1        | Partial fill then drain  | Pass   |
| 2        | Interleaved write/read   | Pass   |
| 3        | Full fill then full drain| Pass   |