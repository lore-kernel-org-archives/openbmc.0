Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbv0m0RPfzDqTm
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 12:00:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VmZTmajE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="na0MvP32"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E85121449;
 Mon, 21 Aug 2017 22:00:49 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Aug 2017 22:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=C6QGZbZAz/WObnz9rlKUAPVTo8E2F+6vU7JsJmdZc
 EM=; b=VmZTmajEdxiDXxasoOr1OrFBPTQXKSd4r+qo5s0DKmq4sNetMPBsYKzk7
 aQS9Y2ItsS00DfEJkP8U9da0lRIbqCK/BJdhJJaz6xmacZrCkMz2z/3DDdpLnXug
 /sQqEwMqM2oG7sM93P3GSpyK6pLw62cI99p9uk+9Lx2lYHGPubIOlzJD1OdtNdot
 XoXD4YSKjbpRtlvz6392nJujskc+TzqLasRVWZ7VpaUkV25xg/PoVbqJiVo8XyTI
 1z3s8wmgnwO2UQNFMnecXl0QcA63wt3Ogwv/hi7IJ+uEs+4HKd7H4faUh/gQBH+u
 Rk6xPJGt8QlogDcPVFkr9SHlepWuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=C6QGZbZAz/WObnz9rl
 KUAPVTo8E2F+6vU7JsJmdZcEM=; b=na0MvP32bPtt4P/XdyjJ2hJ0I/qwwCFiT8
 gNq08Kg0E633zG92+Q6HfdHWHN5zkJjkxfvbNyODmpXEBMs2IwFEJ8iQlHcTIqQ4
 XHvyWy6uNRINfoZGQ4JfVIO8C/yRrspKh9NzPCaQTsFYgr3TtcoIkl8a/+Lsx7Wk
 x0tnKlqv78RqqmJNvGH3H6W2Inr361IKS90rZvas1DJGozO4+6cyCtaG6jAK52Qx
 lh9HifGXsbrHzsQN1V1ESNGfFcPh0W6C7pfkJqi/RFjEu40aWx+R6mrKxa7hcIQ2
 LzvEbx1OtG/r8ZDwgbw94pXzIdaUsF3ch9hbKj1BbD2vdLKTwDrA==
X-ME-Sender: <xms:UZCbWbd8w5DvaPqBdnS_LAi_gXmo90PIrE-xAhaqay3pWOJs6Uy-7A>
X-Sasl-enc: 7U5riOGWHwnOzOa6GFPm1+lLAUWCmqYJxUkVn8xtbrzK 1503367248
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE9562418B;
 Mon, 21 Aug 2017 22:00:47 -0400 (EDT)
Message-ID: <1503367241.7266.16.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 0/2] hwmon: (ucd9000) Add gpio and
 debugfs
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 22 Aug 2017 11:30:41 +0930
In-Reply-To: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-94LdTXiA9NldXQuA70em"
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
X-List-Received-Date: Tue, 22 Aug 2017 02:00:57 -0000


--=-94LdTXiA9NldXQuA70em
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Mon, 2017-08-21 at 17:09 -0500, Christopher Bostic wrote:
> Add GPIO chip for user space access of the device's IO.
> Add debugfs for register dump of mfr_status and individual gpi
> faults.
> Add sysfs attribute to clear logged faults.

In general my preference for cover letters, similar to commit messages, is =
they
should describe the why and not the what. However, unlike the individual co=
mmit
messages, the cover letter should address the motivation for the series as =
a
whole, synthesising the information in the commit messages and discussing
issues that don't make sense for any one commit message.

Again ideally, and in general, the cover letter should call out different
classes of patches if necessary (e.g. "Patches 1-3 fix bugs, patch 4 adds
feature X, patch 5 integrates X into Y"). If features been implemented in w=
ays
that might be controversial it helps to point that out too (and discuss des=
ign
choices).

Essentially the cover letter should be your guide for reviewers on how to m=
ost
effectively review your patches. This is why I don't find just listing the
"what" ultimately that helpful - your cover letter is effectively only serv=
ing
as a header under which to group the threaded patches. I feel like this is =
a
missed opportunity.

Cheers,

Andrew

>=C2=A0
> Christopher Bostic (2):
> =C2=A0 hwmon: (ucd9000) Add gpio chip interface and clear logged faults
> =C2=A0 hwmon: (ucd9000) Add debugfs for mfr_status info
>=C2=A0
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 250
> +++++++++++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 248 insertions(+), 2 deletions(-)
>=C2=A0
--=-94LdTXiA9NldXQuA70em
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZm5BJAAoJEJ0dnzgO5LT55GsQAKN+2/G2trni2C6fvMvBrpsZ
H20zANkgH4HHUNqCpkdG+LBFLV/6VoNGnF9e2/WC1tEAy03bbehnFlK8ztYYbB2f
ssl8yFijrEnBR9A4hb1IZe3LxXVq9hHvPZ/ZEl81f5jNI3in8VtozzvxxYV9ZxIY
mN7T6hnuLhK4Idz2NBO+gai0xK0VmENngd3gCWcqzXVCnVRmM/BHvL166gz8BMQC
+oa8P/Y2G0gv0pItjnvgAYaPfvSTzaVQ8KT5u5ml9yLawmUTOKI+sPoD2Ney1QYP
V5J1PJ46MEZ0UZW3Hg1Yqqp0WqL5zbQDEm3OCs/weT7VR5J08HQ5IMfXsJre6zsu
6b1Z3tgHADM+S6O2jQ2eNIEN0oV1ePoGlUYlvfz0z55ASLvGyWwiF3A6Ce4mL87S
yjQ+HGebN2k5GwmetMFpIaysLZKa93tUYlSPjGXBmGo1YS1VkaHLnmzhkAilpDo8
DyIOat57/iadvy4q9zHEdmwnzJyNwk9CRNrawr3YXMLxq95XX2p3hGx3EDo/t4zo
x/8e4c4Jx+ynf9wimvCxUayW7BiGzh+RkT+V5HtAyAEQRfZAk5jrZZBiyBiWMe7Z
qT3w07Wp3UTwEB0dEqlCVukFI3iJouRvkYebJCbpgx5R1DePanDlijwJsX05kEYv
YZrN4gRZ6bxmxNnYuk5I
=IWkx
-----END PGP SIGNATURE-----

--=-94LdTXiA9NldXQuA70em--
