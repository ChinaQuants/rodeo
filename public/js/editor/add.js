function addEditor() {
  var id;
  if ($("#editors .editor").length) {
    id = parseInt($("#editors .editor").last().attr("id").split("-")[1]) + 1;
  } else {
    id = 1;
  }
  var ext;
  if (getLang()=="python") {
    ext = ".py";
  } else if (getLang()=="r") {
    ext = ".R";
  }
  var editor_tab_html = editor_tab_template({ n: id, name: "Untitled-" + id + ext, isFirst: id==0});
  var editor_html = editor_template({ n: id });

  $(editor_tab_html).insertBefore($("#add-tab").parent());
  $("#editors").append(editor_html);
  newEditor("editor-" + id);
  // set to the active tab
  $("#editor-tab-" + id + " .editor-tab-a").click();
  if (id!="preferences") {
    ace.edit("editor-" + id).focus();
  }
}
