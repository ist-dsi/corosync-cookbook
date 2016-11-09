if defined?(ChefSpec)
  def configure_corosync(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:corosync, :create, resource_name)
  end
end
