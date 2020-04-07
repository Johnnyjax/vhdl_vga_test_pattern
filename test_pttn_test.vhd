library ieee;
use ieee.std_logic_1164.all;

entity test_pttn_test is
	port(
		CLOCK_50 : in std_logic;
		SW       : in std_logic_vector(0 downto 0);
		KEY      : in std_logic_vector(0 downto 0);
		VGA_HS, VGA_VS : out std_logic;
		VGA_R, VGA_B, VGA_G : out std_logic_vector(2 downto 0)
	);
end test_pttn_test;

architecture arch of test_pttn_test is
	signal rgb_reg, rgb_next : std_logic_vector(2 downto 0);
	signal video_on, pixel_tick : std_logic;
	signal pixel_x, pixel_y : std_logic_vector(9 downto 0);
begin
	vga_sync_unit : entity work.vga_sync
		port map(clk => CLOCK_50, reset => not(KEY(0)),
					vsync => VGA_VS, hsync => VGA_HS, video_on => video_on,
					p_tick => pixel_tick, pixel_x => pixel_x, pixel_y => pixel_y);
	test_pttn_unit : entity work.vga_test_pttn(arch)
		port map(video_on => video_on, sw => SW(0),
				   pixel_x => pixel_x, pixel_y => pixel_y,
					graph_rgb => rgb_next);
	
	process(CLOCK_50)
	begin
		if(CLOCK_50'event and CLOCK_50 = '1') then
			if(pixel_tick = '1') then
				rgb_reg <= rgb_next;
			end if;
		end if;
	end process;
	VGA_R <= (others => rgb_reg(2)) when video_on = '1' else "000";
	VGA_G <= (others => rgb_reg(1)) when video_on = '1' else "000";
	VGA_B <= (others => rgb_reg(0)) when video_on = '1' else "000";

end arch;