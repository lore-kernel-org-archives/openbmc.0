Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF82606A319
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2026 00:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MZyBA8BM
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j9kFv21PWz2yNj;
	Fri, 23 Oct 2026 11:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::634" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792642732;
	cv=pass; b=QMwKLAYZJm26/MhNc6SM09vnlo+fIpt4RQIxvfF2DtBGcQ+kpCLbD9McePkDjKW9xkxSdhvgMUdfzGazuvpgnUo5MWQCw3xFfujUAgsuK43Vc90GSvpdkbxAz2KTS+tmRACgHGWZjFms5YUocYnG8qRhV1qH1tG1p6sPrY7c5ISva3UBMijRhh5oy/BI3CpzAL+Dwwsu0rp/EeDAxxD61JxhtvV5oeAVrpBG84yJy7FSIok1XWDTtG6T2Z85SqfBv/MshTlJC2LKFH4owtLpoqECupYbdb4Y1jGW+2z3GR00OAksZl5r1NpQAUI5HGfNLxMDaMJtyotg4KvadLHLxw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792642732; c=relaxed/relaxed;
	bh=WcjghtMKXLBqvDZ9RdBwOrYxAVxzAHFgOI4eE5h027g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Cf5iUbGR97b0ZiNkUQtrE8t3JcJ+hnphqpTG5VJhjkg9Hks9h9Ndbfn7T1WVgwB2yL9f4SYGcd/AhjIwV0slbQKHMxvN00b9myNyyjNTb0n9ICnT15nYv7n8NVLd+UXQ1vWUpqm+M2rX6qaxj0XPMaKFnKqMHUJipCwcQzG/EKPNVREEoi1YLyLqRhew6QaGeyzrop5IapAdUijXlhsd68Z4TSxWHpI/KLsq2+4syyadDwNuAstRlo604wKWu4FzBdcT+MJsVcgCtZk9KA6/iihd/h2gjhckaCEQK8yEn8bchfcn107uEjtX+QAbgWeNF/mbXtv6OfK4QytcG+3z1g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MZyBA8BM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=kavyamadarsh@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MZyBA8BM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=kavyamadarsh@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j9CZf4bhFz2xK7
	for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2026 15:18:49 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c43fbcb4393so177896866b.0
        for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2026 21:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792642726; cv=none;
        d=google.com; s=arc-20260327;
        b=fFX4AkeKEqRtvFy//CIuE4EMULWXxhC255SAoUMRGbeWoPMJpM4S31wGSdIJnlqJfu
         LQv4PjQ3PL0svRsp0yzI7RedFav12BW13G5mMdVvl6FVk+Zyg/AnBsBA6Q2p8eJEBoDa
         Qoo8YYk/T6q+9KT8mf2Baavnnwkk08AK3nWDsK64TWHOHmcKNdiyv0a3qGPkLHzzhYPm
         3zouLyms1Mx22G0FfxYBkrkgt7YIVWCSKSnEDci7sgBehGkDrvSC22KGjQd8/QHFR3Yf
         Q6BzWg3wYxxygkG+ORuVPgb/4dHwrlNQUDDEErU3LyozZAUoNAiVv8FwAY+7QGFVwvQ6
         01FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WcjghtMKXLBqvDZ9RdBwOrYxAVxzAHFgOI4eE5h027g=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=ZXEhsifE4+LokZgvfG3fO/TePk0gg4kE4fT5ey6+ejD4+SgajhpQRoSOa1fQpWAHHn
         nG5uq2A0GMrIECGpbYj8rtLViuRAmlJy82Nuaz6GSdyYl34ZwyVQygtTxSBbfXilSkkU
         vABTir/AKF2fA8cGzFd4uGziaWXtDauMWbzgnBgILQ/b6scZ2jT/NcnA0pHF5RVNqsII
         cAeKm0LIz/M88BgQkR/KGKXhSbc8cvLQV7RXHkW8SdqAWK2v5Ht68nSYWrfOqeW8Uprq
         Ext986OkFa7zkZDB1I9k1JvF2szar4wESM0kGQ9KBUGTqZrGQrV7XieUGc+b1Hme0FGX
         cB5g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792642726; x=1793247526; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WcjghtMKXLBqvDZ9RdBwOrYxAVxzAHFgOI4eE5h027g=;
        b=MZyBA8BMG95KTOntFUVQVWche/P0YfHYLM+pqa5lJy0U3o2zUwa/VYyPWjJUYJ3DGc
         mqainMpKemNZzyaevW5Yh1/4OeYlgzwWT6RPYswhx3HA2r3P1Sfjk2lT4Cx7RC4mL4QH
         uVkSUG+5fiz5XtkY6DQ0+/e98Vc/2M5iBCTjz5Ytp2GNNSPrfLpL/RW65eTt6jICWVGk
         FxUQ88UCo2NFBYq9UhkXF+x46ptbDr6CXCteknO2DJao57YjTi6v0dJZbUCpnvuWijIj
         NErDCvJVlyoX/+FhwovK5cs8jHo9/pCsNgcfvbzg2eueEZ3FQw2rG57zLTUqXATsyaWl
         YD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642726; x=1793247526;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcjghtMKXLBqvDZ9RdBwOrYxAVxzAHFgOI4eE5h027g=;
        b=I7FyYQHHfjNAZSb/88pnB9cUW8R1MX+13X4L0NIKR5osxweZtOPWdqUC74z0oPLlyT
         fQogANHc5fM8r13jjJJ6ggtIuhJDI/x+7++KoL2NlHe/JvDhVOy/5Vq7KI8qHNhxXTlk
         NTxyIgzABaWSGfmsAsaxabojzK7jPXnoXnEWoBrGfjvQLz7n6ZlQwFDL26dFjQY8LCXF
         vP4lgZAcdTGPbTmHzkFgRcOI5i1/MMKxUOGt4MnOi6GbUZwJO1H6lpQNGXBodRteIjm5
         h6Nae87bXN4wj6wfQt4n6iB59uxW6YKkCfAEcMkV8ROMkeij3WgCVL05iZFbmKZB/TS6
         9iRw==
