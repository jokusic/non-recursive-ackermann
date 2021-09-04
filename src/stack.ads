--------------------------------------------------
-- Author: Michael Wirth, repurposed by Jovana Kusic
-- Student #: 0955683
-- Date: March 1st, 2019
-- Description: this file outlines the procedures and functions whose bodies
-- are written in stack.adb that can be utilized by including the package
--------------------------------------------------

package stack is
    procedure push(x : in Integer);
    procedure pop(x : out Integer);
    function stack_is_empty return Boolean;
    function stack_top return Integer;
    procedure reset_stack;
end stack;
