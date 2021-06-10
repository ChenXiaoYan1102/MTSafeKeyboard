# 
带 符号、字母、数字、带小数点数字键盘，可随机键盘位置，可限制长度
效果见mov

## 调用
```
    _safeTextField = [[MTSafeTextField alloc] initWithFrame:CGRectMake((w -200)/2, 250, 200, 40)];
    _safeTextField.borderStyle = UITextBorderStyleLine;
    _safeTextField.delegate = self;
    [self.view addSubview:_safeTextField];

    MTCustomKeyboardView *view = [MTCustomKeyboardView configWithView:_safeTextField keyboardType:MTCustomKeyboardTypeXJ random:NO title:@"123" length:100];

```