class Calculator
  include Mohawk
  window(title: /Calculator/)

  button(:add, id: '93')
  button(:calculate, value: 'Equals')
  control(:result, id: '150')

  def press(number)
    adapter.button(id: "13#{number}").click
  end

  def result
    result_view.control_name
  end
end
