Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXy4pWjzDqJg
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="ERew0kOZ";
 dkim-atps=neutral
Received: by mail-qt0-x232.google.com with SMTP id t26so43464458qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MhN1Ta3U85XZFssBugsPGBk0wPge/g9ZE3x/UA+zCuQ=;
 b=ERew0kOZuEtnnJY8QOJ5HxW3RKwCqD8/f1wubaV2W/47zCo/ewxMHqVezVslNe8bSO
 qV0XjoPKkGPkUiI1uus8hyD9JLW2ejjIcnaFpkemM+MOl9LFeLLo/fbs0sfFlFTH1Uju
 exMzKoav0gPmRbZqTzC63sT6suFcbE2aIt68w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MhN1Ta3U85XZFssBugsPGBk0wPge/g9ZE3x/UA+zCuQ=;
 b=IymBAl7/gugsCb0ZyjzmYvnyhUKXwof0DogqlXyZyuAKKoJz/2/y+qgVJjH2DTrMd2
 KFs0qGNeYEwtK3rursfrdTuPA4aFTWvD/z08QIsJrzPqr3lk3iV+MmkGMRSjrhOrrACt
 TnGISDki9g+/Gof0hrSpTdZ+FrmUyll+twNd7w87XNFmI0knEOekaov+wQniVxMG9Nzd
 w9BrgF+MRs5B4jbqI5Ls9oAWUVLaQ0keg5Q2hy1ERx06DBBtnpJiC0on87QgTZScj5Kw
 cl/ef/qmpI6PJ5ljCoEtWMza0L575x/eY3oRKz5hmSwjC6OHewCK8PmnAqSBCP7bpAVD
 373w==
X-Gm-Message-State: AODbwcCvp4PmUlIYnVL44v6nOUItUY+44VWBB1TUTSnlC7QOJsuqFBsW
 UOxorUB9gFgHDDBofzE=
X-Received: by 10.200.52.232 with SMTP id x37mr6361396qtb.262.1494272464830;
 Mon, 08 May 2017 12:41:04 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id d200sm10442983qkg.50.2017.05.08.12.41.04
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:04 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:47 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,09/15] aspeed: Enable Pinctrl Driver in AST2500 EVB
Message-ID: <20170508194247.GL12511@bill-the-cat>
References: <20170417190034.71945-10-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="buHClxiALU8oNqOy"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-10-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:07 -0000


--buHClxiALU8oNqOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:28PM -0700, maxims@google.com wrote:

> Enable Pinctrl Driver in AST2500 Eval Board's defconfig
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--buHClxiALU8oNqOy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMo2AAoJEIf59jXTHXZSN5IP+gLiBqMym5lI467e3jcIHeKU
bskIYinsKxX45IPl0Nj9sjQWdf8cFHZ2Td3tnzupXtkYjttKa7wAh6a6GaOCmTKY
tKZYXHOtDdwi5PEiooechAU9+tJcrjHT/h67PIhuHkYVjOdd7pjsto1pzKLTFbFc
hB4RY7H99mjwUIT+nZO6WRtpaehQVl0uoEkN5oCPsQE/W+R70DdUJiw89+2pi1S/
cvbKbe4YUlnbQOy9gt2v7TlN2IrSVrfskOtMr0nGTfwyoAjECVmmY25w6L4wND/E
Eq0hyJnehluTVA0j52HVqs9CUWUD20eF746ij538COZYHLW1fUvgAN7c6s+5P8Hz
UyYRCz+2cRwaAQvWrfDC1kv7COULaYW5/1LO9RtI8X+QyZ16NgX8KAhAVqAsgylZ
EX0qOQg4Dr/fYIp/38CqU48Prj8SXi/qKGAMGf3H6iLVNV3F2VaiO2AIBJkh/luP
3BUEEcyOe9+ifHHOUJVtNB6tZHx4ZRBwxy60hRgR6i6hop7LEWGsdZlvSZxGZPui
P6qZGyE175IrDgMVnkveN1ObS1as+yf8r5L5KvUCUN+QTO/fnXQaImY4Muzjnkez
uYG+nY65dS/G7py+zjcgMU5TX1Fnph1daRgeH/N2qHFDd2qmF9+1oc6wELoxJVHo
PYAGSf5ZHbCjzF8H0gMf
=HENR
-----END PGP SIGNATURE-----

--buHClxiALU8oNqOy--
