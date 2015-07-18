$(function(){
    //Hides the subscribe panel if the user presses the x once. Saved locally
    if(window.localStorage.getItem('HideSubscribe')){
        $('#subscribe-panel').hide();
    }

    //closes the subscribe panel and saves the act locally to not show it again
    $('.subscribe-panel-close-icon').on('click',function(){
        var effect = $(this).data('effect');
        $(this).closest('.panel')[effect]();
        window.localStorage.setItem('HideSubscribe', 'true');
    })
})
