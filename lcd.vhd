library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcd is

port(
    color   : in integer := 0;
    clk     : in      std_logic;
    lcd_db	: out   unsigned(3 downto 0);    
    lcd_e	: out	  std_logic;
    lcd_rs	: out	  std_logic;
    lcd_rw	: out	  std_logic
);
end lcd;

architecture behavioral of lcd is

type data_type is array (0 to 7) of unsigned(7 downto 0);
signal counter: integer := 0;
signal initial_delay: integer  :=  4000000;  --40 ms delay
signal delay1: integer  :=  200000;   --2  ms delay
signal delay2: integer  :=  5000;   --50 us delay
signal data : data_type :=((X"20"),(X"20"),(X"20"),(X"20"), (X"20"), (X"20"),(X"20"),(X"20"));    
signal data_1 : data_type :=((X"53"),(X"54"),(X"4F"),(X"50"), (X"20"), (X"20"),(X"20"),(X"20"));
signal data_2 : data_type :=((X"52"),(X"45"),(X"41"),(X"44"), (X"59"), (X"20"),(X"20"),(X"20"));
signal data_3 : data_type :=((X"47"),(X"4F"),(X"20"),(X"20"), (X"20"), (X"20"),(X"20"),(X"20"));
signal data_4 : data_type :=((X"57"),(X"41"),(X"4C"),(X"4B"), (X"45"), (X"52"),(X"20"),(X"20"));
signal  lcd  :  unsigned(6 downto 0):="1111111";
     
begin

lcd_db	<=	lcd(3 downto 0);
lcd_e	<=	lcd(6);
lcd_rs	<=	lcd(5);
lcd_rw	<=	lcd(4);
 
process(clk)
variable	step	:	integer range 0 to 27		:=	0;
variable	counter	:	integer range 0 to 5000000	:=	0;
variable	i	:	integer range 0 to 7		:=	0;

begin
    
    if(rising_edge(clk))	then
       
       counter:=counter+1;
       
       if color = 1 then
       
       data <= data_1;
       
       elsif color = 2 then
       
        data <= data_2;
       
       elsif color = 3 then
       
        data <= data_3;
       
       elsif color = 4 then
       
        data <= data_4;
       
       end if;
       
       case	step	is
---------------Initial Delay, 40 ms -----------------------------
		when	0	=>	if (counter=initial_delay)	then
						counter	:=	0;
						step	:=	1;
					end if;
---------------Initial Settings, Works as 2x16----------------
		when	1	=>	lcd <= "1000010";
					if (counter=delay2/20) then
						counter	:=	0;
						step	:=	2;
					end if;
		when	2	=>	lcd <= "0000010";
					if (counter=delay2/20) then
						step	:=	3;
					end if;
		when	3	=>	lcd <= "1001110";
					if (counter=delay2/10) then
						step	:=	4;
					end if;
		when	4	=>	lcd <= "0001110";
					if (counter=3*delay2/20) then
						step	:=	5;
					end if;
		when	5	=>	lcd <= "1001000";
					if (counter=delay2/5) then
						step	:=	6;
					end if;
		when	6	=>	lcd <= "0000010";
					if (counter=delay2) then
						step	:=	7;
						counter	:=	0;
					end if;
---------------Open Display, Marker Settings---------------
		when	7	=>	lcd <= "1000000";
					if (counter=delay2/20) then
						step	:=	8;
					end if;
		when	8	=>	lcd <= "0000000";
					if (counter=delay2/10) then
						step	:=	9;
					end if;
		when	9	=>	lcd <= "1001100";
					if (counter=3*delay2/20) then
						step	:=	10;
					end if;
		when	10	=>	lcd <= "0001100";
					if (counter=delay2) then
						step	:=	11;
						counter	:=	0;
					end if;
---------------Clear Screen, Go to Starting Address-----------------
		when	11	=>	lcd <= "1000000";
					if (counter=delay1/800) then
						step	:=	12;
					end if;
		when	12	=>	lcd <= "0000000";
					if (counter=delay1/400) then
						step	:=	13;
					end if;
		when	13	=>	lcd <= "1000001";
					if (counter=3*delay1/800) then
						step	:=	14;
					end if;
		when	14	=>	lcd <= "0000001";
					if (counter=delay1) then
						step	:=	15;
						counter	:=	0;
					end if;
---------------Adressing Settings, Increasing Address---------------------
		when	15	=>	lcd <= "1000000";
					if (counter=delay2/20) then
						step	:=	16;
						end if;
		when	16	=>	lcd <= "0000000";
					if (counter=delay2/10) then
						step	:=	17;
					end if;
		when	17	=>	lcd <= "1000110";
					if (counter=3*delay2/20) then
						step	:=	18;
					end if;
		when	18	=>	lcd <= "0000110";
					if (counter=delay2) then
						step	:=	19;
						counter	:=	0;
					end if;
---------------Creating Characters in the Display--------------------------
        when    19    =>    lcd <= "110"&data(i)(7 downto 4);
                    if (counter=delay2/20) then
                        step    :=    20;
                    end if;
        when    20    =>    lcd <= "010"&data(i)(7 downto 4);
                    if (counter=delay2/10) then
                        step    :=    21;
                    end if;
        when    21    =>    lcd <= "110"&data(i)(3 downto 0);
                    if (counter=3*delay2/20) then
                        step    :=    22;
                    end if;
        when    22    =>    lcd <= "010"&data(i)(3 downto 0);
                    if (counter=delay2) then
                        step    :=    23;
                        counter:= 0;
                    end if;    
        -- Switch to bottom line
        when    23  => 
                    if (i=6) then
                        lcd <= "100"&"1100";
                        if (counter=delay2/20) then
                            step := 24;
                        end if;
                    else
                    step := 27;
                    end if;
        when 24 => lcd <= "000"&"1100";
                        if (counter=delay2/10) then
                            step := 25;
                        end if;
                    
        when 25 => lcd <= "100"&"0000";
                        if(counter=3*delay2/20) then
                            step:= 26;
                            end if;
        
       when 26 => lcd <= "000"&"0000";
                        if(counter=delay2) then
                            step := 27;
                            end if;
		when	27	=>
		
		              if (i<7) then
						i:=i+1;
						step	:=	19;
						counter:=0;
					else
					
					step	:=	0;
                    counter:=0;
                    i := 0;					

					end if;

      end case;
    end if;
    
end process;
end Behavioral;

