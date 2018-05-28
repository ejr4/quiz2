

$(() => {

    $(".idea-description").hide();

    $(".toggler").on("click", event => {
        const { currentTarget } = event;
        // You can still use currentTarget inside a listener passed to
        // to on, but don't forget wrap in a Jquery Collection.
        $(".idea-description").hide();
        $(".plus-sign").show();
      });
    
      $(".plus-sign").on("click", event => {
        const { currentTarget } = event;
        // You can still use currentTarget inside a listener passed to
        // to on, but don't forget wrap in a Jquery Collection.
        $(".idea-description").show();
        $(".plus-sign").hide();
      });

});