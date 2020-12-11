#coding: utf-8
require 'rspec'
require_relative '../pages/west_panel'

describe 'West panel tests' do

  test = nil

  before(:all) do
    test = WestPanel.new(@browser)
    test.open_page
  end

  # скрываем панель и проверям, что элементы не видны
  it 'hide panel' do
    test.obj(:roll_btn).click
    expect(test.visibility_list).to be == false
    test.obj(:open_panel).click
  end

  # добавляем новый файл из панели
  it 'add file' do
    test.obj(:add_file).click
    sleep 1
    expect(test.new_file_element(3).text).to be == "Newfile.java"
  end

  # обновляем содержимое панели и смотрим, что всё осталось на своих местах
  it 'refresh project' do
    test.obj(:refresh_project).click
    sleep 1
    expect(test.visibility_list).to be true
    expect(test.list).to be == 3
  end

  # многократно нажимаем на создание нового файла и проверяем, что количество файлов совпадает с запланированным
  it 'multiple click' do
    10.times do |i|
      test.obj(:add_file).double_click
    end
    sleep 2
    expect(test.list).to be == 23
  end

  # проверяем наименование проекта, который должен совпадать с текущей датой (тут, странным образом, работает всё не так, как надо)
  it 'project name' do
    expect(test.obj(:project_name).text).to be == "New Project-#{test.today_date}"
  end
end