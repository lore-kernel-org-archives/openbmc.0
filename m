Return-Path: <openbmc+bounces-1779-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10E7FEEF49
	for <openbmc@archiver.kernel.org>; Tue,  7 Apr 2026 14:07:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqp16630Cz2yh4;
	Wed, 08 Apr 2026 00:07:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a31" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775570842;
	cv=pass; b=L/zaMAe6rk7utBs8JiPi11tVI6Cksau/Pp7RvD8j6m1aBslz+jkFmJzBfkvsqfsdy0u+kiKMvnIyKeWLCAGmOXhRDBJ/mw5yiUOv3NRu9f683yWEETEfEhPvvYOsUQec7S9cH7pKGd5XIrTlNlBUgjH8T7JT+AEql5NXa4A+1M+4HF+di23sGXGB2tbnf78NgoaHoLk0eOFqfgB6JLGGWAQtzQxdAVbDROmNyih40IXlONXNQfS4m+dclmZeAhZXsCyppBGvIJnXrX5aCaHeYZ44aQqo1a8bgsiRMqsh6b1zrG0z1+cZjZWaEqlEhXemtOqY05BNUM/jSl1THIZQ6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775570842; c=relaxed/relaxed;
	bh=qrfpiSlGxQztpmhiw5jN1i0QUscRdxMU8eEDn4I8UNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kx9N39/7NYFZLqBOf+ZJbQ1IZp4+lCwelRXqHOwVkB+US6aA1ym6MQP4vhfis1T6eCzvLNFi1xiZEqIJ9z8EDIL+beJ6EhPDMPTYOcPsZZkVPEuiEK0Poz2V8kwIhAXYgbPovf3WRkWpiuDi07r0CzQsh03LxU2UH2ImQWoIBKOFbKe7oBfS9Uo9l9J46dgwK9ifopLwca44q7RP4tfAhopkwKxRQkzyO0mvheijFLFYOBjtFGTRPonXmyZdkL/EjfQxy/bVSbhxnggay5sSD0IGOmd3vRlxVk5r6GMuvOIQs33S3CfQ9jQFqf+qn2TSNep4Ew4n8jHAXfF44BK76A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzkXwodP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzkXwodP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fqp154xxGz2ySC
	for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2026 00:07:20 +1000 (AEST)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so1464965e0c.1
        for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2026 07:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775570838; cv=none;
        d=google.com; s=arc-20240605;
        b=Gnn0jWPOZoKI/tWW86A9l8ZTi9XhEGrEKQ0yh5UxcCv7V0cmFpyKb5gD0WgZ7mt10K
         YN1LROooNHGUrPYiFkpy9EyNLninUPSPHmnml/0oP3gSojs9pOllh6yelm8E/k8iHr2t
         IY/vKTsq5SA/Q7BqEc4gpWuMP1dBQbxKHLowwHGbHccz+Cmar3vaFgJgj443ElfW2AeU
         Xc0cHBmaIf5EoDc2RU5z5T5yuHU9tPxCeFwbGsjZJCtjZ3o1gGogZvSnxXRABbr2eNAb
         yDkBi9QDGnZ0LI4NbU4UnBY+LXPDMdceKNMWFfzvP3XBN2p8lJzRgpv6Ortp5Nh6YZZe
         hFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qrfpiSlGxQztpmhiw5jN1i0QUscRdxMU8eEDn4I8UNo=;
        fh=1Fz7TnWnhPi8njP3lp5fJ8JqoLKu7HPMS4Wq5hVt1ag=;
        b=HWC41wQEWuzg/BDMlbTLRU+TP4cCv2+nb2oSnN9ugPPJv9T9MkJaFso0VsSnqT8pBa
         eNWOCSkvcKWQX7YvrS0F/nXAfyUGm6Go0yu9Jj6AnVkosBipOm/D+xxG6eJ0cMNGCPGF
         u+afhFcaWwEYz3uUEA1Yrya69EtVWMVoKIPr5Mru1Si0BzmwTY3++P2dnQ03z3Tvy4ls
         fHzeYz8lSgI1NZkrNg5IBgZyC6QdU8TgJTpYpFZWv9756P/hFMI3ZZoSeZSWn/M0PWfZ
         sqFQMaoIFNGu73bjMPj8p0nRYcrmqCHXQvC4de1R2IAV2cLj/H0lHYG3GnrOwbGmpjDG
         nEqQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570838; x=1776175638; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qrfpiSlGxQztpmhiw5jN1i0QUscRdxMU8eEDn4I8UNo=;
        b=hzkXwodPv8Yra1XTuYbeJYUQ9ORwwrFfLruz/6h3lbP9X5plQdrM00ht3JZ1bG56Ad
         M66kzoofl5qkvLqHYrjkn9qrgB8QO4D/VG6zOJYMvlK4mvPQw+Zx+2il7OWIoIIHaY37
         9QpXqR7X/Y1mZzVbrj3GkTAmVaTlautgroRtyIaO85c094bAFYWOHilsusYbBEv3Dto/
         10UoU1/30MIyqV5HffhDyK0iaILoD1WbMrynjW8LQaXhjpsIffNoQA1BLS2FWfxZ/8Sg
         5AsnOoRroON13KtvpNmGDuVdS7YVBanALz9GTKwL0gaSXZwlQ+O3PvXyzZag/vVr3dPT
         7GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570838; x=1776175638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrfpiSlGxQztpmhiw5jN1i0QUscRdxMU8eEDn4I8UNo=;
        b=A1X+97hMZTZmjBwgwGhmCGdHqh9XOKVIh04GI7q7ghfUmcmnWfhFVm643fVXE2F6br
         Q+KzDLlsCxqqVS21s51Hjzwligrs5oRKh5DpIKytzbtFUaEtEBBa6Y61fL6SDtxB6cw1
         CWl9LuPOJv6QlnNXtoH4w5SOd8t5nckxP737KVNZ/+78l6prw6JJBBHe0d49IMU6SMRw
         1LeKvATLdnj8XQHAK4r5C+vFQl8IlgcArmURCVxd6eaJkq+JI8h9zEg0vpHr1efef7Vc
         U/rMNpCh9l7fQd+nSdugJhdjnaCY54nm64DViMe9MQZ2qXtiaBI9xVIMNgJhllfXxUPb
         6VHA==
