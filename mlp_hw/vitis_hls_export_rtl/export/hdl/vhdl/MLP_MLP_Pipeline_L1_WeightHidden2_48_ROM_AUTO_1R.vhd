-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_48_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_48_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101010010100100010100011000", 1 => "00111101011010101011101010001100", 2 => "00111100111110001101001000001110", 3 => "00111110100101111000101110010111", 
    4 => "10111101111010110001100011110010", 5 => "10111110001001100011100101011010", 6 => "00111101011011110111011010010011", 7 => "00111110101001001110011111110111", 
    8 => "00111110011001111101000001111100", 9 => "10111101100001110001110000010010", 10 => "10111110010100000011100010101000", 11 => "10111101010011100100110000101011", 
    12 => "00111110100100001111011100000110", 13 => "10111110000100101010011111011010", 14 => "00111110001010110111001010111110", 15 => "00111110110100110010110111011100", 
    16 => "00111100010101011100011001111011", 17 => "10111110111001010010000101011010", 18 => "10111110011101110011110101101001", 19 => "00111110100101011101001111010010", 
    20 => "10111101100101110101001100111001", 21 => "10111101100010010001110010101100", 22 => "10111110100101000111100101001001", 23 => "10111110000010111111011011100001", 
    24 => "00111110101011000000111000000010", 25 => "10111101001110011001010111110011", 26 => "00111101101111100001001000010110", 27 => "00111101111001001110100011100011", 
    28 => "10111110101011110101101110111101", 29 => "00111110010011110110001111100000", 30 => "10111101100010101011010100011001", 31 => "10111101101001011100011101110101", 
    32 => "10111101110000111010000010100101", 33 => "00111110000010010110100101111011", 34 => "10111101100100011100100110010000", 35 => "00111110000111000111101000000110", 
    36 => "00111110000001011110100010111011", 37 => "10111101111010110011100010000011", 38 => "00111101111100001100010110110110", 39 => "00111110100101110001101101110001", 
    40 => "00111110000100100010100001100011", 41 => "10111110001011101010000100100101", 42 => "10111110101010100011110110110101", 43 => "00111110000110010011001010110100", 
    44 => "10111110000001010101001011001011", 45 => "00111110000111101100111000011101", 46 => "10111101110011110001001000010000", 47 => "00111110000000000110110000101111", 
    48 => "00111110100111100101001011110101", 49 => "10111110010100101111000100001000", 50 => "00111101101000100000011100010101", 51 => "10111110111011011111111110101000", 
    52 => "10111110000001001100110010001000", 53 => "10111101101101110000100111011011", 54 => "10111110000111001101000000110001", 55 => "10111101001010011000101110101010", 
    56 => "10111110010100001001001110111010", 57 => "10111110110100110010110011011101", 58 => "10111110000001111011001001010100", 59 => "10111110010000011100000111110000", 
    60 => "00111110101000010111001001010000", 61 => "00111110001001110000011111000101", 62 => "10111101111110001001111101010101", 63 => "10111101100000111011110110001001", 
    64 => "00111110100111101100011011100111", 65 => "10111101101000101110111100010110", 66 => "00111110000110011111100101100001", 67 => "00111110010001100111110100101001", 
    68 => "10111101011101000011101100000011", 69 => "00111110100111100000110010000000", 70 => "10111110110101110111101000111101", 71 => "10111110001100010011101011110011", 
    72 => "10111110100100011000101101001100", 73 => "10111110001001101010011101010101", 74 => "10111101101111011100011001011110", 75 => "10111110110010111011110101111001", 
    76 => "10111100110110110101011011110100", 77 => "10111110001000100011001100111001", 78 => "10111101100000110110111001111011", 79 => "00111110000110011010001001011110", 
    80 => "00111101111111000100010100011011", 81 => "10111101110100001010111001101110", 82 => "10111101011110011100011101100001", 83 => "00111101110111110001111000100010", 
    84 => "00111100111011010001010111101000", 85 => "10111100101001110001101000010101", 86 => "00111101110010001000101000111111", 87 => "10111101111001011111101011010010", 
    88 => "00111101110010001100100100001110", 89 => "00111110000011100001100100000000", 90 => "00111100101101001110000100101110", 91 => "00111101011101101111001111110011", 
    92 => "10111101101101000001011100000110", 93 => "00111110010110101111111111110001", 94 => "10111101010000110101111011010010", 95 => "10111110011000110101100010110000", 
    96 => "00111110000010001110011110100111", 97 => "10111100110100000100010100100011", 98 => "00111110011000001011100111010001", 99 => "00111011010111110100000001000010", 
    100 => "10111101000101001010001100110000", 101 => "10111101001100100000000111100000", 102 => "10111101110110010100110001011010", 103 => "00111110010111111101001010111101", 
    104 => "10111101101110101011100111101000", 105 => "00111110110011111011011010101000", 106 => "00111110101011101111011100110010", 107 => "10111101101001010001001000011011", 
    108 => "10111101100101101011001111010011", 109 => "00111101000111001110100100011101", 110 => "00111110000011111001000011001101", 111 => "00111101100011011000100101000001", 
    112 => "00111101101101100010111000000010", 113 => "10111101010100001111110010110000", 114 => "00111110100110000100000011110101", 115 => "10111110010111100111000001100011", 
    116 => "10111110101110001101001100101110", 117 => "10111110011000110011010110001011", 118 => "00111100000000011100000110110111", 119 => "10111110000010001001101100011000", 
    120 => "10111101100100001000011000010011", 121 => "10111110001000111010011000101100", 122 => "10111110101000010010011010011111", 123 => "00111011010001111000000101011110", 
    124 => "10111101101011011110110011111100", 125 => "00111110101010100000101111001110", 126 => "10111110100100001000011100010100", 127 => "10111101100100110111011011101011");



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

