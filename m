Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCY34lN9zDqK9
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="BD+KfI/e";
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id u75so61383019qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=77BwGgxqsWAtBlKCZiko5O2xe1Z+kto/86JLaJa+XlM=;
 b=BD+KfI/eoRhLRSPov1gPQFpf1OJGdWRVriXdU5MdwndSdTODDEcbmzXZXe+7rKNXuE
 +1HLiBwEZ+TlJudLnZUM+scL5eAgjBe2XclYGuH4QyysMw+g8e0G9D8v4DDmtfMS8t89
 4MxnI6+suaSJ2DAjy/6FuvgLOQlBdQgcMFQRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=77BwGgxqsWAtBlKCZiko5O2xe1Z+kto/86JLaJa+XlM=;
 b=nUOVijBQvgvOQXzEkoaiORmTmDJC7FuMsoKZJVTyx5abu/qI4KiQnvCJnuZraee8+n
 fzW1+XRECy0FM7MhCaPjLLn6lk26NrQGgTYLorKG/ymjVZyM1CdXrRrzEyHBQxhWYBCX
 OoEiqoY3FHOpbk9LpBN3jdzTiS6psqXfqRjh8qozYg8nShN+Ktb3KjQ1oEhFqvhu2mf/
 Xpr8Aq+jccmOYm179WGNYtGVQ9seDARdkpiiMhq/LZfD35lRpUdyeRcQkImVg3cSTMtl
 jh0ZdCeEFeVGWQAhGXwCoI8zOk0R5+nRiGSbStlXvokHPVkF0cEWrj2wDbUzNFSRrgyF
 DB/g==
X-Gm-Message-State: AODbwcAXmqvB7lEpcDm/LI3ytHRo09miulVaBmlywtNz/9jxQTx+pmir
 pyD3NquGTKg79Q==
X-Received: by 10.55.136.3 with SMTP id k3mr15999392qkd.283.1494272469549;
 Mon, 08 May 2017 12:41:09 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id j14sm10595641qtj.51.2017.05.08.12.41.08
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:41:09 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:51 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot, v1,
 10/15] aspeed: Add P-Bus clock in ast2500 clock driver
Message-ID: <20170508194251.GM12511@bill-the-cat>
References: <20170417190034.71945-11-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vjhvBPueKAUfQM0/"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-11-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:41:12 -0000


--vjhvBPueKAUfQM0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:29PM -0700, maxims@google.com wrote:

> Add P-Bus Clock support to ast2500 clock driver.
> This is the clock used by I2C devices.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--vjhvBPueKAUfQM0/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMo7AAoJEIf59jXTHXZS2jMP/jV2+wur5vH653fM2rxf41AG
oZk/ezzT8HL1w5OEv4aIVspzVlTHrrQoTQYdZFOEJgnI/nA2A8Vg1w9u5TvNx4kd
HKsyFb+y6hb2I/cl0OeomkG1j+byi1w0hP9hL9JPMBngRYCJBxi3aRgxZwLm1F5a
NHMVK0GgHOyCFKfSwqa57siL+e/C7Sgp5WbP439Q0VN2snUmtjsFpM5eH6pbIcxb
IU8Fw1mG38NNnmh37IFg5moBaxxniS5CQCoqBbbnOOvCrb6j63Uku83QhdhHI+Bp
RUzLc9XmFzyOtjUOD2U4fPQaXnTNTciumsDIFDizq67f+RNJ2pepqAFJG81Mu3Zv
3rrfy6D3GbTSeYMPbAld0w3k8hPPi3rQK6BM7suYq1/NV0mdsihD+MZpJnVspXS5
LDHj9/KiHqDGTubjAFLN0495CfWlzBV9MsmPXerr2nhD0wvmsH4U4+K5MHGz0SaP
FKBXcsQqqZp335tlb5E8pmlDdtI9C+rLqzsyqkuLZeW5ed2zSen74/Gp8BO0XWiW
mGGxBli9+KdSPlqHTFlt7tjeEvpKlUDEhNheuRaUaIR1S9V6K5yG2ZZRt0yiYWwp
ZLs76xQ249pQMD4IjQxf62e4fG/7srEAHXI8LJgZ+Lhv+o4G7kWqyvnhH4nUq7WY
6eV23PTCNEsKxxxN3DC1
=onZy
-----END PGP SIGNATURE-----

--vjhvBPueKAUfQM0/--
