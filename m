Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjJw01ZTyzDqKp
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 16:45:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kp6aSyVk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TAej87hx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D1B520A82;
 Wed,  7 Jun 2017 02:45:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 07 Jun 2017 02:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=XPyZNS+HAUlhs2yjE7eMCN9MVyL9UHDpYS1+RNP/u
 C0=; b=kp6aSyVkSVAhky1mi6OmSkJcaqgAw1fWkMZCH0QaZfbUFJk4YhhOhYnPc
 GULUpEPlG3SZ1YIo8ccZPJCACoKilwBIhNe7m7umNB/GwjdUofzLB44h++x8K5m+
 OFM9vOmCwe8N4qwIkBN9TOT9j0R2mT/+D5JGbyEI5idgwJ2fazgEfM5DHO4GL9lt
 iCGjBpPI517Rob8PVHJfDZWiBAVSNe2VgqcW+ujaWLtPeSljxUXLr/zHBFm2KMPR
 1IwKpQgA1gZ6SRMSynPyD8VwhjuxCYyXI+AJJdkQSAYgzvYDNE9VMwaMBx4A/EgQ
 hvWiSEMBpoVc+6UWQd06PCzFXdgtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XPyZNS+HAUlhs2yjE7
 eMCN9MVyL9UHDpYS1+RNP/uC0=; b=TAej87hxM4r+2w2eBWqvKKSwP3VMGAgrea
 kV6DsFih9s6ZC7HcE6SG5y+SLVTQeTO5A1y62+w4J7r+LZCQQD+GZs3ePEsz8WdF
 tRxg/5Y0SEdjv7IwseShSHM1mluyO/zTyjyzzuWWsSCbPW5gDFpqnbudpSi9p5qE
 00Xo1aJNeY9TFAmB1honE6Hd0oBgcmEde7reVSSsFTppXJ6Bin60AU2E/DthfyMh
 JkvLGezzgj4gzxyQFWnXX5XDMUH0/8jpm+cKKH0esiYmQeWDzQ74Mg4VGC995N2X
 mFLyIpERBVGU2wxgEBoa305ay3IRn3hZQVAsJrsC8pvr+ckTCndA==
X-ME-Sender: <xms:_aA3WazH3zKw541wXDxlz7u-veFVMCncXvW2oB-O6MrDixNt-tX0xg>
X-Sasl-enc: ntgLPUgGUn0sgncLHR5aneQ5G9HVJbmnYk2uCSZ7X3SJ 1496817916
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30F9424772;
 Wed,  7 Jun 2017 02:45:12 -0400 (EDT)
Message-ID: <1496817906.8159.31.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Matthew Barth
 <msbarth@linux.vnet.ibm.com>,  Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Timothy Pearson
 <tpearson@raptorengineering.com>,  OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 07 Jun 2017 16:15:06 +0930
In-Reply-To: <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
References: <20170606070230.32669-1-andrew@aj.id.au>
 <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
 <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
 <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/U5lHhKu5GlVDEee4ch7"
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
X-List-Received-Date: Wed, 07 Jun 2017 06:45:21 -0000


--=-/U5lHhKu5GlVDEee4ch7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 12:18 +0930, Joel Stanley wrote:
> On Wed, Jun 7, 2017 at 1:50 AM, Matthew Barth
> > <msbarth@linux.vnet.ibm.com> wrote:
> >=20
> > On 06/06/17 8:33 AM, Guenter Roeck wrote:
> > >=20
> > > On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
> > > > Over and above the features of the original patch is support for a
> > > > secondary
> > > > rotor measurement value that is provided by MAX31785 chips with a r=
evised
> > > > firmware. The feature(s) of the firmware are determined at probe ti=
me and
> > > > extra
> > > > attributes exposed accordingly. Specifically, the MFR_REVISION 0x30=
40 of
> > > > the
> > > > firmware supports 'slow' and 'fast' rotor reads. The feature is
> > > > implemented by
> > > > command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (with t=
he
> > > > 'fast'
> > > > measurement in the second word) rather than the 2-bytes response in=
 the
