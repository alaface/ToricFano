/* 
    Magma Library for Smooth Toric Fano Varieties
    =============================================

    This library provides functions to access a database of smooth toric Fano varieties.
    Simply copy and paste these functions into a Magma session to use them.

    Functions:
    ----------
    1. `FanoP(ID)`:
       - Input: `ID` (integer) - The ID of the smooth toric Fano variety.
       - Output: The anticanonical polytope of the `ID`-th smooth toric Fano variety.

    2. `FanoX(ID)`:
       - Input: `ID` (integer) - The ID of the smooth toric Fano variety.
       - Output: The toric variety corresponding to the `ID`-th smooth toric Fano variety.

    3. `FanoDualX(ID)`:
       - Input: `ID` (integer) - The ID of the smooth toric Fano variety.
       - Output: The toric variety associated with the dual anticanonical polytope.

    Note:
    -----
    Ensure that the database files are correctly placed in the directory:
    `<LibraryRoot>/data/polytopes/smoothfano/`
*/

FanoP := function(ID)
    // Determine the block and offset for the given ID
    block := ID div 250;
    num := ID mod 250;
    
    // Retrieve the database root directory
    L := GetLibraryRoot();
    file := L cat "/data/polytopes/smoothfano/block" cat IntegerToString(block);
    
    // Open the corresponding block file
    fh := Open(file, "r");
    base := StringToInteger(Gets(fh));
    
    // Navigate to the correct line
    line := "";
    while num gt 0 do
        line := Gets(fh);
        num -:= 1;
    end while;
    Close(fh);
    
    // Parse the polytope data
    coeffs := IntegerToSequence(StringToInteger(line), base);
    dim := coeffs[1];
    shift := coeffs[2];
    coeffs := [coeffs[i] - shift : i in [3..#coeffs]];
    vertices := [[coeffs[dim * i + j] : j in [1..dim]] : i in [0..#coeffs div dim - 1]];
    
    // Construct the polytope
    P := Polytope(vertices);
    return P;
end function;

FanoX := function(ID)
    // Get the anticanonical polytope
    P := FanoP(ID);
    
    // Construct the toric variety
    F := SpanningFan(P);
    X := ToricVariety(Rationals(), F);
    return X;
end function;

FanoDualX := function(ID)
    // Get the anticanonical polytope
    P := FanoP(ID);
    
    // Construct the toric variety from the dual fan
    F := DualFan(P);
    X := ToricVariety(Rationals(), F);
    return X;
end function;
