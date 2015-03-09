class ApiConstraints

    # we are initialising the class with an options hash, which will contain the version of the api, and a default value 
    # for handling the default version. 
    # We provide a matches? method which the route will trigger for the constraint to see if the default version is required or the Accept header matches the given string.
    def initialize(options)
       @version = options[:version]
       @default = options[:default]
    end

    def matches?(req)
       @default || req.headesrs['Accept'].include?("application/vnd.marketplace.v#{@version}")
    end

end
