Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VSDosWqR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EgdNRKKQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpRhD4FxBzDrW9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 16:08:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A75820C11;
 Fri,  8 Sep 2017 02:08:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 08 Sep 2017 02:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6nwhroh7fbDJIHqqnRI24RpAHKy++mZuhyBwKoYd8
 Io=; b=VSDosWqR1FudG1G42JAy5CKFy78IUdCqbt+HZiSDnj+UYFFSZ5j+GS1QM
 boFH98njmrJrjDrM6B/nB+zKJrAruHAqOJRJ/khSULIVaQ6sX+8uiYx8aJXK4YoL
 2vmAq3CNMBIq0IXdkoNSZV+4z+TBWmhfPc0hQ+Wa2wMmwDv0wJZKzBqwt0fpQYoM
 9W1mUKIcEfNFs42pESk4dq71DE7N4poSvcea1ETrQhuyoE+886Kz+LnScZLJzpj3
 4eHyZM6jm1BxBAnNSx/ymBXJavvSroZDp1DLPf9BkMizEajFotnaaaA97VvOQ5HT
 vAmrsJnNg42k8nnRcTU7j8O9giM4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6nwhroh7fbDJIHqqnR
 I24RpAHKy++mZuhyBwKoYd8Io=; b=EgdNRKKQJokHaWLCYcD1ws1BkBQdNVReBQ
 UhEA9gydzLbuhrDcrTWC7cIORlbYbYoMzFclGghLvr0ywA9sG8sl8w/1uPWsVfMv
 YRKkKYv3mUfv/yB/IYR0w1kKI73anzVNJ0x+hLYKOJ3Nmx044fPqc8Q40JxbQSF2
 Ibq967+2vzJZkhRH9+Xm1pXl4XwWssMQBhYS2zVMfk1wjCR8tBU8iuhn94l94cPB
 ifa42HGTka96BoxaUwI0OvEf1TksnKjFm4GOxK6oMpNqN2P8tHE0lma4P7VjoaMu
 xXED48mVfoIB6M/HbmO05lWWAaezjr+fX9aNGJtapdohakgNEvkA==
X-ME-Sender: <xms:yjOyWS5u4f_3lIc8lDlODweH3CHsfhztV65Gf3sYF2NGt3Wo9b995g>
X-Sasl-enc: gOE2EWnVQGkggW4ekgLVaRvKBN6VM4So3Y3TauQM0PJH 1504850888
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0404D24081;
 Fri,  8 Sep 2017 02:08:06 -0400 (EDT)
Message-ID: <1504850878.6124.18.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v8 0/2] Add user space accessibility for
 ucd9000 stats
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 08 Sep 2017 16:07:58 +1000
In-Reply-To: <20170907183801.36535-1-cbostic@linux.vnet.ibm.com>
References: <20170907183801.36535-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5qGeY+GRpWGjLi0eMQm6"
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
X-List-Received-Date: Fri, 08 Sep 2017 06:08:14 -0000


--=-5qGeY+GRpWGjLi0eMQm6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 13:37 -0500, Christopher Bostic wrote:
> This set provides means to allow user space to access various properties =
of the
> ucd9000 type chips.
>=20
> patch 0001 Adds gpio_chip interface for user to access various GPIO pin s=
tates
> via the /sys/class/gpio interface.
>=20
> Patch 0002 adds a debugfs for mfr_status information so user space can ga=
in
> visibility of gpi type faults. Note that there are limitations on type of=
 devices
> that debugfs supports.=C2=A0=C2=A0Presently only ucd90160 is supported.=
=C2=A0=C2=A0Any assumptions made
> as to formatting of data is commented inline in the code.=C2=A0=C2=A0Any =
expansion to other
> ucd9000 types will need to take this into consideration.
>=20
> Note also that no pinmux support is provided at this point.=C2=A0=C2=A0Th=
e ucd9000 devs do
> have mux capability so this should be added.
>=20
> v6 patch 0001 which covers the addition of a 'clear logged faults' sysfs =
file is
> now gone.=C2=A0=C2=A0=C2=A0There are a few open questions in terms of req=
uirements.
> Specifically, why clear when no one reads the faults out?=C2=A0=C2=A0This=
 was pointed out
> by Guenter Roeck.=C2=A0=C2=A0Consequently v6 patch 0002 is now v7/v8 patc=
h 0001,=C2=A0=C2=A0v6 patch
> 0003 is v7/v8 patch 0002.
>=20
> Christopher Bostic (2):
> =C2=A0 hwmon: (ucd9000) Add gpio chip interface
> =C2=A0 hwmon: (ucd9000) Add debugfs to list mfr_status info

Series applied to dev-4.10.

Thanks,

Andrew

>=20
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 369 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 368 insertions(+), 1 deletion(-)
>=20
--=-5qGeY+GRpWGjLi0eMQm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsjO+AAoJEJ0dnzgO5LT58jgP/RyAXjKYGyzDJZBiA5GLBhCN
Hchu4+xDoHpaAcwq3Fwoa/0yai3v61UPmRpfxp8vTjOR9xJasiXgWKM7zgat8GMN
wWB/91FTCRfpuLak5SnwMV88Q6ZM/5LEHftSO9g7l8ckZllNfS2RfL5crg4kZOdn
h7napX+KCyv8nxnIwvGHtiJvOQMDbcTED9pIpHrycQDx/NhAi6R7hdPL5bslgT57
AwAQHh5+kHcRTdpSXETCVyUSxXvgixsMfNEq4CV2u0l4n24gpOTpXcFhF9UFo87q
xkNwXQid/rJHwo8tg+Lu0GFJ/1YF4Fm0919u5/wAGNx+HxhhAwN+qCJOk/qfqYZ8
vQV7F6UaRUFqArtaA8wMVMH1cjVLY45bzssiVsKfPZBkwLf7tCwOPeRnmB0sSlVl
VMVSvS9gaEMAE1RsWOiFbRfQDFGHobrRqxIvWoSMTVbli0aL5LzNbkNyN/A4BrJo
377zQNT6q/HB0jXwKge21JLWiJGiQwC1RR6A9iHH6iZFVelNQGNA9wzXptNdCE7D
yByTRGBdD4k87W63KegmVpWW6e8J5uQRZ3rqpgmpoP9YS6SdFXmsXDn6uI/Nj2+p
sKvhgnyQWy+v4fITQW5NezuT8kbmEb8kzVC1Z5K1pFgDD/MnToF31VQuJNis+6nG
5fY6Owr/LDcYeYLWA8T8
=rQgF
-----END PGP SIGNATURE-----

--=-5qGeY+GRpWGjLi0eMQm6--
