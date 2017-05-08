Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCYD3Wl1zDqK3
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="m3G95x2p";
 dkim-atps=neutral
Received: by mail-qt0-x22a.google.com with SMTP id n4so58928971qte.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TfFOtQTjUm3p/hjIiuo7h6Bz5DbkF7LkSbt0KwxfFiU=;
 b=m3G95x2pMAzus/JxSL8J1GHi73hsjpyIoE9pca1r+pUNGxY6JR6deC4vIUivSdSqSe
 g4Fm5bEnctJAkOusNm3OJlhQZz2/etAV+BEhyHmoicdftrW3387Q5GSBnIPTIg7GB78w
 OpsCtoRvbyQtLHKoHa9kwz3nELCKHO0DyifQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TfFOtQTjUm3p/hjIiuo7h6Bz5DbkF7LkSbt0KwxfFiU=;
 b=U9682oOpjDMzhCW6ySrU1WqgudCHeH0YL6jh9ifvcOKFqdKBSVZz3nHx7a8lDbumlm
 9HFuwK6nNuZ7zORjtZC4FI0DP40TDHiZ1OwpN4reQhd7/iykQveY7pd1FZMm2HNRyAyC
 D5Jufk6pZ5xUVOgcPW4lMnZP+PhLKfyWodzGzQJpWnyJzmJ707S19bliKI04j7nv13S4
 EaCyXjNTWoPmS49lfnUgW7CjXg2XM5hWwM23MCsbHHlFf4wsgJVXopHc+W0TKY+o1k2T
 RisY3k/Xa5bfOcZ/gRbyhz3qgdYKcimG6L0gMKVGRhRNwTs9GryomgQUeiXh42WvBCzo
 H6OA==
X-Gm-Message-State: AODbwcByiSvu7iHz4MZlQmrBkXQ1meggfmXrMXeclSODit4EJmeU6Ct/
 TXUBJEArArQL4g==
X-Received: by 10.200.3.129 with SMTP id t1mr13200892qtg.253.1494272478379;
 Mon, 08 May 2017 12:41:18 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id v64sm13081939qkg.38.2017.05.08.12.41.17
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:17 -0700 (PDT)
Date: Mon, 8 May 2017 15:43:00 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,12/15] aspeed: Enable I2C in EVB defconfig
Message-ID: <20170508194300.GO12511@bill-the-cat>
References: <20170417190034.71945-13-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="pdUiLM4f4Q2vjojx"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-13-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:21 -0000


--pdUiLM4f4Q2vjojx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:31PM -0700, maxims@google.com wrote:

> Enable I2C driver in ast2500 Eval Board defconfig.
> Also enable i2c command.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--pdUiLM4f4Q2vjojx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMpEAAoJEIf59jXTHXZSIk0P/266hl1wU1p1dHG5Lv2y0p4v
AOszMO2wP6wh+w7bST7MdOnuse3jyEKR+bNPnWWTUwR0WmEltGYEgUyHRa+vkB1O
CM/18190LhLOEKJwmncMheKSW2P5NOTux69rhNfaKfhbg07tRmoT7tye8Lzd3xvD
XHU5bZ8FZWNtHs5K313AMA+SKZ456D8tq1XzROdAoL2+/seAQaVAPyApVVyO000y
oa/0IL2gV2VB93f8vjW44QwV25kt0p6SoSoer3XrmJcOdQQQbQ0B0rHrszCzbLFN
O0pjjDTfHu0JbKKr/CVuRzCpidFa63pgrlcm4lDhlAXwz5cPW9RuPXCYo9w1ETqZ
1izaPv+yvDvnCHBS8mTjr9OxX+MPWnBXBRIjZEQU1EELZunoUMTskesNCiyUJhSg
8vyGpGps48YLyTK5fNB16f+vrTBlxqiZ47GVj+0cjt24S1e25UT9YFUloRpG69BG
8d0nF+vorpfVnAihJwwhMQuPGTigsmxVBs9qEQsDjK5vSWdqi9FIJ1wSs98MDx3Q
VF9SO0pnI/FRVkYudyu7KlMzyqwLWZTiMviW1F7VXVgG1rJmVs1PN1kmCacKhjpe
gMEW7y1Nbfo+dweNVhoGcnQOutK6rqQnNi80vIcImZ0aUe85IqYtwsKMzRWsPNnU
X4KK415lnLzPSQdhL+hw
=Zg6a
-----END PGP SIGNATURE-----

--pdUiLM4f4Q2vjojx--
