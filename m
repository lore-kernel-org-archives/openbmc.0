Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="AjbMbFIh"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zV0b3n12zDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 21:24:47 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 36AD8418FB;
 Mon, 27 Aug 2018 11:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535369081; x=
 1537183482; bh=JOcJJsmkGydjm17F3wCr2C/BVjkZGqZqxJ8vU3LvT5s=; b=A
 jbMbFIhO8W7uRYFhsXs6C7wJDtGHHzw/D3b0yYeXtmuXNPGD49ycuhrxpNfyFs8T
 p/9HwzNezaVy2GTAY76RjAP6UL6dF0FPRBbFfqY4aGadd1aKuIsQ5KnaYoUlgsCi
 grACDYACSkQ0QO4ZfMHzuQrQof3sRUpp0ThGYCKi2g=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXjg1YtXkfls; Mon, 27 Aug 2018 14:24:41 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 62E07404CB;
 Mon, 27 Aug 2018 14:24:41 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 27
 Aug 2018 14:24:41 +0300
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
Date: Mon, 27 Aug 2018 14:24:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF"
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
X-List-Received-Date: Mon, 27 Aug 2018 11:24:49 -0000

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF
Content-Type: multipart/mixed; boundary="HSBXjiqBBus0kIzxMr1C0NN819z277bvv";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
In-Reply-To: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>

--HSBXjiqBBus0kIzxMr1C0NN819z277bvv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

27.08.2018 13:33, Marek Vasut wrote:
> On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
>> Currently in spi-nor driver there is a line for mx66l51235l.
>> According to Macronix site, there is no such part number. The chip
>> detected as such is actually mx66l51235f. Hence, this commit renames
>> the chip.
> I wonder if this could pose a problem, since this might interfere with
> the DT being an ABI. But I guess fixing the name is OK.
Well, as far as I understand, in the DT you'll only have "compatible=3Dje=
dec,spi-nor" for most cases.
Anyway, I did `grep -r mx66l41235 arch/*/boot/dts` and found nothing, so =
I guess it's safe to rename.

>> According to the datasheet for mx66l51235f, "The device default is in
>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
>> makes the code act as if the device was already in 4B mode and didn't
>> need the EN4B command. That prevents this chip from functioning on
>> systems where the boot loader left the chip in 3B mode (e.g. if the
>> chip wasn't used during the boot process).
>>
>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>> mx66l51235f (added previously by commit d342b6a973af).
> Could it be there are two variants of the chip, one which supports the
> 4B opcodes and one which does not ? Wouldn't be the first time I saw
> this. If this chip supports the SFDP tables, you can check those.
I was unable to find another variant of the chip. There is only one speci=
fied in the datasheet:
http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203=
V,%20512Mb,%20v1.1.pdf
and it says that the device supports both 3B and 4B modes, but defaults t=
o 3B (24-bit) mode.

Most probably, Roman Yeryomin, the author of commit d342b6a973af, was fig=
hting post-effects of u-boot or some other boot loader that set his chip =
to 4B mode before jumping to Linux kernel.
It is hard to say for sure, though, as neither his patch itself, nor his =
post to the mailing list contained any rationale for the change.

It is for sure though that for OpenPOWER systems using this chip as PNOR =
(BIOS flash in x86 terms), commit d342b6a973af broke host booting.

With best regards,
Alexander.


--HSBXjiqBBus0kIzxMr1C0NN819z277bvv--

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbg994AAoJEOiTWHtbdBeN/eQP/05rQ7tuh+vZj7UvNYVs8jFu
x0zfiOmtR/aKM/yiv45jyIYK1TpoPhgThuf8LC1weeR3tYWT9x7ZTHGqhABxhpQ8
pl/s/dObpb8W+YvMcBBDx/e9oU9iaqRBbtIwv5X5y+OxlLI74egYEspNvZW+NqnB
6WCzXdip31ouDZt/t0cDLxLcY1yTbHOGmTymDbsAHsT3dpiR5SLRJqZtToppwGnD
y5xnZbCkiNs+wDlG0nKsliBsGmA05byLZ59Vkf/HDk38kt13j30WZIHU75AFffOx
JbDjBwtwdGb0mp1RYvI4KnHV5Ab0laVs+VTC4A08d8jfddlMGPU9IV8oSoT05vB4
uji1Pz79iN6xRteDxw91fwqwJoekCEnzZgRWJuiwDCdnIll1QA1UDHhWo04GxxLN
cye3eteUUACktTdBMr6fZLjg4Th/xN5JCKjIQd4P+R6OwifdJbGJUIUZB8WQrz3w
XiVKxXAgkElB+C7K75oVZW8/DpTJ5jw0pmFxhnZZVOuLI2LXnb7afckseurRJiCs
yRaYiZ4oWCK1gxejG4n3O80iILQgayCXkhwzl0tbHGX4e6Gpcw/bHlf/uNMtmnjd
SLaeQPKLoop9SlUtg48k6jqbpemVhxRk0WltJVW/6As+g6hyXz4s6Nv8esbWvHRp
98Lj2gBXfHcchh/OV9pq
=ACFt
-----END PGP SIGNATURE-----

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF--
