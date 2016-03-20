class TimePickerInput < SimpleForm::Inputs::Base
  
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date form_time') do

      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
  end

  def input_html_options
    {class: "form-control", readonly: true, data: {format: "hh:mm:ss"}, type: "text"}
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_remove
    "<i class='fa fa-trash-o'></i>".html_safe
  end

  def icon_table
    "<i class='fa fa-table'></i>".html_safe
  end

end