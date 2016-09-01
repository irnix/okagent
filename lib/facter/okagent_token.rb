Facter.add("okagent_token") do
  setcode do
    Facter::Util::Resolution.exec('cat /usr/local/okagent/agent.token')    || nil
  end
end