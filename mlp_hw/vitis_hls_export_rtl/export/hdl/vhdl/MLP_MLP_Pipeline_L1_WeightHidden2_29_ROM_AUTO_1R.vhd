-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_29_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_29_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110100001001010111001000100", 1 => "00111110000001000011010000001110", 2 => "00111110101011100101110001101011", 3 => "00111110010100001011101101011110", 
    4 => "10111110010111010111100101000100", 5 => "00111101111101010111010010001000", 6 => "00111101110100011100000101011111", 7 => "00111101111001100100110001111011", 
    8 => "00111101111001111110110001101110", 9 => "10111110011100010010011111110000", 10 => "00111101101010101011001000110010", 11 => "00111101100100100011101011001011", 
    12 => "10111100000111011100000000011010", 13 => "10111101111010010101110110100011", 14 => "10111101101011010011010001001011", 15 => "00111111011101010100010011111000", 
    16 => "00111101100011111110100010101010", 17 => "00111110000100111000111001000111", 18 => "10111110010011010110010010111001", 19 => "10111100101001000100100100000000", 
    20 => "10111101110110111100010110010001", 21 => "10111101100001010011000100100110", 22 => "10111101101111101111101111011000", 23 => "10111101011100110111010000101001", 
    24 => "00111101110001110110001110101100", 25 => "10111110011100000101110100111010", 26 => "00111101110101101110101110010111", 27 => "10111101010010111010100101011111", 
    28 => "10111110000000111100010011001101", 29 => "10111101010010101111101100001111", 30 => "10111110101001000100011001010010", 31 => "00111101011000000011111000001110", 
    32 => "10111110011010101000001111011011", 33 => "00111101010101110100010011110000", 34 => "10111101100111001110111001100100", 35 => "10111110010111111001110111010000", 
    36 => "00111110111010110001010001011101", 37 => "10111110011110011011001111100011", 38 => "10111110100101001011010001001000", 39 => "10111100001110000010001100000111", 
    40 => "10111110100110010010100111010110", 41 => "00111101101010101010111101011101", 42 => "10111101110111011001111101011011", 43 => "00111110111111000110010011101001", 
    44 => "10111101110010000111001101110001", 45 => "00111110100001000110111100100111", 46 => "00111101110111110001000110111010", 47 => "00111110000100011000110000100000", 
    48 => "00111110001110110111010100001011", 49 => "10111101110101011110010100000101", 50 => "00111111000101110111100011001000", 51 => "00111101101001100010100001111111", 
    52 => "10111111000011000001101011100110", 53 => "10111101100000110000000011101101", 54 => "10111110110011111000100111011001", 55 => "10111101011001011100010010111000", 
    56 => "00111101000010100001010100111101", 57 => "10111110100101001010011111011101", 58 => "10111110000000100011100101010000", 59 => "10111101110110111111101110101000", 
    60 => "00111111000100101100010011110100", 61 => "10111101100010000110101111000111", 62 => "00111101100001000001101101011100", 63 => "00111110011100100111000011010011", 
    64 => "10111101100100100010010001000110", 65 => "10111101011111000101001111111001", 66 => "00111110100101111111011001110100", 67 => "10111101101011000001101110111011", 
    68 => "00111110001101011100101100001110", 69 => "10111101110000011100101100001100", 70 => "10111101001000101101100101111001", 71 => "00111101110010100001001100011101", 
    72 => "10111110100010010011000111100101", 73 => "00111101010111010000010000111010", 74 => "00111101111000000101000111110001", 75 => "10111110101100011111010101001101", 
    76 => "10111101001011011010110011101010", 77 => "10111110000010000101100101111111", 78 => "00111110100101000011111011111101", 79 => "00111101100010110011010101110000", 
    80 => "10111110010101011000000100001000", 81 => "10111110010101001111111010011101", 82 => "00111110100011100011101000011001", 83 => "00111010110101011110010101111010", 
    84 => "00111110100101011001011010110011", 85 => "00111110100111100010111000100110", 86 => "10111110010100100111001100101100", 87 => "00111101101100100111001011001111", 
    88 => "10111110100100011000001010100011", 89 => "00111110011000100101000011101100", 90 => "10111110000011101111001010011101", 91 => "10111110000100101111110110100011", 
    92 => "10111110110110111110000111011101", 93 => "10111001110000111001110110111110", 94 => "10111110010010011000011110001100", 95 => "00111110011101011011111100100010", 
    96 => "00111101101000100100101101001100", 97 => "00111101001100111101110110001010", 98 => "00111110001110100101011011101100", 99 => "00111110001110110110111101110100", 
    100 => "10111100111010110110101011000010", 101 => "00111101110111010011010001000010", 102 => "10111110110101110100110110110110", 103 => "00111110100001101101010010011001", 
    104 => "00111111000001100000101011100000", 105 => "00111101100000100010101000000011", 106 => "10111110010110111000001000001101", 107 => "10111110011010000000011111100011", 
    108 => "00111011111101110100001111101101", 109 => "10111110010011001000001111111001", 110 => "10111110001111111100111000100101", 111 => "10111110000100110111011111011110", 
    112 => "00111101000111011111111110000101", 113 => "00111110011110111101100111110100", 114 => "10111101110000000001101101001110", 115 => "10111100101000011110100011010011", 
    116 => "10111110000000101010100000011011", 117 => "10111110011001000110100101111101", 118 => "00111101100111100001000111011110", 119 => "10111110011101111110110001101011", 
    120 => "10111100110110101100000100011100", 121 => "00111110000100011010010000110011", 122 => "10111101100011011010010001001100", 123 => "10111110011001000000001110111100", 
    124 => "00111101111111011001010000100101", 125 => "10111101101101011000000111010001", 126 => "00111110100100110101000011011001", 127 => "00111101111101110000111111100111");



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

