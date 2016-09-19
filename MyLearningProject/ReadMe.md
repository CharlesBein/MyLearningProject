
/************************************************************/
/*Pod的安装和使用/：
iOS 最新版 CocoaPods 的安装流程

1.移除现有Ruby默认源

$gem sources --remove https://rubygems.org/

2.使用新的源

$gem sources -a https://ruby.taobao.org/

3.验证新源是否替换成功

$gem sources -l

4.安装CocoaPods

(1) $sudo gem install cocoapods 备注：苹果系统升级 OS X EL Capitan 后改为$sudo gem install -n /usr/local/bin cocoapods

(2) $pod setup

5.更新gem

$sudo gem update --system

6. 新建工程，并在终端用cd指令到文件夹内

$pod search 第三方

7.新建文件 vim “Podfile”，

$vim Podfile

写入以下内容并保存 小提示：（终端vim文件 按 i 可编辑 ，esc 退出编辑，：wq  可保存退出）

platform:ios, '6.0'   

pod 'AFNetworking', '~> 2.3.1'    <-------第三方

8.导入第三方库

$pod install

/************************************************************/

