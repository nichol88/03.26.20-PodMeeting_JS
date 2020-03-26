require 'test_helper'

class AnagramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anagram = anagrams(:one)
  end

  test "should get index" do
    get anagrams_url, as: :json
    assert_response :success
  end

  test "should create anagram" do
    assert_difference('Anagram.count') do
      post anagrams_url, params: { anagram: { description: @anagram.description, name: @anagram.name } }, as: :json
    end

    assert_response 201
  end

  test "should show anagram" do
    get anagram_url(@anagram), as: :json
    assert_response :success
  end

  test "should update anagram" do
    patch anagram_url(@anagram), params: { anagram: { description: @anagram.description, name: @anagram.name } }, as: :json
    assert_response 200
  end

  test "should destroy anagram" do
    assert_difference('Anagram.count', -1) do
      delete anagram_url(@anagram), as: :json
    end

    assert_response 204
  end
end
