class WelcomeController < ApplicationController

  helper_method :get_link_info
  helper_method :strip_link_id
  helper_method :topVideos


  def index
  end

  def about
  end

  def get_link_info(link)
    link_obj = LinkThumbnailer.generate(link)
    return link_obj
  end

  def strip_link_id(link)
    link.reverse!
    if link.include? '='
      codeArray = link.split('=',2)
    else
      codeArray = link.split('/',2)
    end
    code = codeArray[0]
    code.reverse!
    return code
  end

  def topVideos
    @posts = Post.all
    videoRankArray = []
    @posts.each do |post|
      linkCode = strip_link_id(post.link)
      videoRankArray.push([post.rank,linkCode])
    end
    videoRankArray.sort!{|x,y|y<=>x}
    videoCodeString = ''
    videoRankArray.each_with_index do |video,vid_index|
      if vid_index < 10
        videoCodeString = videoCodeString+video[1]+','
      else
        return videoCodeString
      end
    end
    return videoCodeString
  end


end
