REPORT Z_JSON.

DATA it_aux TYPE TABLE OF c WITH EMPTY KEY.

it_aux = VALUE #( ( 'A' ) ( 'B' ) ( 'A' ) ( 'P' ) ).

DATA(lr_json) =
  cl_sxml_string_writer=>create( type =
                    if_sxml=>co_xt_json ).

CALL TRANSFORMATION id SOURCE itab = it_aux
                       RESULT XML lr_json.

DATA(iv_json) = lr_json->get_output( ).

CALL TRANSFORMATION sjson2html SOURCE XML iv_json
                               RESULT XML DATA(iv_html).

cl_abap_browser=>show_html( html_string =
  cl_abap_codepage=>convert_from( iv_html ) ).