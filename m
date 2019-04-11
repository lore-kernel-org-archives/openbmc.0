Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="be7+Vxv0"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fyvB5HnFzDqQX
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 21:08:37 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 84D20419A0;
 Thu, 11 Apr 2019 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1554980909; x=
 1556795310; bh=TqDCWc8cVSymAEx81VBiYfhXpH863e1imZoFaWI1Zj0=; b=b
 e7+Vxv0x7+pmsP3P0MgPGVpdO+yk01IqnPFuORwhjY0aKKT+sqiy1h4PZFlIueLY
 UrU2zwS8hkoH1R/4wY+Fer9307x/eQwMJ0mzT9wjUInac+cZH0p++fMCalwz0Pcw
 1it+UbWDD+xPpsvNMfo0Gt8t2+lQFgcLsBpSQc3uA8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dqZkU1SG7iw; Thu, 11 Apr 2019 14:08:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3D1264197C;
 Thu, 11 Apr 2019 14:08:29 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 11
 Apr 2019 14:08:28 +0300
Subject: Re: ipmitool recipe update needed?
To: Andrew Geissler <geissonator@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
CC: William Kennington <wak@google.com>
References: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
Date: Thu, 11 Apr 2019 14:08:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lZ57ZDgbaN1O04ZHYwFrROxdV4dwvYxMk"
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
X-List-Received-Date: Thu, 11 Apr 2019 11:08:40 -0000

--lZ57ZDgbaN1O04ZHYwFrROxdV4dwvYxMk
Content-Type: multipart/mixed; boundary="Qg6ATJ5nd4G8UWsu1RmiTJpfZpYhz8uEU";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: William Kennington <wak@google.com>
Message-ID: <b5501dfe-4b78-adb6-73e5-1b07b3d35d1c@yadro.com>
Subject: Re: ipmitool recipe update needed?
References: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
In-Reply-To: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>

--Qg6ATJ5nd4G8UWsu1RmiTJpfZpYhz8uEU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi, Andrew!

Yes, I've seen that recipe and planned to update it, just didn't have tim=
e to. You may do so yourself if you want.

Releases are automatically packaged by GitHub according to tags and the t=
ags in the project are like IPMITOOL_1_8_18, so the packaged release is h=
ttps://github.com/ipmitool/ipmitool/archive/IPMITOOL_1_8_18.tar.gz

For future releases I planned to continue using the same tagging scheme.

Alexander.

09.04.2019 19:02, Andrew Geissler wrote:
> Hi Alexander,
>
> A while back we had some intermittent CI failures when
> trying to retrieve the ipmitool package from sourceforge.
>
> The link for ipmitool on sourceforge shows it's been moved
> to github. Are there plans to update the recipe upstream to
> use github? William noted in the infrastructure workgroup that
> you'll probably have to provide the package in the expected
> format on github for it to work.
>
> The recipe is:
> meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
>
> Andrew


--Qg6ATJ5nd4G8UWsu1RmiTJpfZpYhz8uEU--

--lZ57ZDgbaN1O04ZHYwFrROxdV4dwvYxMk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcryAsAAoJEOiTWHtbdBeNC04P/je9jrO8uZTbIceSeg+F8c0t
YsWCF/qqurADhT3JrcA+p2SJpkjCbW1D5BV3tqjP8hecm1eX9dEPBuGSy0m7mA4C
LthtS2OCiiTfqERRzlazo494L09qMJgoKdQdNBf+N01wgwGzNHaHojocaT4wdm0I
nRp71snV4f26diIANjezlyYGi5XzfRn5A/kEX4/gXblnIyM/jFNzLlrAIv89wsh0
/Vwg5TsESBw6UWqSozwfVyostMGZjTRhcQHpLhtRhVl7hrO1BgeGDzJl+T14B09o
bKLMr8CfV+3uij+oPKmfQfpWYUWfPw/d077B5V2d3DAML1Q04fkrvy5rHPytBl7e
lffxLHvcIH0dyR8ola/CTWt7ZTzME3+by6KBj9/zpEI9eHEgZutSyWUSbJ1ERbAZ
gEmJITtafe6lYL+V9KYxkOJ8hyOCWQEydaOXFv2YMxHAqC7pnOLXY4SnsZiDcoet
9xu2VCIDkynLk8siD0Nd/WTdkDDwFfyvVh1fQbAbYcyx09mPbLOK2T2KRd9xWC6R
XfAOvlOtSHeyO4fydhP2JFQYI+O50BODiDoOcifJcu9IHfLyfxBFJrCtX59B0/WS
91iIipD/jY8+i54LlwT55UQ0e2GgvNDbsMzHqpb1PDRyIsUPNbf/KK50rPfQdzT6
zOr//CCxf9Ym6hRvVONH
=uhWe
-----END PGP SIGNATURE-----

--lZ57ZDgbaN1O04ZHYwFrROxdV4dwvYxMk--
