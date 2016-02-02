Return-Path: <dja@axtens.net>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A56141A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 16:22:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=WKQrvo61; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id pv5so8080792pac.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 21:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=b95y4t9Xpvl8wDrgg6ZhRwLFCQQwBbMeanKu7lyWM9E=;
 b=WKQrvo617iHJLp8fPUrnxSkSI+OtiU5eQsVvtQ2BAh9J7aBSizyA929NQzUZ51XLlA
 +CjU9+8as4/kkjhe6jwUVaxmsCls53ehty1Bv+EfnWWzaQAaPHzEGYgSjEDZA8abUEi+
 k5Bx5IUljOyjvZKtCT1cO7D9f2RA2/LWqPR90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=b95y4t9Xpvl8wDrgg6ZhRwLFCQQwBbMeanKu7lyWM9E=;
 b=iGfJ7SxzmYifp0k2WLARdyM4qooHpuvvufwTo9FxdC5ZXH2rgbrQDslVsQ6q3OJtbm
 s+rjHzwUDgqxzOQZARmUgoGLxs1tnJ2+2KW2rpd+pyQ3yxkOAZcRM0w8GBGu0YIWdVdH
 juGGDdT0P6BPslRRFHo4uPfLwlYuFxDvuR/rg2j5Sdqn7lCZqqshr5h4IC4CW/Pm9TYF
 F/VlDSSeJufo6SPkPLSiRDfWirCn+4bhr+XXpyBUwiqxm84ZGd5+fu51kPoz9HZmMBD8
 O3syF1qLofjPoRZ7BvwHLvYkMwU/Cyct+L8VDU1BZ2qIPtpeiAGMSeW8jkB3/uMn9/wW
 z1aA==
X-Gm-Message-State: AG10YOTjaVF/ag6DS0ZUbRH+gquja4CFEZfpwOhjrxr4O/vyqgnKTFpNgCj5ilfBwBsQIA==
X-Received: by 10.66.194.230 with SMTP id hz6mr44308848pac.70.1454390543831;
 Mon, 01 Feb 2016 21:22:23 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id m5sm7744559pfi.84.2016.02.01.21.22.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2016 21:22:21 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd v2] Enable DHCP
In-Reply-To: <1454382632-9193-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454382632-9193-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 02 Feb 2016 16:22:06 +1100
Message-ID: <87r3gvit4x.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2016 05:22:28 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> Enable DHCP when network service starts by creating an 80-dhcp.network
> file. Only setup if file doesn't exist already, this allows for a one
> time setup.

This description...

>
> https://github.com/openbmc/phosphor-networkd/pull/3
>
> Adriana Kobylak (1):
>   Fix typos
... doesn't match this patch.

What did you intend to do?

Regards,
Daniel

>
>  netman.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsDz/AAoJEPC3R3P2I92FEqgP/11NZCcYXRzrIzAwCUKPfmQT
R1T97vm4t7pX9zxEm6uDt2rc2uQ7EwCIw6Ie9CenH3dvztEAc1j4l71hCdgSLWKD
l4kYRf1O0veqS218hz2DHcyYLUIS193fv0uMKeluKOp9FJLZV2H1qbB9o1tOBdIs
8ooC0UeT89VwgplEQ6di2aELtWDdm0NkFco3ZWzwrCibYVXmbnAc3u80qf/1Lpc+
4RIKQ/tvroAgXOHEaqjebJxzk+guozrIXgObuSkmviVPvajf6w2GIgJklCkrvQO0
w8lOFxAVp//myM/kgRI2uS8tmIIPyQ/c4qoe92X4k5pK3pLZAXsyy9tV336Eiqww
rLwGXScW8sNtrj4oCTfa3y6NlC4dAmIx0A6K292QPVkEChjdmbzh4f4rmJ0zqNml
20f24uZuuJe8Wp3fb7dwFez8l4FwWJ6AexcB3RST4PzvjBLpWmy8iZ4qt5cs40D2
J+Y8LwpyM5imLor4VhD1EhCB8LGNlXT+jDkHyRr8wMYHbc9Rfgy29SvIoKeB2RCM
D7XaX3fEe3mHRJeIihd/Y0V1KpnEKn7xqw67RSdf2tLTLnsTH517YDiz5nFzXqu5
zs3d6P7zYUAi6ncpMYqoErdXpgdma9B7lOn5B144+aSBoN5psOXhIc5SIjNODADn
j7ay4ehX9IVIyXd97BZn
=AA1H
-----END PGP SIGNATURE-----
--=-=-=--
