#processor.searchMethod: cycles/instructions
#single.highNot: 56/56
#single.lowNot: 46/46
#single.deepYes: 53/53
#5stage.highNot: 80/56
#5stage.lowNot: 73/46
#5stage.deepYes: 77/53

.data
# Test Data: A sorted array of 10 integers
array:  .word 10, 22, 35, 40, 45, 50, 62, 70, 88, 99  
len:    .word 10                                      
target: .word 62

.text
main:
    la   a2, array      # a2 (x12): Base address of array
    lw   a3, len        # a3 (x13): Length of array
    lw   a4, target     # a4 (x14): Value to find
    
    jal  ra, binarySearch # Call the procedure
    
    # After return: a0 contains the index or -1
    li   a7, 10         # Environment call for exit
    ecall

# --- Binary Search Procedure ---
# a2: array base | a3: length | a4: target
# t3: low        | t4: high   | t5: mid    | t6: array[mid]

binarySearch:
    mv   a6, a2             # Copy base address to a6
    li   a0, -1             # Default return to -1
    ble  a3, x0, EXIT       # If length <= 0, EXIT
    
    li   t3, 0              # low = 0
    addi t4, a3, -1         # high = length - 1

LOOP:
    blt  t4, t3, EXIT       # If high < low, target not found

    # Calculate Midpoint
    add  t5, t3, t4         # t5 = low + high
    srli t5, t5, 1          # mid = (low + high) / 2
    
    # Calculate Memory Offset and Load
    slli t6, t5, 2          # Offset = mid * 4
    add  t6, t6, a6         # Address = base + offset
    lw   t6, 0(t6)          # t6 = array[mid]

    # Comparison Logic
    beq  t6, a4, FOUND      # If array[mid] == target, jump to FOUND
    blt  a4, t6, GO_LEFT    # If target < array[mid], jump to GO_LEFT

GO_RIGHT:
    addi t3, t5, 1          # low = mid + 1
    j    LOOP

GO_LEFT:
    addi t4, t5, -1         # high = mid - 1
    j    LOOP

FOUND:
    mv   a0, t5             # Move mid index into return register a0

EXIT:
    ret                     # Return to main (ra)