X-Gm-Message-State: AFq9FYJ54mbIZB+a2r7CPPzugVs8i9WBay8sNZIus1mtzsRnx76ZTujH
	ibLqYqGyOicXgzrJiRMXord8rmNiZkA2xlA7A5DA4NVZxVF+akeiVa1g23E1t0/E3SAMF1tKK8D
	YKm2DOEPCi2MVTOgulLn04ZXa6/CK9x2jnPTR
X-Gm-Gg: AYBFou2axbedrh1FVeG51tiSbq9WgCeCMKj7d1/nDwc3ktOdQVa4vqnxrD4omhsXwwv
	3cNJDnAQrdP0Pw2Bj1OAKQKMDtd2Tu00zmR8B9Z5zooux46HOBzIxiKEQUouQdBGYFrRAs1kjGL
	bkF5NdfTv1zfKxOn2tLfBpVehZ6b90quvAV8Wm7kwssgt8CzOOqGVqQDU4r2SQ5Wo9iFsnRo+HS
	3b41pVInrOTNr7xxud1zQvos8cmKnoF8dpdPUL7hZFTzth+wBbubTV/MFwsaxKSGAq05Fosrmyo
	9pLfNmzGXg7W2ibvvBEN5xCIrcxK/oIqFP85lvdSr58Dzv4t8+TC+mW5cgrp6IqsYMrVLWKNOAe
	ytfDjrE3gbUMOMrZrkOEUZ6foIH8nbggNbLan+A==
X-Received: by 2002:a17:907:3e89:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c46796eb68emr356793366b.40.1792642726170; Wed, 21 Oct 2026
 21:18:46 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: KAVYA M M <kavyamadarsh@gmail.com>
Date: Thu, 22 Oct 2026 09:48:34 +0530
X-Gm-Features: AclHuK9pAATtF7mL6bUJdULiBowjqDh5H563Dj4CiOw992zmVmZtocN7T3bworM
Message-ID: <CAD_a9mYhkzX+4CoCX+7NtYMR7C5C-dBVvQB90g=1f2aHTu3oUg@mail.gmail.com>
Subject: Seeking guidance to start to work on OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e7176c065e66282e"
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000e7176c065e66282e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello team,

I am currently new to OpenBMC. I want to development image for the machine
using the OpenBMC/Yocto build system, available firmware information, and
readings from the existing BMC.

Since the original BMC firmware has limited access and the motherboard
schematic is not available to me, I would appreciate your guidance on the
recommended approach for developing and validating a reliable OpenBMC image
for this board.

I have the following questions:

