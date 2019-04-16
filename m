Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Gm/QAf51"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k5bG2R3MzDqCt
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 23:20:42 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 174DA41980;
 Tue, 16 Apr 2019 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1555420836; x=
 1557235237; bh=KceDgHqGJ7k5H7eB4sDTUetOpFaVosr+XEj2eUMR+co=; b=G
 m/QAf51tY1PhtXo/pZfugHl0tmYsazuIXXCNqV6n8J2/Ejv7+u4ZWR39Ot+lH7V0
 PWNP23/Lz6+6O/QZ+eKZ+h1aBb66wZs+F0w51aBMxV/Csc4SFT+Fgh2RDbmg1lqz
 40C5NbMd/5Q/gj4zU60LBoSwabcxtWVatyxxz8NT54=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrgQnA4EYArc; Tue, 16 Apr 2019 16:20:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 011C74194E;
 Tue, 16 Apr 2019 16:20:35 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 16:20:35 +0300
Subject: Re: ipmitool recipe update needed?
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: Andrew Geissler <geissonator@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, William Kennington <wak@google.com>
References: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
 <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
 <20190411194929.GD15959@mauery.jf.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <03bcef91-3d4b-35cd-c92a-4fa8e48d6839@yadro.com>
Date: Tue, 16 Apr 2019 16:20:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190411194929.GD15959@mauery.jf.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sF1pDlrqijMhJtKDDI5KGclagFO5AbzKb"
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
X-List-Received-Date: Tue, 16 Apr 2019 13:20:44 -0000

--sF1pDlrqijMhJtKDDI5KGclagFO5AbzKb
Content-Type: multipart/mixed; boundary="h8GNzU6NmshL1yYbHDoUaokgJulfXt4Oi";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Message-ID: <03bcef91-3d4b-35cd-c92a-4fa8e48d6839@yadro.com>
Subject: Re: ipmitool recipe update needed?
References: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
 <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
 <20190411194929.GD15959@mauery.jf.intel.com>
In-Reply-To: <20190411194929.GD15959@mauery.jf.intel.com>

--h8GNzU6NmshL1yYbHDoUaokgJulfXt4Oi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

11.04.2019 22:49, Vernon Mauery wrote:
>
> Would it be better to just point at the upstream release tag instead of=
 the release tarball?

Indeed that could be the right approach for petitboot.

>
> Along these lines, if we can get my pending dbus interface pull-request=
 merged, openbmc can use the upstream ipmitool with only one patch to cha=
nge the default interface (which is on my list to make a --configure opti=
on at some point).
>
Both your patches are now merged, so no patches on the buildroot side are=
 needed if git is used.

Alexander.



--h8GNzU6NmshL1yYbHDoUaokgJulfXt4Oi--

--sF1pDlrqijMhJtKDDI5KGclagFO5AbzKb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctdajAAoJEOiTWHtbdBeNdmUP/0MfjDmk32doL+qTHchktLz/
QTEptKjVvIhxVPLeTtrfk42I0COajYhTVv6zclzNdvtA8kwRfFt5Bq2eELmZ7qbY
q3oO4UMBwFT68dJA3tEsv/5KWFamw9EODEvJ0tfN3iDHK3hQXgmuCqMi+X21ehAT
jw53mFwNKTfi5oMNR48/9SLB4tJPrHUJeDgcZuDiPVNIW/4Epi/NkUwIsiD94iHn
VsfEGFGuAB1LlYobnO59ryxoQX7CTwk12rEiMlVTtJxZNcyK0XTXQSU1RDBmLc3k
jfAzqmJBks9R7SbEArsGq4SZ34uoRlvq4eeKWfD+5ovK5UjfU6EMO29tTDX73pox
NTNMEwQ1p1JoV7Sxe4TH0/9O+wfeGWL5pqxMFugY9245cUkiR1pnlOHfDKEZvLYM
b1C+qRSqLx05UNQb+q+/d8Nu8C4uj62e2qNNNh94VK7TBVsNqp28J1DWvHyewOUW
+U6mKACV2mc26COI4ctcs1gVHVhff31Qusa9gjsHIjAAnBVRr3W3uYfLCZlA5Jga
BwjrxBrAUv7lerm0k9whO/LYNIFpb+q72CJYQu3OVlfGoHkJS8+qnDNUNekBIjv9
NDjKY2F7hHWyCKWRRv44ckJaMgrBwvIAeu0aZQrt0+W2Gifb2ZmaMcH9S9GmVYjw
W63v5xIFJqegXtj75MM5
=PkqC
-----END PGP SIGNATURE-----

--sF1pDlrqijMhJtKDDI5KGclagFO5AbzKb--
