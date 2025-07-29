# espnow

Created: 2025-07-18 08:25:54

  - [x] Check the ESP-IDF documentation for the ESP-NOW API.
  - [x] Master-Slave communication.
  - [ ] Both halves should be able to send and receive data. (except for the slave just sending data to the master)
  - [ ] Make it re-usable for other projects.
  - [x] Change the data structure to a struct `espnow_data_t` to receive row, column, and press value.
  - [x] Add send key function to send the data to master when the slave is pressed the button
  - [x] Change receiver(master) to receive new data strcuture. (prinitng the data row, and column)
  - [ ] Also add a function to scan matrix the master for data to send to dongle. (maybe make the existing function to re-usable)
  - [ ] Create a receiver(dongle) to receive data from master and print it.
  - [ ] Add a function to Master to send the data to dongle.
  - [ ] Document the code.
  - [ ] Make dongle able to parse the received data and send to PC.
  - [ ] After all common key press are sending correctly, add a function Long Tap (LT) to activate layers or special key.

## Notes
Do I need to make `Master` & `Donge` command to their `Slave` respectively? or just make them send the data to each other without any command from their `Master`?

## References
- [https://github.com/espressif/esp-idf/tree/master/examples/protocols/espnow]
