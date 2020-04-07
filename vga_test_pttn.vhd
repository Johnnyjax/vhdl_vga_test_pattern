library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_test_pttn is
	port(
		video_on : in std_logic;
		pixel_x, pixel_y : in std_logic_vector(9 downto 0);
		graph_rgb : out std_logic_vector(2 downto 0);
		sw : in std_logic
	);
end vga_test_pttn;

architecture arch of vga_test_pttn is
	signal pix_x, pix_y : unsigned(9 downto 0);
	constant VER_WALL1_L : integer := 0;
	constant VER_WALL1_R : integer := 79;
	constant VER_WALL2_L : integer := 80;
	constant VER_WALL2_R : integer := 159;
	constant VER_WALL3_L : integer := 160;
	constant VER_WALL3_R : integer := 239;
	constant VER_WALL4_L : integer := 240;
	constant VER_WALL4_R : integer := 319;
	constant VER_WALL5_L : integer := 320;
	constant VER_WALL5_R : integer := 399;
	constant VER_WALL6_L : integer := 400;
	constant VER_WALL6_R : integer := 479;
	constant VER_WALL7_L : integer := 480;
	constant VER_WALL7_R : integer := 559;
	constant VER_WALL8_L : integer := 560;
	constant VER_WALL8_R : integer := 639;
	
	constant HOR_WALL1_L : integer := 0;
	constant HOR_WALL1_R : integer := 59;
	constant HOR_WALL2_L : integer := 60;
	constant HOR_WALL2_R : integer := 119;
	constant HOR_WALL3_L : integer := 120;
	constant HOR_WALL3_R : integer := 179;
	constant HOR_WALL4_L : integer := 180;
	constant HOR_WALL4_R : integer := 239;
	constant HOR_WALL5_L : integer := 240;
	constant HOR_WALL5_R : integer := 299;
	constant HOR_WALL6_L : integer := 300;
	constant HOR_WALL6_R : integer := 359;
	constant HOR_WALL7_L : integer := 360;
	constant HOR_WALL7_R : integer := 419;
	constant HOR_WALL8_L : integer := 420;
	constant HOR_WALL8_R : integer := 479;
	
	signal hor_wall1_on, hor_wall2_on, hor_wall3_on, hor_wall4_on,
			hor_wall5_on, hor_wall6_on, hor_wall7_on, hor_wall8_on : std_logic;
	signal ver_wall1_on, ver_wall2_on, ver_wall3_on, ver_wall4_on,
			ver_wall5_on, ver_wall6_on, ver_wall7_on, ver_wall8_on : std_logic;
begin
	pix_x <= unsigned(pixel_x);
	pix_y <= unsigned(pixel_y);
	
	ver_wall1_on <= '1' when (VER_WALL1_L <= pix_x) and (pix_x <= VER_WALL1_R) else
						 '0';
	ver_wall2_on <= '1' when (VER_WALL2_L <= pix_x) and (pix_x <= VER_WALL2_R) else
						 '0';
	ver_wall3_on <= '1' when (VER_WALL3_L <= pix_x) and (pix_x <= VER_WALL3_R) else
						 '0';
	ver_wall4_on <= '1' when (VER_WALL4_L <= pix_x) and (pix_x <= VER_WALL4_R) else
						 '0';
	ver_wall5_on <= '1' when (VER_WALL5_L <= pix_x) and (pix_x <= VER_WALL5_R) else
						 '0';
	ver_wall6_on <= '1' when (VER_WALL6_L <= pix_x) and (pix_x <= VER_WALL6_R) else
						 '0';
	ver_wall7_on <= '1' when (VER_WALL7_L <= pix_x) and (pix_x <= VER_WALL7_R) else
						 '0';
	ver_wall8_on <= '1' when (VER_WALL8_L <= pix_x) and (pix_x <= VER_WALL8_R) else
						 '0';
	hor_wall1_on <= '1' when (HOR_WALL1_L <= pix_y) and (pix_y <= HOR_WALL1_R) else
						 '0';
	hor_wall2_on <= '1' when (HOR_WALL2_L <= pix_y) and (pix_y <= HOR_WALL2_R) else
						 '0';
	hor_wall3_on <= '1' when (HOR_WALL3_L <= pix_y) and (pix_y <= HOR_WALL3_R) else
						 '0';
	hor_wall4_on <= '1' when (HOR_WALL4_L <= pix_y) and (pix_y <= HOR_WALL4_R) else
						 '0';
	hor_wall5_on <= '1' when (HOR_WALL5_L <= pix_y) and (pix_y <= HOR_WALL5_R) else
						 '0';
	hor_wall6_on <= '1' when (HOR_WALL6_L <= pix_y) and (pix_y <= HOR_WALL6_R) else
						 '0';
	hor_wall7_on <= '1' when (HOR_WALL7_L <= pix_y) and (pix_y <= HOR_WALL7_R) else
						 '0';
	hor_wall8_on <= '1' when (HOR_WALL8_L <= pix_y) and (pix_y <= HOR_WALL8_R) else
						 '0';
	
	process(video_on, hor_wall1_on, hor_wall2_on, hor_wall3_on, hor_wall4_on, hor_wall5_on,
				hor_wall6_on, hor_wall7_on, hor_wall8_on, ver_wall1_on, ver_wall2_on, ver_wall3_on,
				ver_wall4_on, ver_wall5_on, ver_wall6_on, ver_wall7_on, ver_wall8_on)
	begin
		if video_on = '0' then
			graph_rgb <= "000";
		else 
			if(sw = '1') then
				if hor_wall1_on = '1' then
					graph_rgb <= "000";
				elsif hor_wall2_on = '1' then
					graph_rgb <= "001";
				elsif hor_wall3_on = '1' then
					graph_rgb <= "010";
				elsif hor_wall4_on = '1' then
					graph_rgb <= "011";
				elsif hor_wall5_on = '1' then
					graph_rgb <= "100";
				elsif hor_wall6_on = '1' then
					graph_rgb <= "101";
				elsif hor_wall7_on = '1' then
					graph_rgb <= "110";
				elsif hor_wall8_on = '1' then
					graph_rgb <= "111";
				else
					graph_rgb <= "000";
				end if;
			else
				if ver_wall1_on = '1' then
					graph_rgb <= "000";
				elsif ver_wall2_on = '1' then
					graph_rgb <= "001";
				elsif ver_wall3_on = '1' then
					graph_rgb <= "010";
				elsif ver_wall4_on = '1' then
					graph_rgb <= "011";
				elsif ver_wall5_on = '1' then
					graph_rgb <= "100";
				elsif ver_wall6_on = '1' then
					graph_rgb <= "101";
				elsif ver_wall7_on = '1' then
					graph_rgb <= "110";
				elsif ver_wall8_on = '1' then
					graph_rgb <= "111";
				else
					graph_rgb <= "000";
				end if;
			end if;
		end if;
	end process;
end arch;