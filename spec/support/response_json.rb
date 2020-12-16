module ResponseJSON
  def reponse_json
    JSON.parse(response.body)
  end
end
