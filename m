Return-Path: <openbmc+bounces-2033-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8412FCD6E57
	for <openbmc@archiver.kernel.org>; Wed,  3 Jun 2026 00:31:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVTCc6DBxz2yS4;
	Wed, 03 Jun 2026 10:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780445910;
	cv=pass; b=ZHR6gpMebGEoJHAhmVHot6rK1EeaornKS/yZH+8UmVFa5ycsAxMdII7eQf58WT3HTSr5mXoMQzDeIa8o0DISmhQHFDDWJu6zVcYDHGYlLXcWga75OkcxZzC3oavyJZeKlkpVAtRwyTzm2lqbdwwESkIoGeahA8mG/gf2aD4YKOSEw350EoLtIa6IkM+4OIToSIeRXuoKUP9IyGRhPMItqD8L0nkt0A+CGYg+DcytUR71saUtnFm8FBKdcnl4jEcvkIlRiERrqUQDrW1Kh6f5bNzrHCOI8/8HjKa1YounaBFvi5AFPp9q6Ap7Ys8EHr9fv9hawInbrcq27yKRiVZYZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780445910; c=relaxed/relaxed;
	bh=wFeYHhECeScruPD6jEd32iRszgXOHa2SbyVuCBngtgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uy6zgFkwrQto736vvlKkzDlATDDPI8AOa9Ub9u0xJsRhNRYLpfshUvJGlMBrRWBM7X6jf8e+RQWLqqMG0qPZA41ybIL57ltEf/4RqFJyApK69OYBXiL0oLbp7Wjdc09hLrrWuQukYpCER/58xEtmV2pefHqw9yO3D6tROgv3OcGknVnuqB4YJrrZvkfx0KD+DNayHrKtTN8308FKTlMHyE0GQFgNuishvQuE2WHgnaO36gCZGOedbvJZxfC3056o24zvM8/CzOEvHgkClaCltDtHCf133d96opR6CBNnNO2YtkYEvl/mrFQev9DYQj/d32ay4ovlcYYdZHIDdwo4UQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nygV24H5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nygV24H5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVSwP35Ccz2xSb
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 10:18:28 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5177d1ff061so1271cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 17:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780445906; cv=none;
        d=google.com; s=arc-20240605;
        b=EnIOqxoaXfuSlVSf64LkGexz1hdxrVIiJzqwFJ56SnZwNvb1HEAolRN2mg3Cu8xLmJ
         702Qx0F76wxtKl9rg+U/fsYSU8Z+DjFg4dkKzn/xJiRHWmPWigUp6/bR1jowUBUtlEJc
         CE1iAKmQFnjKWXz34e1048b7Bf5YtOzqpKOK0u+xIb01HNjy3YtC7mPFwTbHryX7Wsc5
         MZFa6sla70L4ftLuPcZiH1O7jtd6XUdVSZ/rnt4tyRlTidZbf112IAfWXA3KZj4Q6gGp
         7fuZzME9CJYrXGHDAzLYA23TAqWXeJtcjJEWtDO3USNRTRrltKnDzYELDPRR3foCFPs7
         9GMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wFeYHhECeScruPD6jEd32iRszgXOHa2SbyVuCBngtgM=;
        fh=J6KxWK32h6EG/XN5cpuZklfAAFlEIzBiAMrCsJOhbkA=;
        b=HbaMEJ418KF1oOj501BZpd4opzE4NQVuzJW7cIyH1FIopqHIW6/62zmlyxAvaQU9Q4
         a92DCkFg04BAyWFImqbeCHT+AGkRZhVuTDQfUB85AVR+3rT5c1N2JZcoIoqZ/BFMyp5A
         rrcr5+m9wKqyFxGN4Jj1wUM4XRlXUie30RFL8ucVMWTahoHWu6rcmxmfqHmrc3DGtxoe
         ui5ac6EpZYSsfPWWxIbvCFcOVMPMmElMNlw6lAWFec56ART+ar/l7osiNrI1hxWkYxsC
         d1OKFcm9x86rEcNY8ccJQ8wsjAFIm+WI+iQTQS0PTsufQZ/qGfVyu/Pq6Mb8s7wgR/79
         RY4w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780445906; x=1781050706; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wFeYHhECeScruPD6jEd32iRszgXOHa2SbyVuCBngtgM=;
        b=nygV24H5AZzTR+Xgf5QpV0kctt2NaTjaJo7p2A4SpaaUGWw4CR7l19dbNBGBwj2SL6
         kxVv+6OdsvIm+D3Od9dnthe/zZ0S5h2lQpfvZGV6vAKKnhXMInPpD8MGgUH/EamtDWuy
         cvHZ6DEt4uE8i7+wXu1STFFue0InVy0BCblbb35iGpRnoEd8M89edXm/zp4FQnktS5KA
         w3XeULPy7TNRRnUBzfbcaKOuJqUR3hzoxeTxCkMxZUGalwEJL1vicSG0Tm90wQY9KGjK
         UV7Qp0H3qCqh/uTIgiJArwMmA0l9jbGlK92frsJMmGKHj34cSlhbKIL8sOhai5SneJhG
         UsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780445906; x=1781050706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFeYHhECeScruPD6jEd32iRszgXOHa2SbyVuCBngtgM=;
        b=AdTaBqIOH2oRu9tIvPonc5kf9RgfuLJsRNOzU2i+xBZ5fRsneQaM9jPR9CT4NOT4I2
         Fxp3VYqqmUb7XXakZcnldiJSY5NsTJFw+h3RPUzIGanl6x+YAxVwvlAQWtpSoide2Owb
         PUwugp94k/h0i+D7VBYJnkhciOCM66wweLV7Sixw3P24ubFD0h30sWV5PjTBLTe1T/Ia
         MSiNNiF0uX8rKpZNMtVQxDXaMO10hL00SXs3cr8l8NszpzkwatHx0Au616BW/lrLrFB/
         FBpYMoSqjgYHoyg1L8dBCdGWTqEDW1glLtjK+DrJYHe/aRqoIgYvVN/f28XXnK2+Q3AW
         9wWw==