> > > > original firmware (MFR_REVISION 0x3030).
> > > >=20
> > >=20
> > > Taking the pmbus driver question out, why would this warrant another
> > > non-standard
> > > attribute outside the ABI ? I could see the desire to replace the 'sl=
ow'
> > > access
> > > with the 'fast' one, but provide two attributes ? No, I don't see the
> > > point, sorry,
> > > even more so without detailed explanation why the second attribute in
> > > addition
> > > to the first one would add any value.
> >=20
> > In the case of counter-rotating(CR) fans which contain two rotors to pr=
ovide
> > more airflow there are then two tach feedbacks. These CR fans take a si=
ngle
> > target speed and provide individual feedbacks for each rotor contained
> > within the fan enclosure. Providing these individual feedbacks assists =
in
> > fan fault driven speed changes, improved thermal characterization among
> > other things.
> >=20
> > Maxim provided this as a 'slow' / 'fast' set of bytes to be user
> > compatible(so the 'slow' rotor speed, regardless of which rotor, is in =
the
> > first 2 bytes with the 'slow' version of firmware as well). In some cas=
es,
> > mfg systems could have a mix of these revisions.
>=20
> Andrew, instead of creating the _fast sysfs nodes, I think you could
> expose the extra rotors are separate fan devices in sysfs. This would
> not introduce new ABI.

I considered this approach: I debated whether to consider the fan unit
as a single entity with two inputs, or just separate fans, and ended up
leaning towards the former. To go the latter path we need to consider
whether or not to expose the writeable properties for the second input
(given they also affect the first) and how to sensibly arrange the
pairs given the functionality is determined at probe-time. Not rocket
science but decisions we need to make.

There's also the issue that the physical fan that each element of an
input pair represents will change as the fan speeds vary, based on the
behaviour that Matt outlined. I don't feel this maps well onto the
expectations of the sysfs interface, but then I'm not sure there's much
we can do to alleviate it either other than designating one of the
input attributes of a fan pair as the fastest input.

Regardless, I'll look into it in the anticipation that this is a viable
way forward.

Cheers,

Andrew
--=-/U5lHhKu5GlVDEee4ch7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZN6DzAAoJEJ0dnzgO5LT5o3gQAJ42qPAK8Jb0YyGEUlGGtF88
y3pw5VDbPNYHqZpS5eb7L/7JToLm68/7OeUxv6Iczl7/2IGABk1dyiINc5VRPsKc
B5KJ1JFx/IphCzpF4OGUONaWrDSdMginxz3GncSxeepyBJVyNKO6Zk0zoH5fcWEb
WK8/EqcNOtuv8xzsirQYbHnAMlKJ19rdIQl9b0xbalQVKMl7QqOBcqtYd/dA230t
S32ySUDS5wMLxcz+qBhPAXmbDySX9CBl+FNqanOXDf8wzv9OLYqaLdS6/haSZ7Lt
yu1qBDhOEQ/hktGu1UAUKQB7SXgNBWGr79O+D0jQeQqjErZp5nwMV4qD4HI7Sf+y
ztUDDR5VCMWJXiTQpnbRwFG3Kh/E1rfBJvwGDDdW4erkuf/OFKiGVfCjwCng+w5a
F3CQqvrB6Prj5pdFaolY+QmXt7+H+LK02c8+YFcLjbBNFBrt7hQdeEO1fN9PsIgd
e1N3n1CIaOZTm7d4OWh+H0g7Zdg/u+co8rhmriL1l1V+NKiUFF/oVx/mMAoW6hzF
McG5gMb/s8P4+TdUhAxFFOB4S1do0GVuiVasMA7KsY/6DMHnLAuQeM7M2k1cnlhm
lt002eix6+bA+X2jj2Dt5OTnMeNN3j/2/EpR2w5HKc3cY/G+BZKTYMkf4MQ21Omk
c6UHKJYqMNJHh/vbOxYM
=wv05
-----END PGP SIGNATURE-----

--=-/U5lHhKu5GlVDEee4ch7--