1. Hardware documentation required
=E2=80=A2 What documents are normally required before starting an OpenBMC p=
ort for
a new motherboard?
=E2=80=A2 Is the motherboard user manual sufficient, or do we also need the
motherboard schematic, BMC datasheet, hardware design guide, component
datasheets, and board-specific signal mappings?
=E2=80=A2 for example the CPU schematic and AST(BmC) reference schematic ar=
e
available but the motherboard schematic is missing, how much of the
required hardware configuration can be established from them?
=E2=80=A2 Since my target board uses the ASTs BmC, which specific datasheet=
s or
hardware design documents should I obtain?

2. Extracting information from existing BMC firmware
=E2=80=A2 If the original BMC firmware is available only as a binary and it=
s Linux
shell or source code is restricted, what information can reliably be
extracted from the image?
=E2=80=A2 Can we identify the flash layout, device tree, GPIO configuration=
, I=C2=B2C
devices, sensor definitions, fan configuration, Ethernet settings, and
board identity?
=E2=80=A2 Which details can be confirmed from firmware, and which require t=
he
motherboard schematic or physical measurements?

3. GPIO and hardware configuration
=E2=80=A2 How can we verify GPIO connections, signal polarity, direction, t=
iming,
and safe initial states without the motherboard schematic?
=E2=80=A2 How can we identify the actual I=C2=B2C bus routing, multiplexers=
, device
addresses, and peripheral protocols?
=E2=80=A2 What is the recommended method for verifying voltage-divider valu=
es, ADC
scaling, and temperature sensor configuration?
=E2=80=A2 How should fan PWM/tachometer mappings, fan zones, minimum safe s=
peeds,
and failsafe behavior be established?
=E2=80=A2 How can the LED wiring, Ethernet PHY address/reset configuration,=
 and
NCSI connections be verified?

4. OpenBMC image development
=E2=80=A2 What is the recommended workflow for creating a new OpenBMC machi=
ne
configuration, device tree, Yocto layer, sensor configuration, and required
services?
=E2=80=A2 Are there existing OpenBMC reference boards or porting guides tha=
t would
be useful for this type of project?
=E2=80=A2 Can we proceed with firmware analysis and QEMU testing while some
hardware details remain unknown?
=E2=80=A2 Which functions can be validated in QEMU, and which must be teste=
d on the
physical motherboard?

5. Flashing and recovery
=E2=80=A2 If the original BMC firmware source code is unavailable, can a cu=
stom
OpenBMC image still be developed and flashed safely?
=E2=80=A2 How should the original SPI flash be backed up, the flash layout =
and
image size verified, and a recovery procedure prepared?
=E2=80=A2 What checks should be completed before writing the image to the p=
hysical
BMC?
=E2=80=A2 If the image boots but networking, fan control, sensors, or other
hardware functions do not work correctly, what is the recommended debugging
and recovery process?

6. Validation and safety

=E2=80=A2 What validation checklist should be completed before enabling hos=
t power
control or testing other GPIO outputs?
=E2=80=A2 How should fan control and cooling failsafe behavior be validated=
 before
using the image on a live server?
=E2=80=A2 What are the minimum hardware details that must be verified befor=
e
proceeding with physical-board testing?

My current goal is to continue testing the image in QEMU, document the
confirmed and unverified hardware mappings, and determine the correct
procedure before flashing the physical board.

I would be grateful for any recommended documentation, reference
schematics, OpenBMC porting guides, practical experience, or advice from
engineers who have worked on similar BMC porting projects.

Thank you for your time and guidance.

Best regards,
Kavya M M

