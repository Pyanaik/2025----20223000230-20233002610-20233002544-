% 定义变量范围
v = linspace(0, 2.5,16); % v 在 [0, 2.5] 范围内取值

% 定义 p 的三种取值
p_values = [1/4, 1/8, 1/16];

% 初始化图形
figure;
hold on;
box on;
% 获取当前坐标轴的句柄
ax = gca; 
% 设置线宽，例如 2 或 3 磅
ax.LineWidth = 2; 


% 绘制每条曲线
for i = 1:length(p_values)
    p = p_values(i);
    f = zeros(size(v)); % 初始化 f 数组
       
    % 根据条件计算 f 的值
    for j = 1:length(v)
        if v(j) > 2 && p <= 1/2
            f(j) = 1/2 - p;
        elseif v(j) <= 2 && p <= (1/8)*v(j)^2
            f(j) = (1/8)*v(j)^2 - p;
        else
            f(j) = 0;
        end
    end
    
    % 绘制曲线
    if i == 1
        plot(v, f, 'o','Color',[0.04,0.42,0.70],'LineWidth',1);
    elseif i == 2
        plot(v, f, '*','Color',[0.87,0.29,0.05],'LineWidth',1);
    else
        plot(v, f, '*','Color',[0.95,0.70,0.10],'LineWidth',1);
    end
end

% 定义变量范围
v = linspace(0, 2.5,300); % v 在 [0, 2.5] 范围内取值

% 绘制每条曲线
for i = 1:length(p_values)
    p = p_values(i);
    f = zeros(size(v)); % 初始化 f 数组
       
    % 根据条件计算 f 的值
    for j = 1:length(v)
        if v(j) > 2 && p <= 1/2
            f(j) = 1/2 - p;
        elseif v(j) <= 2 && p <= (1/8)*v(j)^2
            f(j) = (1/8)*v(j)^2 - p;
        else
            f(j) = 0;
        end
    end
    
    % 绘制曲线
    if i == 1
        plot(v, f, '-.','Color',[0.04,0.42,0.70],'LineWidth',1); 
    elseif i == 2
        plot(v, f, '-.','Color',[0.87,0.29,0.05],'LineWidth',1);
    else
        plot(v, f, '-.','Color',[0.95,0.70,0.10],'LineWidth',1);
    end
end

% 设置图形属性
xlabel('v');
ylabel('f');


% 设置坐标轴标签
xlabel('$v$', 'Interpreter', 'latex', 'FontSize', 14,'LineWidth',2);
ylabel('$f$', 'Interpreter', 'latex', 'FontSize', 14,'LineWidth',2);

% 设置x轴和y轴的刻度范围
xlim([0 2.5]); ylim([0 0.5]);

% 设置刻度标签，使用明确的向量格式
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2, 2.5]);
set(gca, 'YTick', [0, 0.1, 0.2, 0.3, 0.4, 0.5]);


% 定义变量范围
v = linspace(4, 5, 300); % 标签使用

% 绘制每条曲线
for i = 1:length(p_values)
    p = p_values(i);
    f = zeros(size(v)); % 初始化 f 数组
       
    % 根据条件计算 f 的值
    for j = 1:length(v)
        if v(j) > 2 && p <= 1/2
            f(j) = 1/2 - p;
        elseif v(j) <= 2 && p <= (1/8)*v(j)^2
            f(j) = (1/8)*v(j)^2 - p;
        else
            f(j) = 0;
        end
    end
    
    % 绘制曲线
    if i == 1
        h1 = plot(v, f, 'o-.','Color',[0.04,0.42,0.70],'LineWidth',1); 
    elseif i == 2
        h2 = plot(v, f, '*-.','Color',[0.87,0.29,0.05],'LineWidth',1);
    else
        h3 = plot(v, f, '*-.','Color',[0.95,0.70,0.10],'LineWidth',1);
    end
end





lgd = legend([h1, h2, h3], '$p = 1/4$', '$p = 1/8$', '$p = 1/16$', 'Interpreter', 'latex');
% 设置轴的方向
set(gca, 'YDir', 'normal'); % 确保y轴从下到上增加
% --- 其余样式设置 (边框、颜色等) ---
lgd.Box = 'on';
lgd.EdgeColor = 'k';
lgd.Color = 'w';
lgd.Location = 'NorthWest';
lgd.FontSize = 20;
lgd.TextColor = [0,0,0]
lgd.Interpreter = 'latex'; 


grid off;
hold off;