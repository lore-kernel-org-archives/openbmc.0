Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXR49lSzDqJX
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="cTMKweh6";
 dkim-atps=neutral
Received: by mail-qt0-x234.google.com with SMTP id t26so43454263qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xUd0z+IxOQP5/Od1NkllZuSE2WoC1x3AWJT8hH9mD4g=;
 b=cTMKweh6WYUo1pLMDXqEmboeC6eYOYdf5ldTDSlgzTWESb7E9SKHmfVWgtXnYSQ8kW
 p6LSFsBQ3kHuiBQR1WsFL+nK0yV8H1WdYNG8Pse7q/+V5e6nGi6osjT1u7r5/jatDAvt
 9IPljf5JWTJ1q11jtu9QOdivYLf7Bz56qEUj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xUd0z+IxOQP5/Od1NkllZuSE2WoC1x3AWJT8hH9mD4g=;
 b=tvwr3fkND/FqRaIuPC/iHVTIrGuYH+w/bZ+RvqJhoLi7VxVLhXNONzRghAM1fPBWP0
 YZy9J6qwA0J0Udv6t1N0tukJBO2Fwvlx9CwIMEfFdHtWnoOrvZXHC1Szkllgr8f4lWfo
 tYiwqEvNocM+Kn0sqHtHLum8m+nfwHMeF3AgTchH/8+3fq30eA4IZWOn5FsoH+3UwlPE
 VQjKXt5pH16h0c2/vEPTX+Zb7BEfWn3jSnkkZ4fdnwZl6IKaousMOtfIykKt6TV0D/kY
 ChLxkKFxr7wiNOhhECppt5zRoMSgcPmVE4OL4YTbdEYajv+9RhQ8PpTpf+LwYJ/dtcEa
 Jbyg==
X-Gm-Message-State: AN3rC/50wJBBo9PAKw+C4K2b9GtsmbcERuJujoUWBgBVvxQZAolN6lVJ
 OttilT79mfHn6w==
X-Received: by 10.237.38.103 with SMTP id z94mr55514145qtc.215.1494272437476; 
 Mon, 08 May 2017 12:40:37 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id r55sm8357897qte.22.2017.05.08.12.40.36
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:36 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:19 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,03/15] aspeed: Watchdog Timer Driver
Message-ID: <20170508194219.GF12511@bill-the-cat>
References: <20170417190034.71945-4-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="GA5jH4yfUe2bmJec"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-4-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:40 -0000


--GA5jH4yfUe2bmJec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:22PM -0700, maxims@google.com wrote:

> This driver supports ast2500 and ast2400 SoCs.
> Only ast2500 supports reset_mask and thus the option of resettting
> individual peripherals using WDT.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--GA5jH4yfUe2bmJec
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMobAAoJEIf59jXTHXZSBlkP/1S2IbE/QptpiE38uF16d7Mt
YW7GycMppcURgbyqpnDQzQ6C2PdqofMcf+RmkhOitjSXboc/tGq9IzXsIEbaWi2x
+pFmVq9yc3qpvuSPcS1xq6Op8cGQDX4orG4rI7ELyvRtBiyGLJcNxZTmJSonbmgn
M8UCxEX87ZgLzQMXT0FewiRdMQIqfumrU6FqxHkMTSetIjiQTeZEKw/y7lYA4oAD
kTUkXqUbvSqCl22RL8/Auw/i6b5iUPxNctoY9HHaVbCbSCQfLhwhubARPSl/S36e
0j7K19rcJWTvVi/rrLFpJS1/qjM6isCDANdz9NUFapFyTfOrIDfH7jQ1cobgWRB/
p/tdj+TcGCbIsctQPe/0hEfQrbWf+moSbUi+ksxPNaW1b/ZeTtSD+58eVVlePuPt
yXF8idInny0VniU1bKQJgYhH6gu7521A2+AFwg2JstFBe15CmbeyX2d84IcLunEC
RInqnjmxyYcX1be4SA9VQiJYgZs2qCS4EZ3egWAqvgkTTnfnKrujRWceIMFZN6JT
Atj6Ch9Qe/MQv1O1ZnhbJLycaqhn34aS7XDCXNMdcacqbrkdMHLgOTapJJKgcauy
JtPw4gvboe4OdCWPs6PWT0cgTk++2yfhtwSpXWWc3RnnmeLGxxDXsQL4I/nqTLaX
b38/SEI63OGHuhE1effS
=ySQl
-----END PGP SIGNATURE-----

--GA5jH4yfUe2bmJec--
