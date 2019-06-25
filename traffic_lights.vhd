library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_lights is

port(
     pedestrian_button  : in std_logic;
     red   : out std_logic;
     yellow: out std_logic;
     green : out std_logic;
     clk   : in std_logic;
     a, b, c, d, e, f, g : out std_logic;
     ssd_1, ssd_2, ssd_3, ssd_4: out std_logic;
     lcd_db_o: inout unsigned (3 downto 0);
     lcd_e_o: out std_logic;
     lcd_rs_o: out std_logic;
     lcd_rw_o: out std_logic
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
    
component lcd
port(
    color   : in integer := 0;
    clk: in      std_logic;
    lcd_db    : inout   unsigned(3 downto 0);    
    lcd_e    : out      std_logic;
    lcd_rs    : out      std_logic;
    lcd_rw    : out      std_logic
    );
    
end component;    

signal light_counter: integer := 0;
signal red_light, yellow_light, green_light: std_logic := '0';
signal counter: integer := 0;
type lighting_type is (red_x, yellow_x, green_x, yaya);
signal state: lighting_type := red_x;
signal pedestrian_button1, pedestrian_button2, pedestrian_button3: std_logic := '0';
signal pedestrian_button_db: std_logic;
signal first_ssd, second_ssd, third_ssd, fourth_ssd: integer;
signal color_sender: integer := 0;

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
                                
instantiation_lcd: lcd
                        port map(
                                 color => color_sender,
                                 clk => clk,
                                 lcd_db => lcd_db_o,
                                 lcd_e => lcd_e_o,
                                 lcd_rs => lcd_rs_o,
                                 lcd_rw => lcd_rw_o
                                 );
                                 
pedestrian_button1 <= pedestrian_button;
pedestrian_button2 <= pedestrian_button1;
pedestrian_button3 <= pedestrian_button2;
pedestrian_button_db <= pedestrian_button1 and pedestrian_button2 and pedestrian_button3;

process(clk)
begin

if rising_edge(clk) then

case (state) is

when (red_x) =>

    if (pedestrian_button_db = '0') then

        if (light_counter < 99999999*1) then

        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 5;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 1;

        elsif (light_counter < 99999999*2) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 4;
        second_ssd <=13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 1;
        
        elsif (light_counter < 99999999*3) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 3;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 1;
        
        elsif (light_counter < 99999999*4) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 2;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 1;
        
        elsif (light_counter < 99999999*5) then
        
        light_counter <= light_counter + 1;
        red_light <= '1';
        green_light <= '0';
        first_ssd <= 1;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 1;

        else

light_counter <= 99999999*6;
state <= yellow_x;

        end if;

    else

state <= yaya;
light_counter <=0;

    end if;

when (yellow_x) =>

    if (pedestrian_button_db = '0') then

        if (light_counter < 99999999*7) then

light_counter <= light_counter + 1;
yellow_light <= '1';
red_light <= '0';
first_ssd <= 13;
second_ssd <= 13;
third_ssd <= 13;
fourth_ssd <= 13;
color_sender <= 2;

        else

light_counter <= light_counter + 1;
state <= green_x;

        end if;

    else

state <= yaya;
light_counter <=0;

    end if;

when (green_x) =>

    if (pedestrian_button_db = '0') then

        if (light_counter < 99999999*8) then

        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 5;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 3;

        elsif (light_counter < 99999999*9) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';        
        first_ssd <= 4;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 3;
        
        elsif (light_counter < 99999999*10) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 3;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 3;
        
        elsif (light_counter < 99999999*11) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 2;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 3;
        
        elsif (light_counter < 99999999*12) then
        
        yellow_light <= '0';
        light_counter <= light_counter + 1;
        green_light <= '1';
        first_ssd <= 1;
        second_ssd <= 13;
        third_ssd <= 13;
        fourth_ssd <= 13;
        color_sender <= 3;

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
color_sender <= 4;

elsif (light_counter < 99999999*2) then

light_counter <= light_counter + 1;
red_light <= '1';
first_ssd <= 2;
second_ssd <= 12;
third_ssd <= 11;
fourth_ssd <= 10;
color_sender <= 4;

elsif (light_counter < 99999999*3) then

light_counter <= light_counter + 1;
red_light <= '1';
first_ssd <= 1;
second_ssd <= 12;
third_ssd <= 11;
fourth_ssd <= 10;
color_sender <= 4;

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


