class NavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    #self.title = "Navigation Example"
    imageView = UIImageView.alloc.initWithFrame(CGRectMake(0,0,100,40))
    imageView.contentMode = UIViewContentModeScaleAspectFit
    image = UIImage.imageNamed('FullSizeLogo.png')
    imageView.setImage(image)
    navigationItem.titleView = imageView
    @label = UILabel.new
    @label.text = 'NavController'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end

