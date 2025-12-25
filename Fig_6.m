% 定义变量范围
v = linspace(0, 2.5,16); % v 在 [0, 2.5] 范围内取值

% 初始化图形
figure;
hold on;
box on;
% 获取当前坐标轴的句柄
ax = gca; 
% 设置线宽，例如 2 或 3 磅
ax.LineWidth = 2; 



% 绘制每条曲线
p = zeros(size(v)); % 初始化 p 数组
f = zeros(size(v)); % 初始化 f 数组
for j = 1:length(v)
        if v(j) <= 1
            p(j) = 1/4 * v(j)^2;
            f(j) = v(j)^2 / 3;
        elseif v(j) > 1 &&  v(j) <= 2
            p(j) = (v(j) * 2   - 1) / 4;
            f(j) = (v(j) - 1 / 2)^2 / (2 * v(j) - 1 - 1 / 4 * v(j)^2);
        else
            p(j) = 1/2;
            f(j) = 1;
        end
    end

%绘制曲线
plot(v, p, 'o','Color',[0,0.45,0.77], 'LineWidth', 2);
plot(v, f, 'd','Color',[0.85,0.31,0.09], 'LineWidth', 2);


% 定义变量范围
v = linspace(0, 2.5,400); % v 在 [0, 2.5] 范围内取值
p = zeros(size(v)); % 初始化 p 数组
f = zeros(size(v)); % 初始化 f 数组
for j = 1:length(v)
    if v(j) <= 1
        p(j) = 1/4 * v(j)^2;
        f(j) = v(j)^2 / 3;
   elseif v(j) > 1 &&  v(j) <= 2
        p(j) = (v(j) * 2   - 1) / 4;
            f(j) = (v(j) - 1 / 2)^2 / (2 * v(j) - 1 - 1 / 4 * v(j)^2);
   else
        p(j) = 1/2;
        f(j) = 1;
    end
end
%绘制曲线
plot(v, p, '-','Color', [0,0.45,0.77], 'LineWidth', 2);
plot(v, f, ':','Color', [0.85,0.31,0.09], 'LineWidth', 2);
p = zeros(size(v)); % 初始化 p 数组
f = zeros(size(v)); % 初始化 f 数组

v = linspace(100, 101,10); % 作标签
p = zeros(size(v)); % 初始化 p 数组
f = zeros(size(v)); % 初始化 f 数组
for j = 1:length(v)
    p(j) = 1/2;
    f(j) = 1;
end


h1 = plot(v, p, 'o-','Color',[0,0.45,0.77],'LineWidth',2);
h2 = plot(v, f, 'd:','Color',[0.85,0.31,0.09],'LineWidth',2);



% 设置图形属性
xlabel('v');


% 设置坐标轴标签
xlabel('$v$', 'Interpreter', 'latex', 'FontSize', 14);

% 设置x轴和y轴的刻度范围
xlim([0 2.5]); ylim([0 1.5]);

% 设置刻度标签，使用明确的向量格式
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2, 2.5]);
set(gca, 'YTick', [0, 0.5, 1, 1.5]);


lgd = legend([h1, h2], '$p^{*}$', '$\pi ^{*} $',  'Interpreter', 'latex');
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