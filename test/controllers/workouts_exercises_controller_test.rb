require "test_helper"

class WorkoutsExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workouts_exercises_new_url
    assert_response :success
  end

  test "should get create" do
    get workouts_exercises_create_url
    assert_response :success
  end

  test "should get edit" do
    get workouts_exercises_edit_url
    assert_response :success
  end

  test "should get update" do
    get workouts_exercises_update_url
    assert_response :success
  end
end
