Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LwfT0AxT"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41v7ZV6F1GzDqp5
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 19:20:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4AEC0418BF;
 Mon, 20 Aug 2018 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1534756828; x=
 1536571229; bh=DVP6zb+NuTWMy0jbcBAoHv1AzqSayK3Kb79chIyFIhA=; b=L
 wfT0AxTwQp+VbrG/dLMq/CkuDi4C0hpY+MwQV2pP5MfKCFvQKiC4GgGjr4arZg2z
 SY4e2O0HgIuHBb7LcphUHH9ZfOP9cD7W+wA2SdEfD4vu13QL7grv98XvGv3TOU/0
 sJuluFQM1BpiL0VqmN6ty0BusDkyrRJyMxUMcEqAhU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IR_tgCr4mo1; Mon, 20 Aug 2018 12:20:28 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 54057411F8;
 Mon, 20 Aug 2018 12:20:27 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 20
 Aug 2018 12:20:27 +0300
Subject: Re: [PATCH linux dev-4.7 2/2] mtd: spi-nor: fix spi register address
 for AST2400
To: Lei YU <mine260309@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, <a.soldatov@yadro.com>
References: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
 <CAARXrt=5=dgMzYZhLKwP62DDPMx=2QBL8g9+TjUmYUh-MAVdFQ@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <381b796e-102f-5a0b-e62d-bce094eca2a5@yadro.com>
Date: Mon, 20 Aug 2018 12:20:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAARXrt=5=dgMzYZhLKwP62DDPMx=2QBL8g9+TjUmYUh-MAVdFQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tVttpfgXuEOKg9cwZKk6ic3K2c0eYAYuL"
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
X-List-Received-Date: Mon, 20 Aug 2018 09:20:35 -0000

--tVttpfgXuEOKg9cwZKk6ic3K2c0eYAYuL
Content-Type: multipart/mixed; boundary="nInmWD18NXhpNsn1FpxMC1K1o4ROxezwu";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, a.soldatov@yadro.com
Message-ID: <381b796e-102f-5a0b-e62d-bce094eca2a5@yadro.com>
Subject: Re: [PATCH linux dev-4.7 2/2] mtd: spi-nor: fix spi register address
 for AST2400
References: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
 <CAARXrt=5=dgMzYZhLKwP62DDPMx=2QBL8g9+TjUmYUh-MAVdFQ@mail.gmail.com>
In-Reply-To: <CAARXrt=5=dgMzYZhLKwP62DDPMx=2QBL8g9+TjUmYUh-MAVdFQ@mail.gmail.com>

--nInmWD18NXhpNsn1FpxMC1K1o4ROxezwu
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Yes, sure. That was a typo.


16.08.2018 06:34, Lei YU wrote:
> I think the mail subject should be patch linux dev-4.17, instead of dev=
-4.7.
>
> Tested-by: Lei YU <mine260309@gmail.com>
> On Wed, Aug 15, 2018 at 11:15 PM Alexander Amelkin <a.amelkin@yadro.com=
> wrote:
>> According to AST2400 datasheet v1.4 the SPI Flash Read Timing
>> Setting register is at offset 0x14. There is no register at
>> offset 0x94 (unlike FMC controller and AST2500).
>>
>> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
>> index c9cd20f..9ddf24b 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info =3D=
 {
>>         .hastype =3D false,
>>         .we0 =3D 0,
>>         .ctl0 =3D 0x04,
>> -       .timing =3D 0x94,
>> +       .timing =3D 0x14,
>>         .set_4b =3D aspeed_smc_chip_set_4b_spi_2400,
>>         .optimize_read =3D aspeed_smc_optimize_read,
>>  };
>> --
>> 2.7.4
>>
>>



--nInmWD18NXhpNsn1FpxMC1K1o4ROxezwu--

--tVttpfgXuEOKg9cwZKk6ic3K2c0eYAYuL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbeofaAAoJEOiTWHtbdBeN8Z4P/3D+08/4O1aCoOV49e8MuUjb
RvTVzsdD5n1WYAj1tXP3bF1KNVLqpnOauMetEUmLgohj5VfgUs8PkIIE4P+g3OZX
YzJMn8jy/lxDanRTSoQthJLdWWJUHUBkrhB2oXZh7bgY8iRj1ynLxHspCIepmsTK
5kjMUBDAT2een58QehUPhvBgg669kkQa6WkOA7+3Vv057hmBRGm+eknH2hv+dSW7
TvI8Igzuj0ew3wgNIC68+hOMhiBRYZDqjUfHqYJsnsh+oWjJFXanszxC/8J3Tm6O
PkjCQRcQA1gVnodIySPFyBDPWmgD4JzFIFaNArloMMEwqpWbV4SLTSE+w9va10iA
GYq9+/icyaMi018krhOf/k1B2qObz0AfBKvgH/cx1bJddhzITuUppEPUs6iFXt0v
EyOt4MuUEXSmuhFH+ZiONZiSUL6sXS7fvu0vhYfzgwey1bX6c0Uim0fNjUBX4wUU
pUmEWTAeOjxO7hQUbHdjbRsBEpTwwUQBJxfFX4fGHy2PbuJmLJFxoFtOzsEXXbBz
WP4CUdFsdcpu1FuXlZwmtDk60hlnJBD0/7SJ0nwQsj04HWlwKmWJ81RhITaRfH7S
A3hBE0N/Ngu0DG9ske4X5JYQHeBm+O6qHqwnk+bhgsWK3T5ungo945/XGCK9ldHv
ISpUNudkzejfMd9e9bzr
=mr8X
-----END PGP SIGNATURE-----

--tVttpfgXuEOKg9cwZKk6ic3K2c0eYAYuL--
