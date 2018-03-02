# qserv::firewall
#
# @summary 
# open access among qserv-* nodes
#
# @example
#   include qserv::firewall
class qserv::firewall {

  firewall { '8000 TEMPORARILY accept all on EXT network':
    proto  => 'all',
    action => 'accept',
  }

}