X-Gm-Message-State: AOJu0YzOes9qOCat9fwLQXI5r25Rm/Ukm5JFnNlgU8QUPUOQ6XHLb0Km
	AcaTaaysUs1gNpAy+pOXIW9SPhwg9KtFUc0+TMw4w5omtRRWg4SfxwUiP7feEMAwYoKo8zbD1Ot
	qt2YMkl0tAS9IFvS1+cYYJI4TBsrSjhZp9AWFdNEXYB/sMNzIHxfSQxRH
X-Gm-Gg: Acq92OFeEOezPJ/5KjsUTSZp3BjJUY2UoKRiQdduxnpGyx6jrMdCACFZ3JkeANWe9Kb
	jsDaq01TKzkA5ltltABRvyWxBFOlgIixfYYw8Qp3XuhedcBazkEwRzn6rqSERf6Waf71I9MX6PP
	3DaoD2KH3s+givwt+2xIS9Cs2EorC4p0XYLUWVRoJvkGiWVlmQV130mS+RD9/a3uMDBID6mogYe
	aIfw3h4asCu0POarWQ33hf0IYeXvSFB3kYCe45tyecNuX9s1B/Gxfki5iX7mkk06MjQydw6Z43A
	cBPa+NNWgbcKmjblQDFNIVC8J66t9pkDNiY+EjSbiiOFyPx6mltv
X-Received: by 2002:a05:622a:4891:b0:516:4f62:85ea with SMTP id
 d75a77b69052e-5177bc33fe5mr952241cf.21.1780445905835; Tue, 02 Jun 2026
 17:18:25 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAEPZvmNu--4-Fm0Kq1SVkkNByOB3SDR3MxRQ9Y1w4j28gUBAcg@mail.gmail.com>
 <29fcface8daf3e542bdae518bbbe3ef2eb83c9c7.camel@codeconstruct.com.au>
In-Reply-To: <29fcface8daf3e542bdae518bbbe3ef2eb83c9c7.camel@codeconstruct.com.au>
From: Bhargava Naidu Gulla <bhargavagulla@google.com>
Date: Tue, 2 Jun 2026 17:18:14 -0700
X-Gm-Features: AVHnY4KqGPAoTnpXmEYeVYcIgfrxe0l1VbvEIm3RF3hsYtz7n7YtlFLea_jgv10
Message-ID: <CAEPZvmNKzTP_BADFiAMDU=tjQOepOVnsSio=S+5Jq4QbeT5_9A@mail.gmail.com>
Subject: Re: [Vulnerability Report] phosphor-logging / openpower-pels: Silent
 Log Task Dropping due to Timer Overlaps in HostNotifier
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c3b74f06534e5d48"

