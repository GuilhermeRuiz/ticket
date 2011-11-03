class ConteudoRestrito < ApplicationController
  before_filter :autenticar
end