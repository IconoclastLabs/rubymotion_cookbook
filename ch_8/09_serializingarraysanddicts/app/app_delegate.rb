class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # RubyMotion hashes are NSMutableDictionary datatypes
    dict = {first_name:"Matt", last_name:"Garrison", age: 27}
    children = ["Son 1", "Daughter 1", "Son 2"]
    dict[:children] = children
    p dict
    error_ptr = Pointer.new(:object)
    json = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingPrettyPrinted,
      error: error_ptr)
    if(json.length > 0 && error_ptr[0].nil?)
      p "Successfully serialized the dict into data: #{json}"
    elsif(json.length == 0 && error_ptr[0].nil?) 
      p "No data returned after serialization"
    elsif(!error_ptr[0].nil?)
      p "An error has occured"
    end
    true
  end
end
