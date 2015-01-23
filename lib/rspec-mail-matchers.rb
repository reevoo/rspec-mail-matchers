require 'rspec/expectations'

RSpec::Matchers.define :be_to do |*expected|
  match do |actual|
    expected.all? { |e| actual.to.include?(e) }
  end

  failure_message do |actual|
    "To: #{actual.to.join(', ')} should include #{expected.join(' and ')}"
  end
end

RSpec::Matchers.define :be_from do |*expected|
  match do |actual|
    expected.all? { |e| actual.from.include?(e) }
  end

  failure_message do |actual|
    "From: #{actual.from.join(', ')} should include #{expected.join(' and ')}"
  end
end

RSpec::Matchers.define :be_cc_to do |*expected|
  match do |actual|
    expected.all? { |e| actual.cc.include?(e) }
  end

  failure_message do |actual|
    "Cc: #{actual.cc.join(', ')} should include #{expected.join(' and ')}"
  end
end

RSpec::Matchers.define :be_cc_to do |*expected|
  match do |actual|
    expected.all? { |e| actual.bcc.include?(e) }
  end

  failure_message do |actual|
    "Cc: #{actual.bcc.join(', ')} should include #{expected.join(' and ')}"
  end
end


RSpec::Matchers.define :have_text_body do |expected|
  match do |actual|
    actual.text_part.body == expected
  end
end

RSpec::Matchers.define :have_html_body do |expected|
  match do |actual|
    actual.html_part.body == expected
  end
end