X-Gm-Message-State: AOJu0YzmbshAQoDT7BljlamOHe0u4EwYTYrmNkrvlt0knuc069inHwOB
	RLKYT3gveo5wjUKF+IBsNNTsMt7q+CfQAL9khjDPn9GCdgzjxU+2SEYoeWVz1RoBS0sx9CmhpoW
	t1D0sVdViKCwUABA9t/OlVB6xnw8ya2I=
X-Gm-Gg: AeBDiesmzfZyR1tsPmG/lG1Kxtd65XeI3WhVnkhJpSfhRrv59Hc8VR1fO6MBeTxHVfY
	ZBdFkNxex+/AG+f6BVYqeSP3a6ZvaKsPaNHbv8pgh5tfKdUI+mzxfJC+UnQpuV5a+nu+CQxSQvc
	LBKTayQJ6fEUw+6QPfH8JlwtAVJNWauEC4owFZ7PCS+iLzEqwlmlYaVwAeN73DgIJKaQzvbQRhg
	ROVeU+b68k3eCj6WvSeiv3X/D8tW0KTiJvtxJQLY0LMA2tVSKwHtPPgPbTdvDmV99n2zfY1UKFF
	RqDcv3SSfo0YubTaPEmC+O72vhfea6p+YJu/ffa251/vQk+xHnctwV5/28EsW+6mVJrE
