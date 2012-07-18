class RootController < UIViewController


  def enumerate_fonts
    UIFont.familyNames.each do |family_name|
      p "Font Family = #{family_name}"
      # font names  
      UIFont.fontNamesForFamilyName(family_name).each do |font_name|
        p " - #{font_name}"
      end
    end
  end

  def viewDidLoad
    enumerate_fonts
  end
end
