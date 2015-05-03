#!/usr/bin/env perl
#
# PEGv1.pl written by Ish Sookun <http://hacklog.in/about>
# PEGv1 - Project Evil Genius version 1
# For details about this project please visit http://hacklog.in/peg.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 2 of the License.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.
#

use strict;
use warnings;

chomp(my $arch_check = `uname -i`);
chomp(my $suse_version = `cat /etc/issue`);
print("\n\n");
print("Checking system ...\n");

if (($suse_version =~ /openSUSE 12.3/) && ($arch_check eq "x86_64")) { 
  print("\n\n");
	print("I found openSUSE 12.3 64bit. Great! We're good to go ...\n\n");
	print("If you're running the script as a regular user you will be asked to provide root's password to install packages.\n\n");

	system('sudo zypper ar http://hacklog.in/openSUSE/repository/12.3 Hacklog.in');
	system('sudo zypper mr -r Hacklog.in');
	system('sudo zypper ref');
	system('sudo zypper in oping nping fping gtping noping pinger hping arping2 httping echoping pingtunnel dnstracer dnstop udns nmap zenmap nmapsi4 smb4k etherape wireshark gnome-nettool kadu-networkping avahi-utils avahi-utils-gtk hackbench ktrafficanalyzer pdfcrack rarcrack ophcrack fcrackzip android-tools android-notifier-desktop linphone ant-phone mysql-query-browser john hydra nedi rancid whois gwhois jwhois passwdqc makepasswd nkmkpasswd gq cadaver ncat python-httplib2 leechcraft leechcraft-poshuku leechcraft-pintab leechcraft-sidebar leechcraft-shellopen leechcraft-aggregator leechcraft-azoth leechcraft-azoth-acetamide leechcraft-otlozhu leechcraft-netstoremanager leechcraft-netstoremanager-googledrive leechcraft-poshuku-pogooglue leechcraft-monocle leechcraft-monocle-pdf python-pygithub mysql-gui-tools ruby');
	
	print("Installing additional utiliies ...\n\n");

	system('wget http://hacklog.in/openSUSE/PEGv1/PEGv1_utils.tar.gz && tar -zxvf PEGv1_utils.tar.gz');
	system('wget http://hacklog.in/openSUSE/PEGv1/PEGv1.tar.gz && tar -zxvf PEGv1.tar.gz');
	system('sudo cp -rv PEGv1 /opt/ && sudo chmod -R 755 /opt/PEGv1');
	system('sudo cp -rv PEGv1_utils/* /usr/local/bin');
	system('rm -rf PEGv1_utils PEGv1 PEGv1_utils.tar.gz PEGv1.tar.gz');
	
} else {
	print("You are not running openSUSE 12.3 64bit. Sorry, I cannot proceed with installation.\n");
}

print("Intallation is complete!\n\n");
print("For full list of applications visit http://hacklog.in/peg.\n");
print("If you would like to help in the project, drop me a mail : ishwon\@openSUSE.org.\n\n");
