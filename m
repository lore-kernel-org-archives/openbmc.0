Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="n5Rqa5vz"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420m7l3Kq2zF31P
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 23:05:23 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 395BE4120E
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535547919; x=
 1537362320; bh=Kulft07fU4WQt/0iTs8Fbci5W0qhpUCmO7e626232+c=; b=n
 5Rqa5vzuZk1WMvZiHOHy4MBTLi35Sk7cxqxyr28ykcC/czyyzcRjRFIhH1+7XltV
 DlEinKqLrpuUSv/+BHCYb+BoZ7EsbTC2xhuWWb61GieJyavme+IE/TQpWJ3oBPrx
 lvu6UGjdcZ1S0M3cJE9dC5E6sXIxOkZLwTcLNC5Rkk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTkWe4kTZ1jx for <openbmc@lists.ozlabs.org>;
 Wed, 29 Aug 2018 16:05:19 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 41CFC404CB
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 16:05:19 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 29
 Aug 2018 16:05:18 +0300
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: <openbmc@lists.ozlabs.org>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
 <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <77d81bad-1c01-b953-efea-f8e93e3591f2@yadro.com>
Date: Wed, 29 Aug 2018 16:05:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HwqbMJlG7z899Gj4a6qHobHQVDCJ7RQyS"
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
X-List-Received-Date: Wed, 29 Aug 2018 13:05:24 -0000

--HwqbMJlG7z899Gj4a6qHobHQVDCJ7RQyS
Content-Type: multipart/mixed; boundary="0xEnBDDNtq5XjokJ4RxiXOt1G3P2W8xe9";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <77d81bad-1c01-b953-efea-f8e93e3591f2@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
 <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>
In-Reply-To: <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>

--0xEnBDDNtq5XjokJ4RxiXOt1G3P2W8xe9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

29.08.2018 15:05, C=C3=A9dric Le Goater wrote:
>
>> I start thinking about maybe adding an option to "jedec,spi-nor" DTS=20
>> binding like "enable-4byte-mode", so that we could get rid of our loca=
l
>> patch and just specify that option in the devicetree. The option would=

>> force EN4B on the chip if it supports that mode. What do you think?=20
> Are you proposing to add an extra property  that would be handled at
> the spi-nor level to choose which set of SPI commands should be the=20
> default read_opcode ? either the ones requiring EN4B (SPINOR_OP_READ*) =
=20
> or the others which would not (SPINOR_OP_READ*_4B) ?=20
Not exactly. Currently, spi-nor driver for devices over 16MB in size chec=
ks
whether or not the SPI_NOR_4B_OPCODES is set. If it is not, it simply iss=
ues
an EN4B command to set legacy opcodes to 4-byte mode. If the option is th=
ere,
the driver replaces pointers to legacy-3-byte-command-based functions wit=
h pointers
to modern-4-byte-comand-based functions.

My proposal is to add an option that would force EN4B always, leaving the=
 rest as is.
That is, the driver will still use 4-byte commands if they are supported,=
 but the default mode of the chip will be switched to 4-byte as well.
> I think it would be better to introduce the property in the aspeed-smc
> driver because this is very specific usage of the Aspeed SoC done=20
> by a platform.
The aspeed-smc driver configures the Aspeed SMC controller, not the flash=
 chip.

> and/or, maybe, introduce a new SNOR_HWCAPS to inform spi_nor_scan()=20
> that some driver we doesn't want the SPI_NOR_4B_OPCODES ?=20
If I understand correctly, SNOR_HWCAPS are defined as per JEDEC standard =
and are set according to chip's SFDP table.
Where do you propose the information that "we don't want SPI_NOR_4B_OPCOD=
ES" to come from?
My proposal is to put the option into DTS where it quite naturally belong=
s because it's a platform-specific configuration.

>
>> How do I do it if you approve? Send patches separately in here and in =
 > the devicetree mailing list or cross-post both patches to both lists?
> You need to send a patch to both mailing lists, openbmc@ and linux-mtd@=

Sorry, I wasn't asking about openbmc@. I was asking about devicetree@ and=
 @linux-mtd.

Alexander.


--0xEnBDDNtq5XjokJ4RxiXOt1G3P2W8xe9--

--HwqbMJlG7z899Gj4a6qHobHQVDCJ7RQyS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhpoOAAoJEOiTWHtbdBeNo2sQAJSqO0ntO24q3r+X45qMISl0
1xX1fJaCg5ScoSrXmZODKcBL0CeLYCkTa4TTZ2E5RCxFhKVBOA2hnJy2ZiC9Bo4d
6jxT72fMquoQ7wAhiqBLw5sLPvmuBNEZQPX6FddNbK5sWd9/Nc9Rrp9u1zgKy2Pp
V8556kAMxcdJR9dAjXCBQjBA0vH6lWMJdZczUwc3+6NdDSMtyoTrdAfIwGMUq0XY
NF0GRWlI28Z4szmyekcBZaHDwJtpm269seYSjx/R1fxKKtoYf/KgoZOAtjvJKXZl
9xFpe/96LjwP66zQ5W1sQDXSRkKql2JzKANPeqBnRUPZrsHCHvwz6q6UrYglFGtA
g+nVasSDUc0kSr05vjx8p2H88p+iw28VK8mlqr53/M7VbGSUj+QreMcXtO1ABobf
iBUs4KXaBT2WplCx/GIpaNqC/YzLgCBtQW3dhb5tmSuc8lFGfGn8arHKOLXTUlev
TkA4TV1+SkgKy9pE1H7e/SIPOp7f83xn0aY2+ozz6VKIyTJ2rFpSOlozrsuf/e57
ZQ3P9RtlVj8Wn4Nbu7x8o1WSRfzxwmi5m/buxErRxbMOPBWXY7zh/+69xcd6BlI5
ugVv7nsqeN8K0rH4K8Of2kAxsIJP0XTxmtuevOCIQM8pc34Vq+ufC9veXzejEt3t
4COT6S8M89YSYVuCskBD
=eBjg
-----END PGP SIGNATURE-----

--HwqbMJlG7z899Gj4a6qHobHQVDCJ7RQyS--
