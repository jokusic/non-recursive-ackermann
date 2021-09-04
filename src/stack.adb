--------------------------------------------------
-- Author: Michael Wirth, repurposed by Jovana Kusic
-- Student #: 0955683
-- Date: March 1st, 2019
-- Description: this file encompasses the procedures and functions for
-- a stack of integers, including adding and removing from a stack, checking
-- if the stack is empty, returning the top of the stack and reseting the stack.
--------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body stack is
    type list is array(1..99999) of Integer;
    type int_stack is
        record
            item : list;
            top : natural := 0;
        end record;
    st: int_stack;

    procedure push(x : in Integer) is
    begin
        if st.top = 99999 then
            put_line("stack is full");
        else
            st.top := st.top + 1;
            st.item(st.top) := x;
        end if;
    end push;

    procedure pop( x : out Integer) is
    begin
        if st.top = 0 then
            put_line("stack is empty");
        else
            x := st.item(st.top);
            st.top := st.top - 1;
        end if;
    end pop;

    function stack_is_empty return Boolean is
    begin
        return st.top = 0;
    end stack_is_empty;
    
    function stack_top return Integer is
    begin
        if st.top = 0 then
            put_line("stack is empty");
            return 0;
        else
            return st.item(st.top);
        end if;
    end stack_top;
 
    procedure reset_stack is
    begin
        st.top := 0;
    end reset_stack;
    
end stack;
