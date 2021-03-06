class HostScan
  def initialize(nic)
    ip_command = `sudo arp-scan -I #{nic} -l`
    @ip_list   = []

    ip_command.each_line do |s|
      ip = s.slice(/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/)
      next if ip.nil?

      @ip_list << ip
    end

    @ip_list.sort_by! { |s| s.split('.').map(&:to_i) }
  end

  def ip_list
    @ip_list
  end
end
