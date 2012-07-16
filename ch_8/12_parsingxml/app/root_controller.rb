class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    # Using RaptureXML CocoaPod since it's infinitely easier than iOS's native way.
    # See comments in this subchapter's Rakefile for setup.
    root_xml = RXMLElement.elementFromXMLFile("sample.xml")
    p root_xml
    p "Root Tag: #{root_xml.tag}"
    company = root_xml.child("company")
    p "Company Name: #{company.attribute('name')}"
    founders = company.child("founders")
    #p founders
    individual_founders = founders.children("person")
    #p individual_founders
    individual_founders.each do |founder|
      first_name = founder.child("firstName").text
      last_name = founder.child("lastName").text
      age = founder.child("age").text
      p "Founder: #{first_name} #{last_name}, age: #{age}"
    end

    root_xml.iterateWithRootXPath('//person[id=1]', usingBlock: lambda do |person|
        p "XPath select:"
        p person
    end)    
  end

  def viewDidUnload

  end
end