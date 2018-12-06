document.addEventListener("turbolinks:load", function() {
    $("#questions").sortable({
        update: function (event, ui) {
            Rails.ajax({
                url: $(this).data("url"),
                type: "PATCH",
                data: $(this).sortable('serialize'),
            });
        }
    });
});