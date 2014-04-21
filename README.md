# PAPlaceholder

When you're working on a new app, sometimes it's easier to start with dummy views and slowly replace them as you implement their functionality. Rather than use a simple UIView for this, PAPlaceholder gives you a better looking placeholder view that shows its dimensions and an optional title.

It also provides a dummy view controller which automatically creates the placeholder view. This is useful when you're using a _view controller container_ such as a `UITabBarController` or a `UISplitViewController`.

![screen1](https://raw.github.com/dhennessy/PAPlaceholder/master/Screenshots/SplitView.png)
![screen2](https://raw.github.com/dhennessy/PAPlaceholder/master/Screenshots/MacSplitView.png)

Using this at the early stages of a project is particularly useful on iOS 7, where many of the system views (like the navigation bar or tab bar) are actually transparent and the content views extend behind them. The arrows on the PAPlaceholderView show the edges of the view so you can tell if the edges are where you expect them to be.

## Adding PAPlaceholder to your project

The simplest way to add PAPlaceholder to your project is to use [CocoaPods](http://cocoapods.org).  Just add the following line to your Podfile:

```
	pod 'PAPlaceholder'
```

If you'd prefer to manually integrate it, simply copy `PAPlaceholder/*.{m,h}` into your project.

## Creating a placeholder view in code

You can use PAPlaceholderView anywhere you could have used UIView. For example in `loadView`:

```objective-c
- (void)loadView {
    self.view = [[PAPlaceholderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
```

## Creating a placeholder view in a storyboard or XIB

Simply drag a UIView onto your view and then change its class to `PAPlaceholderView`. Or drag on a UIViewController and change its class tp `PAPlaceholderViewController`. The included example project demonstrates this in a storyboard.

## Changelog

### 0.2
 *  Support for Mac OS X added to PAPlaceholderView.*

### 0.1 
 *  Initial release

## Contact

To hear about updates to this and other libraries follow me on Twitter ([@denishennessy](http://twitter.com/denishennessy)) or App.net ([@denishennessy](http://alpha.app.net/denishennessy)).

If you encounter a bug or just thought of a terrific new feature, then opening a github issue is probably the best way to share it. Actually, the best way is to send me a pull request...

For anything else, email always works: [denis@peerassembly.com](mailto:denis@peerassembly.com)

## License (BSD)

```
Copyright (c) 2014, Denis Hennessy (Peer Assembly - http://peerassembly.com)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Peer Assembly, Denis Hennessy nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PEER ASSEMBLY OR DENIS HENNESSY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

