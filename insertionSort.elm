module Main exposing (..)

import Html exposing (Html)
import Svg exposing (svg, rect)
import Svg.Attributes exposing (height, width, x, fill, y)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


model =
    insertionSort [ 30, 20, 50, 70 ]


update msg model =
    case msg of
        _ ->
            model


view model =
    let
        svgHeight =
            100
    in
        svg [ height (toString svgHeight), width "100" ]
            (List.indexedMap
                (\index element ->
                    let
                        margin =
                            20

                        colWidth =
                            10
                    in
                        rect
                            [ y (toString (svgHeight - element))
                            , fill "red"
                            , width (toString colWidth)
                            , x (toString (index * colWidth + margin))
                            , height (toString element)
                            ]
                            []
                )
                model
            )


insertionSort =
    insertionSortHelper []


insertionSortHelper head list =
    case list of
        [] ->
            []

        [ x ] ->
            List.append head [ x ]

        x :: (y :: xs) ->
            if y > x then
                insertionSortHelper (List.append head [ x ]) (y :: xs)
            else
                insertionSortHelper (List.append head [ y ]) (x :: xs)