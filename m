Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCkCK11H2zDqBj
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 11:14:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XDEQRwRw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LLgsi6Rn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44C3623AC1;
 Tue, 31 Jan 2017 19:14:34 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 31 Jan 2017 19:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=R6tSBBHY8f5JGlOKl+UKxLPVPZg=; b=XDEQRw
 RwPf368/Tfltdh1H2Huw8nYqu/We1MBE9azogzagmTh+GliSj3bvKHcDZ46p3KHP
 Bw6sTCbReIGPzHqJ6YyraLDy94OnAjH6KSSKENl/wxlLnAQ2wjxS0dPYe31h/fTl
 2pJlTZDQDumP7B8LIKgqB0Drvpe06Z3lu+EYA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=R6tSBBHY8f5JGl
 OKl+UKxLPVPZg=; b=LLgsi6Rnk1IWhC/f8UwKbKvTSx+5bInO32WSyQyZ+IoxpI
 TUinZSdtmL+jRElu6PlcrtOFd4rFZs/dh0A7zG0XVHRSu5T9iOwgFgbSzgCGwpOY
 u4+ca6WFEg2O1YIUkyUv6AWuyCE7akU7Lloe2qrKHasG4ozHJMc1JV/4QLrJE=
X-ME-Sender: <xms:aiiRWInkZ7Qy5vrBYfRKr9l___efB6uVtQ9ucJMT_gioDfY_scTjaA>
X-Sasl-enc: s5/U4PO+ap544nUQQo4vtX/QoOGyFIM6PNi1EA6sMCP2 1485908073
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB63B2457B;
 Tue, 31 Jan 2017 19:14:31 -0500 (EST)
Message-ID: <1485908068.4137.30.camel@aj.id.au>
Subject: Re: GPIO expander user space access(ie. pca9552)
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Matt Barth <msbarth@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Date: Wed, 01 Feb 2017 10:44:28 +1030
In-Reply-To: <20170131184808.absjhzv6bg2r2a3e@asimov>
References: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
 <1485216565.4137.9.camel@aj.id.au> <20170131184808.absjhzv6bg2r2a3e@asimov>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Ecrj9f750YRP/YQUEbz6"
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
X-List-Received-Date: Wed, 01 Feb 2017 00:14:38 -0000


--=-Ecrj9f750YRP/YQUEbz6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-31 at 12:48 -0600, Patrick Williams wrote:
> It isn't typical to have the same i2c chip registered in two subsystems
> (leds and gpio) at the same time, is it?

I wouldn't think so.

> =C2=A0 So we would need to get the leds
> driver enhanced to also support gpio manipulation?=C2=A0

I would have to take a deeper look.

>  Since the chip
> doesn't support an interrupt line we are also stuck with polling,
> correct?

Yes.

Andrew
--=-Ecrj9f750YRP/YQUEbz6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYkShkAAoJEJ0dnzgO5LT56QgP/iQ6n2CjNDVMah4kywZy+f8L
CzXU995Plj188uoq7GJWkeV97lye01LHHirmEAdnOVtqdyQXdwjkVTm2AACxivgS
y6Wnyi6gpsv3R1Kkh2zP8GqQukgvCTAp8iQ8uoTIdcsPal01mkg5Ul4ws0ch0yBR
x20BkmKu0FgBeTnlaYJgOrzum3uVwrvDzUqcQiB33W1uYY+0V2IzJA/L9HlvsBUh
uSIilJAsjC6DjMMJ0+1t5DRuOpvIjWd/8VZD1ZWGCy5v9efCDGnJWOXchWGWI/vv
9M5eryGDMLAEw+gydR6Y33LUEd+G2xIheut7ylvUSfIc262KdYEbKGP5HkFMiRnD
fgr2t48tXhKLPNSXxzEdOBmlkDjNbCrPiNMYCnhPUueeQoEAUR1xxSAm/ctXC64C
GlWMWJUCPyZL2giwuKtmmrb49d8ZHOgMEG6w5LCt4Mx61p4uH0TCYL3pjKOEPS9p
dEmZEg3cyr+mGYZhXSyUDFARmsxCg7+QF6bRsCW0v84PioMGZ93NkC0ax+ru8OTh
RfkL4Xz6UNhjVz1G9MMChkMmyhNd0TWqxNeHTxz+59n0NmeoMdyGDohNsg1pq6sD
AxoreMa+vepyun3TbsBmqJJNLC9bpDUBEpJcGuqpaCyPLXRulbH+tZQGpzoTRBbG
j9GO+knP8eFLjObLD3VK
=/shc
-----END PGP SIGNATURE-----

--=-Ecrj9f750YRP/YQUEbz6--
