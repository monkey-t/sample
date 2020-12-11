#coding: utf-8
require 'watir'
require_relative '../pages/abstract_page'

class WestPanel < AbstractPage

  def initialize(browser)
    super(browser)
  end

  Elem = {
      save_project: { class: "icon-save-project" },
      project_name: { css: ".panel.layout-panel.layout-panel-west.layout-split-west>div:nth-child(1)>div:nth-child(1)" },
      refresh_project: { css: ".panel.layout-panel.layout-panel-west.layout-split-west>div:nth-child(1)>div:nth-child(3) a:nth-child(2)" },
      add_file: { css: ".panel.layout-panel.layout-panel-west.layout-split-west>div:nth-child(1)>div:nth-child(3) a:nth-child(3)" },
      roll_btn: { class: "layout-button-left" },
      open_panel: { css: ".panel.layout-expand.layout-expand-west>div:nth-child(1)" },
      tree_hit: { css: ".tree-hit.tree-expanded.tree-expanded-hover" },
      tree_folder: { css: ".tree-icon.tree-folder.tree-folder-open" },
      tree_title: { css: ".tree-title" },
      root_elem: { id: "home" }
  }

  def obj(elem)
    @browser.element(Elem[elem])
  end

  def new_file_element(num)
    @browser.ul(Elem[:root_elem]).lis[num]
  end

  def visibility_list
    @browser.ul(Elem[:root_elem]).present?
  end

  def list
    @browser.ul(Elem[:root_elem]).lis.length
  end
end