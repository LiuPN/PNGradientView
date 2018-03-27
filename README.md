### PNGradientView
这个demo提供渐变视图，包括：渐变文字、渐变背景、渐变进度条等

### 1 渐变进度条

![image1](https://raw.githubusercontent.com/LiuPN/PNGradientView/master/PNGradientViewDemo/PNGradientViewDemo/GradientVc/1_.png)

代码调用：

    // 添加控件
    PNRandomProgressView *randomPv = [[PNRandomProgressView alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    randomPv.colors = @[[UIColor redColor], [UIColor greenColor]];
    randomPv.progress = 0.6;
    [self.view addSubview:randomPv];

### 2 渐变文字

![image2](https://raw.githubusercontent.com/LiuPN/PNGradientView/master/PNGradientViewDemo/PNGradientViewDemo/GradientVc/2_.png)

代码调用：

    // 添加文字
    PNGradientText *gradientTxt = [[PNGradientText alloc] initWithColors:@[[UIColor redColor], [UIColor yellowColor]]];
    gradientTxt.frame = CGRectMake(100, 100, 155, 60);
    gradientTxt.font = [UIFont boldSystemFontOfSize:25];
    gradientTxt.text = @"我是渐变文字";
    gradientTxt.gradientDirection = PNGradientDirectionLeftToRight; // 默认渐变方向
    [self.view addSubview:gradientTxt];

### 3 UILabel背景渐变

![image3](https://raw.githubusercontent.com/LiuPN/PNGradientView/master/PNGradientViewDemo/PNGradientViewDemo/GradientVc/3_.png)

代码调用：

    // 添加控件
    PNGradientLabel  *gradientLbl = [[PNGradientLabel alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    gradientLbl.gradientColors = @[[UIColor redColor], [UIColor yellowColor]];
    gradientLbl.text = @"标签背景色渐变";
    [self.view addSubview:gradientLbl];

### 4 UIButton背景渐变

![image4](https://raw.githubusercontent.com/LiuPN/PNGradientView/master/PNGradientViewDemo/PNGradientViewDemo/GradientVc/4_.png)

代码调用：

    // 添加按钮
    PNGradientButton *gradientBtn = [[PNGradientButton alloc] initWithFrame:CGRectMake(100, 100, 130, 44)];
    gradientBtn.gradientColors = @[[UIColor greenColor], [UIColor redColor]];
    gradientBtn.contentText = @"我是渐变按钮";
    gradientBtn.noRoundedRectangle = NO; // 默认是圆角矩形
    [self.view addSubview:gradientBtn];