--000000000000c3b74f06534e5d48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

My apologies for using the wrong list. Thanks for pointing me in the right
direction, I will forward this report over to
openbmc-security@lists.ozlabs.org and make sure to use that address for any
future reports.

Best,
Bhargava

On Tue, Jun 2, 2026 at 5:05=E2=80=AFPM Andrew Jeffery <andrew@codeconstruct=
.com.au>
wrote:

> Hi Bhargava,
>
> In the future, security vulnerability reports should be sent to:
>
>    openbmc-security@lists.ozlabs.org
>
> as per:
>
>
> https://github.com/openbmc/docs/blob/master/security/how-to-report-a-secu=
rity-vulnerability.md
>
> Andrew
>
> On Tue, 2026-06-02 at 16:06 -0700, Bhargava Naidu Gulla wrote:
> > Hi OpenBMC Security Team,
> >
> > I would like to report a race condition and state corruption
> vulnerability
> > inside the Host Notifier state machine of the openpower-pels extension.
> >
> > Overview of the Vulnerability:
> > Rapid, concurrent, or noisy host state transitions can corrupt in-fligh=
t
> > task tracking for Platform Event Log (PEL) notifications. This results =
in
> > event log notifications being silently dropped, preventing critical
> system
> > error logs from being delivered to the host operating system.
> >
> > Affected File and Location:
> > File: extensions/openpower-pels/host_notifier.cpp
> > Line: 234
> >
> > Root Cause:
> > The `hostStateChange(true)` method arms the `_hostUpTimer` but does not
> > disable or cancel already active timers (such as `_retryTimer` or
> > `_hostFullTimer`).
> >
> > When the first timer expires, it invokes `doNewLogNotify()`, which
> launches
> > an asynchronous PLDM file transmission task and sets the tracking
> variable:
> >   _inProgressPEL =3D pelID;
> >
> > Because `doNewLogNotify()` lacks a command-in-progress guard check
> > (`_inProgressPEL !=3D 0`), if the concurrent overlapping second timer
> expires
> > before the first PLDM command's asynchronous response is received, it
> > blindly executes `doNewLogNotify()` again. This second execution sends
> > another PLDM command and overwrites `_inProgressPEL` with a new ID. The
> > tracking for the first PEL is permanently dropped, and subsequent statu=
s
> > responses are mismatched.
> >
> > Proof of Concept:
> > 1. Force the HostNotifier into a retry state where the `_retryTimer` is
> > currently armed due to a full or blocked state.
> > 2. Rapidly trigger a D-Bus host state property change, invoking
> > `hostStateChange(true)`. This arms `_hostUpTimer` in parallel.
> > 3. The `_retryTimer` expires first, starting a PLDM send task for PEL I=
D
> A
> > and setting `_inProgressPEL =3D A`.
> > 4. The `_hostUpTimer` expires next before the D-Bus/PLDM response for
> PEL A
> > returns, and fires `doNewLogNotify()` again, sending a task for PEL ID =
B
> > and overwriting `_inProgressPEL =3D B`.
> > 5. Observe that tracking for PEL ID A is dropped from the queue and
> > permanently orphaned.
> >
> > Proposed Patch:
> > Add an active command guard check at the beginning of
> > `HostNotifier::doNewLogNotify()`:
> >
> > if (_inProgressPEL !=3D 0 || _hostIface->cmdInProgress())
> > {
> >     return;
> > }
> >
> > Legal Name for Attribution: Bhargava Naidu Gulla
>

