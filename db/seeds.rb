# encoding: UTF-8

require "digest/sha2"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# clear all
Blog.delete_all
User.delete_all
Habrauser.delete_all
Post.delete_all
Fav.delete_all

# create blogs
blog_ruby = Blog.create(:slug => 'ruby', :title => 'Ruby')
blog_ror = Blog.create(:slug => 'ror', :title => 'Ruby on Rails')

# create users
user_gearhead = User.create(:name => "gearhead", :password => "123", 
                            :password_confirmation => "123")
user_wishope = User.create(:name => "wishope", :password => "123", 
                           :password_confirmation => "123")
user_blackfoks = User.create(:name => "blackfoks", :password => "rcfhlfc", 
                            :password_confirmation => "rcfhlfc")

# create habrausers
huser_gearhead = Habrauser.create(:slug => 'gearhead', :name => 'GearHead', 
                                  :user => user_gearhead)
huser_wishope = Habrauser.create(:slug => 'wishope', :name => 'wishope', 
                                 :user => user_wishope)
huser_blackfoks = Habrauser.create(:slug => 'blackfoks', :name => 'BlackFoks',
                                   :user => user_blackfoks)

# create posts               
post_rails31 = Post.create(:blog => blog_ror, :habrauser => huser_gearhead,
  :title => 'Rails 3.1: Release Candidate',
  :content => %{
    Сегодня вышел первый релиз-кандидат RoR 3.1, к чему в оффициальном блоге написали 
    обзорную статью о ключевых нововведениях в предстоящей версии. Чтобы познакомить 
    вас с нововведениями, перевожу с пояснительными комментариями для тех, кто ничего 
    об этом не слышал. Далее в тексте курсивом мои примечания.

    Как я (DHH — прим. переводчика) и обещал на RailsConf, мы наконец готовы выпустить 
    Rails 3.1: Release Candidate. Это фантастически захватывающий релиз. В нём появилось 
    две новых киллер-фичи и намного больше просто потрясающих улучшений. Для начала 
    киллер-фичи:},
  :total_votes => 49,
  :created_at => DateTime.new(2011, 5, 22, 9, 9))
  
post_zombies = Post.create(:blog => blog_ror, :habrauser => huser_wishope,
  :title => 'Rails for Zombies — оригинальный подход к изучению фреймворка',
  :content => %{
    Недавно нашел отличный сайт, посвященный изучению Ruby on Rails — http://railsforzombies.org/
    
    На примере «Твиттера для зобми» автор легко и с юмором объясняет основы фреймворка и языка.
    
    Весь процесс обучения разбит на 5 занятий (своего рода квест) — в начале каждого предлагается 
    посмотреть скринкаст, а затем выполнить лабораторную работу из нескольких заданий. 
    Для выполнения лабораторных не нужно ничего ставить — весь код пишется и проверяется во 
    встроенном онлайн редакторе!},
    :total_votes => 59,
    :created_at => DateTime.new(2011, 3, 29, 19, 24))
    
# create favs
fav_bf_rails31 = Fav.create(:user => user_blackfoks, :post => post_rails31)
fav_bf_zombies = Fav.create(:user => user_blackfoks, :post => post_zombies)