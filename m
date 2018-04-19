Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="UJiP56ZC"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RgFK63WQzF21Z
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 23:44:05 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D0EB851969
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1524145438; x=
 1525959839; bh=keAMDI2uZUi6AK5oOpxj+/I1drKY8PR91vDvqT0IBwU=; b=U
 JiP56ZCFKdNtqBmOe17zAj1LTzPok1JDIIb7hu+8yBCR1RiFWgxbjDSRjsRhzp5H
 3BvsHhOHPJ6bG6YYb07Y+W7nanHGSRcLT1uMKbMNjGP1ZnwqT75IwFI0bTo5qZPR
 J6UAK3XY7oBDiLTnJedYvyAihx48pZZ0cj0wgYGi70=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsefobMe-4sn for <openbmc@lists.ozlabs.org>;
 Thu, 19 Apr 2018 16:43:58 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 77EE450A07
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 16:43:58 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Apr 2018 16:43:58 +0300
Subject: Domains (was: Migration to new gerrit server is coming)
To: <openbmc@lists.ozlabs.org>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
 <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
Date: Thu, 19 Apr 2018 16:43:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="V06MuddkMU9Xzdst1CS0vr5Sk7dzDqg04"
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
X-List-Received-Date: Thu, 19 Apr 2018 13:44:06 -0000

--V06MuddkMU9Xzdst1CS0vr5Sk7dzDqg04
Content-Type: multipart/mixed; boundary="AzK2EHjE3QwveKqXHnK78q4CvNqIJsvZA";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
Subject: Domains (was: Migration to new gerrit server is coming)
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
 <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
In-Reply-To: <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>

--AzK2EHjE3QwveKqXHnK78q4CvNqIJsvZA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


03.04.2018 18:30, Andrew Geissler wrote:
> On Mon, Apr 2, 2018 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Do we have plans to use the gerrit.openbmc.org domain instead?
> In order to reduce what's changing with this first migration, I'll
> keep the old name but yes, Brad got me in touch with someone from the
> Linux Foundation and long term we'll be moving to something like
> gerrit.openbmc.org.
I'm kind of lost with all these domains...
I remember we have an ongoing effort to move all d-bus stuff from
org.openbmc to xyz.openbmc-project.
Now you're saying we'll be moving gerrit to openbmc.org...
What is the official domain for openbmc now?
Are we going to move the d-bus stuff back to org.openbmc now?
Personally, I would welcome that as I hate the .xyz TLD as it is
meaningless and beside that has some not very nice connotation for any
Russian speaker. I also think that short 'openbmc' is way more neat than
'openbmc-project'.
Also, as openbmc-project.xyz is owned by Patrick Williams (as well as
OpenBMC IANA PEN), and openbmc.org is owned by TLF, I'd say that we must
go with openbmc.org everywhere.
However, I'd like to know the official intention.

Alexander.


--AzK2EHjE3QwveKqXHnK78q4CvNqIJsvZA--

--V06MuddkMU9Xzdst1CS0vr5Sk7dzDqg04
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJa2J0dAAoJEOiTWHtbdBeNaeYP/ip5B4Rt2/eLcJ9khZbGEkk4
tIhQiF4v2c1lue4P8/YzDGVJirhY1y0tJVol4UozGLHXCcrssSo5v/b5lWum4+8Y
tPJWJpjPZZ/+S5TWdrFHlIgGL1iv038+drkTkyYt1VH0GPFy8jJ/Lcuq/LQT40vP
PWTXWKWDvk9s8o0sCs+/G0xtEyhxHDsWs3LzxhW0KRxLKWIH+vyUyBqCTmtDroWr
QTCD/NDeGkPOAvDVRF3e1vzzMsm+qjmkQ2N3N+A7bkMrRS7Untl23ttRr80F+ErL
0T0+xGAT9E4tyxoXU5yJ3SU7rzBqCuzmdAnHi/ZhAeNkr/82pQcv3q21b7eiA2tm
xmFeDN5lv/7rvapVBOofxGx8z/MqcP3dluyDkByl8BTqOxgd/STfyb8vaDyKYtDb
U8CCOQcrYEPntT5JRJ9H/JbbsTi6wVL2EhpWP1JzLOUk9mgmBsX1WYO2WKDZu6lJ
15PYzN6Y6qCrcrmfgy2HQ9kns9Z7vA6WM9aOvI2HvhawcMo32s8t08x+FYZatyXM
dg2oD0l5LJQnEVdDCymt+uSu0nsNRito9lczzBh3u/NVbDy9VTixMb7S4fDGiGE+
J14qiA5j6c199SkH9yKzEHaaHEexTXa3bcxzeTTxcDZM7RPlZw/kM3nJlYdrtLwU
aSqZYxGrQSyAPow630Pw
=L10W
-----END PGP SIGNATURE-----

--V06MuddkMU9Xzdst1CS0vr5Sk7dzDqg04--