X-Received: by 2002:a05:6122:3117:b0:56c:d34e:bb1a with SMTP id
 71dfb90a1353d-56dab8c639amr5971956e0c.4.1775570838333; Tue, 07 Apr 2026
 07:07:18 -0700 (PDT)
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
References: <CAMYVuYj-z4DAo-a+5BVUojfRUC7hS5B-vttOuTc_RcGyEfNT4g@mail.gmail.com>
In-Reply-To: <CAMYVuYj-z4DAo-a+5BVUojfRUC7hS5B-vttOuTc_RcGyEfNT4g@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 7 Apr 2026 09:07:01 -0500
X-Gm-Features: AQROBzBqpnEw4baIi1N8HMIFJG9JVvF8Y-HKZZS7dYUepKSmBBMEqMjMd_13qk4
Message-ID: <CALLMt=rOCOR3BZMAC1gAOw7H4qF2vQhpFjP2YWwxGHwz86UL1A@mail.gmail.com>
Subject: Re: Help needed with OpenBMC Gerrit account merge
To: Manish Tiwari <tmanish.in@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000017af6b064edf4d19"

--00000000000017af6b064edf4d19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 7:01=E2=80=AFPM Manish Tiwari <tmanish.in@gmail.com>=
 wrote:

> Hi,
>
> I need help with an OpenBMC Gerrit account issue.
>
> I have two Gerrit accounts:
>
>    - tmanish.in@gmail.com - old account, which I can no longer log into
>    - tmanish.in+openbmc@gmail.com - current account, which my
>    GitHub/OAuth login opens
>
> Hi Manish, I'm a bit surprised github let you setup a separate account
using just the +openbmc on your existing email address. When I  look up
these 2 emails in our gerrit server, I don't see a valid account for your
tmanish.in+openbmc@gmail.com  email. Please be sure to follow the steps up
in https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md
for that new github account. Once you have a valid account in gerrit I can
remove your previous email and account and you can add it back in if you
wish to your new account (although you're basically using the same gmail
account with both of those emails).

Andrew

--00000000000017af6b064edf4d19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, =
2026 at 7:01=E2=80=AFPM Manish Tiwari &lt;<a href=3D"mailto:tmanish.in@gmai=
l.com">tmanish.in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><p>Hi,</p><p>I need help with a=
n OpenBMC Gerrit account issue.</p><p>I have two Gerrit accounts:</p><ul><l=
i><code dir=3D"ltr"><a href=3D"mailto:tmanish.in@gmail.com" target=3D"_blan=
k">tmanish.in@gmail.com</a></code>=C2=A0- old account, which I can no longe=
r log into</li><li><code dir=3D"ltr"><a href=3D"http://tmanish.in" target=
=3D"_blank">tmanish.in</a>+<a href=3D"mailto:openbmc@gmail.com" target=3D"_=
blank">openbmc@gmail.com</a></code>=C2=A0- current account, which my GitHub=
/OAuth login opens</li></ul></div></blockquote><div>Hi Manish, I&#39;m a bi=
t surprised github let you setup a separate account using just the=C2=A0+op=
enbmc on your existing email address. When I=C2=A0 look up these 2 emails=
=C2=A0in our gerrit server, I don&#39;t see a valid account for your
<code dir=3D"ltr"><a href=3D"http://tmanish.in" target=3D"_blank">tmanish.i=
n</a>+<a href=3D"mailto:openbmc@gmail.com" target=3D"_blank">openbmc@gmail.=
com</a></code>=C2=A0 email. Please be sure to follow the steps up in=C2=A0<=
a href=3D"https://github.com/openbmc/docs/blob/master/development/gerrit-se=
tup.md">https://github.com/openbmc/docs/blob/master/development/gerrit-setu=
p.md</a> for that new github account. Once you have a valid account in gerr=
it I can remove your previous email and account and you can add it back in =
if you wish to your new account (although you&#39;re basically using the sa=
me gmail account with both of those emails).</div><div><br></div><div>Andre=
w</div><div>=C2=A0</div></div></div>

--00000000000017af6b064edf4d19--

