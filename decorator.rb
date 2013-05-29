class Decorator

  def initialize(params)
    @resource = Resource.new(params[:resource])
  end

  def save
    # modify values before save
    if @resource.save
      # do stuff if saved
      true
    else
      # handle errors or clean up
      false
    end
  end

  def as_json(opts={})
    @resource.as_json(opts)
  end

  private

  def method_missing(name, *args, &block)
    @resource.send(name, *args, &block)
  end

  def self.method_missing(name, *args, &block)
    ResourceClass.send(name, *args, &block)
  end
end