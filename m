Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Yv+VoMVc"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420jN375HgzDrJ5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 21:00:51 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 02DF44120E;
 Wed, 29 Aug 2018 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535540442; x=
 1537354843; bh=3HGUknazP/XhHfAHLn8Vj8TsKI5XKsr+tkJ7fARLA8g=; b=Y
 v+VoMVciyN5q1clAyLfOD/sdHAJj12EFtUhufJd9jbRoaLditsQUyS4iTfJyOueW
 +wP2BQXQ9dqF0jkofig1iUgXjA5UDdEuxjaDPnWhHgGABofRLlubBRz53o3bf7ys
 4Y+sXj5mau2KIMhG/CLLlzArXVNWeQTrg+HeF6Q6QU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxfNOwNaXaHw; Wed, 29 Aug 2018 14:00:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EE0F541185;
 Wed, 29 Aug 2018 14:00:39 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 29
 Aug 2018 14:00:39 +0300
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 xsFNBFj0jdkBEADhQF4vZuu9vFfzxchRQtU/ys62Z13HTaYK/VCQKzPnm2mf593Il61FP9WV
 0Srt4t4yumiXK7NhHeqktN/YZjYDYVr9l+vZpNydOHpDjk7xjPgb0KkoFCo7bcQ2/e4AtLTQ
 XGoWIKv983vWlphPCG1Jof5jH3RA7mccCNXtGlzVYF0RYR0/qKGgsoBymkldNKPwgPf/3SXb
 QY5V3sJ5SHwDjmhg3MYnblV29OULdi72DKI9MkhTTHQFlA++CfYstx/cZ1BZwWmoMgi0umpj
 Pf+5mAkmTtlPW7U54EUgFpvTMfxRRS7yH+iTlvngduYW6jryt0zm6r7M2LGR+uWGSTmWBB7Y
 t06D0Xrm0Zwl4alQ5WDrlUTkzZcXDb0QqY7UkQSkghLmUjItEj4Z+ay7ynIsfjQe0OYdTofh
 dY0IUxMxNm9jeckOkRpSdgsQrTcKIOAt/8jI62jlzN1EXA6blhASv5xtt7I1WXCpDU+mpfKf
 ccUVJfmd0Q2nlG64L4Bv8o+iBI0Xu5+EX2NzDKQF5vSQIK8mwniAPT16hi80mZG9EQf0fJ1C
 p7xJGvwA6IiwXWsAqhNRhYbmNDfiR2MMxw5DFdQSeqoK3ONeeIwrJAPNdme+Z1DoT2+ZuZP0
 nfUa8e2QaMHkXwCz9e0cI2NUmAwFJ9Qg4L0eyhdZP4rQ1KCg/QARAQABzSxBbGV4YW5kZXIg
 QW1lbGtpbiA8YWxleGFuZGVyQGFtZWxraW4ubXNrLnJ1PsLBgAQTAQgAKgIbAwULCQgHAgYV
 CAkKCwIEFgIDAQIeAQIXgAIZAQUCWmWolAUJcjFDNwAKCRDok1h7W3QXjXyOEACUv6oDO7Vn
 KnDTUypYhyTVi8C+fjlHTH+AIDP4qk6nXjMIJeh0P7rQCHAOIOCW9osy/urYQ5at90eUolDV
 udMe5+sSvKRHYksu74O+4XedE2TDFJnntnz0JIeyuaH4FVRDX5i2hlK6wx2D06wTJj4JONlW
 c1aLULPKfrCbMbpNlD9s/+48RkCj77kl30nJ+56ThEMkSgomMIL9XMesNnQAa83Y55mJhx1f
 n3Gz7kH6nxLPPgLWgKXebAgM6ltJAjaCIWxZYlJK5dQmQC5N7PR0kXdnHttSx89ldgPacpX7
 V39dBMoURY/+YtMU7VKUNVW/IXkwXT7m42QoxO3H+HNHRVfDtELy2l6fBCf0ShXs4b3AF654
 aRJrwQX1Za3mg6OXTmAVDEerqOBht5XZl2Y/FyxV1Tka2SarkYrNVjD3YXODnmF3GfAuP8Jk
 F8uYvQyXpLMpThnUPjs+Vl1NC1exh2mrM+7kxGXPKhrFWxX7tduAJpULpdCk4mefO9/U7I8/
 Edf5giE1o9yhECZ71lzmA7p7bLDv54Qfu4WAVndUgHLHCH7uUsKf3cds/gLtpuTrHB83nvvh
 LKZ6+kYnn5pK89hkia0EbpOrTrqBqphMyxFb7WFapXip7kRaqUdMOqdRO+JHG3rFAhz7sl/0
 DPWSea7WGLe0TNySCQ4GdytKLs7BTQRY9I3ZARAAygmVNgjvxkqud75kP5fwhmwMVu13sLh8
 QnZxjMsA9Zelt1Hu+BVmjET7YL4xBhdJDZ4y3UI/MV8ZzOfJHUWSNr6POwKIrsQfGzdlgB0e
 w2k6Rm651Jp+aAsygB4GR7BopptJd9d/q5oCnZxpPgDpZOBCpl4DQ3fJIGSc8iQVmA84lHLS
 +mqIJ94PZ7uza4F0ly6Au+Hbkhowh/1q+BUd6Rn553WAmPAG7g0lAG/Obq1m77ovlR86yY5i
 C503QKlPJELSNYtzczuLQZetjDtaFkugke4QMlhzHyc7DjSsjyccdhepPtXWEm84jPCx1/KU
 3m9jAWtPdARQ73su/fiitmXAifQXJBB2R9fmKuM2F3ClHcJxv/l0W1ruekD9vojOO75yvBEG
 7fGlLc9hUgIIGgBJvI+Yb1/KhqWC9r53TS6kcuCi+z9kf+4MTBge2sU97DtivZGzul6yhrcr
 3Ic5paWoaka2ClGqKBQo3A9o4F60q3rRq5FAcMdKQq7qJutCzcjkcCpVVik1im0u0+UGrK0s
 YQuAgTu45mJPOfINqz1xz+qwxSjYI/wjxJaYTZLO68CIdBiDj+zxIeo9o/mUJvS+DhnPzKhW
 KXToZl2D7VdjOlu8zZ0tIFYrULJYhuw2f/KwD1lwoehlKikEE0H0xkPygufjtiYo6jTb+BKa
 sG8AEQEAAcLBZQQYAQgADwIbDAUCWmWo6AUJcjFDNwAKCRDok1h7W3QXjc9vEADXse2POSaT
 M0uqR3KGTeF8XVKdyRqK9afWbMaxFzOWGp9pNtcmIvfmyE0M6LPLgUb33jek/Ngup/RN7CjZ
 NCjOc2HTID99uBkYyLEcOYb+bycAReswjrv3a49ZBmmGKJZ+aAm0t6Zo6ekTdUtvlIrVYvRs
 UWWj4HdCaD+BMvSqcDZgyQESLI9nfEGuWtVqdi2QlZZeQT7W+RH4lihHKTdzOsVC93o4h6og
 ZvgOJ/0g1SP3la88RWONejHxVbGzBOyNjkH71CFujnAfuVuuhkJaN8PY/CS56sKMREKJOy0L
 vouE7eSU4bp13GK1xsnbWcDQpyzTsCsP9taqQmeld8Hw1yuPamc6fdpKNyPHyN20vzh20f0C
 QUMAjh3Vym12aKhyRan08VNEaLOKiyya6+i9c3Z3LiWUEqTSzELCkesb68UQVtE6/CXPM2P/
 vs3EQuLFXBC/rD9lurT0kG99xElAbKjHLer5NSw2WA2vQXaFadGNDyHI32Yt2cAqWzZtVqmN
 ESE0npJ5eeAcVWPHjhCwL8phZCDtfxJMy2cqYS8QLIBGfQTIHMQAgqBbpq9FLXCn008tvaTr
 KijxDkPtWeXDLbMgH1kA46gTPJWxsm0c45w7c3aXhXl4hOgXp+iWDTOT83tJU0zoD9hYlpZf
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
Date: Wed, 29 Aug 2018 14:00:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="At7y39sDnhi00MsXtcxoW3LajFCSkO3nT"
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
X-List-Received-Date: Wed, 29 Aug 2018 11:00:52 -0000

