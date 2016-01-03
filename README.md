## 弦木吉他主要模块对应的Model名
- 课程介绍 -> Column
- 弦木视频 -> Course
- Photoshow -> PhotoShow
- 用户 -> User
- 曲谱 -> Score
- 广告 -> Advertisement
- 标签 -> Tag

## 尚未完善的地方

- 后台管理中上传图片后的图片显示
- 后台管理中曲谱图片顺序的改变


##

# 弦木吉他开发

## Tips
- Remigrate migrations, 清楚数据库，重新运行migration构建数据库
- 
  ```ruby
  rake db:drop db:create db:migrate
  ```

## 开发规范

- 缩进使用2 Space，千万不用混合Tab和Space
  
- 编辑器可以考虑Sublime, 可以添加以下配置
  
  ``` 
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "draw_white_space": "all",
  ```
  
- CSS使用SASS
  
- JS使用Coffee



## 注意事项

- 运行`git diff`会看到很多奇怪的修改，比如`- abc`,紧接着又是`+ abc`,内容看似一样，但实际上他们使用的空白符不一样。代码中有些部分使用的是Tab缩进，我全部改成空格缩进了。



## Models

- 不需要administrator, 给User 添加两个字段， is_admin(bool) 和  admin_type(integer), 就可以了 
- 不需要course_comment, 只需要一个comment ,然后使用[Polymorphic](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)，因为很多东西都可以有评论，包括课程、专栏以及活动
- 课程收藏专门使用一个`collect`不太需要，可以在user里面加一个字段，collect，类型为array,放入用户收藏的课程id就行了。具体参考[ActiveRecord and Postgres](http://edgeguides.rubyonrails.org/active_record_postgresql.html)



## MISC

- 第三方登陆有些复杂，暂时不管
- 开发时前端可以使用[Skeleton](http://getskeleton.com/),不需要使用Foundation或者Bootstrap这样的大型框架，因为只是暂时快速做个样子出来
- 前端依赖尽量使用Bower去管理，比如jquery-file-upload
- 文件上传使用[Paperclip](https://github.com/thoughtbot/paperclip)



## 功能实现

现在对照功能结构图，来分析一下每一个功能的具体实现。



### 后台管理模块

- 课程管理，活动管理，专栏管理，标准的CRUD
- 用户管理，用户需用一个frozen字段标示是否被冻结，默认为false,同时，用户密码使用`bcrypt`这个gem。具体参考[Bcrypt](https://github.com/codahale/bcrypt-ruby)，只需要一个`has_secure_password`即可，不需要自己加密和掺盐
- 屏蔽评论可以通过在评论中添加一个blocked字段实现
- 推送系统消息，通过为每个用户创建一个message就可以解决



### 用户功能模块

- 登陆注册，暂时实现我们自己的用户系统，以后再接入第三方登陆
- 个人中心，没有什么特别的
- 收藏课程，将课程ID加入用户的collect字段即可
- 评论，根据评论对象不同创建不同的评论即可
