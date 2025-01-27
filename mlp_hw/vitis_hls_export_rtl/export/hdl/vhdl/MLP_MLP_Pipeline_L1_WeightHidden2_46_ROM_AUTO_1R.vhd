-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_46_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_46_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110001111111000110001110010", 1 => "00111110110111110100101000111100", 2 => "00111110010101010010110001011000", 3 => "00111110101010100000011001000110", 
    4 => "00111100111011111011000100001101", 5 => "10111011101110001011100011011001", 6 => "00111110000111001100011110001001", 7 => "10111110110101011111000100100111", 
    8 => "00111110001011001010000101001111", 9 => "10111100111111100011001111010010", 10 => "00111110101111110010011110011000", 11 => "10111101100100111110001111011101", 
    12 => "00111101100111111110101010011101", 13 => "00111101100110011011101100000010", 14 => "10111101011111010000110110001010", 15 => "00111101100110011011101101101011", 
    16 => "00111110000101001001001110001000", 17 => "00111110110111011111010100001010", 18 => "00111101010110011100110011100000", 19 => "10111110010010001100110110111011", 
    20 => "00111101010001000001010011100011", 21 => "00111110101010100110010101101110", 22 => "10111110100001001000101110101010", 23 => "10111110101101000110111001000001", 
    24 => "00111101001101100001011100010001", 25 => "10111101100101001000010010100011", 26 => "00111110100100001100100001101111", 27 => "00111110000010000101110101100100", 
    28 => "00111101111101011001011100010010", 29 => "10111111000001111011000000100110", 30 => "10111101100010101011110101011010", 31 => "10111101110000110101001001001000", 
    32 => "10111110101111001101001110000000", 33 => "00111110000111100111111001111101", 34 => "10111110100100011100000001111111", 35 => "00111111000010110101111111100001", 
    36 => "00111101100011001111110010001100", 37 => "10111110101010011010101101010000", 38 => "10111110010011000010101001001110", 39 => "10111111000011000011101001011110", 
    40 => "00111101001010100010100000111101", 41 => "00111110100100110010000110110110", 42 => "10111110011001000100100101100100", 43 => "00111110001111111110110011010001", 
    44 => "00111101101000100000111111101001", 45 => "10111101101110111001100110101100", 46 => "10111110000101111101101001100110", 47 => "00111010100000100000001010100100", 
    48 => "00111110010111100110100000110011", 49 => "10111110011100101001101010011001", 50 => "00111011100110011010100010001000", 51 => "00111111000001000000111000011110", 
    52 => "10111101101001111110110011000000", 53 => "10111110001011110000111110111111", 54 => "00111101100011100000100100110100", 55 => "00111101111101100101001000100110", 
    56 => "10111110010100100000010011000010", 57 => "00111110011100100000101010010011", 58 => "10111110010010100001111011001001", 59 => "00111110010110010011110011001001", 
    60 => "00111110010101000111001010110101", 61 => "10111111001001110111010110111000", 62 => "10111110100011111101010010100001", 63 => "10111100111011001100010000000011", 
    64 => "10111110100000000010100001010101", 65 => "00111110001010010001011000011000", 66 => "10111101110110011101100010100000", 67 => "10111111001000100100101011100111", 
    68 => "10111110010010011010101110101111", 69 => "10111110101011001110010100111111", 70 => "00111110100111000110001111101100", 71 => "00111110000111001100000010100110", 
    72 => "00111101000111100001111001101110", 73 => "00111110001111110010101011100011", 74 => "00111101010011000001101100001001", 75 => "10111101110011101101011000111000", 
    76 => "10111110001111000010011011010110", 77 => "00111110101110011001000110110100", 78 => "00111110111110001100100011011001", 79 => "00111100101010100010101100111101", 
    80 => "10111111001100110010111001010101", 81 => "10111101101010111000101011110001", 82 => "00111110100000000000111100011010", 83 => "10111101100011111101100010110010", 
    84 => "00111110111100110111010111010001", 85 => "00111110000100111010110110010000", 86 => "10111110001011010110100000100011", 87 => "00111101001110001001011000101100", 
    88 => "10111110100101100111101011000011", 89 => "00111101011111111100011110001011", 90 => "10111110100011010100011101001111", 91 => "10111110101111011110110000101110", 
    92 => "00111110011111101000011011101001", 93 => "10111110100000010100110011001111", 94 => "00111110111010010110011100100110", 95 => "10111100011101001011110011000000", 
    96 => "00111101101011101010010011001001", 97 => "10111110101001000010111010011111", 98 => "10111110100001110101010010110100", 99 => "00111110010000101001011010110111", 
    100 => "00111110010001011111001101100000", 101 => "10111101110010101111000001101101", 102 => "10111110010000001111110000010010", 103 => "00111110101111001100100001111101", 
    104 => "00111101100010111110001101000100", 105 => "10111110001101101001101001011001", 106 => "10111110101111111111111010011101", 107 => "10111101110001111011011110110101", 
    108 => "10111101100100000011011010111101", 109 => "00111110011101111111100111000011", 110 => "00111110001111110010101000110110", 111 => "10111110000010000011101101110100", 
    112 => "00111110110100011011000100100110", 113 => "00111101001101000110000001111101", 114 => "10111111000101000001101010101110", 115 => "10111110100011111101101111011100", 
    116 => "00111110011001011011111001111110", 117 => "10111101111100001111111111000011", 118 => "10111101000010010101000011010001", 119 => "10111110001010101011010001001000", 
    120 => "10111110011001101011111111101110", 121 => "00111110101111110100011101001010", 122 => "10111101010010001011010011001101", 123 => "00111101010101011111111001111100", 
    124 => "10111110011011010001110111001111", 125 => "00111101100101010110110110001011", 126 => "00111111000101011111011011100100", 127 => "00111101101011101101111011011011");



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

