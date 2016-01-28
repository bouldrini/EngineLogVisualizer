class DatePickerInput < SimpleForm::Inputs::Base
  
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date form_date') do
      template.concat span_table
      template.concat @builder.text_field(attribute_name, input_html_options)
    end
  end

  def input_html_options
    {class: 'form-control', readonly: true}
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon add-on') do
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
# <div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
#   <input class="span2" size="16" type="text" value="12-02-2012">
#   <span class="add-on"><i class="icon-th"></i></span>
# </div>