
[1mFrom:[0m /home/hoang/fairytale-manga/Backend/app/controllers/api/v1/readers/gifts_controller.rb:10 Api::V1::Readers::GiftsController#index:

     [1;34m5[0m: [32mdef[0m [1;34mindex[0m
     [1;34m6[0m:   gifts = [1;34;4mGift[0m.order([35mid[0m: [33m:desc[0m).ransack(params[[33m:q[0m]).result
     [1;34m7[0m:   @pagy, @gifts = pagy(gifts, [35mitems[0m: [1;34m2[0m)
     [1;34m8[0m:   message =[31m[1;31m"[0m[31masda[1;31m"[0m[31m[0m
     [1;34m9[0m:   
 => [1;34m10[0m:   binding.pry
    [1;34m11[0m: 
    [1;34m12[0m:   [1;34m# response_list(@gifts, { adapter: :json,[0m
    [1;34m13[0m:   [1;34m#                         each_serializer: GiftSerializer })[0m
    [1;34m14[0m:   render ({[35mjson[0m: @gifts, [33m:adapter[0m=>[33m:json[0m, [33m:each_serializer[0m=>[1;34;4mGiftSerializer[0m, [33m:meta[0m=>[1;34m2[0m})
    [1;34m15[0m:   
    [1;34m16[0m:   
    [1;34m17[0m: [32mend[0m

