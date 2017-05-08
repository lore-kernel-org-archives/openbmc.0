Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXd2w9qzDqJw
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="eGrTYJQF";
 dkim-atps=neutral
Received: by mail-qt0-x233.google.com with SMTP id n4so58916574qte.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ILfQHSEPlqvuw8D7u8diN6kesYyYvEjziEKVAkk1NIk=;
 b=eGrTYJQFFswLKv5OL0vXHi9220mt2oBpTPTJbHvf0WN5ResD7Q0+npYYR2X+M27qWC
 U0Tinlvn4pBluEcZomCMhNpVx/3OzIfrvMTxJms0Iv1iOE0JFymCurHmUIp4PaUahBAU
 uI62f+B+ubARk7Dj/enwMXv6HfagIzD1hRQGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ILfQHSEPlqvuw8D7u8diN6kesYyYvEjziEKVAkk1NIk=;
 b=oQPhOtY9sF0lk2tqY3sLyZShDqsd/CB27GP4Fhifm68S1Ryg/NRT4IKumFNMkI9oF9
 TKneY1ifqB2uBVKamiqCaq6BHsNjfHrOdc9w8XpNzTgzuk8PvGEgeOcPGuJJLw7issSr
 38xxQ+hU9JvXMmk2/D6Q95DN0aZeI1Taf8sNxRa75gQbrlD6dnd7geY/lIcmO3KT/ufj
 IwK5gYit64uVryfhoQ/cOJFc+1ywxaOV2ovxfIUWdj78Sp4m/K1B9eL2TtyLucQmz5mK
 kEEKAv/wczEqzSTl14/JI/Becylfl9ZgaCJcz34eFzeu1/u8wRSm/1w/tHctzudnn9G8
 UQrA==
X-Gm-Message-State: AODbwcB90wndv62kBOR+ynmJNJhH2u++6kAojIvbgIPBGet+1zS1GGJP
 ZyGkmk3SCUiY8g==
X-Received: by 10.200.51.66 with SMTP id u2mr8338643qta.12.1494272447294;
 Mon, 08 May 2017 12:40:47 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id l36sm4191756qtl.32.2017.05.08.12.40.46
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:46 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:29 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Stephen Warren <swarren@nvidia.com>, openbmc@lists.ozlabs.org,
 Tom Warren <twarren@nvidia.com>
Subject: Re: [U-Boot,v1,05/15] aspeed: Reset Driver
Message-ID: <20170508194229.GH12511@bill-the-cat>
References: <20170417190034.71945-6-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PZifSn3kqWtw9nOX"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-6-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:49 -0000


--PZifSn3kqWtw9nOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:24PM -0700, maxims@google.com wrote:

> Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
> perform resets and thus depends on it. The actual Watchdog device used
> needs to be configured in Device Tree using "aspeed,wdt" property, which
> must be WDT phandle, for example:
>=20
> rst: reset-controller {
>     compatible =3D "aspeed,ast2500-reset";
>     aspeed,wdt =3D <&wdt1>;
> }
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--PZifSn3kqWtw9nOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMolAAoJEIf59jXTHXZSfmAP/iXRJ4nALjHHvY7DSD+VWShB
vI8PMBs6zTey1sRueuEl1SpYfWaXG5QixadRjbXNj0WkXTaqrKbSi912uy0/LpJr
WkzOyMEYn+8XvcrwqySl7HwD5KoOb5suTrwjuX2XXqQIi6Gwgo8gI00nGbfrs1KQ
K0rkxRT82GE4FSnhYUgfAmPv5zpCUWMKVmHQrWdCoB+nknBz03C/Yn/jQ/AoFg43
jSJUpcr+EyJXQ2vsH8lF4fneJ+UsRhFDtm/fEoxKwF6MpVHUfSH0p9+R7bQtpsrf
1D9oVGYIKu8TvAR35ALxWPeYrvzZd9eF226hL3KQK4EyoJvYopek8yPDoYGOAbDi
5b89KqhvYStorXpdizkgxfJEEkueIoV/Ef6bGi+jseFG3auVY68ul7KmekJgmiWd
PCtWopuaio2NH0Fp4inI9eN8XTSArt9feuzLHooF9pzqoPZbwRohL1YUp8RF97QJ
fVTApwqy2I5gcgy5lFJvC7pd5DMbvU7sJS4Yl6fGY1/g8oi9QU6jOSoidUjzN9IP
Y/gU07nCB9di5eJDKlKfjnHzpKMTLdaAsZ8OuhTRJATdRko0T3Figst+ZlFpOSOW
Q0B5zg1egkYCqSZhVBHN1AMKha9JboaQtIwKsocEK3+rx1wMo+pIBdlXJQR5bgu+
AyTl+z9Ck9YvUzcN6ThG
=P74/
-----END PGP SIGNATURE-----

--PZifSn3kqWtw9nOX--
