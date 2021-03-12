# Debugger mruby gem (mrbgem)

A pure mruby CLI debugger.

Similar in usage to `binding.irb` or `binding.pry` from common Ruby (aka CRuby) and the pry Ruby gem.

# Installation

Put the following into your `Mundlefile`([?](https://github.com/Dan2552/mundler)) or `build_config.rb`:
``` ruby
conf.gem :git => 'https://github.com/Dan2552/mruby-irb_like_debugger.git', :branch => 'main'
```

# Usage

``` ruby
eval(DEBUGGER)
```
