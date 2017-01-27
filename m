Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8gq248npzDq7W
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 12:16:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BOBd8cQG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H8uOA7oR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 685BB20AC3;
 Thu, 26 Jan 2017 20:16:28 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 26 Jan 2017 20:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=XYYf1uGnJbB4WoyC4H8YJ2qO+vU=; b=BOBd8c
 QGi9JoguHDB/042zUkrruzkXEwMI4GNol/72gbN95VDeP9SH1kfCD8ZMEo6hX3/s
 Hd6mVHzNpG1nCQEdp4lVp7WbpuLnRaUvWxxBDaCNjiICvNm5S3+5AsVG1z1jzJGI
 DrWP2T4c1L7jDV4T24YV1FlZOl+20NoqTFsps=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=XYYf1uGnJbB4Wo
 yC4H8YJ2qO+vU=; b=H8uOA7oRpBkP5TSi7sakZHvUqRUlM5pGNB7Fs3m6hlcET+
 7tJ7Z6LsUr39rUM0nxNhM0nA7oCoFAGsm6kB9NpvZKc6GyTjgTmu4JjSKwKKjC50
 KAPSh+3W7udzEdJaYx5eOJxmSd6JIwRk6rzHAbxcqguFlbU7vEgAaRPHUGUGY=
X-ME-Sender: <xms:bJ-KWPGmEuepoN_5-bluIXU3FN8Q1hv8EVeirLET6wQjUbYm5pg0Lw>
X-Sasl-enc: 7H6BKIqkSDlGPZYPe4gVteg2zgfqMHI+Q8YsQc6lNMdu 1485479787
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00A7A7E51C;
 Thu, 26 Jan 2017 20:16:26 -0500 (EST)
Message-ID: <1485479779.4137.13.camel@aj.id.au>
Subject: Re: How to deal with failing services in the boot targets
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 27 Jan 2017 11:46:19 +1030
In-Reply-To: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ut51jaB0mAd2IsNYVCQ6"
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
X-List-Received-Date: Fri, 27 Jan 2017 01:16:31 -0000


--=-ut51jaB0mAd2IsNYVCQ6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-01-25 at 15:29 -0800, Xo Wang wrote:
> 3) Do other people also want this? To me it seems obvious that failure
> to power on should always block starting IPL, but maybe somebody else
> has a good reason to use weaker relationships.

Sounds highly desirable to me. In an effort to better understand our
dependencies I dumped them out with `systemd-analyze dot`. Safe to say
I'm not much wiser having seen the graph:

http://ozlabs.org/~arj/openbmc/systemd.svg

(Source: http://ozlabs.org/~arj/openbmc/systemd.dot.xz )

Andrew
--=-ut51jaB0mAd2IsNYVCQ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYip9kAAoJEJ0dnzgO5LT5iTMP/jJ04QTaACDEyZhIvofiVmdw
PQCcl0+5f5Okx53obXX9/xJKMs6wwykL2HW8Pf1/B2gh4AO0WOjhTCeyVcVSlKkh
eSU1vywn11JQJsVGRC/T/Nd9muWFzGQ/6QgqZJ7LdpnEnHWxud4ddt3BDTeTbRXT
eo20fs6mleMyR8hXCPc81NpdUyV/1rlAnKPFJ+/wc6xjP1ENyIqdn7dT/D2Fo3Uu
5me/41HXLXxoJNhP//8XoHN4d2UGjB/I5pl9b9CPZlNDuV01W7HcZXjjiZUZS+KC
3Znfvgl5t3c6O8p6bp1ps3uG7jXPAV98AseyuqFif1UxhAGNtNh/sJIKTnJjE/Nv
NBvdOYQ7zSjiZUbYuBC6NFMwFWljXoUdowiezJulGeQzOQMEH4KzFPu3terA5wfl
Gh71YC8uSnQuRUzBoZzC/j8ahVfICAmDu8kcKvl1ndX/EYGF590Lwo+10XQk0YSU
LFY4s9kM2Kgy1M91/Ba4+lgj5sW4qzT0IQ6/94orgcCCwqJ3iHx1InKqL9HHg2Pl
pmuhZmHyUN0ym4YFepGOzUjiAFZh8nUDw9kQxEs1oh/A1iZKNYWLIKAuW8+SdJFk
osxrUPrM+40SUTcPqO/ZEqDA3o6cj8O0lh3rUrldf0J9pVi8I4kX6EA+JhMtBGPF
lz3/Z+FsJneGWy46rtxA
=ixCl
-----END PGP SIGNATURE-----

--=-ut51jaB0mAd2IsNYVCQ6--
