View    = require "teacup-view"
marked  = require "marked"
moment  = require 'moment'

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (post) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Learning programming from scratch"
    @body =>
      @header =>
        @a href: '/', =>
          @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h1 'Learning programming from scratch'
        @div id: 'about_me', =>
          # @p 'I am a Lawyer who is learning to become a Front-End Developer'
          @li =>
            @a href:'/000-about-this-page.html','ABOUT THIS PAGE'
          @li =>
            @a href:'/','HOME'



      @article class: 'content', =>
        @h1 post.title
        if post.date? then @h6 id: 'date', =>
          date = moment post.date
          @span 'Published: '
          @time datetime: date.format(), date.calendar null,
            sameDay: '[Today]',
            nextDay: '[Tomorrow]',
            nextWeek: 'dddd',
            lastDay: '[Yesterday]',
            lastWeek: '[Last] dddd'
            sameElse : "MMMM Do YYYY"

        markdown post.__content

      # jQuery (necessary for jQuery JavaScript plugins)
      @script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type: "text/javascript"
      @script src: "https://code.jquery.com/jquery-1.11.2.min.js"
      @script src:"/scripts/analytics.js"
