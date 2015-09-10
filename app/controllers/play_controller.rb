class PlayController < ApplicationController
  def index
  end

  # def pdf
  #   @pdf = File.join(Rails.root, "rules.png")
  #   # send_file(@pdf, :filename => "HollyLearyResume.pdf", :type => "application/pdf")
  #   send_file(@pdf, :filename => "rules.png", :disposition => 'inline', :type => "application/pdf")
  # end
end
