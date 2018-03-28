Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="EEnDGQeG"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40B8gd17lkzF2Kx
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 01:01:32 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 437D350F7C;
 Wed, 28 Mar 2018 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1522245683; x=
 1524060084; bh=QUYtnlIgpcPqteFHmCqR38bEI2Xt5bmK2sFuRDksLRI=; b=E
 EnDGQeGCkvjBJf6LhHuLaEnC8ELhhn5DrbeMXzy9kcTwri/kM7lflaW7OI4U/DFE
 ntZ5qEbXIpZAq8yxuk+ZwBguUOM+PcSMbeDE9Ad0QCR4FHbGIaLmcJlA/EKKiJ8M
 0bSC++1pY8a5M+jEjlmvWegg1raQr5lzWcRxheALVg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOGtkHJnD42O; Wed, 28 Mar 2018 17:01:23 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 74B2A50C4E;
 Wed, 28 Mar 2018 17:01:23 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 28
 Mar 2018 17:01:23 +0300
Subject: Re: Implement IPMI POH functionality
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: <openbmc@lists.ozlabs.org>
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
 <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
 <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
 <19186981-00B2-4BA6-AB80-890F374A2D97@fuzziesquirrel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <21a33e55-4372-7af8-4ffe-9848662a82b2@yadro.com>
Date: Wed, 28 Mar 2018 17:01:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <19186981-00B2-4BA6-AB80-890F374A2D97@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w9R97wdhKopZ6wxaJ111bXyYEU0KD5IMg"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 14:01:34 -0000

--w9R97wdhKopZ6wxaJ111bXyYEU0KD5IMg
Content-Type: multipart/mixed; boundary="m5S3Zv2tmd7SKKcrTmQgZkZSxXHvtWffe";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <21a33e55-4372-7af8-4ffe-9848662a82b2@yadro.com>
Subject: Re: Implement IPMI POH functionality
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
 <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
 <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
 <19186981-00B2-4BA6-AB80-890F374A2D97@fuzziesquirrel.com>
In-Reply-To: <19186981-00B2-4BA6-AB80-890F374A2D97@fuzziesquirrel.com>

--m5S3Zv2tmd7SKKcrTmQgZkZSxXHvtWffe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

28.03.2018 16:38, Brad Bishop wrote:
>> On Mar 28, 2018, at 8:56 AM, Alexander Amelkin <a.amelkin@yadro.com> w=
rote:
>>> On Mon, Mar 26, 2018 at 5:00 AM Ratan Gupta <ratagupt@linux.vnet.ibm.=
com> wrote:
>>>
>>>     2) Don't update this property for the chassis power off duration =
and
>>> update
>>>     this property when the chassis state changes to PowerOn.
>> I believe, we must follow the IPMI specification, which clearly states=
 in section 1.7.28 that the POH counter is:
>>
>> "to return a counter value proportional to the system operating (S0) p=
ower-on hours"
>>
>> It looks quite clear to me that this is similar to a car mileage meter=
=2E That is, a means to identify when it's time to do some servicing and/=
or track warranty.
> Agreed.  So option #2 then Alexander?
Yes.
>
>> =E2=80=98Clear=E2=80=99 or =E2=80=98Set=E2=80=99 commands are not spec=
ified for this counter. This is because the counter is most typically use=
d for
>> warranty tracking or replacement purposes where changing or clearing t=
he counter would defeat the purpose.
> So I take this as you don=E2=80=99t feel a factory reset should
> reset the counter, at least, certainly not by default.  Agreed?
Absolutely. We may want to have an OEM command to reset the POH counter,
but I would prefer to only have a special tool available via shell under
root account, and not let this counter be reset via IPMI or REST.


--m5S3Zv2tmd7SKKcrTmQgZkZSxXHvtWffe--

--w9R97wdhKopZ6wxaJ111bXyYEU0KD5IMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJau6AyAAoJEOiTWHtbdBeNj70QAIUdOUkFP10h8sGOEvYjF45M
lHgF0THzyyhuertRCSfR+pNP3G1MKLgIm5F52B9C5FludGH9DmBdsWxDxGCeHwx0
d6gylWhF2lHLNidAIT7T0Y2DtRvc6iVq75ugrotneZuERM/mM38NGTpY1ApfzasE
7DB/VhqV3I6fGdaqOIZ93RlxZLPDzooJxytHA6ZWUjWMpqUoMyiAr1JGZGMAB6YZ
r+MwIj+YrX9cYrj+zkSUqpMBLO5EqaFD/5wquJ2fyC+EyQRri/6jTEGOXvaM/Jp/
ZzLOHCTsksuBs1BV//IU850FPIbMA3wT71+BpCEV+5NhxmqyInQhOuoczD8b4ee/
S5IGky7ikWHXhC4EpWIbmlvRRuQ8ZR4lzGSB7SCO9yV0E8vJWC3Dm6pBWH83zI0y
SrxOY8gBdK1OZV/G+JUln3wYs5zvimHKVKO3T37YHBU0qt+ur1QjvamGAvtUinw2
kL2KZf4dIYc24Vf2f9tHP65Mx11pk1u3Y6AUJHLaHUM/OOrcH+8zdov/HFPNGz1h
9o8vrlsnYmg9tkHhUEsyRFu28t+kV3+fmQ26WLvBXAOILCxBKTvGZYoKYiq3jXfU
fKYMKEyvFTl4AhOI4TFV3K+wo5GbykjiNKOsX4foaSv5dSL241m/s12RCQFigHC2
RvfOw4TTM/0saCpBmIch
=Prpy
-----END PGP SIGNATURE-----

--w9R97wdhKopZ6wxaJ111bXyYEU0KD5IMg--
