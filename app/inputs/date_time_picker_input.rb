class DateTimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(:div, class: 'input-group date') do
      input = @builder.text_field(attribute_name, merged_input_options)
      # this line just add the additional input options to the text_field

      glyph = template.content_tag(:span, class: 'input-group-addon') do
        template.content_tag(:span, '', class: 'glyphicon glyphicon-calendar')
      end

      "#{input}#{glyph}".html_safe
    end
  end

  # def label(_); end
end
