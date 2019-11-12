module Helpers
  module Form
    def submit_form(submit = 'input[name="commit"]')
      find(submit).click
    end

    def upload_file(name, path)
      attach_file name, path, make_visible: true
    end

    def accept_alert
      alert = page.driver.browser.switch_to.alert
      alert.accept
    end
  end
end
