Return-Path: <SRS0=k5r5=GK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195E4C433DB
	for <openbmc@archiver.kernel.org>; Thu,  7 Jan 2021 00:54:19 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382ED23118
	for <openbmc@archiver.kernel.org>; Thu,  7 Jan 2021 00:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382ED23118
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB76H6xCXzDqlP
	for <openbmc@archiver.kernel.org>; Thu,  7 Jan 2021 11:54:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=maxims@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=o3cye1lk; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB74m3qgQzDqbp
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 11:52:48 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id d26so3975645wrb.12
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 16:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jzPmx04reitqYtsYdlT02jCk3tDyFVYTOA850ys9RbM=;
 b=o3cye1lkxJkNrZBFDztxunyMmFxAfdnzPZhUE1XsJOg7UVe0RmzbNpNi/vNrsq5HYY
 V0mlnQUdiROCmMMyVijodTjeEXD5S6/ASS2FrTSt5dpN3AxiIlz0zf9LASFLUdZvzj7d
 gZiThm4eGrvuNaLyIEmC9Ezv8itLE0sAS0r/0WaMI8gJcR9OexXd1D6t8miGKuEhSWel
 50i37Tp/Ie5TOHxeIQYWxkmozr0v3i6kZtDt+vd/Vzp3RlDyiZujdFQtEy8fmHqw1lMn
 F1VYTlO65Ghg6NkWSHM25wd89jQVkzVfZwQxDVHJjWhIcP/Z/jNT+mpWXiEmgozJKKGY
 Jl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jzPmx04reitqYtsYdlT02jCk3tDyFVYTOA850ys9RbM=;
 b=V9tsz2xcZ48uraTmLvkzbDTj6/IprHhSMibGSJIbKB7sl+YmHjgvYhVzcd+G8/77bI
 LcNZ8GfYHmMKdkyuFllCK3YHWPtFONYGl/2l1Ted13h3TeItzucB0fXcgCZwS9TD/+Xt
 IGURL2dNkviaQ7k6wFPUHFKGcIet/LAf2qzlmp0mZ1PWEAgRW3aEwlwykiHQJg140lMs
 VLtWXmz0Fv7BHF3kjS8QA27LSVwAZQA3sZWqvQFQT8U+bznMJTFl4JerlUNbuTunsTxQ
 OxfxpLD983Yy27K+ZSAhgIkDKS8hXYA1/aOtgn1Y09ftW+ztaHxjybbwft4Fay1ABLpj
 HddQ==
X-Gm-Message-State: AOAM532SqpXn0cQn+0MsOgGjOU12lZx/0+M8zmoyL2JY/NkXIytk0Szz
 Sj3O/JzsQIpJIzUBophgqs/ISEK2IMJuryeurLcuhQeZpt4x5w==
X-Google-Smtp-Source: ABdhPJyFx/vDZLw8EETvO43vZx6vZVPyxhq1i58K35kGwKJ6Q2C3f+sRorxVMDOn0roASbBz/buAjkIy3C8FiqGqBGs=
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr6431788wrw.297.1609980764195; 
 Wed, 06 Jan 2021 16:52:44 -0800 (PST)
MIME-Version: 1.0
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 6 Jan 2021 16:52:32 -0800
Message-ID: <CAFR_W8pjBgn=V9ye-R9ThvyvqwxqYnY94vAX0q1h4sVEaLWN2Q@mail.gmail.com>
Subject: Changing LEDs status in response to Power Events
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008bf8cb05b844db1a"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--0000000000008bf8cb05b844db1a
Content-Type: text/plain; charset="UTF-8"

Hi all,

We would like to change the state of some of the LEDs in response to some
power events. For example, if the system goes from Standby to On, the LED
needs to change from blinking fast to blinking slowly.  The way we are
doing it right now is we have a script that runs every second, polls system
state over D-Bus (xyz.openbmc_project.State.Chassis and
xyz.openbmc_project.State.Host) and then, again over D-Bus, ask
phosphor-led-manager to switch LED into a new state. This does not sound
like a good solution to me, so I have a few questions:

0. Did I miss some existing way to do it in OpenBMC?
1. If not, does anybody have the same problem and how do you solve this?
2. If not, Is anybody working on a solution for this?
3. If not, any thoughts on what's the best way to handle this? I can see at
least two approaches:
   a) Implement some callbacks in x86-power-control, so that one can
register their services/targets to be notified of the event.
   b) Implement this in phosphor-led-manager, so that it can listen to
D-Bus events and respond to them.

Thoughts?

Thank you.

-- 
-MS

--0000000000008bf8cb05b844db1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We would like to change the sta=
te of some of the LEDs in response to some power events. For example, if th=
e system goes from Standby to On, the LED needs to change from blinking fas=
t to blinking slowly.=C2=A0 The way we are doing it right now is we have a =
script that runs every second, polls system state over D-Bus (xyz.openbmc_p=
roject.State.Chassis and xyz.openbmc_project.State.Host) and then, again ov=
er D-Bus, ask phosphor-led-manager to switch LED into a new state. This doe=
s not sound like a good solution to me, so I have a few questions:</div><di=
v><br></div><div>0. Did I miss some existing way to do it in OpenBMC?</div>=
<div>1. If not, does anybody have the same problem and how do you solve thi=
s?</div><div>2. If not, Is anybody working on a solution for this?</div><di=
v>3. If not, any thoughts on what&#39;s the best way to handle this? I can =
see at least two approaches:</div><div>=C2=A0 =C2=A0a) Implement some callb=
acks in x86-power-control, so that one can register their services/targets =
to be notified of the event.</div><div>=C2=A0 =C2=A0b) Implement this in ph=
osphor-led-manager, so that it can listen to D-Bus events and respond to th=
em.</div><div><br></div><div>Thoughts?</div><div><br></div><div>Thank you.=
=C2=A0=C2=A0</div><div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">-MS</div><=
/div></div></div>

--0000000000008bf8cb05b844db1a--
