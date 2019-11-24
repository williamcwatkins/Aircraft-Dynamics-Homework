function [EquationsOfMotion] = golfballFlight(t, State)
%golfballFlight contains the equations that ODE45 uses to model the flight
%of the golfball

%% Define global variables

global mass C_d p A W_N W_E W_D

%% Gather State variables

N = State(1); % [m], initial x-position of the ball
E = State(2); % [m], initial y-position of the ball
D = State(3); % [m], initial z-position of the ball
V_N = State(4) + W_N; % [m/s], initial velocity in N direction
V_E = State(5) + W_E; % [m/s], initial velocity in E direction
V_D = State(6) + W_D; % [m/s], initial velocity in D direction

%% Non-differential equations

Vmag = sqrt(V_N^2 + V_E^2 + V_D^2); % [m/s], magnitude of the velocity

Drag = (p / 2) * (Vmag ^ 2) * C_d * A; % [N], drag on the golfball as it flies

%% Heading Components

hN = V_N / Vmag; % North heading
hE = V_E / Vmag; % East heading
hD = V_D / Vmag; % Down heading

%% Differential Equations

% Velocity Equations
dNdt = V_N;
dEdt = V_E;
dDdt = V_D;

% Acceleration equations
dVNdt = -Drag * (hN / mass);
dVEdt = -Drag * (hE / mass);
dVDdt = -Drag * (hD / mass) + 9.81;

%% Create change vector

EquationsOfMotion(1) = dNdt;
EquationsOfMotion(2) = dEdt;
EquationsOfMotion(3) = dDdt;
EquationsOfMotion(4) = dVNdt;
EquationsOfMotion(5) = dVEdt;
EquationsOfMotion(6) = dVDdt;
EquationsOfMotion = EquationsOfMotion';

end

