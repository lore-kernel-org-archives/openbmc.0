Return-Path: <SRS0=VhGl=D5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4A7C388F7
	for <openbmc@archiver.kernel.org>; Thu, 22 Oct 2020 15:43:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 538A72463D
	for <openbmc@archiver.kernel.org>; Thu, 22 Oct 2020 15:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHf6co47"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 538A72463D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHBTV0qb6zDqP5
	for <openbmc@archiver.kernel.org>; Fri, 23 Oct 2020 02:43:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DHf6co47; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHBRy5SzPzDqqY
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 02:41:48 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id n15so1863403otl.8
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kssMpkxNFCajXrYflVBIJfA+td9NboAVpALDOdDcPDk=;
 b=DHf6co47tsVUIAtrft38NzzKOV8mKYZZLtC2bpr8wFjqQSW44sJrnCRKgbvwVvZxi7
 9RjUHAT1ylItLeaRMO7+2QJvh7rm6I4OHKcLdnv47KqWO7q55BQRVu+rucUHPgtna76E
 rjKFUs13NOhsB+NFaxPH8bzK+blFBvPgM4MEyiPkg8DowVXNPPMyYSE9+oHm+jAj4Pww
 5LjwmWZyD1FQL2m6pyLHkEJMZhO8ne9dYynZSmYDMqd1+S14Jnids+o+b/NbKnsrhlb7
 HoCjm8xb+U20r3tGqybO6nLjwaraXVDZuUQfIYRPAwFh/1AE7Gq9HNuUUbewWd0TQvrW
 01gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kssMpkxNFCajXrYflVBIJfA+td9NboAVpALDOdDcPDk=;
 b=JUAlgD1m97VbeZn/vwrEDFw2c2mkS79xQJ8JLPmLP5uxxevn0zzd2WiLhT/ii2xy/J
 t3F1WFIvbxDt87G5/l/s2WhR9vUpMcs09qKsT32bT0vMba9vSPfvPfDcEr9+Ck+kXDNR
 zAatrXRGSJH2Hp9oJlSug5I97sM+5EgjIJNSyd+eMhwfm78mmJTE5TRH06TiIqbXIoF0
 +4ft9Ta5JbxpKsKQEH2o58Z6omdijTKHPehwfyXhHdl3MZIfVcmwwxuqkCOZ6esAHQ9I
 D9GJS4P+++OKLmEMYH47ishdIeiB5L1Ax3Xn2lyKdEW6PH0ZwxcYCqPZSWueL0G6YjGa
 S7QA==
X-Gm-Message-State: AOAM531Ujog9dhreS+mOz//b6zIisq9rx8SRF4HqU68m+3qw4ZXZBsYE
 UfCDEglsERK50gFp2OP+hOgjLkdEVZRBYw==
X-Google-Smtp-Source: ABdhPJwvKZ6buyoZrefMrpMfVG4YETACxnWaf/6RrN5jFXtobrBu3zwZLFyfsg8aFCyKO6BQ4QjXeA==
X-Received: by 2002:a05:6830:1183:: with SMTP id
 u3mr2139864otq.167.1603381304152; 
 Thu, 22 Oct 2020 08:41:44 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id b6sm493736otl.37.2020.10.22.08.41.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2020 08:41:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Critical BMC process failure recovery
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <95ad99d7921c405e93b794463d702853@SCL-EXCHMB-13.phoenix.com>
Date: Thu, 22 Oct 2020 10:41:33 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D041666-3DC0-4C5A-892C-8155D9DA6971@gmail.com>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <95ad99d7921c405e93b794463d702853@SCL-EXCHMB-13.phoenix.com>
To: Neil Bradley <Neil_Bradley@phoenix.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



> On Oct 19, 2020, at 4:35 PM, Neil Bradley <Neil_Bradley@phoenix.com> =
wrote:
>=20
> Hey Andrew!
>=20
> At least initially, the requirements don't really seem like =
requirements - they seem like what someone's idea of what they think a =
solution would be.  For example, why reset 3 times? Why not 10? Or 2? =
Seems completely arbitrary.

