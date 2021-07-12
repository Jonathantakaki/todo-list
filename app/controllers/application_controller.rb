class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    helper TarefasFormat
end
