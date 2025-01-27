-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_6_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_6_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000011010011101011010000", 1 => "00111110010000000100010111110000", 2 => "00111110000010100001010001001010", 3 => "00111110010100111000111000001111", 
    4 => "10111110000011010001001100011011", 5 => "10111100000101110001101010011001", 6 => "00111101101101110111011000000011", 7 => "00111100100011111100000100001000", 
    8 => "00111101010110111100110110011001", 9 => "10111101010010011111011000011000", 10 => "10111110000011110100000010001000", 11 => "10111101000000110001001010010111", 
    12 => "00111101001110110101110111110010", 13 => "00111101101101000011011001111001", 14 => "10111100110010110001101110110010", 15 => "10111101010110011111100001101111", 
    16 => "00111110001100110100100011101100", 17 => "00111100000111111000100001111011", 18 => "00111110011001011001111110010111", 19 => "00111110011110011111010011011010", 
    20 => "00111110100011110001000000101001", 21 => "00111101111111110000110001001001", 22 => "00111100101110101010101110001101", 23 => "10111101001101110101111100100111", 
    24 => "00111101110110100001101101001010", 25 => "00111110001111100100110011101001", 26 => "10111101111000100000011011110001", 27 => "00111011110110000111111100110011", 
    28 => "10111100011011000011001011001110", 29 => "10111101000100101000100001010101", 30 => "00111110000100110011111001110100", 31 => "00111011100000110010101001101100", 
    32 => "10111110000000110101000010011000", 33 => "00111101101100111000011010000101", 34 => "10111110010010000010011000001001", 35 => "00111101110100101110110100111110", 
    36 => "10111110100111011010110010111111", 37 => "10111101010111001001011010101000", 38 => "10111101111111001100101000110100", 39 => "00111101111100010101111101010011", 
    40 => "00111110100010000111000010010100", 41 => "10111101101001011011010110000100", 42 => "10111110001000011111001101101011", 43 => "10111110001111110001110111111011", 
    44 => "00111110001100110101000111010100", 45 => "00111101101111011101100110111000", 46 => "00111101100011000011111110010011", 47 => "10111110000001100100101000101001", 
    48 => "10111101001011110001000111011101", 49 => "10111110000101010000001011010111", 50 => "00111101010010100101010011111110", 51 => "10111101000101010001110110101001", 
    52 => "00111110000001000100000110110110", 53 => "10111101000010000110011010101111", 54 => "10111101111100100000100100100000", 55 => "00111101101101101100011110111001", 
    56 => "00111101100101110100010000100000", 57 => "00111110010000101000101010010110", 58 => "10111011110000000111010010100101", 59 => "10111110000000101101100110010100", 
    60 => "00111110001001011101010010001110", 61 => "10111110001100100100001100100000", 62 => "00111101001010100110001011010010", 63 => "10111101101010110001010100110001", 
    64 => "00111110001011111100110110100100", 65 => "10111110000110011100101110110110", 66 => "10111101000101100100010111000111", 67 => "00111110100000100011100010101101", 
    68 => "00111100001110111111011111010011", 69 => "00111110010001100111101101110000", 70 => "10111110000101010111001011110010", 71 => "00111110000000011011010000101011", 
    72 => "10111110000011110010100010100000", 73 => "00111101100011011011100001010101", 74 => "00111010011010110110101100011110", 75 => "10111101011100000101000001110101", 
    76 => "10111110001110001100011000111010", 77 => "10111011000101110000110101111000", 78 => "10111110001111100110111010011011", 79 => "00111110000011000111100000000100", 
    80 => "00111101100110011011100100110010", 81 => "00111110000111001000011011101110", 82 => "10111110000000110010011000001000", 83 => "10111110000111001011101010011001", 
    84 => "00111101100001100100100101010011", 85 => "10111011010111100100000111101010", 86 => "10111110001011000001101111011111", 87 => "10111101000111010010101010100110", 
    88 => "00111110100010010000011111001110", 89 => "10111110011001100001100101011000", 90 => "10111110100011000101111101110110", 91 => "00111101000011001110100010101001", 
    92 => "10111100111001010100111001000011", 93 => "10111101100001100010111100010011", 94 => "10111101101010001111010110110001", 95 => "10111101110001111011101111001001", 
    96 => "10111101100000011111011011010100", 97 => "00111101111001110101100110011011", 98 => "10111100101111110100000011011000", 99 => "10111110011000101001000011100101", 
    100 => "10111110000011010000111110110000", 101 => "00111101001101101101010100000100", 102 => "00111110100001111101110001101110", 103 => "10111101101000001000101001110000", 
    104 => "10111110011110011000110111010010", 105 => "00111110010110001101010011100010", 106 => "00111110100100000000101111110110", 107 => "10111101111111101100000101110001", 
    108 => "00111101101010010011101001011000", 109 => "00111101100101100011001000000110", 110 => "00111101100110010011101010010000", 111 => "00111110100100001011110010010001", 
    112 => "10111101011101001001000110010101", 113 => "10111101111011010110101011011111", 114 => "00111110001011001010111000010100", 115 => "10111101111111110100001111110101", 
    116 => "10111110010000110001010011101010", 117 => "10111100010010110000010010101011", 118 => "00111110010100000110101000011110", 119 => "00111110000111010010101000011010", 
    120 => "10111101111010010111100011000010", 121 => "10111100110000100101001011100001", 122 => "10111101011000010011001001011010", 123 => "10111101100010110011010111111011", 
    124 => "00111101000110111010110110100011", 125 => "00111110010010000010100001110100", 126 => "10111100100000001100100110010100", 127 => "10111101001010101111011100110111");



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

