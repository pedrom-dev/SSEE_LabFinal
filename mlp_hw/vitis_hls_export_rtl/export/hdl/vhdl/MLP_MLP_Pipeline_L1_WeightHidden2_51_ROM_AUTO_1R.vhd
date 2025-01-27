-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_51_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 7; 
             AddressRange    : integer := 128
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_51_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110100010101011001111110000", 1 => "10111110011010000111101111101110", 2 => "10111100110111001010101000010000", 3 => "10111101101011111010111010010001", 
    4 => "10111110011011100100001010010101", 5 => "00111110001110001110001000010001", 6 => "10111101010110011011010111100100", 7 => "10111100011111000011011101101001", 
    8 => "10111110101110101000011000100011", 9 => "10111110100110011110111001010110", 10 => "10111101010000001000111001100011", 11 => "00111110011110010111001010100100", 
    12 => "10111110011110111110110011010110", 13 => "00111110011000001000111100011011", 14 => "10111110101110011000011011101111", 15 => "00111101100111000010000010111111", 
    16 => "00111110000001000101110010011101", 17 => "00111110100000100100010001001010", 18 => "00111110011000010001000010100000", 19 => "10111101010000100110100100110100", 
    20 => "00111100101010010100001001001001", 21 => "00111110010000010011100001000111", 22 => "00111110000000110111011110010101", 23 => "00111110100010000010001010110110", 
    24 => "10111110010110111010010011000101", 25 => "10111101110010100101111000000010", 26 => "10111110011011001110111111101000", 27 => "10111101111110101010010010111011", 
    28 => "00111110000010011111000101010100", 29 => "10111101000100100011001111100110", 30 => "10111101110011111001110000101000", 31 => "10111101110110101000011010100001", 
    32 => "10111110001101010110000100010110", 33 => "10111101010100011011111001101001", 34 => "10111100011011110011000101110001", 35 => "10111110011110110000100011010001", 
    36 => "00111101110101110110111001110011", 37 => "00111110010110100100111110111100", 38 => "10111110000011001010011000100011", 39 => "10111110100000010100100000100110", 
    40 => "00111100000110001110101111110101", 41 => "00111110011001101111000101111010", 42 => "00111110101101010100101010101110", 43 => "00111110010001001101011100000111", 
    44 => "00111101100001110110110101110101", 45 => "00111100010100010111001001000011", 46 => "00111100101011000100111001011101", 47 => "10111101100010001000100111101111", 
    48 => "10111101110001011011000001111110", 49 => "00111110100010010011001110001010", 50 => "10111101001100101110101110101011", 51 => "00111110100000110111100111101000", 
    52 => "10111110001001110010010111100010", 53 => "00111101111101000101000000100101", 54 => "10111110100101011110011111001000", 55 => "10111110001101100001010110101010", 
    56 => "00111110110000101000101110111100", 57 => "00111110101011111100100001110010", 58 => "00111100010010111100111001001010", 59 => "00111110011010001010110000000101", 
    60 => "10111101111011000101111001001010", 61 => "10111110100011110100001110000011", 62 => "10111101101110101101101000011010", 63 => "00111110100110101010000000101100", 
    64 => "10111101100000010001000110101010", 65 => "10111101100101110001000110111010", 66 => "00111101110001000010011110100111", 67 => "10111101000011110110110110100100", 
    68 => "10111101100000000100011100110000", 69 => "10111110001011110001101001100011", 70 => "00111110001100000010010011011110", 71 => "00111110111100101010100010101110", 
    72 => "10111101101111110100100111111000", 73 => "10111101011001101101100000100001", 74 => "00111110001010111001111001101101", 75 => "00111110101000111110001011110111", 
    76 => "10111101100110111000100001111010", 77 => "10111100100000101000010111100111", 78 => "00111110100001011011110110000000", 79 => "10111111000001010011100111100011", 
    80 => "10111110000101111001011000011000", 81 => "10111110001100111110000110100001", 82 => "00111110011010000010111111010010", 83 => "00111110010110001100111100000000", 
    84 => "00111101111001100100110010111011", 85 => "00111110010000110011110010011111", 86 => "10111110011100000110100101000000", 87 => "00111110010011011011110110110011", 
    88 => "10111110011010010101110000100011", 89 => "10111101100011110000111110100100", 90 => "00111101011111111111110001101111", 91 => "00111110000000001000100001010001", 
    92 => "10111110100110010000001101010011", 93 => "10111101111100111111001110000001", 94 => "10111110001110011010001011011111", 95 => "00111110000001011100010110111001", 
    96 => "00111100100010000010001000110011", 97 => "00111101111011011101110110000001", 98 => "10111110100010011101101100100000", 99 => "10111101100111011011111001010111", 
    100 => "10111101110001000101100001001111", 101 => "00111101110101010101110010000110", 102 => "00111110100010111101000111000110", 103 => "10111101010100010101100010001101", 
    104 => "00111101011110110001101110011101", 105 => "10111110110110010100110111011010", 106 => "10111110100111010000100000010011", 107 => "00111101000001000101111001000110", 
    108 => "10111110101000011001101011101110", 109 => "10111101110111000000011010000100", 110 => "10111110000101000000100000010100", 111 => "10111110100010111110010011001010", 
    112 => "00111110001010001000111100110010", 113 => "00111101010011011000110101101100", 114 => "10111110110010100110000110110001", 115 => "00111110100110111011101111111111", 
    116 => "00111110100111111011110110101110", 117 => "10111101110000100100001100110100", 118 => "10111101110011110011010010111000", 119 => "10111101100010111110111000010001", 
    120 => "00111100101110110110011001100011", 121 => "00111110101001001000011010100101", 122 => "00111110010010100101111011000111", 123 => "10111101000101110111101100010110", 
    124 => "00111101011010000010011000010010", 125 => "10111110100111101000101101111111", 126 => "00111110010101101101100101110101", 127 => "10111101101101111011000101101110");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;

