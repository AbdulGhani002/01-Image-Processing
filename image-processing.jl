import Pkg;
Pkg.add("Colors")
Pkg.add("ColorVectorSpace")
Pkg.add("ImageShow")
Pkg.add("FileIO")
Pkg.add("ImageIO")
using Colors, ColorVectorSpace, ImageShow, FileIO, ImageIO

function process_image(input_path::AbstractString, output_path::AbstractString)

    img = load(input_path)
    
    # Perform the transformation
    transformed_img = [
        img[   :    ,end:-1:1]        img[   :    , end  :-1:1]
        img[end:-1:1,   end:-1:1]    img[end:-1:1, end  :-1:1]
    ]
    
    # Save the transformed image
    save(output_path, transformed_img)
    
    return output_path
end
input_path = "C:/CC/Code/Julia/01-Image Processing/2.jpg"
output_path = "transformed_image.png"
transformed_image_path = process_image(input_path, output_path)
println("Transformed image saved at: ", transformed_image_path)
