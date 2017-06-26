Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxPn60GsxzDr15
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 09:06:17 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1498518365946390.75358372056223;
 Mon, 26 Jun 2017 16:06:05 -0700 (PDT)
Date: Mon, 26 Jun 2017 18:05:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Adriana Kobylak <anoo@us.ibm.com>, brad.debauche@rackspace.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, adi.gangidi@rackspace.com,
 Chad Somerlot <chad.somerlot@rackspace.com>, ryan.dc.yu@foxconn.com,
 Adrian Barrera <abarrera@us.ibm.com>
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. (
 Zaius )
Message-ID: <20170626230559.GB31439@asimov.austin.ibm.com>
References: <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
 <1497022202970.71679@rackspace.com>
 <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
 <CACPK8Xdi8bQWYc5QErBi2rJgMfEHLLOdBW7MoasUdK2tpk-GaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <CACPK8Xdi8bQWYc5QErBi2rJgMfEHLLOdBW7MoasUdK2tpk-GaQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Mon, 26 Jun 2017 23:06:18 -0000


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 03:00:30PM +0930, Joel Stanley wrote:
> On Sat, Jun 10, 2017 at 2:33 AM, Adriana Kobylak <anoo@us.ibm.com> wrote:
> > From: Adi Gangidi
> > Sent: Friday, June 9, 2017 10:06 AM
> > To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerlot;
> > abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert
> > Subject: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Za=
ius )
> >
> > Hi Adriana /.  Ryan ( Foxconn )
> >
> > Right now on openBMC
> > BMC Shared      =3D eth0
> > BMC Dedicated =3D eth1
> >
> >
> > Instead, Is there a way we can make sure the BMC dedicated comes up as =
eth0
> > and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?
> >
> >
> > In how it works currently . you could have BMC dedicated be eth0 or eth1
> > depending upon the hardware config ( Whether or not Broadcom 5719A is p=
opped
> > OR de-popped ) . That could confusing to support operators who don't
> > understand the nuances .
> >
> > If you guys are busy with other things to make the change  , can I have=
 your
> > thoughts on if this can be changed ? I'm guessing this is a u-boot chan=
ge .
> > Any thoughts on how we could make this change ourselves ?
>=20
> You can use a udev rule to ensure the devices are named as you expect.

Most Linux distros have moved away from 'ethN' style naming and to
"something else".  My laptop's network interfaces are named 'enp0s31f6'
and 'wlp4s0' for the ethernet and wireless interfaces respectively.

https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfa=
ceNames/

According to that, the default order of naming we should be getting is some=
thing
like this:

1. Names incorporating Firmware/BIOS provided index numbers for on-board de=
vices (example: eno1)
2. Names incorporating Firmware/BIOS provided PCI Express hotplug slot inde=
x numbers (example: ens1)
3. Names incorporating physical/geographical location of the connector of t=
he hardware (example: enp2s0)
4. Classic, unpredictable kernel-native ethX naming (example: eth0)

Any idea why we are ending up with #4?  Is this due to device tree
entries / naming?  It seems like using something like #3 would get well
defined and consistent names no matter which network interface is
enabled.  It should also, in theory, make all AST2400 chips arrive at
the same names for NC-SI vs direct PHY.

--=20
Patrick Williams

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAllRk1YACgkQqwNHzC0A
wRk1GBAAnSNslDbiB1QM+LcRZ7i9d+XAThStAjhBMq1m0yLnii7NHmTw41iDxZYL
3X3LVBiVo7/ddUHPiOqrggKY3BHeJqvNtpPcje2K/8S2oknwqk8VUZAPR6tqXQXD
6YBGdsy9fbOsoYBlc5v86J8XTiCwg+ZRpglvqTyOyw01nJBnmBsy5xT1r5/GpDc9
mecKYZtR3cYi697ReVmdFuk7xY/FbOXVMn+oG/+dMB5fDrppGOCB+dkWbY4GcETY
BMb+boOQMs2VcT3u8Fk49BnlgIJKh50j61YFyc0gdgJn8vfCxVwCZ40BzKoQanxl
Z4QRUBSwrOc7DjU6Ruc50erAIQ8h4ChnutU44JETFfiEU3SI0H70oXdmNHE77HlB
AOGNVPLayNNapocwsC3jQSDkIELiMNGpmtWFxn71IvtonkSMZoro3xH8GFw/4wxv
fzkCUaChGgXm+9MRmlWcjMW2VkzFpJEtn/AZLi5hpB+EVCtoodCbMSaLcziQavDL
t84UrAyGsbT2x3/D1IBVn4wOUXW+RKjTmpXWUYPbkK9FPokGeBPGmkJJPzTnTj8w
6l3In710cFDDB0RdYxO7+VuJkj1uIm9Q+7tjEB52YRzyIZg7nz9aV7W/NRWFKhHu
rJrmRxrVCqTZfBIiaCAUPKX1Dk9EfFQnVxuyo0eyzK552Aq71Ik=
=3l7k
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
