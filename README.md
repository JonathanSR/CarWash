# CarWash
A Ruby program that runs a simulated car wash.

## Installing / Getting Started

```shell
git clone git@github.com:JonathanSR/CarWash.git #clones the application into your machine.
cd car-wash/ #access the root folder of the application.
```

## Usage

To run the tests:
```shell
ruby test/car_wash_test.rb
ruby test/car_test.rb
ruby test/truck_test.rb
```

To run the program:
```shell
ruby lib/begin_wash.rb
```
To modify the program, you will make changes in the beginwash.rb file. To initiate a second run through the carwash add 'carwash.previous_check(vehicle)' and 'carwash.charges(vehicle)' methods after the last 'carwash.charges(vehicle)' method in the 'start' method. To modify the vehicle make changes to the model in the 'initialize' method. To use the car model uncomment it and comment out the truck model.