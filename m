Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="X1UQ0DOq"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431Z7q4KHmzDqLC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 22:38:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 91A7F41953;
 Fri, 23 Nov 2018 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1542973102; x=
 1544787503; bh=MxrAYEY1v5ywvS//QsD3Av6TO0AzV0HLZ7z/u9sbO1E=; b=X
 1UQ0DOq5DDnKXDCJBfGdCdPMcEhc078rgjRvW0rGccdtv/YXnGEU5hN5m7QYHC1w
 SfwYA6fwZuz15A+HnXiF2ICYNYliFRC3Y0gbs9H5cDjuDpFOWce4eJp/j4lVgLnD
 MzTTJ3MzBwY0DhHdlqzk8jbhW1olk+wsZ+sVZOnz8w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJuUvTKSC1uX; Fri, 23 Nov 2018 14:38:22 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 299184194F;
 Fri, 23 Nov 2018 14:38:22 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 23
 Nov 2018 14:38:21 +0300
Subject: New IPMI spec (Was: IPMI Adopter's agreement)
To: James Mihm <james.mihm@gmail.com>
CC: <openbmc@lists.ozlabs.org>
References: <19fe4e16-c014-3af8-ac1f-a73b446b379e@yadro.com>
 <CADy_Pt1P0Yv_GmHyHPsv6Wx-ML4JoYQ-HhOhc0+Dx-wTiKx3WA@mail.gmail.com>
 <06f38ed2-8963-0834-c786-aeba40fa140d@yadro.com>
 <CADy_Pt0eQR5ZdRkjwc=5t4yB-YGbzfT9c=BFUrpgYnQ317rKZA@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <c6f86ba5-02ab-53e3-fa42-4b7d5fdbeed6@yadro.com>
Date: Fri, 23 Nov 2018 14:38:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CADy_Pt0eQR5ZdRkjwc=5t4yB-YGbzfT9c=BFUrpgYnQ317rKZA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QCtPLcDCikKOnQSRtKDJ08cwHADSh7vr1"
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
X-List-Received-Date: Fri, 23 Nov 2018 11:38:33 -0000

--QCtPLcDCikKOnQSRtKDJ08cwHADSh7vr1
Content-Type: multipart/mixed; boundary="xkVa69ucsjfJ6q2dlaL0v0jOW9Ns5qfSU";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: James Mihm <james.mihm@gmail.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <c6f86ba5-02ab-53e3-fa42-4b7d5fdbeed6@yadro.com>
Subject: New IPMI spec (Was: IPMI Adopter's agreement)
References: <19fe4e16-c014-3af8-ac1f-a73b446b379e@yadro.com>
 <CADy_Pt1P0Yv_GmHyHPsv6Wx-ML4JoYQ-HhOhc0+Dx-wTiKx3WA@mail.gmail.com>
 <06f38ed2-8963-0834-c786-aeba40fa140d@yadro.com>
 <CADy_Pt0eQR5ZdRkjwc=5t4yB-YGbzfT9c=BFUrpgYnQ317rKZA@mail.gmail.com>
In-Reply-To: <CADy_Pt0eQR5ZdRkjwc=5t4yB-YGbzfT9c=BFUrpgYnQ317rKZA@mail.gmail.com>

--xkVa69ucsjfJ6q2dlaL0v0jOW9Ns5qfSU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

James, do you by any chance know if there is any work in progress on a ne=
wer IPMI specification or is it a deprecated standard and will not be upd=
ated? I'm asking mostly because of https://github.com/openbmc/openbmc/iss=
ues/3417

Thank you.
Alexander.

20.11.2018 20:42, James Mihm wrote:
> I've refreshed my question internally, and expect to get a response nex=
t week.
> The person is out of the office until next week.
>
> James.On Mon, Nov 19, 2018 at 4:35 AM Alexander Amelkin
> <a.amelkin@yadro.com> wrote:
>> Any further info on this?
>>
>> 26.06.2018 21:49, James Mihm wrote:
>>> I'm looking into how we need to proceed regarding this question
>>> internally here at Intel.
>>>
>>> James.
>>> On Wed, Jun 20, 2018 at 9:33 AM Alexander Amelkin <a.amelkin@yadro.co=
m> wrote:
>>>> Just wondering, does OpenBMC / TLF have this fine document signed?
>>>>
>>>> https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-home.html/=
#adopters
>>>>
>>>> Or does each vendor need to sign this separately?
>>>>
>>>>
>>>> Sincerely,
>>>> Alexander.
>>>>
>>>>
>>



--xkVa69ucsjfJ6q2dlaL0v0jOW9Ns5qfSU--

--QCtPLcDCikKOnQSRtKDJ08cwHADSh7vr1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb9+atAAoJEOiTWHtbdBeNW5EQAJ52awdREf7JaexEvDUSOm9z
VHOHyxUM7Gs3WxiEITkBkhwZaGoR1kyV4kwBNASzGtRlP7APfW13PtksPngt/sAp
BoGBKBZmduEk8qCSyw/3xAwEuEixOyvDubuYOFSbmLpwB+ObnDYBO2dcwzqce/G8
lZTN2MQgUUVkI2d76bo3ELrsOkJ1GCgPPZVHrGJ8/WkXlDVIS5Bvczl9QMUvPxbV
lFBc21LY9w5ebaWL3PD642FB5c3Jr9XmRaCLEpKTDDXJwrhKv97aSuKaEiIa03nH
JfFvxVXf+N5NDZK1nTJjWlYTOufdayiyapR3ivBNFZ8jxdzMgxrnTL4iGxK0cZg2
auNIiQBBrwQGmdRHDRqjiCy9KrZ1MB7NtxOSBBNKRZ/N5uo9FG9fhzjgOze4UzIb
9UIQS/L86KZhm+cxD8Zxp2QpsDgl0bkwdxsD40Vk+7xGWlIUbbFwpWwsoR1Vvt9G
KzlZsiUTRSpMuO5ZBSTmKdGssOkZYCWSrfv6KY5KxVAx1RDdw7wNDKUG6jA2UGbA
uQA9QLjVugx7C0OYgC27A2xquwDGh21HRn2yXt1nwiSMm9pFJfunG7u0xpkwEF+u
e53+/LYgnTjsq199edlsE/NT5y4cMxdn57u0jZLE7G2rfvU4O+oxsR0P9KpyQSAx
bpnKR6jhHBFGKIvxVDzA
=jjrj
-----END PGP SIGNATURE-----

--QCtPLcDCikKOnQSRtKDJ08cwHADSh7vr1--
