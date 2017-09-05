class Message < ApplicationRecord
  validates :title, :text, presence: true

  def parse(account)
    reg_expr = /(\{{2})[^}]+(\}{2})/
    text.gsub!(reg_expr) do |match|
      account.try(name_without_braces(match).to_sym)
    end
    text
  end

  private

  def name_without_braces(name)
    name.delete!('{}')
  end
end
