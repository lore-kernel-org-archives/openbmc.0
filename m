Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="qf7aJW4u"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442yx9325gzDq5j
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 20:19:25 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BA0FC418F9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1550481559; x=
 1552295960; bh=YaOjl7xv+tieqO7hfgF55BgBZlXlutaAYNPCyf3Am6g=; b=q
 f7aJW4uhfbifTgjX2aerERiZLa5rcIy5ZkJlApDq1x+zdfiq8sOlQYU2ocehGsL7
 8AecArjJ+y5j+PiSXwRG6UnElW6i8DBNUq9+QjaP6ox1RtSlRrWDMetEFpECRd5q
 QKThDXnyFLV2TTYsdLK328J0p+ou9WBtGa/Zh3+Uog=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6lfFvP_t8Dl for <openbmc@lists.ozlabs.org>;
 Mon, 18 Feb 2019 12:19:19 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B0F5141896
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 12:19:19 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 18
 Feb 2019 12:19:19 +0300
Subject: Re: GUI translation bundles
To: <openbmc@lists.ozlabs.org>
References: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
Date: Mon, 18 Feb 2019 12:19:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ffGSITfjRQSAN2BV4e2jOjm9YXafW0n47"
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
X-List-Received-Date: Mon, 18 Feb 2019 09:19:26 -0000

--ffGSITfjRQSAN2BV4e2jOjm9YXafW0n47
Content-Type: multipart/mixed; boundary="10eoSRTxxTzGWn7caTfiPtG5uibiDuoqC";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
Subject: Re: GUI translation bundles
References: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
In-Reply-To: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>

--10eoSRTxxTzGWn7caTfiPtG5uibiDuoqC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi, Susan!

15.02.2019 23:17, susan jasinski wrote:

> I=E2=80=99d like some feedback about how to breakdown translation bundl=
es for the GUI.
>
> My initial thought is to create a bundle per panel since companies
> have the option to pick and choose which upstream panels they want to
> use. Would this be an overwhelming amount of bundles? Does this idea
> scale well as we grow the number of panels? Does this scale well as
> new panels are added after existing panels have already been
> translated?
>
> In addition, there could a =E2=80=9Cglobal=E2=80=9D bundle for navigati=
on and header,
> Should this include words/phrases that are common across many panels
> such as =E2=80=9Csave=E2=80=9D and =E2=80=9Ccancel=E2=80=9D?
>
> Also, should GUI notifications/messages be in their own bundle or put
> into their respective panel=E2=80=99s bundle?
>
> Can you think of other factors that should guide this decision?

Are you going to use some ready framework for translations or are you goi=
ng to develop a new one?

It would be great if the solution provided an option for quick language s=
witching.

I once implemented such a solution, it used a json map of English strings=
 to local strings. All translatable objects had a special class name, and=
 the client-side Javascript code used that class to find all to-be-transl=
ated objects and on the fly changed their innerHTML using the map (saving=
 the original content in an object's property). The con was that the impl=
ementation was only able to process simple strings and couldn't be applie=
d to objects containing variable text (e.g. values embedded in text like =
"You have 12 new messages"). The problem is that different languages may =
require the variable part at different locations within the string and al=
so may use inclinations, so you can't just break such strings apart and t=
ranslate "You have" and "new messages" separately because the translation=
 may not just require writing it like "12 new messages you have", but wil=
l also be different for, say, 21 and 22 messages. At least for Russian la=
nguage the latter is definitely a problem
to think of: we'll say "=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=D0=B2=D0=
=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95", but "=D0=
=A3 =D0=B2=D0=B0=D1=81 22 =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5 =D1=81=D0=BE=D0=BE=
=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=AF". I believe other Slavic languages, =
and at least German and French are also affected by similar problems.

That also concerns your question about "common" phrases. What is "common"=
 in English, may differ significantly depending on context in other langu=
ages.

I implore you to not forget about such peculiarities. In the past I've ha=
d issues with some software packages whose authors didn't think about tha=
t, and it was a pain translating those packages.

As to bundling, I think that if something is shipped as a separate bundle=
, can be removed or added, then the translation data must go along with t=
he rest of the bundle. The translation engine however must either be a se=
parate bundle per se or be embedded into the core of WebUI.

Alexander Amelkin



--10eoSRTxxTzGWn7caTfiPtG5uibiDuoqC--

--ffGSITfjRQSAN2BV4e2jOjm9YXafW0n47
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcaniXAAoJEOiTWHtbdBeNpdUP/2YJ+Ku/fRqIW5Rs6kMMYXlk
sq8H+9402w2W421zoKWwor9cfgiUpQ1Ey2Zy3M0KDA4Mv4dNcKmMFvAuBV+jg8Td
U1b62yiA+tWmBZM6xdN1mOG2pNlCOqW3fZrNstaw9LDZWjJWdXzmvryaQnhJ68v1
MVcX2iFvZ/oTxUp3Bux0xcgM04R+5iwcJ9f1+qKmoTAmDqsC5BhE3u7SXA8C1lvK
0cgGBPigBmW4gZFPPrtV6KzDuOWgEwqQVB5Z6FkLOCdLTNSDqKRO/7Z4Bai5+bjD
3gob7o7Ex909Jcj78SHetHKLUsCPZD87ZuHO+0xGsPIWjIpIgI3kRW1FIT4CweAm
plgSCZ7taEiuniG21J/7Epxrzasn31ISTvstzJaRH6bKo0u6FkQTDh3wS3dfAabC
OxP0IaEOgLSvBBp6IufYO0xbUWRB4h4IawIxdg006UFoNCqevwloWkR4M/CT+qDa
w+H8gxKz3NBdeSzw5bSrDwETvBoBljAj0U5N/umyIBPvj1+RW0lDSZBDBDMhyigk
hKgiMxM2e48wkQ0UWpZgXkiS0+SMkzO7o605fmv7cb/Gdhmewwko87iJZuYt+mhU
QnJHmYNWDzAygLu5eateRsjqxOBMh3LyYsEh2SpeSFwfWXR5wGvXKHPHYlNobTzK
cSGpO6FKS4//FZuTLJpJ
=ZCRx
-----END PGP SIGNATURE-----

--ffGSITfjRQSAN2BV4e2jOjm9YXafW0n47--
