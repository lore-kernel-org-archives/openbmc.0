Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spMLH3S7BzDrFn
 for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2016 01:51:19 +1100 (AEDT)
Received: from localhost (32.97.110.54 [32.97.110.54]) by mx.zohomail.com
 with SMTPS id 1475592666652803.8902921036704;
 Tue, 4 Oct 2016 07:51:06 -0700 (PDT)
Date: Tue, 4 Oct 2016 09:51:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20161004145104.d5co7h25dakpcxyz@asimov>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4sqfid6ejebzvixb"
Content-Disposition: inline
In-Reply-To: <57F37746.6040304@linux.vnet.ibm.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2016 14:51:20 -0000


--4sqfid6ejebzvixb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Forwarding to list.

On Tue, Oct 04, 2016 at 03:02:54PM +0530, tomjose wrote:
> Hello Nan,
>=20
> The current implementation mandates the user to enter <IP=20
> Address>,<NetMask> and <Gateway>
> for the network settings to be changed. Even though the user wants to=20
> change only the IP
> address , because of the way we have implemented we are forcing the user=
=20
> to enter all the three details.
>=20
> The LAN settings is a property of the channel(Channel 1 typically=20
> corresponds to ETH0) and we can leverage
> the "Set Channel Access" command to apply the settings.We can apply the=
=20
> network settings whenever the
> Access Mode is turned on.(ipmitool lan set 1 access on)
>=20
> With the solution i am thinking , the Set LAN configuration command=20
> would not be used to apply the network
> settings but it would be used to cache the network settings and it would=
=20
> be applied when the Set Channel Access
> command is called.
>=20
> The following link explains the order of commands.
>=20
> https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_i=
pmitool(LAN=20
> Configuration section)
>=20
> Regarding #2 - Authentication Type Support, it seems that this section=20
> is not updated properly.
> Get Channel Authentication capabilities is the first command issued for=
=20
> a session setup.
> This command also has the same Authentication type support field and the=
=20
> 7th bit which
> was reserved in #2 is used in this command to specify IPMI2.0 and=20
> IPMI1.5 authentication
> capabilities.
>=20
> So since #2 is outdated to represent the necessary authentication=20
> capabilities, i think we do
> not need to support parameter #2.
>=20
> Regarding #3 - Authentication Type Enables - this is needed if we=20
> support different authentication
> types for different requested privilege levels. Since the authentication=
=20
> types are outdated  and we
> do not support different authentication types per privilege levels, we=20
> can avoid this parameter.
>=20
> Thanks,
> Tom
>=20
>=20
>=20
>=20
> On Monday 03 October 2016 07:29 PM, Li Nan wrote:
> >
> > Hi team,
> >
> > I'm working on the story of Confirm LAN Command meet IPMI 2.0
> > https://github.com/openbmc/openbmc/issues/444
> >
> >
> > <https://github.com/openbmc/openbmc/issues/444>
> >
> > I summarize some fields of settings below, and need some help to=20
> > confirm the direction of my work.
> >
> > ```
> >
> >
> >   1.IPMI LAN command status and work plan
> >
> >
> >     1.1.Current status
> >
> > IPMI LAN command consists of 4 command ( refer to IPMI 2.0 Spec,=20
> > Chapter 23 ):Set LAN Configuration Parameters, Get LAN Configuration=20
> > Parameters, Suspend BMC ARPs and Get IP/UDP/RMCP Statistics.
> >
> > Existing code includes implementation of Set/Get LAN configuration=20
> > Parameters. ( Refer to=20
> > https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthan=
dler.cpp=20
> > )
> >
> >
> >     1.2.IPMI LAN Command Handling
> >
> > Example for Set LAN Configuration Parameters.
> >
> > Parameter
> >
> > =09
> >
> > #
> >
> > Number
> >
> > =09
> >
> > IPMI handling
> >
> > =09
> >
> > dbus method
> >
> > Set In Progress(Volatile)
> >
> > =09
> >
> > 0
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 209.
> >
> > variable lan_set_in_progress act as a statemachine.
> >
> > =09
> >
> > No need.
> >
> > Authentication Type Support(Read Only)
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 305.
> >
> > Setto 0x4 (MD5)
> >
> > =09
> >
> > No need.
> >
> > Authentication Type
> >
> > Enables
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 311.
> >
> > Set to 0x4, 0x4, 0x4, 0x4, 0x4.
> >
> > =09
> >
> > No need.
> >
> > IP Address
> >
> > =09
> >
> > 3
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 169.
> >
> > =09
> >
> > phosphor-neworkd/netman.py: Line 266: SetAddress4
> >
> > MAC Address
> >
> > (can be Read Only)
> >
> > =09
> >
> > 5
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 174.
> >
> > =09
> >
> > phosphor-neworkd/netman.py: Line 334: SetHwAddress.
> >
> > Subnet Mask
> >
> > =09
> >
> > 6
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 199.
> >
> > =09
> >
> > phosphor-neworkd/netman.py: Line 266: SetAddress4
> >
> > Default Gateway Address
> >
> > =09
> >
> > 12
> >
> > =09
> >
> > phosphor-host-ipmid/transporthandler.cpp, Line 204.
> >
> > =09
> >
> > phosphor-neworkd/netman.py: Line 266: SetAddress4
> >
> > Handling of Get LAN Configuration Parameters command is similar to Set=
=20
> > LAN Configuration Parameters. Refer to=20
> > phosphor-host-ipmid/transporthandler.cpp and phosphor-networkd/netman.p=
y.
> >
> >
> >     1.3.Gap between current code and IPMI Spec 2.0
> >
> > LAN Configuration Parameter List
> >
> > Parameter
> >
> > =09
> >
> > #
> >
> > Number
> >
> > =09
> >
> > Parameter Data( non-volatile unless otherwise noted )
> >
> > =09
> >
> > Bit field
> >
> > =09
> >
> > Description
> >
> > =09
> >
> > Current status/Note
> >
> > ( Yes =3D current support.
> >
> > No =3D not support. )
> >
> > Set In Progress(Volatile)
> >
> > =09
> >
> > 0
> >
> > =09
> >
> > byte 1
> >
> > =09
> >
> > =09
> >
> > 00b -=3D set complete
> >
> > 0ab =3D set in progress
> >
> > 10b =3D commit write
> >
> > 11b =3D reserved
> >
> > =09
> >
> > Yes
> >
> > Authentication Type Support(Read Only)
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > byte 1
> >
> > =09
> >
> > =09
> >
> > Authentication type(s) enabled for this channel(bi0tfield):
> >
> > All bits: 1b =3Dsupported
> >
> > 0b=3D authentication type not available for use.
> >
> > [5] =E2=80=93 OEM proprietary
> >
> > [4] =E2=80=93 straight password / key
> >
> > [3] =E2=80=93 reserved
> >
> > [2] =E2=80=93 MD5
> >
> > [1] =E2=80=93 MD2
> >
> > [0] - none
> >
> > =09
> >
> > Yes.
> >
> > MD5
> >
> > Authenticaton Type
> >
> > Enables
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > This field is used to configure which Authentication Types are=20
> > available for use when a remote console activates an IPMI messaging=20
> > connection to the BMC for a given requested maximum privilege level.
> >
> > =09
> >
> > Yes.
> >
> > MD5
> >
> > IP Address
> >
> > =09
> >
> > 3
> >
> > =09
> >
> > data 1:4
> >
> > MS-byte first
> >
> > =09
> >
> > =09
> >
> > IP Address
> >
> > =09
> >
> > Yes
> >
> > IP Address Source
> >
> > =09
> >
> > 4
> >
> > =09
> >
> > data1
> >
> > =09
> >
> > =09
> >
> > address source
> >
> > 0h =E2=80=93 unspecified
> >
> > 1h =3D static address (manually configured)
> >
> > 2h =3D address obtained by BMC running DHCP
> >
> > 3h =3D address loaded by BIOS or system software
> >
> > 4h =3D address obtained by BMC running other address assignment protocol
> >
> > =09
> >
> > No.
> >
> > MAC Address
> >
> > (can be Read Only)
> >
> > =09
> >
> > 5
> >
> > =09
> >
> > data 1:6
> >
> > =09
> >
> > =09
> >
> > MAC Address for messages transmitted from BMC.
> >
> > MS-byte first.
> >
> > =09
> >
> > Yes.
> >
> > Subnet Mask
> >
> > =09
> >
> > 6
> >
> > =09
> >
> > data1:4
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > Yes
> >
> > IPv4 Header Parameter
> >
> > =09
> >
> > 7
> >
> > =09
> >
> > data1
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No
> >
> > Primary RMCP Port Number(optional)
> >
> > =09
> >
> > 8
> >
> > =09
> >
> > data1:2
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Secondary RMCP Port Number(optional)
> >
> > =09
> >
> > 9
> >
> > =09
> >
> > data1:2
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > BMC-generated ARP control (optional)
> >
> > =09
> >
> > 10
> >
> > =09
> >
> > data1
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Gratuitous ARP interval (optional)
> >
> > =09
> >
> > 11
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Default GatewayAddress
> >
> > =09
> >
> > 12
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > Yes
> >
> > Default Gateway MAC Address
> >
> > =09
> >
> > 13
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Backup Gateway Address
> >
> > =09
> >
> > 14
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Backup Gateway MAC Address
> >
> > =09
> >
> > 15
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Community String
> >
> > =09
> >
> > 16
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Number of Destinations( Read Only )
> >
> > =09
> >
> > 17
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Destination Type (volatile / non-volatile =E2=80=93 see description )
> >
> > =09
> >
> > 18
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Destination Address
> >
> > =09
> >
> > 19
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Following parameters are introduced with IPMI v2.0/RMCP+
> >
> > 802.1q VLAN ID (12-bit)
> >
> > =09
> >
> > 20
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > 802.1q VLAN Priority
> >
> > =09
> >
> > 21
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > RMCP+ Messaging Cipher Suite Entry Support( Read Only )
> >
> > =09
> >
> > 22
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > RMCP+ Messaging Cipher Suite Entries( Read Only )
> >
> > =09
> >
> > 23
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > RMCP+ Messaging Cipher Suite Privilege Levels
> >
> > =09
> >
> > 24
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Destination Address VLAN TAGs
> >
> > =09
> >
> > 25
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Bad Password Threshold
> >
> > =09
> >
> > 26
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6/IPv4 Support
> >
> > =09
> >
> > 50
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6/IPv4 Addressing Enables
> >
> > =09
> >
> > 51
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6/IPv4 Header Static Traffic Class
> >
> > =09
> >
> > 52
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Header Static Hop Limit
> >
> > =09
> >
> > 53
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Header Flow Label
> >
> > =09
> >
> > 54
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Status
> >
> > =09
> >
> > 55
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Addresses
> >
> > =09
> >
> > 56
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Static DUID storage length
> >
> > =09
> >
> > 57
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Static DUIDs
> >
> > =09
> >
> > 58
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic ( SLAAC/DHCPv6) Address
> >
> > =09
> >
> > 59
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Dynamic DUID storage length
> >
> > =09
> >
> > 60
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Dynamic DUIDs
> >
> > =09
> >
> > 61
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Timing Configuration Support
> >
> > =09
> >
> > 62
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 DHCPv6 Timing & Configuration
> >
> > =09
> >
> > 63
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Router Address Configuration Control
> >
> > =09
> >
> > 64
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 1 IP Address
> >
> > =09
> >
> > 65
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 1 MAC Address
> >
> > =09
> >
> > 66
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 1 Prefix Length
> >
> > =09
> >
> > 67
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 1 Prefix Value
> >
> > =09
> >
> > 68
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 2 Address
> >
> > =09
> >
> > 69
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 2 MAC Address
> >
> > =09
> >
> > 70
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 2 Prefix Length
> >
> > =09
> >
> > 71
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Static Router 2 Prefix Value
> >
> > =09
> >
> > 72
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > Number of Dynamic Router Info Sets
> >
> > =09
> >
> > 73
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic Router Info IP Address
> >
> > =09
> >
> > 74
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic Router Info MAC Address
> >
> > =09
> >
> > 75
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic Router Info Prefix Length
> >
> > =09
> >
> > 76
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic Router Info Prefix Value
> >
> > =09
> >
> > 77
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Dynamic Router Received Hop Limit
> >
> > =09
> >
> > 78
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Neighbor Discovery / SLAAC Timing Configuration Support
> >
> > =09
> >
> > 79
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > IPv6 Neighbor Discovery / SLAAC Timing Configuration
> >
> > =09
> >
> > 80
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> > OEM Parameters
> >
> > =09
> >
> > 192:255
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > No.
> >
> >
> >     1.4.Work Plan
> >
> >
> >       1.4.1.Set LAN Configuration Parameters
> >
> >
> >       1.4.2.Get LAN Configuration Parameters
> >
> > I figure out what we support in phosphor-netwokd repo ( Refer to:
> >
> > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py ) :
> >
> >   * Set In Progress,
> >   * Authentication Type Support,
> >   * Authentication Type Enables,
> >   * IP Address,
> >   * MAC Address,
> >   * Subnet Mask,
> >   * Default Gateway Address
> >
> > So I think we only support existing configuration.
> >
> > How can I implement the rest of the configurations/parameters? (open=20
> > issues?)
> >
> >
> >       1.4.3.ARP
> >
> > Not implemented in Tom=E2=80=99s IPMI network story.
> >
> > Should I refer to=20
> > openbmc/import-layers/meta-openembedded/meta-networking/recipes-support=
/arptables=20
> > ?
> >
> > Optional command. Not to implement?
> >
> >
> >       1.4.4.IP/UDP/RMCP statistics
> >
> > Seems like it was not implemented in obmc stories too.
> >
> > This is an optional command. Not to implement?
> >
> >
> >   2.IPMI LAN Commands in IPMI Spec 2.0 -- Format
> >
> >
> >     1.1.Set LAN Configuration Parameters command
> >
> > Set LAN Configuration Parameters command
> >
> > =09
> >
> > Byte
> >
> > =09
> >
> > Bit field
> >
> > =09
> >
> > Description
> >
> > =09
> >
> > Support
> >
> > Request Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > [7:4]
> >
> > =09
> >
> > reserved
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [3:0]
> >
> > =09
> >
> > Channel number
> >
> > =09
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > =09
> >
> > Parameter selector
> >
> > =09
> >
> > =09
> >
> > 3:N
> >
> > =09
> >
> > =09
> >
> > Configuration parameter data
> >
> > =09
> >
> > Response Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > Completion code
> >
> > =09
> >
> > 80h =3D parameter not supported.
> >
> > 81h =3D attempt to set the =E2=80=98set in progress=E2=80=99 value (in =
parameter #0)=20
> > when not in the =E2=80=98set complete=E2=80=99 state. (This completion =
code provides a=20
> > way to recognize that another party has already =E2=80=98claimed=E2=80=
=99 the parameters)
> >
> > 82h =3D attempt to write read-only parameter
> >
> > 83h =3D attempt to read write-only parameter
> >
> > =09
> >
> > Existing code supports 7 LAN command:
> >
> > Set In Progress,
> >
> > Authentication Type Support,
> >
> > Authentication Type Enables,
> >
> > IP Address,
> >
> > MAC Address,
> >
> > Subnet Mask,
> >
> > Default Gateway Address.
> >
> > Refer to:
> >
> > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> >
> >     1.2.Get LAN Configuration Parameters Command
> >
> > Get LAN Configuration Parameters Command
> >
> > =09
> >
> > Byte
> >
> > =09
> >
> > Bit field
> >
> > =09
> >
> > Description
> >
> > =09
> >
> > Support
> >
> > Request Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > [7]
> >
> > =09
> >
> > 0b =3D get parameter
> >
> > 1b =3D get parameter revision only
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [6:4]
> >
> > =09
> >
> > reserved
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [3:0]
> >
> > =09
> >
> > Channel number
> >
> > =09
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > =09
> >
> > Parameter selector
> >
> > =09
> >
> > =09
> >
> > 3
> >
> > =09
> >
> > =09
> >
> > Set Selector. Selects a given set of parameters under a given=20
> > Parameter selector value.
> >
> > 00h if parameter don=E2=80=99t use a Set Selector.
> >
> > =09
> >
> > =09
> >
> > 4
> >
> > =09
> >
> > =09
> >
> > Block Selector (00h if parameter does not require a block number)
> >
> > =09
> >
> > Response Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > [7:0]
> >
> > =09
> >
> > Completion Code.
> >
> > Generic codes, plus following command-specific completion code(s):
> >
> > 80h =3D parameter not supported.
> >
> > =09
> >
> > Existing code supports 7 LAN command:
> >
> > Set In Progress,
> >
> > Authentication Type Support,
> >
> > Authentication Type Enables,
> >
> > IP Address,
> >
> > MAC Address,
> >
> > Subnet Mask,
> >
> > Default Gateway Address.
> >
> > Refer to=20
> > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > [7:0]
> >
> > =09
> >
> > Parameter revision.
> >
> > Format: MSN =3D present revision. LSN =3D oldest revision parameter is=
=20
> > backward compatible with. 11h for parameters in this specification.
> >
> > =09
> >
> > The following data bytes are not returned when the =E2=80=98get paramet=
er=20
> > revision only=E2=80=99 bit is 1b.
> >
> > =09
> >
> > 3:N
> >
> > =09
> >
> > =09
> >
> > Configuration parameter data.
> >
> > If the rollback feature is implemented, the BMC makes a copy of the=20
> > existing parameters when the =E2=80=98set in progress=E2=80=99 state be=
comes asserted=20
> > (See the Set in Progress parameter #0). While the =E2=80=98set in progr=
ess=E2=80=99=20
> > state is active, the BMC will return data from this copy of the=20
> > parameters, plus any uncommitted changes that were made to data.=20
> > Otherwise, the BMC returns parameter data from non-volatile storage.
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > =09
> >
> >
> >       1.2.1.DHCPv6 Timing Parameters
> >
> > Not support.
> >
> >
> >       1.2.2.Neighbor discovery / SLAAC Timing Parameters
> >
> > Not support.
> >
> >
> >     1.3.Suspend BMC ARPs command
> >
> > Suspend BMC ARPs Command
> >
> > =09
> >
> > Byte
> >
> > =09
> >
> > Bit field
> >
> > =09
> >
> > Description
> >
> > =09
> >
> > Support
> >
> > Request
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > [7:4]
> >
> > =09
> >
> > Reserved
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [3:0]
> >
> > =09
> >
> > Channel number
> >
> > =09
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > [7:2]
> >
> > =09
> >
> > Reserved
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [1]
> >
> > =09
> >
> > ARP response suspend.
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [0]
> >
> > =09
> >
> > Gratuitous ARP suspend
> >
> > =09
> >
> > Respond
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > =09
> >
> > Completion code
> >
> > =09
> >
> > Do not support.
> >
> > ( Should refer to
> >
> > openbmc/import-layers/meta-openembedded/meta-networking/recipes-support=
/arptables?=20
> > )
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > =09
> >
> > present state o f ARP suspension
> >
> > =09
> >
> > =09
> >
> > [7:2]
> >
> > =09
> >
> > reserve
> >
> > =09
> >
> > =09
> >
> > [1]
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [0]
> >
> > =09
> >
> > Address Resolution Protocol.
> >
> >
> >     1.4.Get IP/UDP/RMCP Statistics Command
> >
> > Get IP/UDP/RMCP Statistics Command
> >
> > =09
> >
> > Byte
> >
> > =09
> >
> > Bit field
> >
> > =09
> >
> > Description
> >
> > =09
> >
> > Support
> >
> > Request Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > [7:4]
> >
> > =09
> >
> > reserved
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [3:0]
> >
> > =09
> >
> > Channel number
> >
> > =09
> >
> > =09
> >
> > 2
> >
> > =09
> >
> > [7:1]
> >
> > =09
> >
> > clear statistics
> >
> > =09
> >
> > =09
> >
> > =09
> >
> > [0]
> >
> > =09
> >
> > =09
> >
> > Respond Data
> >
> > =09
> >
> > 1
> >
> > =09
> >
> > =09
> >
> > Completion Code
> >
> > =09
> >
> > RMCP is implemented in openbmc.
> >
> > Refer to
> >
> > https://github.com/openbmc/openbmc/issues/432 and so on.
> >
> > Discussed with Tom, these statistics is not implemented in=20
> > phosphor-networkd.
> >
> > =09
> >
> > 2:3
> >
> > =09
> >
> > =09
> >
> > IP Packets Received.
> >
> > =09
> >
> > 4:5
> >
> > =09
> >
> > =09
> >
> > Received IP Header Errors
> >
> > =09
> >
> > 6:7
> >
> > =09
> >
> > =09
> >
> > Received IP Address Errors
> >
> > =09
> >
> > 8:9
> >
> > =09
> >
> > =09
> >
> > Fragmented IP Packets Received
> >
> > =09
> >
> > 10:11
> >
> > =09
> >
> > =09
> >
> > IP Packets Transmitted
> >
> > =09
> >
> > 12:13
> >
> > =09
> >
> > =09
> >
> > UDP Packets Received
> >
> > =09
> >
> > 14:15
> >
> > =09
> >
> > =09
> >
> > Valid RMCP Received
> >
> > =09
> >
> > 16:17
> >
> > =09
> >
> > =09
> >
> > UDP Proxy Packets Received
> >
> > =09
> >
> > 18:19
> >
> > =09
> >
> > =09
> >
> > UDP Proxy Packets dropped
> >
> >
> >   3.End
> >
> > ```
> >
> >
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20

