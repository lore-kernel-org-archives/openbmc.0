Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="IvyO+7ZP"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wy8y5rJyzF2Py
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 18:23:13 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 751F541900;
 Thu, 23 Aug 2018 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535012588; x=
 1536826989; bh=Zc/1Tasl9oJzTymiemGAm+vlO6b4mL2B0XozjS6YZ6o=; b=I
 vyO+7ZPLFbo5RhFqEvPl7r/eJNEEl5Iq2+VdQndED+xmdmWhPoAQjV2Nq/0saqmA
 CNr/wHNsUpuSfPjbWY23EomIgFSZ/JLQCng+1tKB3YeRJHp5GS9UJr/xPaFaDM2s
 zPp7r8WQEbyimcKAe/KNo1C0M8BYd7zZ1JB1Zlx7EY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsyZahxcqZrp; Thu, 23 Aug 2018 11:23:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3887A400FD;
 Thu, 23 Aug 2018 11:23:08 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 23
 Aug 2018 11:23:07 +0300
Subject: Re: Proposals for commit log policy
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <89b9dac7-b4ae-6eb7-c364-f7788b86b59f@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <a4d703a6-b725-eb3d-798c-b040b00c00a0@yadro.com>
Date: Thu, 23 Aug 2018 11:23:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <89b9dac7-b4ae-6eb7-c364-f7788b86b59f@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EA5RYQ1hVL88Mj20q4RVOG7q3Fdq6kaOh"
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
X-List-Received-Date: Thu, 23 Aug 2018 08:23:16 -0000

--EA5RYQ1hVL88Mj20q4RVOG7q3Fdq6kaOh
Content-Type: multipart/mixed; boundary="sumiNOUHf5WPum2O0Mv601FTyXmVrxSaB";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <a4d703a6-b725-eb3d-798c-b040b00c00a0@yadro.com>
Subject: Re: Proposals for commit log policy
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <89b9dac7-b4ae-6eb7-c364-f7788b86b59f@linux.vnet.ibm.com>
In-Reply-To: <89b9dac7-b4ae-6eb7-c364-f7788b86b59f@linux.vnet.ibm.com>

--sumiNOUHf5WPum2O0Mv601FTyXmVrxSaB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


22.08.2018 18:01, Gunnar Mills wrote:
> Hi Alexander,
>
> On 8/21/2018 7:29 AM, Alexander Amelkin wrote:
>> Thankfully, for linux-obmc version bumps Patrick Williams and Joel Sta=
nley do a great job by including the 'git shortlog' output. Unfortunately=
, not everyone is following this rule for bumps.
> The autobump tool is here: https://github.com/openbmc/openbmc-tools/blo=
b/master/infra/autobump.pl
> Could you enhance to have the =E2=80=98git shortlog=E2=80=99 in the com=
mit message?
Thanks for pointing me to it. I will enhance.

>> Now for item 1, it would be great if we could have a mandatory "End-us=
er-impact" line/section, like these added to the following real commits:
>>
> I really oppose another field/section in each commit. We already have a=
 "tested" field. What happens when someone else wants a field for what sy=
stems this commit effects? This might be a bad example but hopefully, you=
 see my point. :)
I see your point, but I hope you feel my pain too. ;)
Technical description for developers is great... for developers. But is t=
otally useless for end users.
What does an admin have to do with all those framework-related commits or=
 dbus optimizations?
They want to know what has changed for them in the new release. And extra=
cting that info from commit logs as they are now is painful and takes at =
least a leading software engineer. In my experience it takes about 3-4 da=
ys to "compile" the current commit logs between releases. That is, read t=
hem, comprehend them, ditch pure technical commit messages, translate com=
mit messages that actually change the user experience from programmer's l=
anguage to admin's language, and as a result of all that produce a docume=
nt useful for admin end users. IMO, that's a waste of time and a very bor=
ing activity.

Alexander.


--sumiNOUHf5WPum2O0Mv601FTyXmVrxSaB--

--EA5RYQ1hVL88Mj20q4RVOG7q3Fdq6kaOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbfm7rAAoJEOiTWHtbdBeNGEwQAKXPG1ds/1ouDW5nTAEMbDqs
fQWPm0P5if2vHigH52MWGX+QT5drifkTvPr3jveCA5qMoRQdMdw9tPOqqQI3sprX
EopVeEbN4y3f7Tsc427e+kw43SYcIbKDTl98ngM8yagy+vR/04ThLti1DZyigsVJ
Yo4HU4mCj/OagsU52VUMoSZ+WEfowucKI+Y5aama9f6WadNWX68Iq3Oc7rFlrUYn
eZz18JeMt3Fb4o4D21W7vBuwD4qIQ9R7UbPCxveO3Ze+7P9/57lZRjSV6w62C8YE
LSNtHQBoo0Lfg5n1aqokEZacisfRIj/BuQ+nBfBn87PcGovPcAAHG/1KAJ2N44Yq
vzsA++U2BhFQ/zLf5yTk+0vNbyKFxn42d4gDE2kFzaYBqex6xrLHGLX0OQh8q8IR
zeB1YBeSTC1a1WI5ozclFDix6+/SDp6CW+QxOto8pE1a/ktqOqupwvee6zk8ON+q
gVNFm/cCa9ZoiggmDSKXgBZpS4pHOYM6g1WXLAJp9ybnUkHGtjQs2v6phhGQggR1
NmmYoVai+C+U2DQLbLFJjAuCTHraN+35Nm3Y3HWJgXXXA10kyLjgprpDP/JWh8Rp
P3XdJNubkrowdG4Vd/1VRyhdKUefxbVlTRoJ1QA42/NDc3Zmh/Lmy9rMQoexhqJB
9x4sdfgjtfff8cP4KUYE
=VOXA
-----END PGP SIGNATURE-----

--EA5RYQ1hVL88Mj20q4RVOG7q3Fdq6kaOh--
