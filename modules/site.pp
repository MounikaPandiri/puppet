import 'ims'
import 'mymodule'

node base_lbaas{
   include myfile
}

node base_dns{
   include ims::dns
}

node base_bono_ellis{
   include yuma_modules
   include ims
   include ellis
   Class['ellis'] -> Class['yuma_modules']
}

node base_homestead_homer_sprout{
   include homestead
   include homer
   include yuma_modules
   include sprout
   Class['sprout'] -> Class['yuma_modules']
}

node base_homer{
   include yuma_modules
   include homer
   Class['homer'] -> Class['yuma_modules']
}

node base_sprout{
   include yuma_modules
   include sprout
   Class['sprout'] -> Class['yuma_modules']
}

node base_ellis{
   include yuma_modules
   include ellis
   Class['ellis'] -> Class['yuma_modules']
}

node base_bono{
   include yuma_modules
   include ims
   Class['ims'] -> Class['yuma_modules']

}
node base_homestead{
   include yuma_modules
   include homestead
   Class['homestead'] -> Class['yuma_modules']
}

node base_homer_homestead{
   include yuma_modules
   include homer
   include homestead
   Class['homestead'] -> Class['yuma_modules']
}

node base_all_in_one{
   include homer
   include homestead
   include yuma_modules
   include sprout
   include ims
   include ellis
   Class['ellis'] -> Class['yuma_modules']
}   

#node bono inherits base_bono{}
#node ellis inherits base_ellis{}
#node homer inherits base_homer{}
#node homestead inherits base_homestead{}
#node sprout inherits base_sprout{}
#node lb inherits base_lbaas{}
#node ubuntu-server inherits base_bono_ellis{}
#node ubuntu-server inherits base_homestead_homer_sprout{}
#node ubuntu-server inherits base_sprout{}
#node /^(ubuntu)\-server$/ inherits base_bono{}
#node /^(ims-vbono)\_[0-9]$/ inherits base_bono{}
#node /^(ims-vbono)\_(ellis)\_[0-9]$/ inherits base_bono_ellis{}
node ims-vbono-ellis inherits base_bono_ellis{}
node ims-vsprout inherits base_sprout{}
node ims-vhomer-hs inherits base_homer_homestead{}
node ims-vsprout-homer-hs inherits base_homestead_homer_sprout{}
node /^(ubuntu)\-[a-z]*$/ inherits base_homer_homestead{}
