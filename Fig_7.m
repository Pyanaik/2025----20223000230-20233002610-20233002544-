clc; clear; close all;

%% 1. 定义变量
v = linspace(0, 3, 500); % 提高精度到500个点
num_points = length(v);

pi_comp = zeros(1, num_points); % 竞争模型总利润
pi_ex = zeros(1, num_points);   % 独家模型总利润

%% 2. 计算利润 (基于积分推导的公式)
for i = 1:num_points
    val = v(i);
    
    % --- Part A: 竞争模型 (原文 Section V) ---
    if val <= 1
        % Prop 1(a): p = v^2/4, q = 2/3, Total = 2 * p * q
        pi_comp(i) = 2 * (val^2/4) * (2/3);
    elseif val <= 2
        % Prop 1(b): p = (2v-1)/4, q = ...
        p_c = (2*val - 1) / 4;
        q_c = (val - 0.5) / (2*val - 1 - val^2/4); 
        pi_comp(i) = 2 * p_c * q_c;
    else
        % Prop 1(c): p = 1/2, q = 1
        pi_comp(i) = 2 * 0.5 * 1;
    end
    
    % --- Part B: 独家销售模型 (创新点 Section XI) ---
    if val <= 1
        % 积分结果: 1/2*v^2 - p > 0 => p = 1/2*v^2
        % 此时只卖给1人
        pi_ex(i) = 0.5 * val^2;
    elseif val <= 2
        % 积分结果: v - 1/2 - p > 0 => p = v - 0.5
        % B 退出，A 独享
        pi_ex(i) = val - 0.5;
    else
        % 积分结果: 1/2*v - 1/2 - p > (1/2*v - 1)
        % p = 0.5
        pi_ex(i) = 0.5;
    end
end

%% 3. 绘图与自动标记
figure('Color','w', 'Position', [100, 100, 800, 500]);
plot(v, pi_comp, 'b-', 'LineWidth', 2); hold on;
plot(v, pi_ex, 'r--', 'LineWidth', 2);

% 寻找交叉点 (Switch Point)
% 在 v > 2 之后寻找交叉点
diff = pi_comp - pi_ex;
% 我们只关心 v > 1.5 之后的交叉，因为前面显而易见
check_indices = find(v > 1.5);
cross_idx = check_indices(find(diff(check_indices) > 0, 1)); % 找到竞争模型反超的第一个点

if ~isempty(cross_idx)
    x_cross = v(cross_idx);
    y_cross = pi_comp(cross_idx);
    plot(x_cross, y_cross, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
    % 绘制垂直虚线
    line([x_cross, x_cross], [0, y_cross], 'Color', 'k', 'LineStyle', ':');
    text(x_cross + 0.1, y_cross - 0.1, sprintf('临界点v \\approx %.2f', x_cross), 'FontSize', 12, 'FontWeight', 'bold');
end

grid on;
xlabel('$v$', 'FontSize', 14,"Interpreter","latex");
ylabel('$\pi$', 'FontSize', 14,"Interpreter","latex");
legend({'标准竞争模型', '独家销售模型'}, 'Location', 'NorthWest', 'FontSize', 12);
ylim([0, 1.2]); % 调整Y轴范围以便观察