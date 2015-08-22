$(document).ready ->

  # This function highlights hashtags
  # and @ user mentions
  twitterSyntax = (el)->
    el.each ->
      # Vars
      $this = $(this)
      text  = $this.text()
      tweet = text
      image = ""
      video = ""

      # Highlight @ user mentions
      tweet = tweet.replace /@[a-z1-9]+/ig, (at)->
        return "<a href='#'>#{at}</a>"
      # Highlight hashtags
      tweet = tweet.replace /#[a-z0-9]+(?=\s|#|$)/ig, (hash)->
        return "<a href='#'>#{hash}</a>"
      # Highlight links
      tweet = tweet.replace /http(s|):\/\/(www\.|)\S+\.\S+/ig, (link)->
        shortlink = link.replace(/^http(s|):\/\/(www\.|)/i,"").substr(0,15) + "..."
        return "<a href='#{link}'>#{shortlink}</a>"

      # Images
      image = text.match(/http(s|):\/\/(www\.|)\S+\.\S+\.(png|jpg|jpeg)/ig) || []
      if image.length
        image = image[0]
        image = """
          <div class="embed-responsive embed-responsive-16by9">
            <img class="img-responsive" src="#{image}">
          </div>
        """

      # Videos
      video = text.match(/https:\/\/(www\.|)youtube\.com\S+/ig) || []
      if video.length
        video = video[0].replace("watch?v=","embed/")
        video = """
          <div class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" src="#{video}"></iframe>
          </div>
        """

      # Set html
      $this.find(".twitter-text").html(tweet)
      if video.length
        $this.find(".twitter-content").html(video)
      else if image.length
        $this.find(".twitter-content").html(image)


  # Hilight 
  twitterSyntax($(".twitter-syntax"))