# MokeForFun
Moke loading view.

Current version [v0.2](#v0.2)

![](moke.gif)

*待更新*，目前实现方案在头部位置仍有瑕疵

## v0.1

用两个渐变图层上下（左右）组合为一个大图层，把圆环层设为大图层的 `mask` 再旋转整个大图层

问题：可以用更多的渐变图层组合，计算颜色麻烦且线条一旦粗了之后，细节效果尤其是各渐变层边界处很不好。

## v0.2

用一个 `imageView` 来代替渐变图层，把 `imageView` 添加到一个 `CALayer` 作为子 layer 再旋转这个父layer。

再这个父layer之上是一个 `CAShapeLayer` 用于展示灰色的圆环, 动画 `strokeStart` ，与 `imageView` layer那个旋转动画组合实现蓝色转第一圈的效果，转完一圈之后再隐藏灰色的圆环。

问题：“头部”细节仍有问题，Stop Rotate事件需完善。