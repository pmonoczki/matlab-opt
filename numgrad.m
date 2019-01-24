function g=numgrad(x,fun)
% calculates numerical gradient of function f at x
% input parameters:
%      x    - point where grad f(x) is evaluated
%     fun   - user supplied routine for y=f(x), it is a character variable
% output parameters:
%     g     - gradient of f at point x (column vector)
% --------------
h=sqrt(eps);
n=length(x);
for i=1:n
   xf=x;
   xa=x;
   xf(i)=x(i)+h;
   xa(i)=x(i)-h;
   g(i,1)=(feval(fun,xf)-feval(fun,xa))/(2*h);
end
