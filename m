Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DJZ45Igh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HVdGJj7U"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFn4B0kZQzDrFt
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 16:31:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E61220B69;
 Mon, 16 Oct 2017 01:31:19 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 16 Oct 2017 01:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xSoumgskE7gnoQsc5AVFnnOYnEmO8hL/gWD9gBBaVEM=; b=DJZ45Igh
 QtXqg/BTH7qC7nsJDK6zxnujTFSGWYshIbyU0JlsLy4sEf3d0WWcS042nMQbGJlP
 4zlNidbR+x8moZWcuoBr+0b7mfsQegMAsbjBtgvmsNxW8NEbmCBprXhQxqdj5Ujt
 TQbPDSzDEUTcNkaoN0FBGTnVcHDjVbKo1Dk6/GLiaiWedhq9VDchQGAyCCtV+Q5b
 rG8g62/HzSL2rZBQAEqwv2heXnuJVSeH5N6mLMxv9h7DyBtKJdly+sBJOavF2kzG
 9dYttGWuLRiXfnXwqq/uVty/g6zZcK6bsn276g5nc/gc83yaTj+T9dWaHvH7kBf2
 2uE6fn114TpLWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=xSoumgskE7gnoQsc5AVFnnOYnEmO8
 hL/gWD9gBBaVEM=; b=HVdGJj7UfXOeT8nwXjamG6Evn0p2/ccNz++edVFOzFINJ
 +N7N4m4epfsgc8a+/SS5LYawCujza1GGdlTN79bFEpdCQk7JfAwauhUu07yCWQKI
 +ncIP79NZzJ4dkSgzrUn6fjehS0/m6OLdpx4+dEeYsXVUfWe53WVE+5OROWEnLD6
 ZL/4aUFxsNHpUdEBNtlC/vkkV6ft7/NTFfli6QpfW6ZWs9Q1d2LbuNrrF7OFIZ62
 LpPX+XOzf/R2osmq4CTc1Npbltn8vQWsCykjAKt/VlvuS/qnCPFGDVKr5qKhCBSs
 765UlV/joury48pyMfwfuhUxwiWLivP5p7pksew8A==
X-ME-Sender: <xms:J0TkWbaCSf2glFJOgi9fLQBDjrxZCcfZ8dH_pfzPrVhKGzzuN_jt9A>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A0C17E3DF;
 Mon, 16 Oct 2017 01:31:17 -0400 (EDT)
Message-ID: <1508131873.24322.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] drivers: hwmon: occ: Add
 sysfs_notify to throttling attributes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 16 Oct 2017 16:01:13 +1030
In-Reply-To: <71cf1bf4-1b85-ac18-dcb0-9ae406de1296@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507322581-13947-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1507875069.5452.203.camel@aj.id.au>
 <71cf1bf4-1b85-ac18-dcb0-9ae406de1296@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Okav4RWPYb8S7BFKKF7w"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2017 05:31:22 -0000


--=-Okav4RWPYb8S7BFKKF7w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-13 at 10:15 -0500, Eddie James wrote:
>=C2=A0
> On 10/13/2017 01:11 AM, Andrew Jeffery wrote:
> > On Fri, 2017-10-06 at 15:43 -0500, Eddie James wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > =C2=A0=C2=A0
> > > Need to alert user space when we change throttling state.
> > > =C2=A0=C2=A0
> > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 drivers/hwmon/occ/common.c | 25 +++++++++++++++++++++----
> > > =C2=A0 1 file changed, 21 insertions(+), 4 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> > > index e8579b6..242ba40 100644
> > > --- a/drivers/hwmon/occ/common.c
> > > +++ b/drivers/hwmon/occ/common.c
> > > @@ -182,6 +182,7 @@ int occ_poll(struct occ *occ)
> > > =C2=A0=C2=A0	u16 checksum =3D occ->poll_cmd_data + 1;
> > > =C2=A0=C2=A0	u8 cmd[8];
> > > =C2=A0=C2=A0	u8 occs_present =3D header->occs_present;
> > > +	u8 ext_status =3D header->ext_status;
> > > =C2=A0=C2=A0
> > > =C2=A0=C2=A0	cmd[0] =3D 0;
> > > =C2=A0=C2=A0	cmd[1] =3D 0;
> > > @@ -206,10 +207,26 @@ int occ_poll(struct occ *occ)
> > > =C2=A0=C2=A0	} else
> > > =C2=A0=C2=A0		occ->last_safe =3D 0;
> > > =C2=A0=C2=A0
> > > -	if (occs_present !=3D header->occs_present && occ->hwmon &&
> > > -	=C2=A0=C2=A0=C2=A0=C2=A0(header->status & OCC_STAT_MASTER)) {
> > > -		sysfs_notify(&occ->bus_dev->kobj, NULL,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->status_attrs[7].dev_attr.attr.=
name);
> > > +	if (occ->hwmon) {
> > > +		if (occs_present !=3D header->occs_present &&
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0(header->status & OCC_STAT_MASTER))
> > > +			sysfs_notify(&occ->bus_dev->kobj, NULL,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->status_attrs[7].dev_attr.attr=
.name);
> >=C2=A0
> > Why are we now protecting this under the occ->hwmon condition? Shouldn'=
t we
> > have done that in the previous patch which introduced the notify for
> > occs_present?
>=C2=A0
> Checking for occ->hwmon was there previously.

Ugh, yep, glad that was the point I put the laptop away for the evening. It
would be less jarring to introduce the `if (occ-hwmon)` in the first patch,=
 but
lets not let that hold us up.

Cheers,

Andrew
--=-Okav4RWPYb8S7BFKKF7w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5EQhAAoJEJ0dnzgO5LT5puUQAI3YXYRJaMIPgzmy5qE2y5HP
NMAn/IIj7BZrOshpP6HhNPbl25+hQ6JPedNtFaoWmbgvOLFIsjn5JQn3pS6sEi7U
mDXP01/xA1G/XM235vSuh9GZeREI4Z1NqNGKvVX7JNClzrm5Qqkgi2saMj9blMQM
V5wPhpIwiFs4+0bTAGoXXeFnOzhOEzocZk6YSJ6RZzpFqM+jrqyMyaNqoFbNk+d8
Dwi+34/Q4wlp9PwE6JK/Mt04/oPfrbasUR3s943EhBTgn+50tI24+TlV1bTHmahU
KrSqW3gEK7NIMwVx5ZHBp1ks1Euuhahfu/p5ej66w4MGDJ6EBfID6ximNmYNxedJ
xQUsU6KGEKrMuCJ5W53ZhrWCkEOMm2/uIv8p0PwmFihrYMt1Tt3rOEVSt1UD+hj+
X9ac9LTv35uClA39ELDqfWLr3jrX++d2Qs54Cmeq5hkFr6iQQR314QaHJ4agNIDf
q6gmmEbiU3cMeli6r4V03lXvbXAqdvIn1lFsXiuXo+7wlrOQld5kzJsA7m6OzGqR
LPdC7qFoCcqbdTzReJ9vBbxluw174I5M0bCjZ1X9c7M5n0RqwW2tVKIFLd1Fabwm
NdPqfsqzRnMVU7ybx9NJo83F9jiawPYo32F+1oHw1W+gsyYmmKokzeo1hf6EQsd8
walF1SQ3bD2YpV8P1jt0
=Y//D
-----END PGP SIGNATURE-----

--=-Okav4RWPYb8S7BFKKF7w--
