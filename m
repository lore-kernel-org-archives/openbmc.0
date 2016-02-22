Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 106831A06D3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=CkzGf6qK; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 5B88A76C06E;
 Mon, 22 Feb 2016 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=N8B3zR3oVx7tQuJrkkIbq
 D/cPNU=; b=CkzGf6qKIB4DJXYK2+U8qQ9PhqipEkYxyMUI7sDZJ9E4mgpU/iFcg
 MzVOY4+BKLqh7kpV6VnObAxSZIr+JJbndzVAi8nGW8/KKjHLjNWUcsaWgnknE7B3
 Tnf8/P1NO7yZWeFQSvYCTVBfLbiXMNEYq49355HlTuR+TIDrhIVh50=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 12E9476C065;
 Mon, 22 Feb 2016 03:19:55 -0800 (PST)
Message-ID: <1456139985.3064.47.camel@aj.id.au>
Subject: Re: [PATCH skeleton] skeleton: fixed hard-coding for master OCC
 hwmon sysfs path
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 22 Feb 2016 21:49:45 +1030
In-Reply-To: <201602220952.u1M9qmds006993@d23av02.au.ibm.com>
References: <1456104727.3064.29.camel@aj.id.au>
 ,<1455909058-21748-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909058-21748-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201602220952.u1M9qmds006993@d23av02.au.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xsB70y5UpV/zw68kP1ya"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 11:19:59 -0000


--=-xsB70y5UpV/zw68kP1ya
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yi Li,

On Mon, 2016-02-22 at 08:42 +0000, Yi TZ Li wrote:
> Hi Andrew,
>=20
> Thank you for the comment.
>=20
> After some thoughts I would like to abandon this patch, since
> sensor_manager2.py will be invoked before OCC becomes active.
> So searching hwmon sysfs for "user_powercap" attribute will always
> fail, since only after OCC becomes active, the OCC hwmon sysfs
> attributes can be created.
>=20
> I will resubmit a patch.
>=20
> For your comments, please see bellow:
>=20
> -----"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wro=
te: -----
>=20
> >To: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
> >openbmc@lists.ozlabs.org
> >From: Andrew Jeffery=20
> >Sent by: "openbmc"=20
> >Date: 02/22/2016 09:33AM
> >Subject: Re: [PATCH skeleton] skeleton: fixed hard-coding for master
> >OCC hwmon sysfs path
> >
> >Hi Yi Li,
> >
> >On Fri, 2016-02-19 at 13:10 -0600, OpenBMC Patches wrote:
> >> From: Yi Li <adamliyi@msn.com>
> >>=20
>=20
> >> > > obj_path =3D OBJ_PATH+"/host/PowerCap"
> >> > > sensor_obj =3D Sensors.PowerCap(bus,obj_path)
> >> -> > ## hwmon3 is default for master OCC on Barreleye.
> >> -> > ## should rewrite sensor_manager to remove hardcode
> >> -> > sensor_obj.sysfs_attr =3D
> >"/sys/class/hwmon/hwmon3/user_powercap"
> >> +> > ## scan hwmon sysfs for master occ's user_powercap attribute
> >> +> > for pcap_file in
> >glob.glob('/sys/class/hwmon/*/user_powercap'):
> >> +> > > occ_i2c_dev =3D os.path.dirname(pcap_file)+'/device'
> >> +> > > occ_i2c_dev =3D
> >os.path.realpath(occ_i2c_dev).split('/').pop()
> >> +> > > # master OCC address
> >> +> > > if occ_i2c_dev =3D=3D '3-0050':
> >> +> > > > sensor_obj.sysfs_attr =3D pcap_file
> >
> >Have you tested the code in the for loop? Because running the body in
> >a
> >Python shell doesn't give me confidence the if-condition will ever be
> >satisfied:
> >
>=20
> The skeleton creates sensors in the order following BMC states, see
> Barreleye.py.
> When I did test, I manually booted the host. But when obmc actually
> boots, sensor_manger2.py will be invoked before OCC becomes active.
> "glob.glob()" search will return empty list.
>=20
> I will need to fix this.
>=20
> > andrew@keelia :~$ python
> > Python 2.7.10 (default, Oct 14 2015, 16:09:02)=20
> > [GCC 5.2.1 20151010] on linux2
> > Type "help", "copyright", "credits" or "license" for more
> >information.
> > >>> import os
> > >>> pcap_file =3D "/sys/class/hwmon/hwmon3/user_powercap"
> >>>> os.path.dirname(pcap_file)+"/device"
> >'/sys/class/hwmon/hwmon3/device'
> >>>> os.path.realpath(_).split('/')
> >['', 'sys', 'class', 'hwmon', 'hwmon3', 'device']
> >>>> _.pop()
> >'device'
> >>>>=20
> >
> >I can't see how occ_i2c_dev will ever take the value '3-0050'? Are we
> >missing additional globbing and/or reading of files?
> >
>=20
> "os.path.realpath()" will resolve the symbol link to real file path,
> e.g:"/sys/class/hwmon3/device", the real path will be
> e.g:"/sys/class/i2c-adaptor/... ... /3-0050".