--=20
Patrick Williams

--4sqfid6ejebzvixb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX88HYAAoJEKsDR8wtAMEZ+jMP/jQH6CPjUaJSVUikyjlQSllM
HKlz/HVdcbFF8YhWb/YFnFTBZJHIbyUcfOZ/GjPBHterbIgBxzfYHTVLxK8pscWT
wg8MvM0YdH/SWSBisAhfiloMBHdAp6QfLhX0UW8Ib0AiSCJzlUIA2xhDQbRRFcH5
phKZfkGYfIidL/8EqhWSsgwDm8fdjI2toZUcdq/6l1VyDpIiAyYsK+4suwSa/sBx
3sRAqmNARUrVYGIigLkdDQTRdvCe7m89BqmK0oZ8CcOZiO0M6T48EaA6AUeDkUwT
OYv7tz4eM0/znprpxxkeyZ+bTj36VKjTP2r4zAIJHsyJwO6pbvIHAFqUN/ykPkCq
0iFsCJqEN+D0hN4+BKmpfL1fr/HskkRUB0cZMMKU0ltKXS1w8W/5QwyWzTnZrYmw
KuhHk/mbqGVgxW08O+wnm6h9hv+CiqiCr5vPm0Hkn5pOoQCtah+Hfzlxu0NGyKda
NHmE7M8pL64kiHBsXT1bh27w2uc4aBiAByNL5SVk1Zc9kJVfb+UmFaAgdSDuJvHM
AUK7sdXcwDw9sD75wA/ag3lYoV5s/4hkHZdV1YUCKu8jTDrMsf6Euf0tkZ9MNYhW
IQGDstNAiKyYlmkRZpEjksjCTVSveTcA1xnjRi36EOpgEwECgXwkRUnJBzbpsm+W
VqogZFPG+n8VFfGn6fGS
=7W9B
-----END PGP SIGNATURE-----

--4sqfid6ejebzvixb--
