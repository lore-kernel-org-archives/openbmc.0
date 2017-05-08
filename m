Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXn5lmMzDqJv
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="s65WGtTG";
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id k74so61579804qke.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NznR01AFUu+x95reRmgtG3BhcpZh3i2a7eGkFCKRarc=;
 b=s65WGtTGbltIsk766eTp3zsQI8a6NURUcRd9RrEopPBq0dgCdx5ghhwtmhED97oIXN
 kdrb9IfMXLyst2JXqwyhvJaM1k05NG+u9ALR3mM4DEjFu9oovryogknfH6S9usyy99a4
 AzEtYEuDo5QhZvGhJG0gunJsH9db67i5ib7NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NznR01AFUu+x95reRmgtG3BhcpZh3i2a7eGkFCKRarc=;
 b=TP3cIZsmUtzb0tKnq1c5HOek9YDv0i5dn/Olp5bAu4dJozTGO/owFokGix3gyvyJTb
 oCkEt4ETHt5BxFbx5+34G3F/UUPykj5AGuqs3Mu37w2vnzX/g46uF0QuY8ZJ8ntJNT/0
 2sM+ZSY1yO2IbeIVD0lJ9TqToWBa5D+ECrL1LINBZD/cKl5ZMDQtiKPfm5mXliKVRGr/
 kX4jcCspKJ1J3Iot4mrZK08j0anYryXu4YhQLxjCRLVaousBBCyKg3pnn5GxGjBKGVOi
 jLGPke47M6zBbOTmQDwfid0C2T5/ArbHPqfSBC8ZAcKZWifQShsmMMokois4D2/Q0JUw
 6MSw==
X-Gm-Message-State: AODbwcDk6I9nbwHEBaeY3Nvj9zkH2rYKhOFdoRB5ZdqLgp/AHrD63yCS
 10q9Cey/sC8zvg==
X-Received: by 10.55.169.77 with SMTP id s74mr29841306qke.297.1494272455920;
 Mon, 08 May 2017 12:40:55 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id r129sm9978179qkb.16.2017.05.08.12.40.55
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:55 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:38 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot, v1, 07/15] aspeed: Refactor AST2500 RAM Driver and
 Sysreset Driver
Message-ID: <20170508194238.GJ12511@bill-the-cat>
References: <20170417190034.71945-8-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Ecgo2ZBDry9z5RYd"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-8-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:58 -0000


--Ecgo2ZBDry9z5RYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:26PM -0700, maxims@google.com wrote:

> This change switches all existing users of ast2500 Watchdog to Driver
> Model based Watchdog driver.
>=20
> To perform system reset Sysreset Driver uses first Watchdog device found
> via uclass_first_device call. Since the system is going to be reset
> anyway it does not make much difference which watchdog is used.
>=20
> Instead of using Watchdog to reset itself, SDRAM driver now uses Reset
> driver to do that.
>=20
> These were the only users of the old Watchdog API, so that API is
> removed.
>=20
> This all is done in one change to avoid having to maintain dual API for
> watchdog in between.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Ecgo2ZBDry9z5RYd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMotAAoJEIf59jXTHXZS1ZMQALPYd+rgLTlnM/RXQpVoyPPC
MdaB8mAqb4//FelrljGBC/1NQAi7a9UKagG/dOcIebONlHEJP7YEBUmzOirYUfqI
sgehISlk7eZJrLI5EqGxKBsjgid83mt6AM9Cs29W6xXLU2Uou28Q+CFoUhfaCQRB
PHk5Y/wR6FgCZkPATgGPJUSmkdXHv/tK6k/YM1T3is8LTvU0HX1iIi84isYX/A8C
+zsOnnuGiHoNA7VdU7Qxr0VBV372iMpru8Q0kjmC8rERGb5ZXcWNQ4wucRWD2D2n
gUvQoZRH/PDBDQJN6WAL2k4jzlYCTJM3TbN34zHWSXzp/rN9J8SheRna8CeEEPNc
44AZSmN9yKVzlT5bGsit/Sdl1vbnLpO7ZEpDwAmGHm816Gr7VvQsmE0ClxuObhhY
DMfpHEt13K3Y1q6fFfXf+oYVxzjBNFF92oYE1EEmqz23I7Yl3HsG99rPTXNrNd7P
17m1K+7cTQKmgXd4YM9U7QARdM8rau834W69mqY/CxC6Ch5OQdcJCJnUEe0QMva1
p5WP5QlMR2BlfzDF+s6cHR9ze0a6pI+xfnJ0F0skhUMdfDmJ1GlHAg58+fT5qwTL
tyqvVu4Fs2usewaP/dnIEa3WsUMmcZsarkQCIz24Vszag5ghOF3iYVs/Uj2aYQx5
+jJd0BnAKozsu6K+LW9A
=GpLI
-----END PGP SIGNATURE-----

--Ecgo2ZBDry9z5RYd--
