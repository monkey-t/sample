#coding: utf-8
require 'watir'
require_relative '../pages/abstract_page'

class FileMenu < AbstractPage

  def initialize(browser)
    super(browser)
  end

  Elem = {
      file_btn: { xpath: ".//*[@id='north']/div[1]/a[5]" },
      create_file: { css: "#mm1 .menu-item:nth-child(2)" },
      save_file: { css: "#mm1 .menu-item:nth-child(3)" },
      delete_file: { css: "#mm1 .menu-item:nth-child(4)" },
      # delete confirm window
      yes_delete: { css: ".dialog-button.messager-button a:nth-child(1)" },
      no_delete: { css: ".dialog-button.messager-button a:nth-child(2)" },
      confirm_mess: { css: ".messager-body.panel-body.panel-body-noborder.window-body div:nth-child(2)" },
      rename_file: { css: "#mm1 .menu-item:nth-child(5)" },
      download_file: { css: "#mm1 .menu-item:nth-child(6)" },
      upload_file: { css: "#mm1 .menu-item:nth-child(7)" },
      new_directory: { css: "#mm1 .menu-item:nth-child(9)" },
      delete_directory: { css: "#mm1 .menu-item:nth-child(10)" },
      rename_directory: { css: "#mm1 .menu-item:nth-child(11)" },
      error_mess: { css: ".panel.window.messager" },
      error_mess_ok: { css: ".panel.window.messager-window>div:nth-child(3)>a" }
  }

  def obj(elem)
    @browser.element(Elem[elem])
  end

  def click(elem)
    obj(:file_btn).click
    obj(elem).click
  end




end