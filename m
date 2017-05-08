Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXM1fhBzDqJ9
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="E/ne/byw";
 dkim-atps=neutral
Received: by mail-qt0-x231.google.com with SMTP id t26so43452666qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IQFeG1JlGmFJhSXFkp/0USgZYnjlhCo29o4C7vmhUYc=;
 b=E/ne/byw/0h8EhXIq8lU/4WzRjJestd96Kj1n4ecEp21AlU3m2xgPWsZ0SISjXy7R8
 NHTWBH/Ihr+Bc/H1EKOjMap4kJ9wkGtwmfF0N1CA81c4+ujhV5n2e7JW5msHp6OTNN1R
 hGZicXc7xsSQV8cnmNHHUOqvBaLmHXgCrDuvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IQFeG1JlGmFJhSXFkp/0USgZYnjlhCo29o4C7vmhUYc=;
 b=dPOk/+GBCAbhKefSXgZ36XQAEy4y6pZi9bQKY50/kUa+HXfimsIcN9DZzvuoqLXzuU
 P9slZYigzVPrtNhULuEUEjtMRUw6EVo6zEn40HhclKegzeNQ4RVBgApP/bSw3FW2dPTZ
 IAwr34gKUqtfkczkxuQEh8edJhquoIJXuS1uo6uaahyvOE8eqOCgZESSJ+Lq3YHMoFQK
 Am1TbZ+E15GypTmxzGrUmrwgxNzmcmgXOAOq+cr5fHjqITbKPl3+sh5eHu9EBPlSr2N2
 SvQr+Opci5i+ta36PoSjCksEvDrsHMKxBw4u5KsNvmweG+AFbUY/yGLgd7/Uyf3Tk+q0
 urOw==
X-Gm-Message-State: AN3rC/447n3QMTXRDRtiMXLvW5AWX0p4BRfmip6Ru1czqp0sh/8enCJb
 H29v8UQpq1suPA==
X-Received: by 10.237.33.69 with SMTP id 63mr46165262qtc.251.1494272433066;
 Mon, 08 May 2017 12:40:33 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id y17sm10471411qtc.29.2017.05.08.12.40.32
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:32 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:15 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Stephen Warren <swarren@nvidia.com>, openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,02/15] dm: Simple Watchdog uclass
Message-ID: <20170508194215.GE12511@bill-the-cat>
References: <20170417190034.71945-3-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="X8WhROWZE4/pBrdd"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-3-maxims@google.com>
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
X-List-Received-Date: Mon, 08 May 2017 19:40:35 -0000


--X8WhROWZE4/pBrdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:21PM -0700, maxims@google.com wrote:

> This is a simple uclass for Watchdog Timers. It has four operations:
> start, restart, reset, stop. Drivers must implement start, restart and
> stop operations, while implementing reset is optional: It's default
> implementation expires watchdog timer in one clock tick.
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--X8WhROWZE4/pBrdd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMoXAAoJEIf59jXTHXZStfMQAMIKlmhAiaIpaxnp1qeGiuv7
CYr8/cxw+scZaRYa5H9DVU+TvURaqy0jdX9ZOiW/GF5ItrF4/UNiH3ZOXc5ZGxdn
pZ0cB/R00mb+5bK7ty0OYR765vngXKHunFEG+P2fMlq7WDDWPp1gb+fk8HyW0fJ2
ns/jWvjVH48qgEUszEdENHdHUVIF2Q9T8/3/Xqlkx1xMk9OA1fKCXixmRjSJMPoe
yQA6CwP9AOw2I04kSZkVGmbMO7gN1qnfC9x3rajPLTDUbVD/OPMcEhd1/nJBiez3
10wKANAAw5gLgDwRy63AAYk2+PHH1+khIjUDfHI6aPkecCQ7A2ZNj5oWRoof7EPJ
ANSQgIoHJENK+pqxgqKjWwMi5aqxveN1cpBrQPrfkAHW8wBqZTmJ7twNPIe5zj57
zhzT7OpV/hlCldXKivF+bpIm20rdHF/g5xzWxCN0KKKCIm+l3WrTKTuv5iONyzka
E30Z3Kb4vQ5fX1GrnS2j0/I/SskoAtgPFNGTe34kVzDqQ+EKjsrs1f2qlEDGJIMc
n/lDO2lo/urB61cIBepfNHqk3gS8Bz2kEDwTtG1NEmC6ulIIubPtK+3UYamk/TzA
ZX1un4C5Z7G4icsVDMVCzZp6PizBdVv4AVPCM3ywqsPuLwq9ds5rI6h+I78dBS+x
OMx88vCRyTRjtwG9hbGn
=6dFt
-----END PGP SIGNATURE-----

--X8WhROWZE4/pBrdd--
