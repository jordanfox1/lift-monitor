# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should not save article without title' do
    article = Article.new
    assert_not article.save
  end
end
