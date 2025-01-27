-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_2_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_2_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000101001101100110111011", 1 => "00111010101010101100000001011101", 2 => "10111100001010000001010000010001", 3 => "10111110100001110111110011001000", 
    4 => "00111101000101111110000011010111", 5 => "10111110010000111101101101111101", 6 => "00111101101101001100110010100010", 7 => "10111100110111001111101000001100", 
    8 => "10111101101010000010001010001110", 9 => "00111101111000011001010001100011", 10 => "00111110001110110111111001000110", 11 => "10111110010101010100111100011101", 
    12 => "10111110000110110000010010001101", 13 => "00111110001111011010000111110000", 14 => "00111110010001000000001111100100", 15 => "10111101001110100110110110011101", 
    16 => "10111101100001110110010010111010", 17 => "10111101101010010001010111100101", 18 => "00111101011001110000011001100100", 19 => "00111101010110111000111100011000", 
    20 => "10111101100001000010100110101000", 21 => "00111101011100001011000110110001", 22 => "00111110110001001000010101000110", 23 => "10111101101000010010101111011011", 
    24 => "00111110011100011111110110010011", 25 => "10111101110000010111011001010111", 26 => "10111101111110001000001100111100", 27 => "10111101111010101101011110011001", 
    28 => "00111110000011110001010001000110", 29 => "10111011101110011111001100001110", 30 => "10111110010100101110001001110110", 31 => "00111101000010010101010001001010", 
    32 => "00111110100101000100111011000010", 33 => "00111110000001111000110111101010", 34 => "00111011111110001101100011000100", 35 => "10111110101010000101101101100101", 
    36 => "00111110001011001000100111010011", 37 => "10111001000011000010101011000011", 38 => "10111100000000001001100111111001", 39 => "10111010100011000110011111011000", 
    40 => "10111110011011101000001101101110", 41 => "10111101110001011011001001010111", 42 => "00111101100010010011011001000010", 43 => "10111101011001110001000110110101", 
    44 => "10111101111110101000000010110001", 45 => "00111011101100110011110101000100", 46 => "00111110010001001010101101000100", 47 => "10111101001000100110001111111011", 
    48 => "10111110010110000001100000001011", 49 => "00111110010011110010010110100100", 50 => "10111101110001010011011011110001", 51 => "10111100101111000111110110111010", 
    52 => "10111100000000101111100001001101", 53 => "00111101011011001111101111101010", 54 => "10111101000111110100000000101111", 55 => "00111110000010101001011101000110", 
    56 => "00111101110000110101010000101011", 57 => "10111101101100001000100110110011", 58 => "00111101110001001011010000101001", 59 => "10111101111000101111011000101010", 
    60 => "10111110010101010111011000110010", 61 => "00111101111001010001100110011100", 62 => "10111101110011011010110111011011", 63 => "10111110000100101010101010011001", 
    64 => "10111110001010101011011000100111", 65 => "10111110000011001010001101010001", 66 => "10111110010101110001101100000010", 67 => "00111100111010011100100001111011", 
    68 => "00111110101001110100101001110011", 69 => "00111100100110110111100111110100", 70 => "10111101100001100101111101100100", 71 => "10111101101111000101111100100111", 
    72 => "10111110000001111011100000011010", 73 => "10111101101111110011101111001110", 74 => "10111101100110010000001011001010", 75 => "00111110000111000001010011111010", 
    76 => "00111101001110101000001001011101", 77 => "00111101101010000110011110110000", 78 => "10111110010010111110011000000011", 79 => "00111110011111110110110010101111", 
    80 => "00111110100011100001100000100011", 81 => "00111101001001010000000100111111", 82 => "00111101111111010111110110101111", 83 => "10111101010111101000010101101111", 
    84 => "10111101111011101011011101010100", 85 => "10111110100101101101011111000011", 86 => "10111101100001001000010000111100", 87 => "10111110011001000011011000001000", 
    88 => "00111110100000010100100110111001", 89 => "10111101111001000011001111000100", 90 => "00111101000011001111010000101010", 91 => "00111100111000101011100101000011", 
    92 => "10111110000101001001010001000001", 93 => "10111110001100000010001011111000", 94 => "00111110001100000011001000100011", 95 => "10111110010001110011101100100001", 
    96 => "10111101100111000011011100100011", 97 => "00111101110110010011110110110101", 98 => "00111100111100100101101011001011", 99 => "10111110100010110000000001001100", 
    100 => "10111101111100011001100000001010", 101 => "10111101101100010101000111110001", 102 => "00111110000111110011100111011001", 103 => "10111110101101011000001000111011", 
    104 => "10111110000001010010100000000101", 105 => "00111110001000111110100001111101", 106 => "00111110100001000010101000011000", 107 => "00111110011011010101011101100101", 
    108 => "10111100111100011011010010011110", 109 => "00111100000011011101011110000100", 110 => "10111110010010111100000100111111", 111 => "10111101101101010110101110111010", 
    112 => "10111101111101110111100111100111", 113 => "00111011110010100011001111010110", 114 => "00111101100010100010000010110111", 115 => "10111100111001000011000111001001", 
    116 => "00111101000011000100101001101011", 117 => "00111101100001100100011100110010", 118 => "00111101110010101101100110011011", 119 => "00111110000110001101111111100010", 
    120 => "00111101000001010110111001001001", 121 => "10111110111000111000111111011101", 122 => "10111101100101001101001111101001", 123 => "00111110100001110010011011100000", 
    124 => "00111101100100001101101011100111", 125 => "10111101111100000000110001001110", 126 => "10111101111000110000111011101101", 127 => "00111011111000001100000000011111");



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

