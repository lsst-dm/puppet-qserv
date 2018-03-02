# qserv::users
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include qserv::users
class qserv::users {

    # Defaults
    File {
        ensure => 'directory',
        owner  => 'qserv',
        group  => 'qserv',
        mode   => '0700',
    }
    $user = 'qserv'
    $group = 'qserv'
    $uid = 1000
    $gid = 1000
    $home = "/home/${user}"

    group { $group :
        ensure => 'present',
        name   => $group,
        gid    => $gid,
    }

    user { $user :
        ensure         => 'present',
        gid            => $gid,
        home           => $home,
        managehome     => true,
        password       => '!!',
        purge_ssh_keys => false,
        shell          => '/bin/bash',
        uid            => $uid,
    }

    $dirs = [
        $home,
        "${home}/.ssh",
    ]
    file { $dirs : }

    file { "${home}/.ssh/authorized_keys" :
        ensure => 'present',
        mode   => '0600',
    }

}
