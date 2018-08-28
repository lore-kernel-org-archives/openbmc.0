Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Va+8TNMu"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42063N25p1zDrTP
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 21:29:20 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A4047418F9;
 Tue, 28 Aug 2018 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535455755; x=
 1537270156; bh=MBMyYRomsT+9cNCokvKTr7lYY0Gqbj+/KjzmYOwAI0g=; b=V
 a+8TNMuMug4EMfQgWxPT0C0Au3xYxZlM3Qb3MbzbxhaYgYbkyCB0ZWeIUjRslwcH
 Q7d1RBt3Y8i51c3spcYcNnLtl4vNZWaic94pGGyyOb6DUbvo+KI5ZDcxEetdZ6q1
 vA9nQugLHW/bJtcWwX/cANvmoRBGsPoDPSA7pl/LRk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2t-RDHutMRXV; Tue, 28 Aug 2018 14:29:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 858E340311;
 Tue, 28 Aug 2018 14:29:14 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 28
 Aug 2018 14:29:14 +0300
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
Date: Tue, 28 Aug 2018 14:29:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL"
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
X-List-Received-Date: Tue, 28 Aug 2018 11:29:21 -0000

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL
Content-Type: multipart/mixed; boundary="jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
In-Reply-To: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>

--jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

27.08.2018 14:34, Marek Vasut wrote:
>
>>>> According to the datasheet for mx66l51235f, "The device default is i=
n
>>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODE=
S
>>>> makes the code act as if the device was already in 4B mode and didn'=
t
>>>> need the EN4B command. That prevents this chip from functioning on
>>>> systems where the boot loader left the chip in 3B mode (e.g. if the
>>>> chip wasn't used during the boot process).
>>>>
>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>>> mx66l51235f (added previously by commit d342b6a973af).
>>> Could it be there are two variants of the chip, one which supports th=
e
>>> 4B opcodes and one which does not ? Wouldn't be the first time I saw
>>> this. If this chip supports the SFDP tables, you can check those.
>> I was unable to find another variant of the chip. There is only one sp=
ecified in the datasheet:
>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%=
203V,%20512Mb,%20v1.1.pdf
>> and it says that the device supports both 3B and 4B modes, but default=
s to 3B (24-bit) mode.
> So keep the 4B part in. Linux will just not reconfigure the device to 4=
B
> mode using register write, but will instead issue the 4B opcode
> directly, without any stateful change.
Marek, thank you for asking all these questions. They made me conduct a d=
eeper investigation than just finding the commit that broke it and revert=
ing it. It appears that OpenPOWER P8's SBE code (the thing that P8 CPU ru=
ns first from its built-in memory) expects the PNOR flash chip to be in E=
N4B mode. It reads the rest of OpenPOWER Firmware using a usual READ (0x0=
3) command with 4 bytes of address. Always. That's why, I believe, Roman'=
s commit broke host booting for us.

Probably it would be best not to merge this patch into Linux kernel. I'll=
 discuss it with colleagues from OpenPOWER community and we'll probably f=
ix it on SBE side.

As for renaming the chip, I can provide a patch just for that. Or we can =
leave it as is.

Thanks.
Alexander.


--jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ--

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhTIJAAoJEOiTWHtbdBeNS5AP/jdCr+dd5cCcaeXOsL1iO5vQ
VogAcesACMlFUD7EqBS1SoBLRFGsFXcWR+lUfi7PzN8VKv7QY97H4JR1dPQD8MH5
wrPi993Lbe2kfNo88Q2uHod/gSqamZQsBhVQeK5guo4iCOpF6E7Q8wlYQ6FdA13o
2rwh8wxx8RC21LJEgYeNgyY1iUskvh/Wk5ltH3KTzjfouviP3ZnRAoxwqEph3ZYw
C9GHjBxnF/eB1lozyVejI4BTDs18TUvVmOS/YNAK2p+nBPl0JvKkDXJzfh4wrybQ
XDI6Q5l1VewBDFB3rQQEnjGEydRivKMLCxaxUh+gf59gtpDbDWfb3T1cR4xVjCwy
KuanKJPIFn/02xWMzC7vZj5ibpFiJj58Z+6P0+ThcQihrGcLkcn3IGfBNJpmBVq+
fPzmAGTCQ1yEOCiH/2IRXSFZzLZcLakImIXI+D2MhNOabw+G0EyExdNgJIUS0dEF
INtx/hMtQ0d/pQDFK/ANjYZWBRSNstQvqy2y7oFujIzfga/hPJKxqjbBVf9n17ui
AyhjrYYygwYhCyXBM6+nNwo/WANYF60sLgTFtZa0VYWr6KxaBZGLqt4oP6/mpsUK
5qYbcIO+g4r39Uds+LtMjio3Uzv/nSf9gh04EsR1XkSHaYK3D3Fufl4I8ECXT0b5
NEjEv2YxsZvJ1eu9NUto
=bI+O
-----END PGP SIGNATURE-----

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL--
