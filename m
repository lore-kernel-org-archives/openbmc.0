Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2WM3jW5zDrBx
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M2YSEMBo"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D7Pnq1QZ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DE0A206BB;
 Tue, 29 Nov 2016 20:14:21 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 20:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Cr5H7YfCHiWSPMOw3BENKExNKkk=; b=M2YSEM
 BoUpzz5yfLV66wYibln0EiUXH0u0m/o80xLIxWo1JMDYsu2dh5qP+tSc2jJYeyRH
 WtiJyY/prjPFMdQ9w9LyokLu3eFN8WzqeYpb/GWcL+tlNDrTevA/ANLkiEMVqP8Z
 c1W6jmBZ5gmomxdIsMs8h4woKq2IFUroR+rZE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Cr5H7YfCHiWSPM
 Ow3BENKExNKkk=; b=D7Pnq1QZU2D2t/BnYlH9F0ItfiZeufSIYyr6ia+LjRV+7u
 Zk8xR5rhPjentbdnZzxobjKH3lpJhiRYO9w2eRn2Ea6vp4gb4rIXN+uOGOuQuXqK
 IHTc1Jnh8HlLbkjDfbZHyMIXkT70vNV/Uiki9Dicu7QzQaqrJTBWqKneHeLdE=
X-ME-Sender: <xms:7Sc-WJeL3h5UcuFwMtVuReaAqcyM1KVmJHs0nR2_SCP6UwuXYZVUxw>
X-Sasl-enc: 3y6zyf7vfubwWR+8UKJafTf1axRFYBPe0maXw2NbcDVZ 1480468460
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BE262461E;
 Tue, 29 Nov 2016 20:14:19 -0500 (EST)
Message-ID: <1480468456.2503.102.camel@aj.id.au>
Subject: Re: Starting the phosphor-hwmon service from udev rules
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, Patrick Williams
 <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 11:44:16 +1030
In-Reply-To: <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <20161129024216.GS15757@heinlein.lan>
 <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-b1EEsfwIPbSY7h7/8CGs"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Wed, 30 Nov 2016 01:14:24 -0000


--=-b1EEsfwIPbSY7h7/8CGs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 10:30 -0600, Matt Spinler wrote:
> Another issue I have is if the MRW should have the knowledge of if a
> device has a hwmon driver or not?=C2=A0 While it would make things a lot
> more simple if it did, I'm not sure if it's in its domain. If it
> doesn't, then it would either still generate rules and unit files for
> every I2C device and some just wouldn't get used

This seems reasonable to me. That way as hwmon drivers are added to the
kernel we have no extra work to do to enable the devices, and we don't
have work to do to keep a list of disabled devices.

The "extra" cruft is a problem if we're running out of space, but I
doubt udev rules and systemd unit files are going to be our first
concern there.

Andrew
--=-b1EEsfwIPbSY7h7/8CGs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPifoAAoJEJ0dnzgO5LT57IwQAJj4mgPOdHuttVIYxCN/uuSG
UiSmjrWqDFEN+W6umcmo9EUxt9eKNqBSmfthAeikLD1F6UD8+/VDRfvroWM7QhTt
vmOV2vEqeLxqSHMGQagjaKriO/giu6KOvCoS74QuwCIGvKV0hs3/31XZt2ddRBBs
jT9IG4rY0dljdNRvTpNPK2jgqg7XOmDY2CywT5bvfAm1uR41MhY1kTTDdE2zcqH/
hANi1peT3ncuNILdiyTYshhHSMYChtNmh/s8n+ANME/VeYqPau+Fnzm6Zu7mowrf
048JHO244alnoxC8rN4BZwrM82pkJVLIa300DkJ5NGQCp8wiIJ1hD53bl3JIbR3z
JSIfu1Ktmy0tVIDLfoq2okBVA44w4pYnqBI44i51o8zuZ46KrsyNvJAW+WbRqpT1
b8mOo9WbzLsJYm5J153S9+GEp3BnMafWNRnBItWJ/IYC6VXY1gP98tFQbV7AtEYe
H3Pj5zd88u89/eArw64y6i/hOM1h3FqdGUDJjdkl2qhDtbO3ZZSwJAnOwuruQJdc
pyKkqtHmgTe99/60Izr/cEd4O42ETrrEe5PEzViqHnaa1S8ENhFO/b8HNZ5KpGCf
QBc9alnL7dJZ40Tkh5bGD29dBCWBOS2f1ylPOSeW71lRsPi4Rqrf0otPjMqdGojt
fbpuDwZzLCzaBIZtuhy3
=K1HH
-----END PGP SIGNATURE-----

--=-b1EEsfwIPbSY7h7/8CGs--
