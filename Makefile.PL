use inc::Module::Install;

name        'Net-Scan-SSH-Server-SupportedAuth';
all_from    'lib/Net/Scan/SSH/Server/SupportedAuth.pm';

requires 'UNIVERSAL::require'    => 0;
requires 'Net::SSH::Perl'        => '1.30';

build_requires 'Test::More'      => 0;
build_requires 'Test::Base'      => 0;

use_test_base;
auto_install;
WriteAll;

{
    eval q( require Math::BigInt::GMP  );
    my $has_gmp  = 1 unless $@;
    eval q( require Math::BigInt::Pari );
    my $has_pari = 1 unless $@;

    if ($has_gmp || $has_pari) {
        ; # OK
    } else {
        print '  ','*'x69,"\n";
        print "  * recommend to install Math::BigInt::GMP or Math::BigInt::Pari.\n";
        print '  ','*'x69,"\n";
    }
}
