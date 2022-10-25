require_relative '../test_helper'
require 'log_file/parsers'

describe LogFile::Parsers do
  let(:parsers) { LogFile::Parsers }

  describe '.ip' do
    it 'expects basic parts of ip addresses' do
      ipv4 = '100.100.100.1'
      ipv6 = 'fe80::1497:a22f:97d5:d8d7'

      assert_equal ipv4, parsers.ip(ipv4)
      assert_equal ipv6, parsers.ip(ipv6)
    end

    it 'is permissive as rigid validation can be problematic' do
      ipv6 = 'fe80::1497:a22f:97d5:d8d7%tun1'

      assert_equal ipv6, parsers.ip(ipv6)
    end

    it 'rejects if there is nothing vaguely ip address-like' do
      ip = 'not really anything'

      assert_nil parsers.ip(ip)
    end
  end

  describe '.path' do
    it 'allows anything vaugely path like' do
      basic = '/pages/1/hi'
      strange = '/hi!?myname=1234'

      assert_equal basic, parsers.path(basic)
      assert_equal strange, parsers.path(strange)
    end

    it 'rejects if not path-like' do
      basic = 'hello'

      assert_nil parsers.path(basic)
    end
  end

  describe '.line' do
    it 'parses a line of path and ip' do
      line = '/index 1.1.1.1'

      result = parsers.line(line)

      assert_equal '/index', result[0]
      assert_equal '1.1.1.1', result[1]
    end
  end
end
