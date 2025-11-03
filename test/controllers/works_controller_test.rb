require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get works_url
    assert_response :success
  end

  test "should get show" do
    # Create a test work record
    work = Work.create!(
      title: "Test Work",
      slug: "test-work",
      story: "# Test Story\n\nThis is a test.",
      summary: "Test summary",
      category: "Test",
      status: "Live"
    )

    get work_url(work)
    assert_response :success
  end
end