--000000000000c3b74f06534e5d48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<br><br>My apologies for using the wrong list. T=
hanks for pointing me in the right direction, I will forward this report ov=
er to <a href=3D"mailto:openbmc-security@lists.ozlabs.org" target=3D"_blank=
">openbmc-security@lists.ozlabs.org</a> and make sure to use that address f=
or any future reports.<br><br>Best,<br>Bhargava<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at 5=
:05=E2=80=AFPM Andrew Jeffery &lt;<a href=3D"mailto:andrew@codeconstruct.co=
m.au" target=3D"_blank">andrew@codeconstruct.com.au</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bhargava,<br>
<br>
In the future, security vulnerability reports should be sent to:<br>
<br>
=C2=A0 =C2=A0<a href=3D"mailto:openbmc-security@lists.ozlabs.org" target=3D=
"_blank">openbmc-security@lists.ozlabs.org</a><br>
<br>
as per:<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/docs/blob/master/securit=
y/how-to-report-a-security-vulnerability.md" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openbmc/docs/blob/master/security/how-to-report-a=
-security-vulnerability.md</a><br>
<br>
Andrew<br>
<br>
On Tue, 2026-06-02 at 16:06 -0700, Bhargava Naidu Gulla wrote:<br>
&gt; Hi OpenBMC Security Team,<br>
&gt; <br>
&gt; I would like to report a race condition and state corruption vulnerabi=
lity<br>
&gt; inside the Host Notifier state machine of the openpower-pels extension=
.<br>
&gt; <br>
&gt; Overview of the Vulnerability:<br>
&gt; Rapid, concurrent, or noisy host state transitions can corrupt in-flig=
ht<br>
&gt; task tracking for Platform Event Log (PEL) notifications. This results=
 in<br>
&gt; event log notifications being silently dropped, preventing critical sy=
stem<br>
&gt; error logs from being delivered to the host operating system.<br>
&gt; <br>
&gt; Affected File and Location:<br>
&gt; File: extensions/openpower-pels/host_notifier.cpp<br>
&gt; Line: 234<br>
&gt; <br>
&gt; Root Cause:<br>
&gt; The `hostStateChange(true)` method arms the `_hostUpTimer` but does no=
t<br>
&gt; disable or cancel already active timers (such as `_retryTimer` or<br>
&gt; `_hostFullTimer`).<br>
&gt; <br>
&gt; When the first timer expires, it invokes `doNewLogNotify()`, which lau=
nches<br>
&gt; an asynchronous PLDM file transmission task and sets the tracking vari=
able:<br>
&gt; =C2=A0 _inProgressPEL =3D pelID;<br>
&gt; <br>
&gt; Because `doNewLogNotify()` lacks a command-in-progress guard check<br>
&gt; (`_inProgressPEL !=3D 0`), if the concurrent overlapping second timer =
expires<br>
&gt; before the first PLDM command&#39;s asynchronous response is received,=
 it<br>
&gt; blindly executes `doNewLogNotify()` again. This second execution sends=
<br>
&gt; another PLDM command and overwrites `_inProgressPEL` with a new ID. Th=
e<br>
&gt; tracking for the first PEL is permanently dropped, and subsequent stat=
us<br>
&gt; responses are mismatched.<br>
&gt; <br>
&gt; Proof of Concept:<br>
&gt; 1. Force the HostNotifier into a retry state where the `_retryTimer` i=
s<br>
&gt; currently armed due to a full or blocked state.<br>
&gt; 2. Rapidly trigger a D-Bus host state property change, invoking<br>
&gt; `hostStateChange(true)`. This arms `_hostUpTimer` in parallel.<br>
&gt; 3. The `_retryTimer` expires first, starting a PLDM send task for PEL =
ID A<br>
&gt; and setting `_inProgressPEL =3D A`.<br>
&gt; 4. The `_hostUpTimer` expires next before the D-Bus/PLDM response for =
PEL A<br>
&gt; returns, and fires `doNewLogNotify()` again, sending a task for PEL ID=
 B<br>
&gt; and overwriting `_inProgressPEL =3D B`.<br>
&gt; 5. Observe that tracking for PEL ID A is dropped from the queue and<br=
>
&gt; permanently orphaned.<br>
&gt; <br>
&gt; Proposed Patch:<br>
&gt; Add an active command guard check at the beginning of<br>
&gt; `HostNotifier::doNewLogNotify()`:<br>
&gt; <br>
&gt; if (_inProgressPEL !=3D 0 || _hostIface-&gt;cmdInProgress())<br>
&gt; {<br>
&gt; =C2=A0=C2=A0=C2=A0 return;<br>
&gt; }<br>
&gt; <br>
&gt; Legal Name for Attribution: Bhargava Naidu Gulla<br>
</blockquote></div>

--000000000000c3b74f06534e5d48--