--At7y39sDnhi00MsXtcxoW3LajFCSkO3nT
Content-Type: multipart/mixed; boundary="5qRWUbdHHKRmuDxxwWLgIwP4uIKHBGkee";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
In-Reply-To: <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>

--5qRWUbdHHKRmuDxxwWLgIwP4uIKHBGkee
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


28.08.2018 19:03, Marek Vasut wrote:
>
>>>> Probably it would be best not to merge this patch into Linux
>>>> kernel. I'll discuss it with colleagues from OpenPOWER community
>>>> and we'll probably fix it on SBE side.
>>> Can you fix the firmware ? If so, that'd be amazing.
>> It turns out that it is impossible to fix that on firmware side
>> mainly because the firmware does not send any opcodes over SPI at
>> all. It relies on the SPI flash controller to do the address mapping
>> so the firmware accesses the chip as a usual memory address range.
>> The flash controller is located in our case inside Aspeed AST2400 BMC
>> SoC and does not support 4B opcodes. It expects the chip to respond
>> to generic READ and WRITE opcodes with (configurable) either 3 or 4
>> address byte cycles. So the only way to make it work is put the chip
>> in EN4B mode when BMC boots.
> And who does that ? Or is the EN4B set by default and U-Boot/Linux
> _clears_ it , thus making the board unbootable ?
>
> Doesn't it simply mean your board is missing SPI NOR hardware reset lin=
e?
No, you're probably just missing it. In servers the BMC is always on when=
 PSUs are connected to mains.
The flash chip in question is the one used to boot the host (OpenPOWER P8=
), not the BMC (ASpeed AST2400).
U-boot on AST2400 has nothing to do with the chip. When BMC boots, it loa=
ds a driver for the host's chip (because it is connected to the BMC SoC f=
or the BMC to be able to upgrade the host's firmware), and the driver ini=
tializes the chip to the right mode. The BMC reads host firmware version =
info, etc. from the chip. It may also update the firmware or parts of it.=
 Then it powers up the host and the host reads the chip via the memory wi=