Ah, yes - thanks for the gentle to read the docs before opening my
mouth!

>=20
> >> root_sensor.add(obj_path,sensor_obj)
> >
> >Have you given consideration to what should be done if the
> >if-condition
> >in the for loop above never fires? Is it still valid to add
> >sensor_obj?
> >
>=20
> Yes. In Sensor.py, I assigned a default path to "sysfs_attr"
>=20
> "CONTROL_IFACE =3D 'org.openbmc.Control'
> class PowerCap(VirtualSensor):
>         def __init__(self, bus, name):
>                 VirtualSensor.__init__(self, bus, name)
>                 SensorValue.setValue(self, 0)
>                 self.sysfs_attr =3D "/sys/class/hwmon/hwmon3/user_powerca=
p"
> "

No worries. I'm still coming up to speed with the codebase(s), so
thanks for taking the time to respond.

Andrew

>=20
> Thanks,
> -Yi
>=20
--=-xsB70y5UpV/zw68kP1ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWyu7RAAoJEJ0dnzgO5LT56MIQAKlNw0Y6n2lskT9gs3fDtGsU
H9AgY/a2jJzyEEaFqqwR3nKM1+z1NVeLiEiX/0UWkLg++NGADedKxuYHV70eJe88
6+Czz4561yObIioiUwbqzqRys86jOVDosvrBIzQlezeWldUkwD8kOb4z5yhePBsA
Qvt80rhbWF9WOFzkIJ2reGw0Gcf18dPzRDB/xDfT5w+M/LFNtFsgOyoH2SYKfvM9
4oU2VY1eDxqqkVldyjC49ic6plNt2MpXKz6P1nENODJp9l5PhD3u0ltf7x/+Lqac
GyDJV8qmPrxr0rEl/MpX/tXwojsCWi39u/ymiJrj7B9H28gFCWhBC97iQ7z4usAG
xzSaC6BG7IJPBg8wJSlUNkN729KskZ1hFDe1JJmTRK91IbQELWQqX8Zp+SMSSfU2
R6JWunRjtqgFxvT2ZhCr/WwSE3OoyS6BzjjQWO/i7EDKcnoHBpv83ggJneHdne6w
4lE9Z51LU26ElzmGtLvLTBJ8MwJC3dhJbqCxHPBRYwY/izrSxO9ghiqVTOO/mPMn
ZpYNez9jRZQEQwUHw9+FbIu7s6hyNmpNMwib9wtyPTYfKHzMIQqU3UmZtmLHV1Cn
nRNqkuJ1QqOskmdPWtE77OSs0eZpXfixtuOUOMarw/Y19kArmVRZHVeYk9ORcVCQ
HPL/LhGNVcn0UEEtQi1y
=BRtw
-----END PGP SIGNATURE-----

--=-xsB70y5UpV/zw68kP1ya--
