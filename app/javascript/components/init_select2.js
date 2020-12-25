import $ from 'jquery';
import 'select2';
import '../../../node_modules/select2/dist/css/select2.min.css'

const initSelect2 = () => {
    console.log("Hello");
    $(".js-example-tags").select2({
        tags: true
    });
}

export default initSelect2;