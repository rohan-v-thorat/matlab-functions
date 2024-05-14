%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code uses ode45 solver
%
% Sample Usage: 
%
% >>para = [1, 100, 0.4, 10]; % para = [mass, stiffness, damping, nonlinear coeff]
% >>u = 1;
% >>gacc = 1;
% >>x = [1;1]; % state at time t
% >>x = discrete_ss(x,para,u,gacc); % state at time t+1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output = discrete_ss(x,para,u,gacc)

dt = 0.01;
tspan = [0 dt];
x0 = x;
[t,output] = ode45(@(t,x)continuous_ss(x,para,u,gacc),tspan,x0);
output = output(end,:)';

    function output = continuous_ss(x,para,u,gacc)
    m = para(1);
    k = para(2);
    c = para(3);
    nonlinearcoef = para(4);
    output = [x(2);...
              -k/m*x(1)-c/m*x(2)-nonlinearcoef/m*x(1)^3+u/m-gacc];
    end
end