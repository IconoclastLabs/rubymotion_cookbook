class RootController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.lightGrayColor
   
    @assets_library = ALAssetsLibrary.alloc.init

    @assets_library.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock:lambda do |group, stop|
      group.enumerateAssetsUsingBlock(lambda do |result, index, stop|
        assetType = result.valueForProperty(ALAssetPropertyType)

        p "This is a photo" if assetType == ALAssetTypePhoto
        p "This is a video" if assetType == ALAssetTypeVideo
        p "This is uknown" if assetType == ALAssetTypeUnknown


        end)
      end,
      failureBlock:lambda do |error|
        p "Failed to enumerate the asset groups"
      end)
  end


end
