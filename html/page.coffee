View    = require "teacup-view"
marked  = require "marked"
moment  = require 'moment'

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (page) ->
  {
    logo
    menu
    title
    subtitle
    expertise
    about
    references
    certificates
    contact
    copyright
  } = page
  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      @link rel: "stylesheet", href: "/css/index.css"
      @title title

    @body =>
      @div class: 'container', =>

        @div class: 'header', =>
          @div class: 'logo', =>
            @div class: 'name', logo.name
            @div class: 'law', logo.description
          @ul class: 'menu', =>
            menu.map (item) =>
              @li =>
                @a href: item.url, item.label

        @div class: 'main-picture', =>
          @h1 subtitle
        @div class: 'main-content', =>
          @h2 expertise.title
          @ul class: 'areas-of-expertise', =>
            expertise.items.map (item) =>
              @li item.label

          @div class: 'description', =>
            @h2 about.title
            @p about.description

          @div class: 'references', =>
            @h2 references.title
            references.items.map (reference) =>
              @p reference.text
              @h5 reference.name

          @div class: 'certification', =>
            certificates.map (certificate) =>
              @h2 certificate.title
              @p certificate.label

        @footer =>

          @div class: 'logo', =>
            @div class: 'name', logo.name
            @div class: 'law', logo.description

          @div class: 'contact', =>
            @h2 contact.title
            markdown contact.text

          @div class: 'copyright', =>
            @a href: copyright.href, copyright.text
