Return-Path: <SRS0=wYns=FE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174DDC64E7B
	for <openbmc@archiver.kernel.org>; Mon, 30 Nov 2020 17:43:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0340206E3
	for <openbmc@archiver.kernel.org>; Mon, 30 Nov 2020 17:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CtgI+1on"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0340206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClCJ804LZzDq9J
	for <openbmc@archiver.kernel.org>; Tue,  1 Dec 2020 04:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CtgI+1on; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClCGC11n1zDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 04:41:30 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id y18so11567627qki.11
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qFtUC1abob0p3emf6sZlZHwN6N2AqEqrtKF6N/U3zu8=;
 b=CtgI+1onOgIL3b9/vG2UFv7dtYDeiJ//XyTbQzyrcv0xGl10aijXMRWpLiVg72Xt66
 BBkIHk9wWcEmiVcismw7tSuYK6scTKZynV1m3MWXSf6LckjL6yDiquW0lBu4DBmWdh86
 vqupeCz1s0MfjCF0ZKkFF7b0pEv4aQj0WIsQyn6/HlYnhaTz2ArIMfyPoPxD2sBMl7Js
 SZThgm6ejYgYumTtap/g+xDlLEIgUwgxQGG3XrMAXl9OwWaLVVhtPnjn4XfxHDwy4qoo
 Skur3sviqn/WETRODfdPb6wzKrxqAVy5d7idguLkrIhCCt0+XdE15u89GOXLiWzV7YPd
 bhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qFtUC1abob0p3emf6sZlZHwN6N2AqEqrtKF6N/U3zu8=;
 b=BCnkamgZl89PZ/EyZqly041imvzFgIDGqUYjqCPxyxBxOYkH51XRXMqGXKk/KB6kkS
 X1Rb0etDuwXbMr2Jqr/fhLWErNvpP7yWV9XqwtqgPhpRCOs90FhqVxfSd07+qtuGtUB6
 8pJzd1/2vnwH9OCUNgHmdVJFQd6hrIOmlpPdCN3+jJg9y90xDkD+VcjkJP10UhHM5W6r
 6V9/7K3S8/Vp5YlQ19h4bSIutqURcsnoD8BzUYabVNSh23Lyv1Ocvv7d22c6Gz35/Dpn
 +2BuR01K8RlTyLKKk1F7h1wXpudnd2tGnTErWvPGul87BKzPAUVUaR8VJnwQKEnSg54W
 rEpw==
X-Gm-Message-State: AOAM5321J+xRdC8HM7P9geyZuKEypGrPikKanMwwvcU/zbo6BgG4LIge
 TbtCCYllETLJxM3sMgAvLATnI/hvu2Rj4i0cMq+Nng==
X-Google-Smtp-Source: ABdhPJwFXwCT02fhiCPMOLFoitDlb1qd6q8/I1fK2j3dJCB2+se54am7D8/7KAfnJ93/so2W4nvBRtvL25GFnkokA0I=
X-Received: by 2002:a37:8586:: with SMTP id
 h128mr23837000qkd.241.1606758085356; 
 Mon, 30 Nov 2020 09:41:25 -0800 (PST)
MIME-Version: 1.0
References: <3f94f822-0df2-e8ae-71db-2ecb512f93a9@amd.com>
In-Reply-To: <3f94f822-0df2-e8ae-71db-2ecb512f93a9@amd.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 30 Nov 2020 09:41:13 -0800
Message-ID: <CAGMNF6VEKOn-n2_HvpTwZTQ1PXdCgy9kUAGejid0DQybvOVQ2g@mail.gmail.com>
Subject: Re: SB-TSI virtual hwmon driver
To: Supreeth Venkatesh <Supreeth.Venkatesh@amd.com>
Content-Type: multipart/alternative; boundary="000000000000edf35205b556840e"
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

--000000000000edf35205b556840e
Content-Type: text/plain; charset="UTF-8"

Hey Supreeth,

Thanks for reaching out! Actually, I was sidetracked this year and didn't
have a chance to address the latest comments from the upstream reviewers. I
was hoping to get it landed upstream first.

Let me take a look again this week.

On Mon, Nov 30, 2020, 8:27 AM Supreeth Venkatesh <supreeth.venkatesh@amd.com>
wrote:

> Hi Kun/Joel,
>
> I am little late to SB-TSI virtual hwmon driver patch series:
>
> https://patchwork.ozlabs.org/project/openbmc/cover/20200405030118.191950-1-kunyi@google.com/
>
> I could not find this patch series included in OpenBMC Linux kernel fork.
> What is the status on this? Any plans to include this driver in dev-5.8
> branch?
>
> Thanks,
> Supreeth
>

--000000000000edf35205b556840e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Supreeth,<div dir=3D"auto"><br></div><div dir=3D"auto=
">Thanks for=C2=A0reaching out! Actually, I was sidetracked this year and d=
idn&#39;t have a chance to address the latest comments from the upstream re=
viewers. I was hoping to get it landed upstream first.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Let me take a look again this week.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Nov 30, 2020, 8:27 AM Supreeth Venkatesh &lt;<a href=3D"mailto:supreet=
h.venkatesh@amd.com">supreeth.venkatesh@amd.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hi Kun/Joel,<br>
<br>
I am little late to SB-TSI virtual hwmon driver patch series:<br>
<a href=3D"https://patchwork.ozlabs.org/project/openbmc/cover/2020040503011=
8.191950-1-kunyi@google.com/" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://patchwork.ozlabs.org/project/openbmc/cover/20200405030118.191950=
-1-kunyi@google.com/</a><br>
<br>
I could not find this patch series included in OpenBMC Linux kernel fork.<b=
r>
What is the status on this? Any plans to include this driver in dev-5.8 bra=
nch?<br>
<br>
Thanks,<br>
Supreeth <br>
</blockquote></div>

--000000000000edf35205b556840e--
