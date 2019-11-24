%% ASEN 3200: Homework 1

% William Watkins

%% Prepare workspace 

close all;
clear all;
clc;

%% Declare Constants

global mass C_d p A W_N W_E W_D

mass = 0.03; % [kg]
dia = 0.03; % [m], diameter of golf ball
C_d = 0.6; % Coefficient of drag of golfball
x_i = 0.0; % [m], initial x-position of the ball
y_i = 0.0; % [m], initial y-position of the ball
z_i = 0.0; % [m], initial z-position of the ball
V_Ni = 0.0; % [m/s], initial velocity in N direction
V_Ei = 20.0; % [m/s], initial velocity in E direction
V_Di = -20.0; % [m/s], initial velocity in D direction
W_N = 0.0; % [m/s], wind initial velocity in N direction
W_E = 0.0; % [m/s], wind initial velocity in N direction
W_D = 0.0; % [m/s], wind initial velocity in N direction
p = 1.225; % [kg/m^3], density of air
A = 3.14 * (dia/2) ^2; % [m^2], cross sectional area of the ball

%% Preparing for ODE45

Initials = [x_i y_i z_i V_Ni V_Ei V_Di]; % Declaring the initial state vector for ODE45

tSpan = 0:0.001:10; % [s], time range for ODE45 plotting

options = odeset('Events', @golfballEventsFcn);

%% Call the ODE

[t, y, te, ye, ie] = ode45(@golfballFlight, tSpan, Initials, options);

%% Plot Results

plot3(y(:,1), y(:,2), -y(:,3));

%% Events Function

function [value, isterminal, direction] = golfballEventsFcn(~,y)
%golfballFlightEventsFcn stops the ODE45 integrator when the golfball hits the
%ground

value = y(3); % Looking for the z-position to be 0;
isterminal = 1; % Make sure ODE45 stops when we hit this event
direction = 1; % Only marks zeros after z has started to decrease again

end
