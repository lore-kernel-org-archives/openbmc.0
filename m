Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="p6Jt0xQT"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wVc10cmMzDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:41:36 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 300B741900;
 Wed, 22 Aug 2018 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1534948891; x=
 1536763292; bh=YgUVTwdIjxhoA6f9xlrjED4nDlyvUYzjjDPo+dVIkEw=; b=p
 6Jt0xQTWNqTiuuk6Kn/wCxEWjjoFXKOyXctMDi2h7Yui3z3+hY5vFVWW+QZVzzpN
 WaVUsTvEM8JZC/tFe9CgUjdrp0KBCVJyJeIIz2hSiTUTG8IBj0R2gbO4eeX50fR4
 xw7ZxeC69D49oG78+WG0CW23jUI2c5dqZa2qMBjpfk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fi3wXjMWODGC; Wed, 22 Aug 2018 17:41:31 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5C9EF404CD;
 Wed, 22 Aug 2018 17:41:30 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 22
 Aug 2018 17:41:30 +0300
Subject: Re: Tagging master
To: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
 <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
 <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
 <CACPK8XcuJp=aMVE4WDbf66gjEv1nEAF9YD=RNS198Db0O+Q1HQ@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <2e9aff0f-7de0-89a9-5659-43a580fff779@yadro.com>
Date: Wed, 22 Aug 2018 17:41:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcuJp=aMVE4WDbf66gjEv1nEAF9YD=RNS198Db0O+Q1HQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="V6Rl58AXK0UgGqLiBCHi3yk5vefXhcTOT"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 14:41:38 -0000

--V6Rl58AXK0UgGqLiBCHi3yk5vefXhcTOT
Content-Type: multipart/mixed; boundary="svNqdEBAtP0XngD3E7QMEYpsMRjdrKsmZ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Message-ID: <2e9aff0f-7de0-89a9-5659-43a580fff779@yadro.com>
Subject: Re: Tagging master
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
 <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
 <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
 <CACPK8XcuJp=aMVE4WDbf66gjEv1nEAF9YD=RNS198Db0O+Q1HQ@mail.gmail.com>
In-Reply-To: <CACPK8XcuJp=aMVE4WDbf66gjEv1nEAF9YD=RNS198Db0O+Q1HQ@mail.gmail.com>

--svNqdEBAtP0XngD3E7QMEYpsMRjdrKsmZ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

22.08.2018 17:12, Joel Stanley wrote:
> On Wed, 22 Aug 2018 at 23:37, Patrick Venture <venture@google.com> wrot=
e:
>>>> So this would be a non-versioned tag?  I believe we already have
>>>> versions that are meant to track behind or with yocto (once the
>>>> release schedule hits).  Since these aren't tested, I'd suggest they=

>>>> do have a naming scheme based on version, with may date in the tag a=
nd
>>>> some indication that it's not stable.
>>> I don't follow. I was proposing we continue with the existing scheme,=

>>> so the tag for today would be v2.4.
>>> ...
>>> products out of it. I think a tag in the git repo can exist in
>>> parallel without taking value away from the broader release branding.=

>>>
>>> Please help me out if I've missed something here.
Please note that if you add any tags to master, they WILL break versionin=
g in the software.
That is, at least IPMI `mc info` will get broken as phosphor-host-ipmid w=
on't be able to parse a non-standard VERSION generated from a non-standar=
d tag. It has a very limited set of supported tag formats (actually, just=
 one).

And I don't understand what would be the profit, provided that `git descr=
ibe` already gives a pretty human-friendly description like `v2.3-592-g28=
cd22e`, that contains simultaneously the base version tag, the number of =
commit since that, and an abbreviated hash. Pretty descriptive and friend=
ly (unlike bare hash), IMO.

Alexander.


--svNqdEBAtP0XngD3E7QMEYpsMRjdrKsmZ--

--V6Rl58AXK0UgGqLiBCHi3yk5vefXhcTOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbfXYZAAoJEOiTWHtbdBeNUO0P/iFBCxXBqsCx0CAZmTqP1p/4
k39UNXHVpSW5u2OS296Lb597L7Q6lAMOnYBgCUe+uXCW7Khgx4I5yIC+an2GSKg8
YvMEFS/pzjG8HSQAW5F7RQBTu0WTCT6m1sr2Bz4dXSjjUaiCs++9s3ZZj/8WVIZp
uI5+l8d7eLfqKCmPEdvnRUm47EzDL0d40zjl1oX5AGnGvIFIb4xfUZLLt/UdlFE0
MPbjNY9N9w4EnjNkUCVV4JHXf16LFdfnb6Fhnll1dySstMkKKv35XwtMBbuVi7gV
+fqPBe7ssIerMLJQPcTQAxITByLTQHy6cQeKhGUDiC4MNElnpYMScrfR3312JKvC
z90DAgvwLfeAyxbHSBz9ufBne+jI0nn6oG1jvpz1Kedw19PbHlMHouJblrOf/dKJ
+cSq3b5VAgzt7Eb9BLkO3QDnO1/P0JUc62Dx89o8DKWD0nngbnj0HjvYNkC7fVri
8Nrr3qwm/mnCOcfbqnROyECZhLOkeDTIX8jlLtMD4sAPudwrJe3wj0O9FxKZSJvB
qGLv0dIzeourmQLfL3AXg+fFTaswNRKBCjrelGmJhhPi0Nc6UrhNm8GlYSvjE/5I
xrdJxKawAkDGzfDsr/CwDHdmcUIDBxloA9mJeENDXhmSIPagK9biwy9d1j/pyJOy
AQQT6+wBcdNw89dfTnWW
=OuMT
-----END PGP SIGNATURE-----

--V6Rl58AXK0UgGqLiBCHi3yk5vefXhcTOT--
