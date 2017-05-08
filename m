Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCYJ6RNPzDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="oNsmvKNs";
 dkim-atps=neutral
Received: by mail-qt0-x233.google.com with SMTP id j29so59043870qtj.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pqkclGHxmwVcfXZrxxsjhfslnxq+YCYHzhAM4pYE64k=;
 b=oNsmvKNsHYUg9hcrWxuKNSxlQBBlK+Xp9h6mw764eMLnSqEKPwN+37RWJIpI9H+zDA
 0BwnRtpTl8I+uoqybwYtzjRAnBNcNwR2YzRW/uG7ZGkgnonm0ghS1C3aZsfFsqhoD/fc
 NiPvpFHeoWlXegNoKkrS4RL5qTfU+AOtPVNAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pqkclGHxmwVcfXZrxxsjhfslnxq+YCYHzhAM4pYE64k=;
 b=fYX1NY8Hm7fqG7xr2q94gmvwf7/qT7ekdz4LXQJ6qgjK7NfCkKStCP28P4wkrvMQNF
 IgNka921hL8HeaThLOc70rYsRWgN+Tbwx2v30pcE3h527+jNmbwYTwcoW8yxBq2E7lL5
 90QHgM3tmkfEuF5hzJc3vvEGrLeM0NdH8YAiTBR+2UYPdKQUc3cAvJDDh+IBLIq4FAYH
 F1tlm+CCXPIA1pePF7YCGeBXsZ81X79jehyR2Ych91LBniDzkh+8iN+4Ob1wHzb8lf79
 WG1ZUaGuZZIsA7bP6EJosE8Yy4+p5WeSh3MAwJeM5p6XXTcWo4AzDZk+KlNpFsJsU3A2
 4U5g==
X-Gm-Message-State: AODbwcCOIHRgmeaODveZ0Mto7E4WcubD65XoTTRYu2xufIWwnWh3NKhA
 oB6ugt/lye3r107Jbig=
X-Received: by 10.200.39.215 with SMTP id x23mr12512731qtx.155.1494272482794; 
 Mon, 08 May 2017 12:41:22 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id h128sm2750367qke.43.2017.05.08.12.41.22
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:22 -0700 (PDT)
Date: Mon, 8 May 2017 15:43:04 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,13/15] aspeed: Add support for Clocks needed by MACs
Message-ID: <20170508194304.GP12511@bill-the-cat>
References: <20170417190034.71945-14-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8Lj62l8iz/W5P8RY"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-14-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:25 -0000


--8Lj62l8iz/W5P8RY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:32PM -0700, maxims@google.com wrote:

> Add support for clocks needed by MACs to ast2500 clock driver.
> The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> PCLK_MAC2 for MAC1 and MAC2 respectively.
>=20
> The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> SDK. It is not entirely clear from the datasheet how this clock is used
> by MACs, so not clear if the rate would ever need to be different. So,
> for now, hardcoding it is probably safer.
>=20
> The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected through
> hardware strapping.
>=20
> So, the network driver would only need to enable these clocks, no need
> to configure the rate.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--8Lj62l8iz/W5P8RY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMpIAAoJEIf59jXTHXZS1GcP/2TC8VbcCVO7evhWiU44jS4z
PHRy//DBy0p/+ujPQ39LfsAA9THFzXYCa5H0NKQTjbulDRUcxSodyG81Sa+iv9n2
kwiBBx71ccT2KuOpEOhG3ZlWqNzOiCG2agXVV4sqKkz2hISHvYcCUkstkIs3DSFI
td5trtD2wq/7UiBBXPOurJ+Pjwqv0eDnNXuOISnonTvhoWN2wKxeDGcOM4c7lVor
P3FsKRzAf7Zsa1dVqFC6Lmxil/TjwfQLClh9XlO0IJYojwZ7ZcjnGU314wt/PCmW
607pvrL4M5Q3gBSSNVwl+pqOYO6X9n1VzGmJdvy2WsIqSxmCMefAHYH5ZBYNkVe0
B3y6RX0ekSkAKn7H6hoiT4F8xKs7/+z20RAhqS6kGich/XQHjIRZcOLIamOpMhTg
DQaZWxycPS87ZptdSb/Ahah/9Hz45r/g4i7wiJS+sAgZwdXMMxjoVnQX8UuZr9BU
//GwOL8DQwByKKDcpJiG7jzIjNtjj4GJEupGjf2qPwU53X6/nsp0ixUUVniBqSSw
xZ26y1EUcMdpVih1YIuK/uNybCjC2sZ71nUKjD+nHuplLDQ2kPOKNlIGF8yI8XiL
wWMP6ivbR1Ue2bqcSM7OzJ2K9JPvgb02zFuR+4w+p6o6V19UHdk/MyS/nbPc6qEC
YSHC5p5zlGq2sztjIdLw
=Nsxv
-----END PGP SIGNATURE-----

--8Lj62l8iz/W5P8RY--
