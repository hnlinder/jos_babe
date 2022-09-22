%I usually close and clear at start of main script,
%It can save a lot of headaches
close all
clear

m = 1200e-3;    %g ??   SI units? I wrote in kg now
D = 2.23;       %kg/m   ? assumption?
g = 9.82;       %m/s^2
d = 1.11;       %m      ? assumption?
B = 71.63;      %N      ? assumption?
rho = 1.293;    %kg/m^3 ? just says k/m^3

% Anonymous function for acceleration as a function of velocity.
% Just to make it easier to read in the loop
acceleration_function = @(v) B/m - g - (D/m) *abs(v)*v;

% Time step, good enough for this simulation
dt = .01

%initialize variables
t = linspace(0,5,1/dt);
t_length = length(t);
v = zeros(t_length,1);
a = zeros(t_length,1);
z = zeros(t_length,1);

%acceleration is not zero at t=0,
%so we define an initial acceleration for v=0
a(1) = acceleration_function(v(1));

%loop where we update the current velocity
%based on previous velocity and acceleration
for i = 2:t_length
  v(i) = v(i-1) + a(i-1)*dt;
  z(i) = z(i-1) + v(i-1)*dt;
  a(i) = acceleration_function(v(i));
end

%plot the results
plot(t,v)
xlabel("Time [s]")
ylabel("Velocity [m/s]")
grid on

figure
plot(t,z)
xlabel("Time [s]")
ylabel("Height [m]")
grid on
%text(2.5,4,"Note terminal velocity up here")
