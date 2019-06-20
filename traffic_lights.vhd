library ieee;
use ieee.std_logic_1164.all;

entity traffic_lights is

port(
     yaya_button  : in std_logic;
     red   : out std_logic;
     yellow: out std_logic;
     green : out std_logic;
     clk   : in std_logic;
     a, b, c, d, e, f, g : out std_logic;
     ssd_1, ssd_2, ssd_3, ssd_4: out std_logic
     );
     
     end traffic_lights;
     
architecture behavioral of traffic_lights is

component ssd
port(
    ss_display_1, ss_display_2, ss_display_3, ss_display_4: in integer;
    clk: in std_logic;
    ss_1 : out std_logic;
    ss_2 : out std_logic;
    ss_3 : out std_logic;
    ss_4 : out std_logic;
    ss_a, ss_b, ss_c, ss_d, ss_e, ss_f, ss_g : out std_logic
    );
    
    end component;

signal light_counter: integer := 0;
--signal red_counter: integer := 4;
--signal yellow_counter: integer := 2;
--signal green_counter: integer := 5;
signal red_light, yellow_light, green_light: std_logic := '0';
signal counter: integer := 0;
--signal slow_clk: std_logic := '0';
type lighting_type is (red_x, yellow_x, green_x, yaya);
signal state: lighting_type := red_x;
signal yaya_button1, yaya_button2, yaya_button3: std_logic := '0';
signal yaya_button_db: std_logic;
signal first_ssd, second_ssd, third_ssd, fourth_ssd: integer;

begin

instantiation_ssd: ssd 
                       port map(
                                ss_display_1 => first_ssd,
                                ss_display_2 => second_ssd,
                                ss_display_3 => third_ssd,
                                ss_display_4 => fourth_ssd,
                                clk => clk,
                                ss_1 => ssd_1,
                                ss_2 => ssd_2,
                                ss_3 => ssd_3,
                                ss_4 => ssd_4,
                                ss_a => a,
                                ss_b => b,
                                ss_c => c,
                                ss_d => d,
                                ss_e => e,
                                ss_f => f,
                                ss_g => g
                                );

yaya_button1 <= yaya_button;
yaya_button2 <= yaya_button1;
yaya_button3 <= yaya_button2;
yaya_button_db <= yaya_button1 and yaya_button2 and yaya_button3;

process(clk)
begin

if rising_edge(clk) then

case (state) is

when (red_x) =>

    if (yaya_button_db = '0') then

        if (light_counter < 99999999*1) then

        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 5;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;

        elsif (light_counter < 99999999*2) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 4;
        second_ssd <=13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*3) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 3;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*4) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 2;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*5) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 1;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;

        else

light_counter <= 99999999*6;
state <= yellow_x;

        end if;

    else

state <= yaya;
light_counter <=0;

    end if;

when (yellow_x) =>

    if (yaya_button_db = '0') then

        if (light_counter < 99999999*7) then

light_counter <= light_counter + 1;
yellow_light <= '1';
red_light <= '0';
first_ssd <= 13;
second_ssd <= 13;
third_ssd <= 13;
fourth_ssd <= 13;

        else

light_counter <= light_counter + 1;
state <= green_x;

        end if;

    else

state <= yaya;
light_counter <=0;

    end if;

when (green_x) =>

    if (yaya_button_db = '0') then

        if (light_counter < 99999999*8) then

        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 5;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;

        elsif (light_counter < 99999999*9) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';        
        first_ssd <= 4;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*10) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 3;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*11) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 2;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        
        elsif (light_counter < 99999999*12) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 1;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;

        else

light_counter <= 0;
state <= red_x;

        end if;

    else

state <= yaya;
light_counter <=0;

    end if;

when (yaya) =>

yellow_light <= '0';
green_light <= '0';

if (light_counter < 99999999*1) then

light_counter <= light_counter + 1;
red_light <= '1';
first_ssd <= 3;
second_ssd <= 12;
third_ssd <= 11;
fourth_ssd <= 10;

elsif (light_counter < 99999999*2) then

light_counter <= light_counter + 1;
red_light <= '1';
first_ssd <= 2;
second_ssd <= 12;
third_ssd <= 11;
fourth_ssd <= 10;

elsif (light_counter < 99999999*3) then

light_counter <= light_counter + 1;
red_light <= '1';
first_ssd <= 1;
second_ssd <= 12;
third_ssd <= 11;
fourth_ssd <= 10;

else 

light_counter <= 99999999*6;
state <= yellow_x;

end if;

end case;
end if;
end process;

red <= red_light;
yellow <= yellow_light;
green <= green_light;

end behavioral;


