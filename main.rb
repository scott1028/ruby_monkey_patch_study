# encoding: utf-8

# ref: https://github.com/rails/rails/blob/master/railties/lib/rails/application.rb - Application -> config

# Module::Class 的結構
    module App
        class Main
            # 標記 @jj 為可存取(@jj: Instance variable)
            attr_accessor :jj

            # class variable, 類似 singleton 的 variable
            @@x=nil

            # setter
            def self.x=(x)
                @@x=x
            end

            # getter
            def self.x
                @@x
            end

            def echo
                puts @@x+50
            end

            def get_jj
                puts @jj
            end

            def initialize

                # Rails 內採用的方法
                instance_variable_set("@jj", 789)
                
                # equal: @jj=789
            end
        end
    end

    require './patch.rb'

    app = App::Main.new

    app.echo
    app.get_jj

# 透過 accessor 來取得 @jj
    puts app.jj
    app.jj += 20
    puts app.jj

# 區塊塊程式碼呼叫的寫法：
    puts 'start...1'

    def block1(&block)
        # 區塊程式碼當做匿名參數, 就是 lambda { puts 1 }
        block.call
    end

    block1 { puts 1 }
    # 相當於 block lambda { puts 1 } 的另一種寫法

    puts 'start...2'

    def block2(fn)
        fn.call
    end
    fn = lambda { puts 1 }
    block2 fn

    puts 'start...3'

    def block3(fn)
        fn
    end

    def fn2(x=100)
        puts x
    end

    block3(fn2)

    puts 'start...4(也可以達到類似 Decorator 的效果)'

    def block4
        yield
    end

    block4 { puts 78910 }

    puts 'start...5(另類的寫法)'

