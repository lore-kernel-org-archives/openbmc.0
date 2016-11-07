Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBz455MVWzDvNT
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 14:50:29 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478490622324676.3758351956718;
 Sun, 6 Nov 2016 19:50:22 -0800 (PST)
Date: Sun, 6 Nov 2016 21:50:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20161107035006.GB15757@heinlein.lan>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com>
 <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <581CCA61.4010202@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 07 Nov 2016 03:50:30 -0000


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tom,

Thanks for the explanation.  With this website you pointed to and some
other investigation I've done, I am comfortable with us using the 'Set
Channel Access' as the time to apply the settings.  The documentation of
two competition products both seem to require an 'ipmitool mc reset
warm' for IP address changes to take effect, so we are at least better
than that.

Can you internally track down a contact on the xCAT team and verify that
this will be ok with them?  xCAT is an open source management tool that
uses IPMI for most of the system management and we should understand
what process they use for applying IP address changes.  If they expect
to do a sequence of set-lan command and then a reset, then our
implementation using 'Set Channel Access' won't cover their cases
either.

On Fri, Nov 04, 2016 at 11:20:25PM +0530, tomjose wrote:
> Hi Patrick,
>=20
> In the IPMI command flow that Nan mentioned in the earlier mail. Any of=
=20
> the following ipmitool command for
> setting the IPv4 configuration, one of the step is to 'Commit=20
> Write'(Step 8 in Nan's mail).
>=20
> ipmitool lan set 1 ipaddr x.x.x.x
> ipmitool lan set 1 netmask x.x.x.x
> ipmitool lan set 1 defgw ipaddr x.x.x.x
>=20
> As part of the execution of any of the above commands a commit write is=
=20
> executed. In that case we cannot use
> 'Commit Write' as a way to denote the completion of a transaction.
>=20
> The IPMI specification expects the IP configuration parameters as=20
> non-volatile parameters. The commit write
> parameter is a way to implement rollback feature. The BMC would make a=20
> copy of the existing parameters
> when the 'Set in Progress' state is asserted.
>=20
> The Get/Set LAN Configuration commands do not provide an option to apply=
=20
> the configuration and is identified as
> LAN channel settings. The link below used 'Set Channel Access' command=20
> to apply the settings.
> (ipmitool lan set 1 access on). Since LAN configuration parameters are=20
> channel settings, we thought of
> applying the LAN configuration parameters as part of 'Set Channel=20
> Access'. I am okie if we have
> an OEM command to trigger applying the LAN settings.
>=20
> https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_i=
pmitool
>=20
> In Barreleye we did not implement the 'Set Channel Access' command.=20
> There was no external
> command to trigger apply the settings. In Barreleye the LAN settings are=
=20
> applied when all the
> three entries(IP Address, Netmask and Gateway address) where set. So=20
> only to change the
> IP address, the netmask and gateway address need to be re-entered, which=
=20
> was an imperfect
> solution.
>=20
> Regards,
> Tom
>=20
>=20
>=20
> On Friday 04 November 2016 07:44 PM, Patrick Williams wrote:
> > Tom,
> >
> > On Fri, Nov 04, 2016 at 06:56:21PM +0530, tomjose wrote:
> >> The Set Channel access command was decided to be used to mark the end =
of
> >> a setting LAN configuration transaction.
> > The IPMI spec for the SetLanConfig has a parameter 'Set In Progress'
> > which states: 10b =3D commit write.  Why are we not utilizing that?  Ma=
ybe
> > in addition to Set Channel Access?
> >
> > I don't see anything in the Set Channel Access command description that
> > would be obvious as a mechanism for updating IP addresses.  Was that
> > just quick behavior we decided to do for Barreleye?  Is there any reason
> > why we would not deprecate that behavior in favor of the Set In
> > Progress / commit write?
> >
>=20

--=20
Patrick Williams

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/nuAAoJEKsDR8wtAMEZHNIP/1bxPmnhDp5Z1KTtBN739laP
0Gud5NAAIv5RtY8i70FgfUN1UE1kP00fV0LaeUBxsIifHcBUnN2otUEuAyfExSia
DN9QFR7C8bdtBm9Bowr0mgjyWS2q/547IWT/cvf6mewwZYhnTjlk9xHlZ0/n2p24
c1DcA1AkEfC0RLNOjt3ZKj4S2GfGpVD3UpAX5WBZe7JlBla9LsHn33YUY3RHEITs
44cxt9K9GjYzKG1Pr8ddP4Uvp2BzVhl/sATS4mkGb5XxMl7s9lhpZoTQwWdNjQ3N
7akiECBEIfWROQhEy2OaXCK8VEEpsyqmBh0bevQWdgzSLSLLJFP+HmPgtL79mac2
ACVa8gmNLWe343XXk/mF0Rf20ZpEqhZE5Z8FnXvGgU/zl0n1P78qYBE5jLYE0Srd
o8732ZrWyk77wjFZW2ylk7b0Pjv/lSQ/gydmsFZIQpUAC9ltS3iuEA7PUiinBnWY
NC6wvOtzxDnetKmFYwIdCzIpD1qnpMUiYIUecW3K92L1PfLvntaUmF2sOz/AxfTO
w44SeQ7/z31HRj2iAhOR0s9SpaLpeGv5YmelhrmPYM1LHK/lrvN5AoQ+2AF6TrJQ
OtkJqER5QdWITKQnS8KVnnz4+eO4h9jJe56nqswNp9XBpIhYeOl5JYenKOSILH1c
PbLTKsAKl6syfteDMjqI
=9fU6
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
