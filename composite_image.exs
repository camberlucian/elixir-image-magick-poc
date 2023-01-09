# Define the paths to the input images
image_paths = ["head.png", "body.png", "face.png", "nose.png", "arms.png"]
|> Enum.map(fn path ->
    Path.join(File.cwd!, path)
end)
# Build the command to composite the images using ImageMagick's "convert" tool
target_path = Path.join(File.cwd!, "composite.png")
options = image_paths ++ ["-flatten", target_path]
# Execute the command using System.cmd
{exit_code, output} = System.cmd("convert", options)
# Check the exit code to make sure the command was successful
if exit_code == 0 do
  # Return the path to the composite image
  {:ok, target_path}
else
  # Return an error message if the command failed
  {:error, output}
end
