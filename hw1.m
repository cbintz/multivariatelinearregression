% Corinne Bintz
% HW 1

data = load('x15a.txt');
data(:,1) = []; % remove first column since it just contains row numbers

[rows, cols] = size(data);
x = data(:, 1:cols-1);
y = data(:, cols);

[x2 mu sigma] = featureNormalize(x);
X = addones(x2);

num_iters = 78;
alpha = 0.4;
theta = zeros(1, cols)';

j = computeCost(X, y, theta);
axis([0 num_iters 0 j]) 
 
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);
% Plot the convergence graph
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

theta % theta from gradient descent
J = computeCost(X, y, theta) % cost from gradient descent

xtest = [7.5  4200  9999  0.7];
xtest_norm = (xtest - mu)./sigma; % normalize xtest
xtest_norm_Ones = addones(xtest_norm); % add ones so you can multiply by theta
ytest = xtest_norm_Ones* theta % prediction of y from gradient descent

% use normal equation to find theta
x_ones = addones(x); % add ones to x so you can multiply by theta
theta2 = pinv(x_ones' * x_ones) * x_ones' * y % theta from normal equation
J2 = computeCost(x_ones, y, theta2) % cost from normal equation

xtest_ones = addones(xtest); % add ones to xtest so you can multiply by theta
ytest2 = xtest_ones * theta2 % prediction of y from normal equation  