--000000000000e7176c065e66282e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello team,<div dir=3D"auto"><br><div dir=3D"auto">I am c=
urrently new to  OpenBMC. I want to  development image  for the machine usi=
ng the OpenBMC/Yocto build system, available firmware information, and read=
ings from the existing BMC.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Since the original BMC firmware has limited access and the motherboard =
schematic is not available to me, I would appreciate your guidance on the r=
ecommended approach for developing and validating a reliable OpenBMC image =
for this board.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have t=
he following questions:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
1. Hardware documentation required</div><div dir=3D"auto">=E2=80=A2 What do=
cuments are normally required before starting an OpenBMC port for a new mot=
herboard?</div><div dir=3D"auto">=E2=80=A2 Is the motherboard user manual s=
ufficient, or do we also need the motherboard schematic, BMC datasheet, har=
dware design guide, component datasheets, and board-specific signal mapping=
s?</div><div dir=3D"auto">=E2=80=A2  for example the CPU schematic and AST(=
BmC) reference schematic are available but the motherboard schematic is mis=
sing, how much of the required hardware configuration can be established fr=
om them?</div><div dir=3D"auto">=E2=80=A2 Since my target board uses the AS=
Ts BmC, which specific datasheets or hardware design documents should I obt=
ain?</div><div dir=3D"auto"><br></div><div dir=3D"auto">2. Extracting infor=
mation from existing BMC firmware</div><div dir=3D"auto">=E2=80=A2 If the o=
riginal BMC firmware is available only as a binary and its Linux shell or s=
ource code is restricted, what information can reliably be extracted from t=
he image?</div><div dir=3D"auto">=E2=80=A2 Can we identify the flash layout=
, device tree, GPIO configuration, I=C2=B2C devices, sensor definitions, fa=
n configuration, Ethernet settings, and board identity?</div><div dir=3D"au=
to">=E2=80=A2 Which details can be confirmed from firmware, and which requi=
re the motherboard schematic or physical measurements?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">3. GPIO and hardware configuration</div><div=
 dir=3D"auto">=E2=80=A2 How can we verify GPIO connections, signal polarity=
, direction, timing, and safe initial states without the motherboard schema=
tic?</div><div dir=3D"auto">=E2=80=A2 How can we identify the actual I=C2=
=B2C bus routing, multiplexers, device addresses, and peripheral protocols?=
</div><div dir=3D"auto">=E2=80=A2 What is the recommended method for verify=
ing voltage-divider values, ADC scaling, and temperature sensor configurati=
on?</div><div dir=3D"auto">=E2=80=A2 How should fan PWM/tachometer mappings=
, fan zones, minimum safe speeds, and failsafe behavior be established?</di=
v><div dir=3D"auto">=E2=80=A2 How can the LED wiring, Ethernet PHY address/=
reset configuration, and NCSI connections be verified?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">4. OpenBMC image development</div><div dir=
=3D"auto">=E2=80=A2 What is the recommended workflow for creating a new Ope=
nBMC machine configuration, device tree, Yocto layer, sensor configuration,=
 and required services?</div><div dir=3D"auto">=E2=80=A2 Are there existing=
 OpenBMC reference boards or porting guides that would be useful for this t=
ype of project?</div><div dir=3D"auto">=E2=80=A2 Can we proceed with firmwa=
re analysis and QEMU testing while some hardware details remain unknown?</d=
iv><div dir=3D"auto">=E2=80=A2 Which functions can be validated in QEMU, an=
d which must be tested on the physical motherboard?</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">5. Flashing and recovery</div><div dir=3D"auto"=
>=E2=80=A2 If the original BMC firmware source code is unavailable, can a c=
ustom OpenBMC image still be developed and flashed safely?</div><div dir=3D=
"auto">=E2=80=A2 How should the original SPI flash be backed up, the flash =
layout and image size verified, and a recovery procedure prepared?</div><di=
v dir=3D"auto">=E2=80=A2 What checks should be completed before writing the=
 image to the physical BMC?</div><div dir=3D"auto">=E2=80=A2 If the image b=
oots but networking, fan control, sensors, or other hardware functions do n=
ot work correctly, what is the recommended debugging and recovery process?<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">6. Validation and safety=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">=E2=80=A2 What validati=
on checklist should be completed before enabling host power control or test=
ing other GPIO outputs?</div><div dir=3D"auto">=E2=80=A2 How should fan con=
trol and cooling failsafe behavior be validated before using the image on a=
 live server?</div><div dir=3D"auto">=E2=80=A2 What are the minimum hardwar=
e details that must be verified before proceeding with physical-board testi=
ng?</div><div dir=3D"auto"><br></div><div dir=3D"auto">My current goal is t=
o continue testing the image in QEMU, document the confirmed and unverified=
 hardware mappings, and determine the correct procedure before flashing the=
 physical board.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I would=
 be grateful for any recommended documentation, reference schematics, OpenB=
MC porting guides, practical experience, or advice from engineers who have =
worked on similar BMC porting projects.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thank you for your time and guidance.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Kavya M =
M</div></div></div>

--000000000000e7176c065e66282e--

