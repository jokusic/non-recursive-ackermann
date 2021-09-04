--------------------------------------------------
-- Author: Jovana Kusic
-- Student #: 0955683
-- Date: March 1st, 2019
-- Description: this file grabs two numbers from the user and runs a
-- non-recursive ackermann function using a stack and then returns the 
-- the final number and the amount of time it takes to run in milliseconds.
--------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with stack; use stack;


--------------------------------------------------
-- This procedure is the main of the program. It takes in user
-- input of two numbers, and then calls another procedure to
-- calculate the ackermann number, which is then returned back to
-- the main and displayed to the user, along with the time it took to run.
--------------------------------------------------
procedure ackermann is
    startTime, endTime : Time;
    milliS : Duration;
    m : integer := 0;
    n : integer := 0;
	
    --------------------------------------------------
    -- This procedure takes in two numbers and performs the Ackermann
    -- function non-recursively by utilizing a stack to store the numbers
    -- and then returns the final result.
    --------------------------------------------------
    procedure calcAckermann(m: in out Integer; n : in out Integer) is
    begin
    -- Resets stack to the beginning and pushes the first number on
    stack.reset_stack;
    stack.push(m);
    -- Continues to loop until the stack is empty 
    while stack.stack_is_empty = false loop
        -- Starts by popping off the top of the stack
        stack.pop(m);
        -- If m is 0, 1 will be added to n
        if m = 0 then
            n := n + 1;
        -- If n is 0, it will be given a value of 1, and m will
        -- decrease by 1 and be pushed back onto the stack
        elsif n = 0 then
            n := 1;
            m := m - 1;
            stack.push(m);
        -- If neither condition is met, m will decrease by 1 and be 
        -- pushed back onto the stack, along with its original value
        -- and then n will decrease by 1
        else
            m := m - 1;
            stack.push(m);
            m := m + 1;
            stack.push(m);
            n := n - 1;
        end if;
    end loop;
    -- The final value of n is displayed to the user
    put("Result:"); put(n);
    new_line;
    end calcAckermann;
    
    begin
        startTime := Clock;
        -- Grabs user input for the value of two numbers
        put_line("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
        put_line("-------Ackermann Function-------");
        put_line("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
        new_line;
        put_line("Please enter the first number: ");
        get(m);
        put_line("Please enter the second number: ");
        get(n);
        
        calcAckermann(m,n);
        endTime := Clock;
        -- Converts the time difference of the clock into milliseconds
        milliS := (endTime - startTime) *1000;
        
        -- Displays amount of time the program took to run
        put_line("Runtime:" & Duration'image(milliS) & " milliseconds");
        new_line;
end ackermann;








