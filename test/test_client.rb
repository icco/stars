require 'helper'

class TestClient < Test::Unit::TestCase

  def test_load
    mock(Stars::Formatter).new.with_any_args
    mock(Stars::Client).puts.with_any_args
    Stars::Client.load!
  end
  
  def test_username_when_exists
    mock(File).exists?.with_any_args.returns(true)
    mock(File).read.with_any_args
    Stars::Client.username
  end
  
  def test_username_when_nonexistant
    mock(File).exists?.with_any_args.returns(false)
    mock(Stars::Client).prompt_for_username
    Stars::Client.username
  end
  
  def test_write_home_config
    assert_equal Stars::Client.remember_username('holman'), 'holman'
  end
  
  def test_config_path
    assert Stars::Client.config_path.index('.stars')
  end
  
end