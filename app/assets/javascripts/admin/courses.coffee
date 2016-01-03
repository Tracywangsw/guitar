$ ->
  pageId = ".page-admin-courses._show "

  $(pageId + ".block-comment").on "ajax:success", (evt, html)->
    $(evt.target).closest("tr").replaceWith(html)
  $(pageId + ".block-comment").on "ajax:error", (evt, url)->
    swal "操作失败!", "", "error"

  $(pageId + ".unblock-comment").on "ajax:success", (evt, url)->
    $(evt.target).closest("tr").replaceWith(html)
  $(pageId + ".unblock-comment").on "ajax:error", (evt, url)->
    swal "操作失败!", "", "error"

  $(pageId + ".destroy-comment").on "ajax:success", (evt)->
    $(evt.target).closest("tr").fadeOut()
  $(pageId + ".destroy-comment").on "ajax:error", (evt, url)->
    swal "操作失败!", "", "error"
