module LocationsHelper
		def location_img_select(location)
		return image_tag location.header_image.url(:medium),
		        id: 'image-preview',
		        class: 'img-responsive center-block' if location.header_image.exists?
					image_tag 'default-location.jpg',
						id: 'image-preview',
            class: 'img-responsive center-block'
	end
end
