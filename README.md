# Magma Library for Smooth Toric Fano Varieties

This library provides functions to access a database of smooth toric Fano varieties. The library is implemented in the Magma computational algebra system. Below, you will find details on how to use the library, along with an example of usage.

## Installation

To use the library, ensure you have access to the required database files located in the directory:
```
<LibraryRoot>/data/polytopes/smoothfano/
```

Then copy and paste the library code into a Magma session.

## Provided Functions

1. `FanoP(ID)`
   - **Input**: `ID` (integer) - The ID of the smooth toric Fano variety.
   - **Output**: The anticanonical polytope of the `ID`-th smooth toric Fano variety.

2. `FanoX(ID)`
   - **Input**: `ID` (integer) - The ID of the smooth toric Fano variety.
   - **Output**: The toric variety corresponding to the `ID`-th smooth toric Fano variety.

3. `FanoDualX(ID)`
   - **Input**: `ID` (integer) - The ID of the smooth toric Fano variety.
   - **Output**: The toric variety associated with the dual anticanonical polytope.

## Example Usage

Here is an example showing how to use the library to compute certain properties of the toric varieties:

```magma
// Load the database and functions
// Assume the library has already been loaded into the current session

// Example: Retrieve the 24th smooth toric Fano variety
X := FanoX(24);
print "The dimension of the variety is:", Dimension(X);

// Retrieve the anticanonical polytope of the 24th variety
P := FanoP(24);
print "The polytope has vertices:", Vertices(P);

// Retrieve the dual variety
DualX := FanoDualX(24);
print "The dual variety dimension is:", Dimension(DualX);

// Filter varieties based on a condition
selected := [n : n in [24..147] | Length(FanoX(n)) - Dimension(IrrelevantIdeal(FanoX(n))) ge 3];
print "IDs of varieties satisfying the condition:", selected;
```

## Filtering Toric Varieties

You can use the following command to filter toric varieties based on a specific condition:
```magma
[n : n in [24..147] | Length(FanoX(n)) - Dimension(IrrelevantIdeal(FanoX(n))) ge 3];
```
This command selects IDs of varieties where the difference between the number of generators in the Cox ring (`Length(FanoX(n))`) and the dimension of the irrelevant ideal (`Dimension(IrrelevantIdeal(FanoX(n)))`) is at least 3.

## License

This library is open-source and freely available for academic use. If you use this library in your research, please consider citing it appropriately.

