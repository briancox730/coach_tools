User.delete_all
Statistic.delete_all
Wod.delete_all
Wtype.delete_all

wtypes = [{type: "weight"},
          {type: "time"},
          {type: "complete"},
          {type: "rep"}]

wtypes.each do |type|
  Wtype.create(type)
end
