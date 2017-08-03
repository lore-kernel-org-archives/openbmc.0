Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNH2Z1kNHzDr51
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 14:22:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F4kt08jL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DCl4y0rj"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 560C120982;
 Thu,  3 Aug 2017 00:22:09 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 03 Aug 2017 00:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1tIkwDrJEmabp6x4pQJiDdflGr3WlqSLAl82L+j7e
 yg=; b=F4kt08jLVeLMh+he0cTMVb3hICesh2QSC/Hvg09cjBqMfI/+EQJ8U9nZa
 8FO8KWDU0NPURRyWU5VXYZCNXP6+EoPKwMPQRf7C59hbSLVaikjHVqeIoFDAubsy
 ideVModirzLVJF2Q17f14zcNkYchIvYbVV9f6dJEWXRsmfYQbQW8aCgLxuFuwhKo
 d3A5/J0nhuwJrsjKSEaZLdBQwgxsIaEZKPhgfX1DWoVdieTrRG+G3VHnmPg9upuo
 LDwSOWX69do4c+T+RDv/dOo7qGuj/63a0G3yV0g3YGN01hWg4irOX0SDcJKlNsGf
 lEPt9sC6Io15Lzvul58s1H/cfxEHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1tIkwDrJEmabp6x4pQ
 JiDdflGr3WlqSLAl82L+j7eyg=; b=DCl4y0rjQk51GrYy562Ojb48ujuvi6Vr+d
 xnOKh/lQ7h9i5P+wlMzAnqE/GezvKPqOhBwQkpWKu8uvQXFpYC1FYULAD1iVJ+QT
 WUWYnh5bVu6XdwZfiWUOKzFJGEsnRzsMUw0OnXD5zWZjvHlOVoGFVFfqbipzsZFu
 T6IBh7umWnBWzNW3dBIwI3tR4jlRTw41vbvQ7CCrlP/RsmkGqkdV61tDeY1ZZ/wl
 VMmNR7w224cU4zwhz02oVGXpTs0dbWo0gkID+c6DztHRa0Z29MLYr7rwTxJ5mPxc
 UoOL3VJwAUGBR9f1O5HFIkj3bCCCFWIC6ClpVxsemr3afC7rlcHA==
X-ME-Sender: <xms:8aSCWdhrq_WrCfqQ3iNgwZdO6x1thgnGKjgtAVWngcYjDSRR8gI-Tg>
X-Sasl-enc: J3194d1tw9RcU3RtOOpSs3kujuPN4oz2pyqVuCN5XRxC 1501734128
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 221D67FA6C;
 Thu,  3 Aug 2017 00:22:06 -0400 (EDT)
Message-ID: <1501734120.29409.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 3/5] Documentation: hwmon: Add IBM
 power supply documentation
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, Brandon Wyman <bjwyman@gmail.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 13:52:00 +0930
In-Reply-To: <e6d6cc0f-8337-2228-9c28-da98d424131f@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-4-git-send-email-eajames@linux.vnet.ibm.com>
 <CAK_vbW1GJAaV9OLWTcyY=2s55zMELs1qZ59PZZc-6H1mcm=gEg@mail.gmail.com>
 <e6d6cc0f-8337-2228-9c28-da98d424131f@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-J+wIyUBlCbHUCiEtbjjt"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 03 Aug 2017 04:22:16 -0000


--=-J+wIyUBlCbHUCiEtbjjt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-02 at 21:23 -0500, Eddie James wrote:
>=20
> On 08/02/2017 05:11 PM, Brandon Wyman wrote:
> > On Wed, Aug 2, 2017 at 3:25 PM, Eddie James <eajames@linux.vnet.ibm.com=
> wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > >=20
> > > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 Documentation/hwmon/ibmps | 53 +++++++++++++++++++++++++++++++=
++++++++++++++++
> > > =C2=A0 1 file changed, 53 insertions(+)
> > > =C2=A0 create mode 100644 Documentation/hwmon/ibmps
> > >=20
> > > diff --git a/Documentation/hwmon/ibmps b/Documentation/hwmon/ibmps
> > > new file mode 100644
> > > index 0000000..7f13fd4
> > > --- /dev/null
> > > +++ b/Documentation/hwmon/ibmps
> > > @@ -0,0 +1,53 @@
> > > +Kernel driver ibmps
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Supported chips:
> > > +=C2=A0=C2=A0* IBM Witherspoon power supply
> > > +
> > > > > > +Author: Eddie James <eajames@us.ibm.com>
> > > +
> > > +Description
> > > +-----------
> > > +
> > > +This driver supports the IBM power supply. This driver is a client t=
o the core
> > > +PMBus driver.
> > > +
> > > +Usage Notes
> > > +-----------
> > > +
> > > +This driver should auto-detect devices. In the event that it does no=
t, you will
> > > +have to instantiate the devices explicitly. Please see
> > > +Documentation/i2c/instantiating-devices for details.
> > > +
> > > +Sysfs entries
> > > +-------------
> > > +
> > > +The following attributes are supported:
> > > +
> > > +curr1_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Output current over-current fault.
> > > +curr1_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Measured output current in mA.
> > > +curr1_label=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0"iout1"
> > > +
> > > +fan1_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 1 warning.
> > > +fan1_fault=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 1 fault.
> > > +fan1_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 1 speed in RPM.
> > > +fan2_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 2 warning.
> > > +fan2_fault=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 2 fault.
> > > +fan2_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Fan 2 speed in RPM.
> > > +
> > > +in1_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Input voltage under-voltage fault.
> >=20
> > Is this the normal/regular file to put this under-voltage fault in? I
> > noticed that the UCD9200 device driver appears to be the only one
> > looking for that right now, and it has it updating in1_lcrit_alarm:
> > ucd9200:in1_lcrit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0Voltage critical low alarm. From
> > VIN_UV_FAULT status.
>=20
> Since this is "vin" this will provide the status of VIN_UV_FAULT.=C2=A0
> Similarly, VOUT_OV_FAULT will be provided by the in2_alarm ("vout"). The=
=C2=A0
> power supply doesn't provide limit ranges for it's values, so in order=C2=
=A0
> to get lcrit_alarm or similar I'd have to "trick" pmbus into thinking=C2=
=A0
> limits are being provided by the PS. This seems more simple.

