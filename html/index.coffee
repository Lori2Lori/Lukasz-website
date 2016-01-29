View    = require "teacup-view"
marked  = require "marked"
moment  = require 'moment'

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (posts) ->
  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Łukasz Bańkowski radca prawny"

    @body =>
      @div class: 'container', =>

        @div class: 'header', =>
          @div class: 'logo', =>
            @div class: 'name', 'Łukasz Bańkowski'
            @div class: 'law', 'Law advisor'
          @ul class: 'menu', =>
            @li =>
              @a href: './', 'CONTACT'
            @li =>
              @a href: './','CERTIFICATION'
            @li =>
              @a href: './','REFERENCES'

        @div class: 'main-picture', =>
          @h1 'PROFESSIONAL LEGAL HELP AT AFFORDABLE RATES'
        @div class: 'main-content', =>
          @h2 'AREAS OF EXPERTISE'
          @ul class: 'areas-of-expertise', =>
            @li 'contracts'
            @li 'personal'
            @li 'administrative law'
          @div class: 'description', =>
            @h2 'MY STORY'
            @p 'I am certified lawyer with several years of experience. Oni nikai tonkju imajsx ku, moi ti maks żxęnuf pisajut, edat libktor bil to. Kupit vlósiś nózxis śo des, odnakju potrebijsx vo gaz. Divąjte prekrasju mi moi, kak bo slozxju celuvajt, użx eś vódą vorćxanie. Ońa to dajt slovis dumajut.'
          @div class: 'references', =>
            @h2 'REFERENCES'
            @p """Łukasz is one of the most energetic lawyers I've been working with."""
            @h5 'JAN KOWALSKI - RADCA PRAWNY'

          @div class: 'certification', =>
            @h2 'PROFESSIONAL CERTIFICATION'
            @p '(np. wpis na listę radców prawnych, inne)'

        @footer =>

          @div class: 'logo', =>
            @div class: 'name', 'Łukasz Bańkowski'
            @div class: 'law', 'Law advisor'

          @div class: 'contact', =>
            @h2 'CONTACT'
            @p 'I work in Warsaw and Łódź'
            @p 'Phone: 500-100-200'
            @p 'Email: info@lukaszbankowski.pl'
            @p class: 'copyright', =>
              @a href: 'lori2lori.com', '© Created by Dorota Cieślińska 2016'
