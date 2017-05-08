Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXk0Vf9zDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="gzWgo69e";
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id a72so45305596qkj.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RKrDYXSjw4brNhk3r5Ob4etVAselHFguDg2KQVONXRw=;
 b=gzWgo69eKnII7KmNEs3cPEu7XlWNQ0qq5oz3JAtXMouXWqgjhvz+ueJEQ/kWi23Rfd
 y+Fdu/3JpYh7guG7p4kV2IhYtFj7AMYsik+X4hwMz3HmuOZWzeH2PYh2k5LMM1S3skwI
 PaX9ox0EEMAq2vs65AMjL/PV1CL4BFZWrGWdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RKrDYXSjw4brNhk3r5Ob4etVAselHFguDg2KQVONXRw=;
 b=rD8OKipu/7Ii+zBgaMuHDCbNSuT0d1BA3zhttzABKlbMDeA1ghjgCAcnn8q9v+f0R7
 gJjqafnLB3l7KbE6w/qey6rHOya8mx7ii2CN9iPF1sOjyGrg0V6Dh+552QmcagVQ5lCi
 ijhKfs7sjhBmeVMmAhtZ9e4tEgT7737KanJ/vpNkxvPVa7LOfF5ffRzxGKOMmmwFNdq9
 6Rqi0URA1bhAHIVq8s7/bygXhgm5/oVKyF/9nORcl4Q/+KHQo85maFCgxEBnyasVeGKr
 2meOXAJ0mBeBXDT4cDXQFTu/Js7PrPbL5xxz+JfxX5l4uHkVkpvFL8Fb5Xmxw6V+TtOw
 fyzw==
X-Gm-Message-State: AODbwcBYswW7CPK1PjGAdU7SclEmgGIYJwRNK1ij8z8Ajcdph7+iWW1U
 w8NYVA2ypAw9djwitgc=
X-Received: by 10.55.204.23 with SMTP id r23mr28896806qki.72.1494272451946;
 Mon, 08 May 2017 12:40:51 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id z33sm10961065qta.48.2017.05.08.12.40.51
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:51 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:33 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,06/15] aspeed: Device Tree configuration for Reset
 Driver
Message-ID: <20170508194233.GI12511@bill-the-cat>
References: <20170417190034.71945-7-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="UXdpmlmE+xADLAjU"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-7-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:54 -0000


--UXdpmlmE+xADLAjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:25PM -0700, maxims@google.com wrote:

> Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
> for various reset signals
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--UXdpmlmE+xADLAjU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMopAAoJEIf59jXTHXZSSPcP/3lHWbTeusVnputcc5f/IG70
ToTI9mNxZwYkJ+vbX+3hhvQ7e4zO3u8QwXJASHieu/n0gdTDWmT4oPDFYkK1GT5C
BVnoafJF1CMkbEhVl1eXmaKsv4N59bJ7jiDWh31UbQGaOu/jqHIj8Y+0uv0mwy2P
JZ62vkeYx7Qb+e25ZJywQ8tUnGXqf5a3HqVHpncURhkBwB8I+3GTEwzMZ2DYJ+Yx
fSwh3tsEKXrzENJ+D/4AMpWDJZdV5RoPmMT1MvSuMdTimaopvsqkrEYk+RRh+o7F
BrjvkO7Qp//VJ6Lo9ZLoPPOnbkaZx0MC/l2jB5ruBdkb7LN9v1oqg4SJWJ3j78jm
akXWwoevOfrdmv0Lmyz6U2/bZ4EWh/sGOVVitanfjDUtmWl5FUDEYVLD5OmfGC+3
YmB8qhYW7IdjTU8B6u8HBpdfmrgpFPBHy+1u0DlrNLCjEZqbQLN4ujswBWtMjYT4
CA9vAluqQ+Sr6xPATXQnJE4Xlze8VftL6rJZdP6GrVO9YSyOAKkyn/lj8o/x2A2p
j+DuXfpqJlKLuOrXdKMHrzSrvEbXnkdcy2tJLHDHyla46moQNrU8H8PW+s4X6ENu
CP2dHT3QEqLE5PxkNpCRYJYAuub9Wa9vddhGFfUD0vCmjYh4jv6qozOyN4yfS+BI
YokhWkJOcXddRonx1T8i
=Ysnz
-----END PGP SIGNATURE-----

--UXdpmlmE+xADLAjU--
