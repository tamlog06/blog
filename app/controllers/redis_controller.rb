class RedisController < ApplicationController
  def index
    Redis.current.set("testkey", "mebee")
  end
end
