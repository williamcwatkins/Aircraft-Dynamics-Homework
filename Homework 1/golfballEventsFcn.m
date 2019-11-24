function [value, isterminal, direction] = golfballEventsFcn(~,y)
%golfballEventsFcn stops the ODE45 integrator when the golfball hits the
%ground

value = y(3); % Looking for the z-position to be 0;
isterminal = 1; % Make sure ODE45 stops when we hit this event
direction = -1; % Only marks zeros after z has started to decrease again

end

