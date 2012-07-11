class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # Copied from subchapter 09, which builds the json object
    p "Serialize:"
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

    p "Deserialize"
    error_ptr2 = Pointer.new(:object)
    json_object = NSJSONSerialization.JSONObjectWithData(json, options:NSJSONReadingAllowFragments, error: error_ptr2)
    if(!json_object.nil? && error_ptr2[0].nil?)
      if(json_object.class == Hash)
        deserialized_dictionary = json_object
        p "Deserialized JSON Dictionary: #{deserialized_dictionary}"
      elsif(json_object.class == Array)
        deserialized_array = json_object
        p "Deserialized JSON Array: #{deserialized_array}"
      else
        p "Some other object was returned, which is weird since the deserializer should only return dictionaries or arrays"
      end
    elsif(!ferror_ptr[0].nil?)
      p "An error occured while deserializing the JSON data."
    end
    true
  end
end
