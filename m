Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCYN5NZWzDqK8
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="iLrwnWPp";
 dkim-atps=neutral
Received: by mail-qk0-x229.google.com with SMTP id u75so61390308qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YtWmrNG45xayaE8De3wuYaCkHXh5I9+PbfgSGbTHBJo=;
 b=iLrwnWPpwdZdv4HPqYl/x2tBHO9eL2SztSaDgcgZeoaGnIVhVkneBPLNQ94TYwdZDL
 iMWu+B5qZivJfbdMj/dMePpEthbN5g7CuonEHQktAVSkQ/fAhQdGhIwIsj7M/N08R9xI
 5PCCkIHNZDbnKQfuTgQ14wU15XbVq9pj8iDME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YtWmrNG45xayaE8De3wuYaCkHXh5I9+PbfgSGbTHBJo=;
 b=GDBrlaAs/geAeLayr9gV0/Mo6ZdGN8vfqrUN6laaZWB4AmGwGTOP4rAEikGXtTDQbn
 Fi0e3tWvmVnP1RfC0EVNEkrEA4dVGHkce20A4xFPXeEhXF6TgkbKwitumGalPCK5sxEr
 F1TnAmrJ4Prz2Yh/DQz/2C50Jnzh3ydqrvIgj0PvF+YoUP7o7Ko4eMnTXevJzgVewhav
 r1fOISMeH5F9/uU57IypNtJdcYgXbq42+NQomJJFhEuVzu8AS0uYqiX3h8oJI3qjfOS4
 7WLWX+Ngf/N8fbVZzyLmdy+/HPeLAuBnVOYAgMd3bHN+lN3mXMA2zGFzKG5bgrTlNwoG
 1VnQ==
X-Gm-Message-State: AN3rC/731pJXmF3dOMhI2AZbfdhiSZZHwTS9CfDhUfD1K4omkGEQqYCB
 ueRdA/sPOcGfkQ==
X-Received: by 10.55.19.86 with SMTP id d83mr28171458qkh.196.1494272486907;
 Mon, 08 May 2017 12:41:26 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id c142sm10456228qkb.10.2017.05.08.12.41.26
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:26 -0700 (PDT)
Date: Mon, 8 May 2017 15:43:09 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot, v1, 14/15] aspeed: Refactor SCU to use consistent mask
 & shift
Message-ID: <20170508194309.GQ12511@bill-the-cat>
References: <20170417190034.71945-15-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="G/DRDqNIGCYbwux9"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-15-maxims@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 08 May 2017 19:41:29 -0000


--G/DRDqNIGCYbwux9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:33PM -0700, maxims@google.com wrote:

> Refactor SCU header to use consistent Mask & Shift values.
> Now, consistently, to read value from SCU register, mask needs
> to be applied before shift.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--G/DRDqNIGCYbwux9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMpMAAoJEIf59jXTHXZS5P8P/2Fqsr3t/R1c4ZzbBsAC48ve
c+lwb3DDwc5Bzn4JquM4Mt/tv3ROYDhGJ4Ts1z2DuJtsKFWGHJ4m1+YPXGjtUhtK
7Tp654jF17/6FahY8GO5NqcTkKrnXNkwWBfjNlC+miHbcvyOH5eALtrMYxfL9zNG
lVxLBoZjX6lG+Q4s09U94vVY2emfBUiSRrXmHpytnygOdeSGiaou2H2TkN5lv6+m
zkg2AduvQh4cyYRL414rFJruso//SXuE1nhZqhsGrqtND9n5jJLdB574cRqhnvZ0
LPu1RBZBJLD1dadOywamvR/7cUhSWubPHswYjYDrJEOQ3+oZTHZd1pRhD4rib4Zc
BOiHylZE9nTxdHvYWXHgAj658fzZv0I0KQ7lD9xR+UJUE1y5sf/QzWMcEhM8igbx
0gTdN7ulQ7S4EWGWtBDmkJFqYw4KzY/zG8cXJH/ahCO1LNWsSPqtR/G79Gvtv4uf
DcOTb8hgKmVXTrPve49jzB/lddJ2Std4pSKUhoGa3CAOkggNZL7vuY50BPBfg0YC
M/O4xflky8vEbcUU3lLFJRXMT/0TRESwjDFGPPr9MwDcyy0qKn1SID3DYTgTTtiN
kk/tQJkGa5QiH39XHCbYxOxpm6XatgKbn0lQO9+bainPhORMQlpolE9p0MGgJLCy
uSoWWwRknmaLzdLqxL/l
=M5Fx
-----END PGP SIGNATURE-----

--G/DRDqNIGCYbwux9--
