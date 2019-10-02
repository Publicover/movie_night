module MoviesHelper
  def na?(obj)
    if obj = 'N/A'
      'No website. Sorry.'
    else
      link_to "#{obj}", obj
    end
  end
end
