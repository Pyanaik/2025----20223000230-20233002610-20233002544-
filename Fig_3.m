% 水平线 p = 1/2 - 只在v>2时有效
v_half = linspace(2.001, 3, 1000);
p_half = 0.5 * ones(size(v_half));

% 抛物线 p = (1/8)v² - p的取值为[0,0.5]
v_parabola1 = linspace(0, 2, 1000);
p_parabola1 = (1/8) * v_parabola1.^2;
% 只保留p∈[0,0.5]的部分
valid_idx1 = p_parabola1 >= 0 & p_parabola1 <= 0.5;
v_parabola1 = v_parabola1(valid_idx1);
p_parabola1 = p_parabola1(valid_idx1);

% 抛物线 p = (1/2)v² - p的取值为[0,0.5]
v_parabola2 = linspace(0, 2, 1000);
p_parabola2 = (1/2) * v_parabola2.^2;
% 只保留p∈[0,0.5]的部分
valid_idx2 = p_parabola2 >= 0 & p_parabola2 <= 0.5;
v_parabola2 = v_parabola2(valid_idx2);
p_parabola2 = p_parabola2(valid_idx2);

% 直线 p = v - 0.5 - p的取值为[0.5,1.5]
% 计算对应的v范围: v = p + 0.5, 所以v∈[1,2]
v_line = linspace(1, 2, 1000);
p_line = v_line - 0.5;
% 只保留p∈[0.5,1.5]的部分
valid_idx_line = p_line >= 0.5 & p_line <= 1.5;
v_line = v_line(valid_idx_line);
p_line = p_line(valid_idx_line);

% 垂直线 v = 1 - 只在p=[1/8, 0.5]有效
v1 = 1;
p_v1 = linspace(1/8, 0.5, 200);

% 垂直线 v = 2 - 只在p的有效范围内有效
v2 = 2;
p_v2 = linspace(0.5, 1.5, 200);

% 绘制图形
figure;
hold on; % 保持当前图形以便添加更多线条
box on;  % 添加上侧和右侧的轴线
% 绘制水平线 p = 1/2 
plot(p_half, v_half, 'g-', 'LineWidth', 2,'Color',[0.54,0.67,0.34]);

% 绘制抛物线 p = (1/8)v² 
plot(p_parabola1, v_parabola1, 'b-', 'LineWidth', 2,'Color',[0.11,0.44,0.65]);

% 绘制抛物线 p = (1/2)v²
plot(p_parabola2, v_parabola2, 'r-', 'LineWidth', 2,'Color',[1, 1, 0]);

% 绘制直线 p = v - 1/2
plot(p_line, v_line, 'c-', 'LineWidth', 2,'Color',[1, 0.4, 0]);

% 绘制垂直线 v = 1 
plot(p_v1, v1 * ones(size(p_v1)), 'm-', 'LineWidth', 2,'Color',[0.46,0.75,0.89]);

% 绘制垂直线 v = 2 
plot(p_v2, v2 * ones(size(p_v2)), 'm-', 'LineWidth', 2,'Color',[0.5, 0, 0.5]);

% 移除所有文本标签（区域标记和曲线标签）

% 设置坐标轴标签
xlabel('$p$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$v$', 'Interpreter', 'latex', 'FontSize', 14);

% 设置x轴和y轴的刻度范围
xlim([0 2]); ylim([0 2.5]);

% 设置刻度标签，使用明确的向量格式
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
set(gca, 'YTick', [0, 0.5, 1, 1.5, 2, 3]);

% 设置轴的方向
set(gca, 'YDir', 'normal'); % 确保y轴从下到上增加

hold off; % 结束绘图模式