-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_50_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_50_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110100110111110101111100110", 1 => "00111110000010010100011100001110", 2 => "10111101010110011001001100100001", 3 => "10111110101110000110111100100001", 
    4 => "10111010111101000101000111001100", 5 => "10111100001101011011101001001100", 6 => "10111100011011000100100110110101", 7 => "10111101110000110101111111001001", 
    8 => "00111100011011000010110111110001", 9 => "00111110001101111011100110101010", 10 => "10111110000010000000111101111000", 11 => "00111100001101111011000000010000", 
    12 => "10111101001000110001011100101100", 13 => "00111101101010010100111000100101", 14 => "10111110010001000110101111000110", 15 => "00111100110111001011011100011010", 
    16 => "10111101111110000010110000100110", 17 => "00111110100101000000000100110110", 18 => "00111110110010110011001011001010", 19 => "10111101000011101001110101011010", 
    20 => "00111110011011111111000110000010", 21 => "00111110000011111000101110110001", 22 => "00111110010001010110000101111010", 23 => "00111110000110101111000000010100", 
    24 => "10111110101101010110000010100011", 25 => "00111110011001000011110011001100", 26 => "10111110100110111100101001001100", 27 => "00111101010100001101011101110110", 
    28 => "00111110100111111111000111111011", 29 => "00111101101100000000010000010011", 30 => "00111110010111100101101001101010", 31 => "10111101001110100100100101101101", 
    32 => "00111110000101111100100011111101", 33 => "10111110110100110110111001011011", 34 => "00111110001111001011100000100111", 35 => "10111110100111101011100101111110", 
    36 => "10111101011010010110010101101101", 37 => "00111100000001101110101111111010", 38 => "10111101101011001010011000101110", 39 => "00111101111101001101000010100101", 
    40 => "00111101101000000110110000000100", 41 => "10111110000000000001100001110011", 42 => "10111110000101100000110010110110", 43 => "10111101111110101101011100000010", 
    44 => "00111110010110111010101111000101", 45 => "10111110000100101111011100110111", 46 => "10111101111111110011100111100000", 47 => "10111101101111000110101100011001", 
    48 => "10111110001011111001111101000100", 49 => "10111110001001001101000110111110", 50 => "00111110001100101100010011010100", 51 => "00111110010110011101101000010100", 
    52 => "10111101110111011000100111101001", 53 => "10111101100000001000010001010011", 54 => "00111101011101010010001101011000", 55 => "00111110001100011101100011000110", 
    56 => "00111110111101011000111100010010", 57 => "00111110101000011111101110000000", 58 => "10111101101101010000001001000100", 59 => "10111101100111011001000110000001", 
    60 => "10111101010011011101111011111001", 61 => "00111110001000000100101011101100", 62 => "00111110111110100111000110100001", 63 => "10111101110011101100110101010100", 
    64 => "10111100110000001101101011100111", 65 => "10111110001111000001011000000110", 66 => "10111100001101100110001101111001", 67 => "00111110010100111100010101101000", 
    68 => "00111110001011101110101110110011", 69 => "10111110000010111000110100111010", 70 => "00111101100111000001000100110000", 71 => "00111110000001001100001000000111", 
    72 => "00111110011110111011000001001100", 73 => "00111110011010100111111011001010", 74 => "10111101010100101000000111011000", 75 => "10111110000011111111000110001111", 
    76 => "00111101100110001001111001101010", 77 => "10111110101110010111000000011001", 78 => "10111101001100001001111010110001", 79 => "00111101111000010010110011111100", 
    80 => "00111110100100101011001100001111", 81 => "00111110101001000110101010111000", 82 => "10111101010000010100011010001110", 83 => "10111110001001001101010001001111", 
    84 => "10111101100101000110100000101000", 85 => "10111101101110000011110001011100", 86 => "10111110010100010000001000001001", 87 => "10111100000110100000010010111001", 
    88 => "00111110010100100110011110000011", 89 => "10111110100010110001100110000000", 90 => "10111110101101010010010100010100", 91 => "10111101001010000101100101111110", 
    92 => "00111101011010001000101001010000", 93 => "10111101111100100101000100011010", 94 => "10111110101100101010001101111001", 95 => "00111110100000010100100011101010", 
    96 => "10111110100100101110000101101011", 97 => "10111101011111100100110000101000", 98 => "10111110001110111101101100110011", 99 => "10111101110111110110001011000100", 
    100 => "10111110001011101111101001000111", 101 => "10111110000100100100010101101000", 102 => "00111101100111011010110110110100", 103 => "10111110110011101101111110001110", 
    104 => "00111101101110011001100110011011", 105 => "10111101101011011110100111010010", 106 => "00111110011100110111111001100011", 107 => "10111110001111001011000001111000", 
    108 => "00111110011000100101010000011101", 109 => "10111110010111001000100101111100", 110 => "10111110000001101100000011100010", 111 => "00111110000011000000001111111100", 
    112 => "10111110110001100011010111000001", 113 => "10111110001000010100011001010101", 114 => "00111101100000100011010101010011", 115 => "00111110001101011101101101001000", 
    116 => "00111100110101001111010100011010", 117 => "00111101101111011101111000011010", 118 => "00111110001111110110110010100110", 119 => "00111110100011110100001010010110", 
    120 => "10111101000000010110101000110011", 121 => "10111101111100101000101001000010", 122 => "00111110011100110001101010111011", 123 => "10111100001001111010001011010001", 
    124 => "00111110100111000001100001010001", 125 => "10111100000110011011000100110111", 126 => "10111101000001000001111001000010", 127 => "10111101101010110011001110110000");



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

