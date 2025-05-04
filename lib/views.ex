defmodule Shortly.Views do
  require Slime
  @template_dir "lib/templates"
  @external_resource Path.join(@template_dir, "root.slime.layout")
  @layout_content File.read!(Path.join(@template_dir, "root.slime.layout"))

  # Generate view functions for each template at compile time
  for file <- Path.wildcard(Path.join(@template_dir, "*.slime")) do
    name = Path.basename(file, ".slime")
    fname = String.to_atom(name)
    @external_resource Path.expand(file)

    # Inline template preparation directly in the for loop
    partial_content = File.read!(file)
    
    template_content = @layout_content
                      |> String.split("/ inner_content")
                      |> List.insert_at(1, partial_content)
                      |> Enum.join()
    Slime.function_from_string :def, fname, template_content, [:assigns]
  end
end
