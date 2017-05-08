Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXX32yszDqK3
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="LUdlj3uz";
 dkim-atps=neutral
Received: by mail-qt0-x22f.google.com with SMTP id j29so59028217qtj.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ggedZm95pjoTtKYMYwQTpW3e8cfMd6hSnkZh+EpxY9Y=;
 b=LUdlj3uzudi51DiORuBw7PsZWeHLXh/yonw2tLBPLmqEmYJWZynoviTBf+dboRx1oc
 IZyRa/80LBZhv0Hk+9JyFbksVjNtQ8L/CV/EmaQwBUh8O562XonHEiweYKdOgAL5yfXZ
 Xu9S7I28/79nprJP3jBSUuKfVz71jcJ+YchbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ggedZm95pjoTtKYMYwQTpW3e8cfMd6hSnkZh+EpxY9Y=;
 b=C5oqJz+2uwwVhnSwgQAREqG8XzouLk140djcP5Z+2IqKjzU7zx+UpMiFLx3GYChomB
 I2TBGFvLQkjXWN3Juj1RbwgZy8p7jY5oXWDQb7MNEOlVsxpvMVLamqSDVTkVu7LCgjOH
 On4suzqVh+DEwbxPfhhjhLTsFeSi7S572jMeee5df2qzjYk2Vwmhh8Fv/I2mnuLcpBwQ
 gCtg+f9l7OGFJOLz8tJ3FRQtm7jIhCDZ6DGM3DYNSoBQ3OQNuDWO3XVGbv1m93/s+8+B
 tLz9zb07I/T9dvBiTu2N3u//dMTZ6GKIBEDHdUexeT0fSbsRV1g+HlcWHTxUO6nYmooO
 yMDQ==
X-Gm-Message-State: AODbwcAgiuAt+CFCNIXmO4BJIc3bj7lVwlmMRbX5GBZu7QV3RoLUJBqN
 q6YLXcAClHejHA==
X-Received: by 10.200.47.201 with SMTP id m9mr21055238qta.187.1494272442307;
 Mon, 08 May 2017 12:40:42 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id x27sm7532739qtb.54.2017.05.08.12.40.41
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:41 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:24 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot, v1, 04/15] aspeed: Make SCU lock/unlock functions part
 of SCU API
Message-ID: <20170508194224.GG12511@bill-the-cat>
References: <20170417190034.71945-5-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M9kPtxBi5snwxJYU"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-5-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:44 -0000


--M9kPtxBi5snwxJYU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:23PM -0700, maxims@google.com wrote:

> Make functions for locking and unlocking SCU part of SCU API.
> Many drivers need to modify settings in SCU and thus need to unlock it
> first. This change makes it possible.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--M9kPtxBi5snwxJYU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMogAAoJEIf59jXTHXZSAFgP/jfa1PtNZGUiCy66+Ug62EhT
amcyyfcx5P9vlSc3fvZ3xo3Mp5vG6X9Vy3jQUUzTWuDcv/P3/zQgVTr3cR90ofjC
KokomGXbREXj++eAAQIpkhE6qmbExCMPfqwm3D0bNmNIq+a9LGdUfRfb0fHACk1H
EBVgi9QydYwFFl3fWuCmlSZ1PXNyfLFq4uZs3dhgHwnPtwKvD+PBP+MHKDSJCDEV
MwMBCQ8Skv7ZWWqwGGnt0fgWS2WWqdQQyOKwZqnO+/cLqq8G4x7/xA/GhaXNtM7b
r8fMbQVDLyS0g7iKUvglgO9TrsdyzijWFA7KQMGyqWTNdNz6Q6r6EmGv23jJungF
mzQlxDUJ35R1mEbMzCzESBEYbCSX11gkyp2CfTHCEPVCxEVNsKRaggWBTfoouFia
GxZpUgUpCIZjAl2Q0KsmP0/HywUjQNdA8MoHnmeeasX8cZ6pzm0k8mO8a3j1jvue
MQJMKUF0dNVtZ15w+iEUYA4+8W75b3owCBoFvBYPKosp8WKNIcNn/3tbFB1OzEym
OLwH+6U5IGpjaXOyPdvntVX/TXSW9o4w9JpJ/cD9qZqn9G/968L8ivgQpcjbYvZq
bFZ+xpuV9Lc/giJacFTpOFEUZvMRd9yNUP0UswzbdW/G02o2dfrhRYSlwQCgFrmX
GV7edblmX0ldNkixxOTF
=erbu
-----END PGP SIGNATURE-----

--M9kPtxBi5snwxJYU--
