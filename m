Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="bSrUfe/U"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Kdhs0FmzzDqjT
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 02:14:20 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BFB2D41972;
 Wed, 19 Dec 2018 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:references:from:from:subject:subject
 :received:received:received; s=mta-01; t=1545232456; x=
 1547046857; bh=X4GawfnBJDW8akEzRgwKX4DvpUUUJDFt/KuuEkMPXLo=; b=b
 SrUfe/U9m32c7KUZPDzDRC4N2Ksp15F80wJqWiYbveuR4gfO/aTQELQtEeQZdiEF
 rgce495+otIXXmUMAvIyuxp5MCqH4F/Sokth2wCoZlmcH36JdKcAeylvT4V5bLsU
 G+WF1iBlMdeyCeJrcmQJefOsETYxuXlxYShFCrbuXo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T51VeuDZMKGV; Wed, 19 Dec 2018 18:14:16 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F36F341968;
 Wed, 19 Dec 2018 18:14:15 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 19
 Dec 2018 18:14:15 +0300
Subject: Re: PLDM design proposal
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Jeremy Kerr
 <jk@ozlabs.org>, Emily Shaffer <emilyshaffer@google.com>, Supreeth Venkatesh
 <Supreeth.Venkatesh@arm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, <tomjose@linux.vnet.ibm.com>
References: <1f371684-8db6-3a02-cefe-d073856599ab@linux.vnet.ibm.com>
 <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <9850149e-a498-c61f-6aca-9d6cf17cde67@yadro.com>
Date: Wed, 19 Dec 2018 18:14:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8vZIhpYJo0hOwc57YUaNoL9iVhYxp39Vx"
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
X-List-Received-Date: Wed, 19 Dec 2018 15:14:22 -0000

--8vZIhpYJo0hOwc57YUaNoL9iVhYxp39Vx
Content-Type: multipart/mixed; boundary="Pivy94nIgIYK88TMLaGPGWCnukFVcY2Qx";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>, Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjose@linux.vnet.ibm.com
Message-ID: <9850149e-a498-c61f-6aca-9d6cf17cde67@yadro.com>
Subject: Re: PLDM design proposal
References: <1f371684-8db6-3a02-cefe-d073856599ab@linux.vnet.ibm.com>
 <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>
In-Reply-To: <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>

--Pivy94nIgIYK88TMLaGPGWCnukFVcY2Qx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

18.12.2018 17:36, Alexander Amelkin wrote:
> 13.12.2018 19:30, Deepak Kodihalli wrote:
>> Hi All,
>>
>> I've put down some thoughts below on an initial PLDM design on OpenBMC=
=2E Thie structure of the document is based on the OpenBMC design templat=
e. Please review and let me know your feedback. Once we've had a discussi=
on here on the list, I can move this to Gerrit with some more details. I'=
d say reading the MCTP proposal from Jeremy should be a precursor to read=
ing this.
>>
>> # PLDM Stack on OpenBMC
> Hi Deepak!
>
> Thank you for bringing this up.
>
> PLDM/MCTP look like a logical step in context of bringing in RedFish.
>
> Are there any ready Linux-based tools for inband management (similar to=
 ipmitool via /dev/ipmi0) for PLDM/MCTP?
>
Also I'd like to draw your attention to our need of keeping OpenBMC compa=
tible with OpenPOWER Firmware for P8 family. If you're planning to switch=
 to PLDM/MCTP for BMC-to-PNOR communications, we'd need support for that =
in PNOR for P8.
P8 is going to remain our main CPU until P9+ is released, but we are very=
 interested in resolving the sensor count limit problems. We're currently=
 developing a workaround for IPMI in context of https://github.com/openbm=
c/openbmc/issues/3417

Alexander.


--Pivy94nIgIYK88TMLaGPGWCnukFVcY2Qx--

--8vZIhpYJo0hOwc57YUaNoL9iVhYxp39Vx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcGmBHAAoJEOiTWHtbdBeNmbEQAJrvzv7ijrYp3ljanmCtgAkS
1vulZ4ySX27P0FWkXCo5nIm+oEP+m6/tXUH78TUA6dTrKneLuqeCLId1KryYkUy6
ks+5C9B7jPYao0dC/r6nAp9OCP0wwS6P/zZvb+go6bax1T0nsvNofJ7BFnl+PpzO
gkaWF75Veo+hBzJIhhV0rOmSKry/DoiBggKla+R+bVz0b6IGjR9be913ttlrk5wQ
1pPDDfETcbpGSp35W2tbnTTGFIRHaTY16GmqIuRfvWojJb3pCpKcncNT25IAGWw3
6KMbk93hDrQ2Mtpa/wPPXQWevU7apd/gzuJbRJ38T79bPbHhSQ2H1YQCKId6p1W+
g6ar9klYKHZB5qxIYYVTZWsJZgYB1VBrAwzApgbGjEXaAPpbJ0hMEeI8thH294e3
U7v3mbZR5EbsFtWHQG6ygEeYjBuFXNYXvD+Cuv6SYsXMcioyR6FDuuK9Rh9f7BEL
m24/FXgFFDM7jualCsadYPaCv+Omo33r2mxEC4pvOcJahyaMJh166ztKPN8oykio
IyMpPBRI7OrA4ObPPH6Kim9GE2mRUgSTlP/fDU6Nvhzx0W6BSl5U2ilJeM50XLCj
C7GroGshbMfSwosipGoJiwCHqcSWiGQhYqC9CBcVa/LSHAw5o5s5aslT8H9+9X/J
v7e3IH1cufuepHDKiVWr
=xDBR
-----END PGP SIGNATURE-----

--8vZIhpYJo0hOwc57YUaNoL9iVhYxp39Vx--
