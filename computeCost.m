function j = computeCost(X, y, theta)
  h = X * theta;
  sub = h-y;
  sqr = sub' * sub;
  m = rows(y);
  j = sqr / (2*m);
endfunction

% computeCost measures the accuracy of hypothesis function by taking an average difference 
% of all the results of the hypothesis with inputs of x's and the actual output y's