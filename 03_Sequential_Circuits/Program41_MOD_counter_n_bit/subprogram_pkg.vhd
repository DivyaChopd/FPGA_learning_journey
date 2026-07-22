-- ===============================================================================
-- Function ceil_log2 in a package
-- ===============================================================================

package subprogram_pkg is
    function clog2 (input:positive) return natural;
end package;

package body subprogram_pkg is
    function clog2 (input: positive) return natural is
        variable result: natural := 0;
        begin
            while 2**result < input loop
                result := result + 1;
            end loop;
            return result;
        end function clog2;
    end package body;

