Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpV71gw1zDvhr
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 23:55:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SfR7FdWG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AT7jjRGb"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 054472084E;
 Mon, 21 Nov 2016 07:55:09 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 07:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=f5WAeYDMTqoVHb33867dYfHyxaI=; b=SfR7Fd
 WGVsUsSgJb7VysAu2CXXdSit2aeqA4fsbQLXGfdkPPTisx4RKYM+Gk/82MIoFFXL
 cHX0Ih31wvEPnxIdTe7nshKcdKxpoFT63HVTYtoBBzwfxDCztSYnAWzGu2O7ooYC
 jNjIBWYvczZ0ybDsWtFTIlQmXgHgScX2508ic=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=f5WAeYDMTqoVHb
 33867dYfHyxaI=; b=AT7jjRGbPoPt2/TLddCFN5nDsIceGoF+hFAopOgBsd7SVV
 xnFvyjWu/MLZz681PFMMn1vrY51l1SSvHw/AlnNYJNz56rvp6574z5Mg5P/kpEIK
 damA96w4dyYFMVidPatL4xU1DARs8KC/JgdKNmCtCG+w8+XBvDwVKF8ujojZY=
X-ME-Sender: <xms:rO4yWDEyip2A4WZISSJWXvP_O_SjfRrp3yEG4V0vYCzCyZS-4ywiGg>
X-Sasl-enc: yuBb7VFbphDBMvoBimoMSLM7CFr4WwcuODV949p8U50C 1479732908
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8E49D7E420;
 Mon, 21 Nov 2016 07:55:07 -0500 (EST)
Message-ID: <1479732887.2503.3.camel@aj.id.au>
Subject: Re: [PATCH qemu 09/38] aspeed/scu: fix SCU region size
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 23:24:47 +1030
In-Reply-To: <1479478938-13267-10-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-10-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NdhdpMQxQRtjAR9OZObL"
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
X-List-Received-Date: Mon, 21 Nov 2016 12:55:11 -0000


--=-NdhdpMQxQRtjAR9OZObL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/misc/aspeed_scu.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
--=-NdhdpMQxQRtjAR9OZObL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMu6XAAoJEJ0dnzgO5LT5fEEQAJ6Oke0Cn/0jK/gHcuP/vr5d
gcxfdsmNkSjcCmIGZNcTzk3H1IF93pIa2bNY9rUggytIuDcv9VOthvBlM7Zscev/
mXLxrnAQoWp5CjxyCGgaV/316s0dOwMLjhU7OZM4bh3fPrBg5+DH6ByQlxl2LcKN
rntkXIRXvSjMWrPPUYXhb/S02ok7oFRjSOg8veFw/6lPtNQb+CMxkreusW7TcU/w
znd5D+K+4uMoys3kn/ypHkJbFwTG51LspSmkaIbYV5+kPbChheg4KQqLHEJeAQbY
XEjwccgRJbdDoR7IB1MHFE0I44Poy5omJImcTr9rqPu5wFwA9G0U5RJZEhCOhejO
CFmk0HoAs73uSKx8HFQq0kpAr2yXn+LghNrNXzZ+2wv4l+FLEj0wPdjMJGzSgKrP
JpT47SsLjBnlpl17+8QDlqUBFQq44s5NTxKggrZjATvzA++4y5uSwmohRDyQe/7m
yA5VzYVt8zg40TZP4n/vGTQXeL2WvyNtnut0yvNm/b1oGMnx5frx/2RSEgvPyaKs
L8S+LFFhiKCkHTTu7dXTeVQQHURJKhodBeRjqBAO5mJl5AbrJTAneKEQaTgJn9mq
g+k3YW3e9vPUUNafF/YC1ZFfPq5s1UUDKPzcS9HUXJfZURhOZCGr/o/oPVZnLSfi
ovIW/vhmx0fzKSLXOqSf
=pCVj
-----END PGP SIGNATURE-----

--=-NdhdpMQxQRtjAR9OZObL--
