clear; clc; 

% 定义第一段曲线的x范围和y值
x1 = linspace(0, 0.5, 400); % 创建从0到0.5的400个点
y1 = sqrt(2 * x1);          % 计算对应的y值

% 定义第二段曲线的x值和y范围
x2 = 0.5 * ones(size(linspace(1, 2, 400))); % 创建一个所有元素都为0.5的向量
y2 = linspace(1, 2, 400);                   % 创建从1到2的400个点

% 定义第三段曲线的y值和x范围
y3 = 1 * ones(size(linspace(1, 2, 400))); % 创建一个所有元素都为1的向量
x3 = linspace(0, 2, 400);                   % 创建从0到2的400个点

% 绘制图形
figure;
hold on; % 保持当前图形以便添加更多线条
box on;  % 添加上侧和右侧的轴线
plot(x3, y3, 'Color',[0.6471,0.1647,0.1647], 'LineWidth', 2);
xlabel('$p$', 'Interpreter', 'lateX', 'FontSize', 14);
ylabel('$v$', 'Interpreter', 'latex', 'FontSize', 14);

% 绘制第一条曲线 y = sqrt(2x)
plot(x1, y1, 'b-', 'LineWidth', 2);

% 绘制第二条曲线 x = 0.5
plot(x2, y2, 'r-', 'LineWidth', 2);

% 设置x轴和y轴的刻度范围
xlim([0 2]);
ylim([0 2]);

% 设置刻度标签，使用明确的向量格式
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
set(gca, 'YTick', [0, 0.5, 1, 1.5, 2, 3]);

hold off; % 结束绘图模式