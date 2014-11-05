$(document).ready ->
  $('#edit_workout').on("ajax:success", (e, data, status, xhr) ->
    json = JSON.parse(xhr.responseText)
    $('#workoutName').text(json.name)
    $('#editName').text(json.name)
    $('#editDescription').text(json.description)
    $('#editType').text(json.type)
    $('#editModal').modal 'show'
    ).on 'ajax:error', (e, xhr, status, error) ->
    $("#edit_workout").append 'fail'
