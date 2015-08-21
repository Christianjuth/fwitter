$(document).ready ->

  # This function highlights hashtags
  # and @ user mentions
  twitterSyntax = (el)->
    el.each ->
      $this = $(this)
      text  = $this.text()
      text = text.replace /@[a-z1-9]+/ig, (at)->
        return "<a href='#'>"+at+"</a>"
      text = text.replace /#[a-z0-9]+(?=\s|#|$)/ig, (hash)->
        return "<a href='#'>"+hash+"</a>"
      $this.html(text)

  # Hilight 
  twitterSyntax($(".twitter-syntax"))