I'm not across the context, but tricking pmbus is straight forward:
Implement the {read,write}_{byte,word}_data callbacks, and provide an
implementation of the register whose value you want to to fake out.

However, from Documentation/hwmon/sysfs-interface:


    Each channel or limit may have an associated alarm file, containing a
    boolean value. 1 means than an alarm condition exists, 0 means no alarm=
.

    Usually a given chip will either use channel-related alarms, or
    limit-related alarms, not both. The driver should just reflect the hard=
ware.

Sounds like what Eddie's describing maybe fits the channel-related
case? Again, I haven't read though the whole series so take that with a
grain of salt.

Andrew

>=20
> Thanks,
> Eddie
>=20
> >=20
> > > +in1_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Measured input voltage in mV.
> > > +in1_label=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0"vin"
> > > +in2_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Output voltage over-voltage fault.
> > > +in2_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Measured output voltage in mV.
> > > +in2_label=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0"vout1"
> > > +
> > > +power1_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Measured input power in uW.
> > > +power1_label=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0"pin"
> > > +
> > > +temp1_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0PSU inlet ambient temperature over-temperature fault.
> > > +temp1_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Measured PSU inlet ambient temp in millidegrees C.
> > > +temp2_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Secondary rectifier temp over-temperature fault.
> > > +temp2_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Measured secondary rectifier temp in millidegrees C.
> > > +temp3_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0ORing FET temperature over-temperature fault.
> > > +temp3_input=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Measured ORing FET temperature in millidegrees C.
> > > --
> > > 1.8.3.1
> > >=20
>=20
>=20
--=-J+wIyUBlCbHUCiEtbjjt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIbBAABCgAGBQJZgqToAAoJEJ0dnzgO5LT5HbYP8wbx4OUArrwS+JNNDvTnQ73e
uw+GQtHugNFARqrND4hJk8w/LDvuEMInBnzcrzOW48DgXKTSXl3KaRWdxz1W/AyR
Cl7YJF88c0OiZVQsKcrcIIb22poPPskm8sz2t21GXg2lKPYX0qI09AHU7KMs1UzE
g11c4u8lhNCUbjbGhwxRbEF6vQQRZrSSW5JHNHwRPWdrAgo2zkhtMHVplqbSEhbe
/07ineLjo0gjDhUf/jgL7hSCIgGm6JJOrYuPgdOv9a69Hw5/p/oAXntrARxFr6OB
1IaFW+JpJlZk85KVbevMawTf+5U8n+YW0fBDjU/LAWfEOqEmnDjjBWdYaQjfplD4
Tefk+MDsDVKS8rB2buNNxY2O0v1kV4RHaeUqJ3gd7yS9CiZNZUt2q37SxwvQaVx4
GvPMfqe97VLiXDyeccdetaj3evuf2JCwDnVqKMqHwB67eR9Oth9xgzJ27QrsGaa9
KoKZpby1kVODnCsScxG8oK/r0ZvC1axW3It7e6+BdyHbaa4ZqCcgNK9aLOWn2/JY
IMJGmws8SusKxPZyBGJ5ZDUlgFHkc/6jLhytKHesD8Ee80qZe3Z4NIAgXB4tbAWE
yUXsPiXYy3hTjseA6xX8KBj4YZQc2BS9YBwQJ8PgZAu+rPkWGIy0STr9Y2EAt4HG
Z8roTnZGjI0gYjGGFZo=
=GGYj
-----END PGP SIGNATURE-----

--=-J+wIyUBlCbHUCiEtbjjt--
