Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCYb3fKVzDqKJ
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="GH5az9fL";
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id t26so43477207qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iS4hzZIEHLJ1pJad44PwxVPkzzQlAp0RKGlRooOzdUE=;
 b=GH5az9fL6yfy4hko2WNsFGAJ+eoMqtEaOGbaQjuIfZM17sU9Of9FPgLU6tOOTlFQ2c
 tqu6FRmCD/pfIQtCsuICIL573xjak+4VHD6AIeWGMPStf5RKguh83oIAzAXXh+7cU0UK
 1EA9f50WjSRHr44Pp+KhU4F59vxaLVXy8MEf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iS4hzZIEHLJ1pJad44PwxVPkzzQlAp0RKGlRooOzdUE=;
 b=BGMdRFqI1EtiZ++0QuzJl4L3/6nogJD16RsBA20WvOg2fO3/jQo34sadni3mu1S4LH
 p1MCfZvNVE9yxLDSWSQdPv8ZJk0bVNZkWrIMTVVoTLzi9EgPG/A8gQgotBMDkenuCPDj
 ey1ZjkrbeDoGWdsurcobhxIMqWBFndjX2BaoKRwXglvsQUDt/IknHLv+NlSQ6BJCrloz
 bEWJxYwUYHXsHN5oIEjACP8q6AB51S2q0m+KniZLvIE0kyL0pbSzCJqDvPp9Izp8HoJT
 d7o4y0YyJCokaLaT3ESEBebiwhKLXGsd9LtcgVRq0cIgde4jX9ePVDE+W38rJK7KAXXW
 DdJg==
X-Gm-Message-State: AODbwcDN2WYW41JUXbTs9ePfJwn4RggaDYBLm2vKpu/mnoLDHnC0Dcth
 oeRNBWjjCy+rXQ==
X-Received: by 10.200.35.61 with SMTP id a58mr9322321qta.231.1494272497383;
 Mon, 08 May 2017 12:41:37 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id i51sm685435qte.28.2017.05.08.12.41.36
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:36 -0700 (PDT)
Date: Mon, 8 May 2017 15:43:19 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot, v1,
 15/15] aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
Message-ID: <20170508194319.GR12511@bill-the-cat>
References: <20170417190034.71945-16-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ue/gAJdQlOYdl8Gx"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-16-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:40 -0000


--ue/gAJdQlOYdl8Gx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:34PM -0700, maxims@google.com wrote:

> Remove unnecessary apb and ahb nodes and just override necessary
> nodes/values.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ue/gAJdQlOYdl8Gx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMpXAAoJEIf59jXTHXZSVC0QALbox99BgElgwIf3jT2SATOx
wBqS6XtTy+dvKEIIOs6YmRoYimDZBYgdJ0WNk12Fm6LCWe/ac52+YcoITHKmI596
7qY9+9FPUwswcNq16WHDcvf75c+2fZX+ZPZJw/EGXMBK03HECfG/qpZs2Pseb0r5
/XCNbyAzn11PQA8tD9RcM9UcZcItTkaGskG/LNYYXYfLuA2hL4eSNzxkA0saDQ7H
B1gmkUP9v6NlCIuXqAsxT9j84XTzYJrUi9bzzA3SZMX/wZIthU+FE/bRFA6fmhSE
iXmCv0mXnY5chFqXP/wf51lOU32ScRE7o3DaIHEUxMKenXlCD8ITFwdYzA11IUHX
1jG480YGbGZ3oYgsG5sl5Bkvb8wJ1IDdMML9un4l/PHrrZ3DneGuF6Z6T4V7AgAo
lEFRKOVpA7hCrVtwgkIlDsPctmRymw/9ZDE7U6lCvDglrGwZ7l57ToUOghAJKcYd
+m75pew8ccJhMfI0E82zx0w4T7+E66uuh9IBKdzrZoLnCyUlLVgroCl8EyobUPy0
ura+MiqX0fD5u2PZEz7KYW14u0SJJ4aqa884coEFh10DK2BEcLWBAnyxdyQTLDMz
g08yS1HB0r9kMJI9L7i13PogQAa7CfnIAl0B081V4GZT54yLLphPKh5/qkDy9RaJ
9pI5XK31owM2KQkeRO99
=A0/s
-----END PGP SIGNATURE-----

--ue/gAJdQlOYdl8Gx--
