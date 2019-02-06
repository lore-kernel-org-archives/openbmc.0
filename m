Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="gS8pgr69"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vl621LG9zDqPw
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 02:02:02 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 51FCE418BF;
 Wed,  6 Feb 2019 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1549465316; x=
 1551279717; bh=suE50CL8bSQC8IkNFKpJK6xjtrvNllux1z14RIxThbM=; b=g
 S8pgr69zD1vnCcHhyFvIhkqyCyZAbS5NTHhNHYcAUeFGtfoYGsAagE53PJbaF5b1
 Uzu0QMmc5o6lkjGO3tkUs9t1yg+JBFEo3vCKNogi1gNRdCVuPAhLOV4PG+1ABG+2
 jligsvJvnTP7FTMh4ZgZ4LSN+5QL+ebNkTCNHukBIA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGvNAdei56DQ; Wed,  6 Feb 2019 18:01:56 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 41A4441911;
 Wed,  6 Feb 2019 18:01:56 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 6 Feb
 2019 18:01:55 +0300
Subject: Re: Romulus to use Virtual PNOR
To: Stewart Smith <stewart@linux.ibm.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <fdc48c10-5dc1-0fca-7b7c-d150307b9a37@yadro.com>
 <87o97piwcp.fsf@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <5b47c893-274b-2d8f-355c-4f565ddc2579@yadro.com>
Date: Wed, 6 Feb 2019 18:01:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87o97piwcp.fsf@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iK8aKTuTDjsmBqW9EQ2Egz2vuQYivkB0G"
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
X-List-Received-Date: Wed, 06 Feb 2019 15:02:03 -0000

--iK8aKTuTDjsmBqW9EQ2Egz2vuQYivkB0G
Content-Type: multipart/mixed; boundary="SSK9zYgfOdt7cVCYJ8lkEBMut5YvAEmyo";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Stewart Smith <stewart@linux.ibm.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <5b47c893-274b-2d8f-355c-4f565ddc2579@yadro.com>
Subject: Re: Romulus to use Virtual PNOR
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <fdc48c10-5dc1-0fca-7b7c-d150307b9a37@yadro.com>
 <87o97piwcp.fsf@linux.vnet.ibm.com>
In-Reply-To: <87o97piwcp.fsf@linux.vnet.ibm.com>

--SSK9zYgfOdt7cVCYJ8lkEBMut5YvAEmyo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


06.02.2019 3:39, Stewart Smith wrote:
> Alexander Amelkin <a.amelkin@yadro.com> writes:
>> 25.01.2019 10:40, Lei YU wrote:
>>> This email is to notify that Romulus is going to use VirtualPNOR feat=
ure, if
>>> no objections are received.
>>>
>>> ...
>>>
>>> Any objections?
>> Well, the main concern is how it will affect vesnin, which is P8-based=
 (like palmetto).
>>
>> All this virtual PNOR functionality is based on mbox/hiomap, which is
>> not supported for P8 in openpower firmware.
> For various reasons, this is now changing, so you'll be able to do hiom=
ap
> on P8.

Could you please elaborate on this? Some GitHub issues or discussion thre=
ads anywhere?

The problem as we see it is that P8 must be supported everywhere througho=
ut op-build components.
Even if there was no support in hostboot for hiomap being added, we could=
 be able to add it ourselves. But that still wouldn't work with SBE, as w=
hile the SBE sources for P8 are public, they nonetheless require a propri=
etary toolchain to build that, I quote the README.md, "cannot be open-sou=
rced". The op-build framework takes pre-built SBE binaries for P8.

Anyway, if hiomap support is indeed being added for P8, we'd love to know=
 more about it.

>
>> As a result, we suspect that palmetto and (what concerns us most)
>> vesnin will lose firmware update support completely.
> I think this is a valid concern, and I'd be concerned if there's tight
> coupling between VPNOR and the firmware update APIs.

So far it looks to me like there is such tight coupling.

Thanks.

Alexander.



--SSK9zYgfOdt7cVCYJ8lkEBMut5YvAEmyo--

--iK8aKTuTDjsmBqW9EQ2Egz2vuQYivkB0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcWvbjAAoJEOiTWHtbdBeNRksP/2KcQzLxy9KOaA0IKL57LQ5K
S1CTgIPfMS5T2wzS4vUaS6Edn2ApcdaTW1Qm8CTd7F723w3bnzZyi2viEXQgp1tT
OJ3w7NOpPryXHECUkcKKmcF1GeYwpkDw5HkTFHW2CNG3WfuaMUxvszqgPPmqVrNR
5NUzuX+AjXipuo9R1Yu8mmcebooFmQ0czyUHoB3mZ5vmS6wFpC+kPIX6M4IMo0Wh
DgsrIdYCL/2dZe+4plndqM1Xjv17pBraK4qLxdJjQ5cHLD1ii3GHWCPGixu2bEHs
28OM8NhD8vpIsrXNRMbmbDyA5kBN/VyaTuA1UEx1lZBgHX06+cVvKqY7nZnTTtuv
k+4cMfZvGAHMoGVm2iGHQ8tIBB0IX+75bNb0jJB2LkzeXJOUltG5pGn795bcfpmz
Ow5QtZZYVbWIy/jfv40YkXu8p0YZOdBDltWJuT0y0SkUEYMOXqDBxCq+e4px/eKQ
M4mvvUzT5iKps+f2swwBLPoPT/V2WbBNxUbHR0FXyex4ZTw9kw+zVJgYqJTKQqDi
XILgCP6+FBKV5QiVyopz6wazNO+ib1sELj6A4Zddkf0iHv+EkRmqiXFzxCLvGDoj
tsm2b2yoHQ3XYCWWxCNtBuEnj4hlPZHfOy2NDLNZ+OIE/lg1wFX8TISBeWSF6j7A
BmS8YXlGxrIjiyOhsi0D
=TOCw
-----END PGP SIGNATURE-----

--iK8aKTuTDjsmBqW9EQ2Egz2vuQYivkB0G--
