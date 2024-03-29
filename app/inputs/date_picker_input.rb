class DatePickerInput < SimpleForm::Inputs::Base
  
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group input-append date form_date') do

      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
  end

  def input_html_options
    {class: "form-control", readonly: true, data: {format: "dd.MM.yyyy"}, type: "text"}
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
    "<i data-time-icon='fa fa-home' data-date-icon='fa fa-check' class='fa fa-table'></i>".html_safe
  end

end