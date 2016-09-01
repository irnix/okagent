Facter.add("okagent_version") do
  setcode do
    Facter::Util::Resolution.exec('ls -l /usr/local/okagent/okagent | cut -f2 -d ">" | cut -f5 -d "/"')    || nil
  end
end