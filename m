Return-Path: <dja@axtens.net>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 69EE41A0D59
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 10:49:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=nCYtBKMi; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id e65so4155874pfe.0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 15:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=+lGrY+cV5QhvCtcDW5YtHUEBtyQUkpg2MqZL1Nbxdz4=;
 b=nCYtBKMiG0+2NNQHL/afMUV0V7XWRf28wwaYSz3WuGKfmmn2HzBdVEAhZ3DIu4uzWw
 11fMnO3m+P08oDrP3FH/vtMgBIVmOVu8LfCFA7ywzfHAVKYqG9lVYsRymnOeGe+3SZiH
 JoEs5qp2IaarwrIwVhsBqxQ9QjuDRCyY55E70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=+lGrY+cV5QhvCtcDW5YtHUEBtyQUkpg2MqZL1Nbxdz4=;
 b=VnLB9Tw4/lHCck2ynPFbE2aA7nUtuzpIWL/CZII4ZVZlOw5PIkrzgEGTmFX4zWvxYM
 JplJgUzrcSUUT783rokFNva3xojZryUW+Q3Esy0tPPcvToNYXL5m13WzpzKCH7zqnBOO
 Hvbw2mgehINpzfRQCVfUsmZCkUUEDnCfeApG9TpoXwLeG1Utp914wn21h+Y6PWZwct2F
 HcE+W3aRGNBJRQ8OxIIkdyAWUntTuqu/3tRHjUMjhGcDqd+MsI7MSm8gxjYsK1atcT74
 TVolPlKJqqECBbntkp1I0dLPbyDRydyf2JId5mR6pV/csQfK+9yYWo0NO202u+g37En3
 57ZA==
X-Gm-Message-State: ALoCoQnh/CyekPJdPloP6D+CHY7d4Xv3x1NToBuTVctaYi1ranqfB505WZSxKufKn2QL/t0bxdF/OPPxN7tO9NF372dg75s3kA==
X-Received: by 10.98.80.135 with SMTP id g7mr20650195pfj.132.1452556187471;
 Mon, 11 Jan 2016 15:49:47 -0800 (PST)
Received: from localhost (ppp121-45-193-224.lns20.cbr1.internode.on.net.
 [121.45.193.224])
 by smtp.gmail.com with ESMTPSA id r66sm25649231pfr.59.2016.01.11.15.49.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2016 15:49:46 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] pflash and linux updates
In-Reply-To: <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 12 Jan 2016 10:49:26 +1100
Message-ID: <877fjf7k3d.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 23:49:51 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> I've tested on Barreleye

I realise this might be a bit optimistic, but do we have any automated
(or even semi-automated) testing for existing machine types?

If not, I'm happy to start chipping away at little bits of it.

Regards,
Daniel

>
> https://github.com/openbmc/openbmc/pull/130
>
> Chris Austen (1):
>   pflash and linux updates
>
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
>  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWlD+GAAoJEPC3R3P2I92Fe64QAL2skl73cjbj8FHsLYsnwiTF
aeAoYSG8d/nkYL0NPXOfNXuOhhisdN4ad83uAqvNHHvFFEsH0kHqow0BLGM+7AMl
5AB44ThgRh7zJwJ8ht/dyMXx3RXzH/91tmGt65zPViZSy6LAC6qVc7G2m69+LpZi
2xDu9Zu6vJoopmrDIizEmzd1H309ENpS3sFxqiW89ZhZ3uBukhPD+6mTGl504ZFG
XKwAfqc9D5j2Ee+3+DfmW3s8XFcOMSMKm9QbelhAY2ZhwY3XUn9+1PustuXXzk9M
XYCJhHCoCBXpR+OXedP0EJ89KYroyKD02xudLTHXnzpMBFRwwGx8MlSfQEQOlRPy
7b82RuDaK/Aekv2CvZkNL4ajttz82QHIe+j5PFu4Mmsk9t11OPo+HRvv6ZTJaUUb
SzZz3naK0XW/dAHIk2Mgyf7b7mfV3+jZCfQwhBxZFnQyuCkZ0s5Yc6ARdvNGGh/z
EObnGqnauBO/CQ2Xz0CssiSLyv4fbkCyUdGXK/K25UlIipsb98SCR4oFI3kkf0i8
dogG6cRot+sucwtIwb7USkmyXD9oYpz/TryGyMGhG8IJmfFjioB4d5STDUm/KfmL
vrMlKOV50nT5CUkMlKJjuNiDBKC7CAmBMJg/qUcURzYhU/8jM+W6DdSHIbrWMV9G
iOFLfEOqORP1wAXUAByU
=nF1R
-----END PGP SIGNATURE-----
--=-=-=--