ndow mapped on LPC bus by the BMC.
The BMC hardware (AST2400 in our case) translates memory transactions int=
o SPI Flash commands.
Unfortunately for us, AST2400 (unlike newer models) only supports generic=
 3-byte commands (READ, READ FAST, PP, etc.), but has a 'hack' that allow=
s for using 4-byte addresses with those commands. Thus if an over-16MB fl=
ash chip is connected (and the firmware image itself is over 16MB), and t=
hus AST2400 is configured in 4-byte address cycle mode, it is crucial tha=
t the flash chip is in EN4B mode as well. That's what was provided by the=
 spi-nor driver before Roman Yeryomin's commit and by this patch that rev=
erts that commit. When OpenBMC project upgraded from kernel 4.13 to 4.17,=
 it sucked in the commit made in version 4.15 and thus broke the mechanis=
m I described above.

The flash chip in question does have a hardware reset line, but it does n=
ot matter in this case at all. Resetting the chip will bring it into EX4B=
 (3-byte) mode, and that's not what is needed. Basically, that's exactly =
what is happening now (without this patch).

By the way, the newer AST2500 BMC chip has support for 4-byte commands an=
d most probably does not have this problem.

>
>> As this is quite a specific case, I
>> guess you won't be willing to remove the SPI_NOR_4B_OPCODES option
>> globally. We'll have to keep the patch local to openbmc project
> I am more worried about this being actually unfixable in reliable way.
Well, configuring the chip for EN4B mode before powering on the host is q=
uite reliable.
There is no-one to interfere with this setup in-between and even after th=
e host is booted, as there is no driver in Linux for AST2400-based SPI co=
ntroller on LPC bus (as seen from the host). There is only driver for tha=
t peripheral as seen from BMC.

>
>>> But still, there can be a software which does rogue transmission on
>>> the SPI bus and flips the flash into 3B mode before reset, so the
>>> system will not boot anyway. Do you have a way to deal with that
>>> somehow ?
>> Sure. As I said, there is no way to turn on the host without BMC
>> knowing/controlling it. The BMC ensures the chip is in the right
>> mode. That's actually the reason why this patch appeared in the first
>> place. Also, there is no rogue software on BMC.
> OK, but if the BMC puts the chip in a defined state, how come the syste=
m
> will refuse to (re)boot if Linux interferes with the chip's volatile
> register settings ?
Because it was BMC's Linux that got broken, not host's.
The commit fetched into BMC's linux while upgrading 4.13 to 4.17 resulted=
 in putting the chip in a wrong state.

I start thinking about maybe adding an option to "jedec,spi-nor" DTS bind=
ing like "enable-4byte-mode", so that we could get rid of our local patch=
 and just specify that option in the devicetree. The option would force E=
N4B on the chip if it supports that mode. What do you think? How do I do =
it if you approve? Send patches separately in here and in the devicetree =
mailing list or cross-post both patches to both lists?

Best regards,
Alexander.


--5qRWUbdHHKRmuDxxwWLgIwP4uIKHBGkee--

--At7y39sDnhi00MsXtcxoW3LajFCSkO3nT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhnzXAAoJEOiTWHtbdBeNlGYQAN7NYp94zgc2TWPVMi6WqpxG
bECXTSCih8BSwMdJ3tdiQop90jU1ChfxFKm023mTGAB4C8rj3ISMvvu9EON5qSNq
1ZYopHy1SsBHuoLr7yUoraHf92mPR2zPp3Otxl9ZJqtjBWbznbWIqeG84vFXj2Zp
kE6MsZOaNZoCbrtcUqczcvxGjS7qVyaqD6SgUkXtm1EnUJxA5ByT5zA0PidCXYyD
nfXGe1i3X9f2/hH/TDLEqqXEj3m3vS5FK+J0I+PsX+T9FmGF5Sr4DM50UH9NO2KC
ioV5LQUzjDyrkLpAqQai9XnK03y92FjfwD2y7LcsafsRGGgNTI6Yvoeq3CUmLMuh
Kw/d3/PJ1z5vFxFJlXsgvlPcTm5fw/9/+5pjWeF79zPLreN3b6IfCSixsjJUKQ8Y
5Rxlp5CR3ZdqgDzw5yoJmt5k0w/LD1S0Kh56ULzmhOor3dF5/MduJ7riPcFk0DO0
l/BK/5gMcktBdFOdeuuuBTG1UszupY8oDTuNY4MsVTXkNtnycHHdAs7VBQ+RRADg
aAn7Uo5NwZ+7peBEKRRSJIl+UJOIt647y+ayAhGRNpIXaIutBa4+rb1x4gP9MJqz
g5SM3kmpcHYEWgGMd3oMp2YGS8hMY4a7T+DrcD0QVHBQvZHEJEnLOA4xDsw147UJ
OdqKw93/rxWf8WYFHs+0
=Qrob
-----END PGP SIGNATURE-----

--At7y39sDnhi00MsXtcxoW3LajFCSkO3nT--
