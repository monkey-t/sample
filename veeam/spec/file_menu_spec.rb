#coding: utf-8
require 'rspec'
require 'watir'
require_relative '../pages/file_menu'
require_relative '../pages/west_panel'

describe 'File menu tests' do

  file_menu = nil
  panel = nil

  before(:all) do
    file_menu = FileMenu.new(@browser)
    panel = WestPanel.new(@browser)
    panel.open_page
  end

  # создаём новый файл -- проверяем, что файл созхдался с требуемым наименованием
  it 'create one file' do
    sleep 2
    file_menu.click(:create_file)
    expect(panel.new_file_element(2).text).to be == "Newfile.java"
  end

  # переименовываем в очень длинное наименование (в текущей ситуации длинным будет расширение)
  it 'wrong rename' do
    sleep 2
    file_menu.click(:rename_file)
    sleep 2
    panel.new_file_element(2).send_keys "#{file_menu.random_word(500)}"
    @browser.send_keys :enter
    expect(file_menu.obj(:error_mess)).to be
    file_menu.obj(:error_mess_ok).click
  end

  # звызываем удаление созданного файла и проверяем на появившееся конфирм окно
  it 'delete file message' do
    file_menu.click(:delete_file)
    expect(file_menu.obj(:confirm_mess).text).to be == "Do you really want to delete file Newfile.java"
  end

  # отменяем удаление и проверяем, что файл остался
  it 'cancel del file' do
    file_menu.obj(:no_delete).click
    expect(panel.new_file_element(2)).to be
  end

  # удаляем файл и проверяем, что он удалился
  it 'delete file' do
    file_menu.click(:delete_file)
    file_menu.obj(:yes_delete).click
    sleep 2
    expect(panel.list).to be == 2
  end
end