Hey Neil. I was starting with what our previous closed-source system
requirements were. The processes that cause a reset and the amount
of times we reset should definitely be configurable.

> If the BMC resets twice in a row, there's no reason to think it would =
be OK the 3rd time. It's kinda like how people have been known do 4-5 =
firmware updates to "fix" a problem and it "still doesn't work". =F0=9F=98=
=89

Yeah, history has shown that if one reboot doesn=E2=80=99t fix it then =
you=E2=80=99re
probably out of of luck. But=E2=80=A6it is up to the system owner to
configure whatever they like.

>=20
> If the ultimate goal is availability, then there's more nuance to the =
discussion to be had. Let's assume the goal is "highest availability =
possible".
>=20
> With that in mind, defining what "failure" is gets to be a bit more =
convoluted. Back when we did the CMM code for the Intel modular server, =
we had a several-pronged approach:
>=20
> 1) Run procmon - Look for any service that is supposed to be running =
(but isn't) and restart it and/or its process dependency tree.
> 2) Create a monitor (either a standalone program or a script) that =
periodically connects to the various services available - IPMI, web, =
KVM, etc.... - think of it like a functional "ping". A bit more =
involved, as this master control program (Tron reference =F0=9F=98=89 ) =
would have to speak sentiently to each service to gauge how alive it is. =
There have been plenty of situations where a BMC is otherwise healthy =
but one service wasn't working, and it's overkill to have a 30-45 second =
outage while the BMC restarts.

This sounds like it fits in with =
https://github.com/openbmc/phosphor-health-monitor
That to me is the next level of process health and recovery but =
initially here
I was just looking for a broad, =E2=80=9Cwhat do we do if our service is =
restarted
x amount of times, still in a fail state, and is critical to the basic
functionality of the BMC=E2=80=9D. To me the only options are try a =
reboot
of the BMC or log an error and indicate the BMC is in a unstable
state.

>=20
> -----Original Message-----
> From: openbmc =
<openbmc-bounces+neil_bradley=3Dphoenix.com@lists.ozlabs.org> On Behalf =
Of Andrew Geissler
> Sent: Monday, October 19, 2020 12:53 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Critical BMC process failure recovery
>=20
> Greetings,
>=20
> I've started initial investigation into two IBM requirements:
>=20
> - Reboot the BMC if a "critical" process fails and can not recover
> - Limit the amount of times the BMC reboots for recovery
>  - Limit should be configurable, i.e. 3 resets within 5 minutes
>  - If limit reached, display error to panel (if one available) and =
halt
>    the BMC.
>=20
> The goal here is to have the BMC try and get itself back into a =
working state via a reboot of itself.
>=20
> This same reboot logic and limits would also apply to kernel panics =
and/or BMC hardware watchdog expirations.
>=20
> Some thoughts that have been thrown around internally:
>=20
> - Spend more time ensuring code doesn't fail vs. handling them failing
> - Put all BMC code into a single application so it's all or nothing =
(vs.=20
>  trying to pick and choose specific applications and dealing with all =
of
>  the intricacies of restarting individual ones)
> - Rebooting the BMC and getting the proper ordering of service starts =
is
>  sometimes easier then testing every individual service restart for =
recovery
>  paths
>=20
> "Critical" processes would be things like mapper or dbus-broker. =
There's definitely a grey area though with other services so we'd need =
some guidelines around defining them and allow the meta layers to have a =
way to deem whichever they want critical.
>=20
> So anyway, just throwing this out there to see if anyone has any input =
or is looking for something similar.
>=20
> High level, I'd probably start looking into utilizing systemd as much =
as possible. "FailureAction=3Dreboot-force" in the critical services and =
something that monitors for these types of reboots and enforces the =
reboot limits.
>=20
> Andrew
>=20

