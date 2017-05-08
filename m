Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXt41GPzDqKF
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="SgKQAivD";
 dkim-atps=neutral
Received: by mail-qk0-x229.google.com with SMTP id u75so61378968qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xnN9pN2cY8YcwiNCvpdswnxXdNCLYmWL0nHVYIeorQM=;
 b=SgKQAivDvYzvAREclOpTrmJAbLvm0Ldkdf2z/FGSYEPwfJ2OiwN7BzVXg6QQ3DxSBu
 N9eoWipaPhKF8OknDgyeGWxz5WM4ZioIf5QTBZIvdgN2Y8ZL0NFp3y8ZsoaznsZW/aTK
 +CUfSgvQX69pNmDtJZCaBPmXskwGnPxhrr8/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xnN9pN2cY8YcwiNCvpdswnxXdNCLYmWL0nHVYIeorQM=;
 b=HCCx/7DO2Gq9AEHbPmvVCBEwJhJYxS8sRpdCBC/3GPn6UmEA9rYfgZGJN1oIqEsr2K
 Fhg5CH/uM4uvzt6M0bsC/rAIGWPVF3zzqWf1pQUo1Rc2hqonbPiCGfCoE83hU6jNVl8w
 KtdupT2QcT5OeGsMhKge67qyWkHTZTkDhNRhVrWcVPP2GX4KtrXg/0zlVLQkywsI1ew0
 dJO/niV6/wrGHNPJovygG60zkdKlIPoevdXQNdveabbEz0axlUGsqn6gZxUXLVn7rlsd
 mbjFvf1DNCofPv/4lxApWFDmyu3Ek9brlUouUUEsgXYw8L1nFyCvdxiDNY+ONYyPss4I
 Cv1A==
X-Gm-Message-State: AODbwcDn9Z58pXI4aNL42OLLh7n3F2iTFoW0jTp6kW+bJSCxW7ZNB61x
 eUX6/L3UMA7owQ==
X-Received: by 10.55.130.131 with SMTP id e125mr28863812qkd.109.1494272460423; 
 Mon, 08 May 2017 12:41:00 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id k34sm9874646qte.3.2017.05.08.12.40.59
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:59 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:42 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org, Wills Wang <wills.wang@live.com>,
 Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [U-Boot,v1,08/15] aspeed: AST2500 Pinctrl Driver
Message-ID: <20170508194242.GK12511@bill-the-cat>
References: <20170417190034.71945-9-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ktVyxOZBIsenE1Qh"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-9-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:03 -0000


--ktVyxOZBIsenE1Qh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:27PM -0700, maxims@google.com wrote:

> This driver uses Generic Pinctrl framework and is compatible with
> the Linux driver for ast2500: it uses the same device tree
> configuration.
>=20
> Not all pins are supported by the driver at the moment, so it actually
> compatible with ast2400. In general, however, there are differences that
> in the future would be easier to maintain separately.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ktVyxOZBIsenE1Qh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMoyAAoJEIf59jXTHXZSoQcQAIUSY7+XzBmSllbA7LylEKjo
XZxfT+o/qNwTuxd5a+4Wj6kDGY0tBEcL6DA8ccntENsN+H3S9qvuvlYkmjqah8S0
wTAkJL06+MeKIv1cdtLP6WJkLHtFljFzfyh0vmbD1FrwZQLNIZnCjqJcUx/6hnvm
6Tb6K1qcfW+EdcwbniDvUFRakf79T7XZ5MYrkl1fzTavTe8BOD0tUgUiDBviVTiu
dO2kQt3DFXJmjm+J2NmpEb5diI/h3jSw/y506VsLcUMCtvF0XV5avrAT2/yHq5qP
bWkmKIueN0yFoQWGjI4e48IEcIIaWpddOFti6OnrPoScuY/cMSmVASPSwwzVlBhC
JJ9mwigf7dhlfg3SW5Rz4h+jUAGkKD9GkjsJMwtXunvtw+YAA3U1fRwHmY0tR3SV
viqVkYzucwPHKxnY3CmStSd+2F4Ig9sTi4nVRrAomxzjfdhjHK79z9tuA4O2jY3/
oyq7X8mJ6dyyYGOlIDWb1GEoW4TpoV5Az1jUv6yptaxlF28D+inO7GnvU1fdnTFn
PJX6iuX+m9r0R6lV9ovBfjq+FWW14AGGPHqTZwoD1ZyIdZKj7tvzZz+RUl4RcnRc
7EKkrjc1wsDXOrlhm7F5azTX/VN4uh3xOk5rJLZOuYKGXOj1EoWQhN1AfwDNXGEU
bt/LAOBzmEfwHeGA2zcj
=oORZ
-----END PGP SIGNATURE-----

--ktVyxOZBIsenE1Qh--
