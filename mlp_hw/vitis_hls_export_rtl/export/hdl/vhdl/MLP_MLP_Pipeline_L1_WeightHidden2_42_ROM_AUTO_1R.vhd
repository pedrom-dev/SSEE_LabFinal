-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MLP_MLP_Pipeline_L1_WeightHidden2_42_ROM_AUTO_1R is 
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


architecture rtl of MLP_MLP_Pipeline_L1_WeightHidden2_42_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000010001010010010101100", 1 => "00111101001111011000110101010100", 2 => "10111110000001100110001010000000", 3 => "10111101100010101101010110111000", 
    4 => "10111110100000010001101011111101", 5 => "00111110000110010001110110110001", 6 => "10111110010001111110011100011010", 7 => "10111110111111110110000000011100", 
    8 => "10111110001101101110110100000011", 9 => "10111110000011011111011101101101", 10 => "00111110100111101011001100001000", 11 => "10111110101011011100011100111011", 
    12 => "10111101101111010010111001001101", 13 => "00111110011010010111001100101011", 14 => "10111110001001101000100110011100", 15 => "10111111000010100100010101001000", 
    16 => "00111101000000111001000110100101", 17 => "00111111001000000111101101011110", 18 => "00111110111111100000000110000011", 19 => "10111110010100010001011000001100", 
    20 => "00111110100001100110011100101010", 21 => "00111110111100111111101010110100", 22 => "00111110110111110000111010110110", 23 => "10111100100101010101011110010000", 
    24 => "10111110010011101000100100111111", 25 => "00111110100010110011100110101101", 26 => "10111110011110010000101100100010", 27 => "10111110000100111101001110001011", 
    28 => "00111111010000101001010000011100", 29 => "10111110101110110010000110100000", 30 => "00111101100000111111110101011110", 31 => "10111101011111011111001111111100", 
    32 => "10111101100001001101000011101001", 33 => "10111101001111010111100011010010", 34 => "10111101110011000110100111111101", 35 => "10111110011111110110011111000001", 
    36 => "10111110101000111001110000110001", 37 => "10111101101000111110100000001110", 38 => "10111110011010111101010101100101", 39 => "10111110110111110010011010011111", 
    40 => "10111110000010010100000011100001", 41 => "00111110010110100101111100110000", 42 => "00111101100101110111011101011000", 43 => "10111101101101001100111111111101", 
    44 => "00111110111100101010011110110100", 45 => "10111110110100011100011100111101", 46 => "00111110100000110000000100111101", 47 => "10111110011100010011010000111011", 
    48 => "10111110101000101000111010110001", 49 => "00111110000000010100111010011101", 50 => "10111110010010100000101011111100", 51 => "00111111010011100011110001101101", 
    52 => "00111101101001100111100111000011", 53 => "00111110000010100000110111100111", 54 => "10111101110100110101101001100000", 55 => "00111110001101111010110110101101", 
    56 => "00111111000101011001011100001111", 57 => "00111111000011010100100000111111", 58 => "00111110010100011011110010111000", 59 => "00111110010000010011100100000101", 
    60 => "10111101110111010111100110110011", 61 => "10111110101110000000000011010111", 62 => "00111110101000000011011100101001", 63 => "00111100010110101000001011011000", 
    64 => "10111110101101100111110110000010", 65 => "10111110000110101000010011000101", 66 => "00111101011111010010111001101110", 67 => "10111110001010111111010000000010", 
    68 => "00111101011110101101001111010100", 69 => "10111110101011011101000100000001", 70 => "00111111000000111111001000001101", 71 => "00111110111101100000111010001111", 
    72 => "00111110101110001110111000110010", 73 => "00111110110011010111100010101000", 74 => "00111100111000111111001011111111", 75 => "00111110101101100110010000010100", 
    76 => "00111101001100011100011010111010", 77 => "00111110010100100111111001001111", 78 => "10111100100100010010010100110111", 79 => "00111101100100111111001000101001", 
    80 => "00111101000110111101010011000011", 81 => "00111110101111001001111000111100", 82 => "10111101010011010000011110010000", 83 => "10111100011001000011111011001111", 
    84 => "00111110000010010010010001100010", 85 => "00111101100101011010100000010100", 86 => "10111110110011100111000100000100", 87 => "00111101111010000011100101001001", 
    88 => "10111101001010011100001001111100", 89 => "10111110111000000010011101011110", 90 => "10111110100111110000110101110000", 91 => "10111101101100101100000111101111", 
    92 => "10111101110000111100011000110011", 93 => "10111110101110111111110111100010", 94 => "00111100111001111110111110010011", 95 => "00111110000101001101001010111100", 
    96 => "10111110011100000000001110000100", 97 => "00111110000100111111111111110001", 98 => "10111110110100101001000001010100", 99 => "10111110101010100000001010010110", 
    100 => "10111101000111000011101011101111", 101 => "10111101011101110111000011011101", 102 => "00111111000001111111111010100001", 103 => "10111110101011101110000111100100", 
    104 => "10111110001001011000011010001101", 105 => "10111110111010101111010111010000", 106 => "00111100000100010111100000110000", 107 => "00111110101100000000111101001101", 
    108 => "00111101101101111001000110001010", 109 => "10111101111011011100000000111110", 110 => "10111110001111100011011100001110", 111 => "00111101100010101001100111011010", 
    112 => "10111110100010100011010110001110", 113 => "10111110010111111001011100101111", 114 => "10111110101011000010001111100011", 115 => "00111100101110011000111101110011", 
    116 => "00111110101100111111101111000100", 117 => "00111110010000111100011010001001", 118 => "00111110001110011111101111001010", 119 => "00111110100101001010110111111011", 
    120 => "10111101110111100001000010010110", 121 => "00111010111011101110111100001100", 122 => "00111110100111000101111000100101", 123 => "00111110100101000110111010011111", 
    124 => "00111110100100101111101000011111", 125 => "10111101111001010010100100100011", 126 => "00111110101110110101011110101101", 127 => "10111101101100100100011011000111");



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

