Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="DbJUg3E4"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440YQp44rqzDqMk
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 22:03:14 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2210141994
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1550142188; x=
 1551956589; bh=H+tDD2kqWVCe6AyiZRWWllLQMzyw3nkykkudv9Ul7MU=; b=D
 bJUg3E4XfnqV184N9mzeHAlwxovVYjZgqhRWKSIg9kiUdpjoYmSKh0ePkiypTgne
 oa0OJWQ13fCXX0dtvLcGQL5A5zC2Kfzl7JKxOGEb2k9U72UaWW2hdh8JWUzfU7qP
 Tb+8DRADX5wjkXODvnPC7t8NQX7rFBpbHjlnXbVZsw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2Wn86VpugtD for <openbmc@lists.ozlabs.org>;
 Thu, 14 Feb 2019 14:03:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3367441965
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 14:03:08 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 14
 Feb 2019 14:03:07 +0300
Subject: Re: Romulus to use Virtual PNOR
To: <openbmc@lists.ozlabs.org>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
 <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <3ddb6822-51ae-a613-f46c-bad4826d546e@yadro.com>
Date: Thu, 14 Feb 2019 14:03:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HJtsRH4O5Z0aWGTotST2xD1WFXiQc1hdV"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 11:03:15 -0000

--HJtsRH4O5Z0aWGTotST2xD1WFXiQc1hdV
Content-Type: multipart/mixed; boundary="lnxZv84bxkguiWyPU4OJXjxtkAcidIyE5";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <3ddb6822-51ae-a613-f46c-bad4826d546e@yadro.com>
Subject: Re: Romulus to use Virtual PNOR
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
 <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
In-Reply-To: <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>

--lnxZv84bxkguiWyPU4OJXjxtkAcidIyE5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

14.02.2019 6:03, Lei YU wrote:
> Based on the discussion, let's keep using static flash layout for PNOR =
on
> Romulus.
>
> This brings the questions:
> 1. Shall we move the legacy code update service
>    (org.openbmc.control.Flash.service) to the new one
>    (xyz.openbmc_project.Software.xxx.service)?
> 2. How do we plan to support PNOR version, image verification for stati=
c flash
>    layout?

What's the problem with version and image verification?

The installed PNOR reports its version via IPMI FRU now, so we know the i=
nstalled version.

The version supplied in the update can be checked using the image contain=
er header.
Image integrity/validity checks can also be performed using container hea=
der information.
The header meta-information can be then saved on BMC side to perform PNOR=
 contents checks before starting the host.

You could also reserve a section in PNOR itself for that meta-info, but I=
MO that would be less secure than storing the info in BMC.

Alexander.



--lnxZv84bxkguiWyPU4OJXjxtkAcidIyE5--

--HJtsRH4O5Z0aWGTotST2xD1WFXiQc1hdV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcZUrrAAoJEOiTWHtbdBeNZaYP/1X2ldk7/BT84j2UnvIijXXu
m5t/4g2mwsPp0vcIESP9KOXmv3/sarDd4TYO2QXmsHS1FDaHO/dicCw59MwEPeYG
dIs8c+lb/N/9/XtrqmLwALYNvTNGuZcyQlLWrFtwYrZp7ZgKeiUwPDFyljE3mNad
97VPclCJShWMJ/t0f997ihQrg6PXJA2XU7tA72ytkmupApQ9jobSMr6pZHNDocL+
Oa9LIAS0pA7ve/M6lWGr1ovwWW8UTjZ5mBwMEoFvOkjv9dM5BtiTgdZFAKVAs8LX
hpFCaqoQovJKrf4I8bwLYSd0texbP8JT3OjGtgvHR/ImMhSyNU4r4h2zZfLzOjMU
Up25lH2RNYUnGFdis1Y7zmEFq0KoTwGgq/g/xabMgCAG2PDZweDf8OSymeZqPsLm
abi8Y//5ZiQEPwoGNl5eUofxD3V3A0CCnNVQgaxeRFM657fL/rWu+Q1Z2PGex6HO
M2MZ41UpmTirUD3YMpfCFQAUs60UJl76mKCPZsIkJWNSRYVTcXZ/HpAXgGbNSydQ
VCwAf+/yetK9utjkvl9rin6F8pCJqj+aE0MBnPM/wYx3K7gR883syvw2dgni/r0q
BBtPE5gOGrip6/0HldV22LS99/vfc8M6zZlXQozggwyEGAMRvpaP1hQljXLUEKHV
4gL/KShz+NRaadW7m0ba
=1ae4
-----END PGP SIGNATURE-----

--HJtsRH4O5Z0aWGTotST2xD1WFXiQc1hdV--
