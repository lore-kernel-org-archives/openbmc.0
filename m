Return-Path: <SRS0=YSNb=JZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0537C433ED
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 16:06:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B7A61407
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 16:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B7A61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVk5L19B3z2ysq
	for <openbmc@archiver.kernel.org>; Thu, 29 Apr 2021 02:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=kk18ZA7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kk18ZA7M; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVk4t0frLz2xZH
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 02:05:47 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 y14-20020a056830208eb02902a1c9fa4c64so22316392otq.9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fkqdOUNJKz2ZM+BwGSAXaU1wtQONJAvQznCmMS9Vm4A=;
 b=kk18ZA7M4NqyUmwJgBwCI5wSnKbWUh3/2wc9oJQcCRgli7XQsHdWhu4X9XBMYpfObk
 /dOWCh47siWQtRSiWsQ+3xDc1+1M+El1oEOM5qInwWzJl3qONhSUfVO1GQWhnOSQ26UW
 6ch3EPc5Svvm1UhVdP8K1M1lBjZp5FC/+/tsrUb1ADvl4Zy4xErs0/GZnyxPRziaRWjz
 YG3I+G1F84ZCVmBE7IbOO5CDrVw1OMNxvwFqgFUcbOaeJnkYutdmQhpjVhH+qeq7Okfw
 0x6X05l7BTUBdxp0E0b5ybNHCZAEdFFjRSW0/185mTJtmIQTK8J8FDMkDvrhXcfacphE
 y/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkqdOUNJKz2ZM+BwGSAXaU1wtQONJAvQznCmMS9Vm4A=;
 b=kb54bSdUVrNyJpz7r8V4I3reC3lmuKQAgScESaLef7riJJQvTTV2ZmN0ysJwuFFwh+
 S/M8MV/cVWQQQstM8h50DNS0R7KvTmI+gUN5+hX7QLUZdvWvYR9ZhTjO6rcBJxBIwzhq
 6nfwNgjZZvQ4kCV89KFWLzWh+VudIOEQ0lFaLdkxaViyThAbuOgn4HUNmhbH20Mxow2t
 DiThK5eK1fgFFqTWvFl477uV9S0vU8YDtABEeh3gmhjLk/z47uLGUb+/Xt0Zv7PZyUV9
 nnEWW+fBlfHcKVJ+IcIzgK/abrlWzWAczisnBvWJ4bM6WWeKOhEWaZQcNT9cseXhwNrH
 W1yA==
X-Gm-Message-State: AOAM532mk9S5Hw2GgCJ2pOHtl2C409w9yaBdjFLgBzy2dwvPzmgYE9Fd
 7hzFY114rIPtdEWVvltf9ykZiGAroYPJWsv5pRo7ilrR97M=
X-Google-Smtp-Source: ABdhPJxnDWvjYYwgff/u5ZGwt3z4jzjCzVnx2IX8qRqckxU9pp1BmD1JkYy/rCRxseiq7nC/+Bq/I5/OKaO7yJ6iiFM=
X-Received: by 2002:a9d:615a:: with SMTP id c26mr24452203otk.54.1619625944027; 
 Wed, 28 Apr 2021 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notybt0NeU6N2QFmPFv8bOs3fxHrT_+KVGZyuRJeyCGqxcg@mail.gmail.com>
 <20210428010816.oeumsvfwb6kyu5fq@thinkpad.fuzziesquirrel.com>
 <CAO=notzVwRdayCxbZ6b7A3RG873rB=MJSPbu5rqpR9pnJOSSKg@mail.gmail.com>
In-Reply-To: <CAO=notzVwRdayCxbZ6b7A3RG873rB=MJSPbu5rqpR9pnJOSSKg@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 28 Apr 2021 09:05:31 -0700
Message-ID: <CALGRKGMvBd+rXcd10-Qno=P19fFbJy9eK4=DPV5syqOabGFutw@mail.gmail.com>
Subject: Re: phosphor-hwmon-maintainers group
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000010b9dd05c10a8d99"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--00000000000010b9dd05c10a8d99
Content-Type: text/plain; charset="UTF-8"

Thanks Patrick!

On Wed, Apr 28, 2021 at 8:14 AM Patrick Venture <venture@google.com> wrote:

> On Tue, Apr 27, 2021 at 6:08 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
> >
> > On Mon, Apr 26, 2021 at 12:52:09PM -0700, Patrick Venture wrote:
> > >Brad;
> > >
> > >Matt Spinler and I are in the group phosphor-hwmon-maintainers, but
> > >neither of us in the group are maintainers of the group, so I cannot
> > >add "brandonkimbk" who is taking over my responsibilities on this
> > >repo.  Can you set Matt and myself as Maintainers in the group, and
> > >then I'll add Brandon and remove myself.  Or you can.
> >
> > Hi Patrick, I've added the maintainer role, thanks!
>
> Thanks! - Brandon, I've added you as maintainer, and I've removed
> myself.  For reference, this is managed via this group:
> https://github.com/orgs/openbmc/teams/phosphor-hwmon-maintainers/members
>
> >
> > -brad
>

--00000000000010b9dd05c10a8d99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Patrick!</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 28, 2021 at 8:14 AM Patrick Ven=
ture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Ap=
r 27, 2021 at 6:08 PM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesqui=
rrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Apr 26, 2021 at 12:52:09PM -0700, Patrick Venture wrote:<br>
&gt; &gt;Brad;<br>
&gt; &gt;<br>
&gt; &gt;Matt Spinler and I are in the group phosphor-hwmon-maintainers, bu=
t<br>
&gt; &gt;neither of us in the group are maintainers of the group, so I cann=
ot<br>
&gt; &gt;add &quot;brandonkimbk&quot; who is taking over my responsibilitie=
s on this<br>
&gt; &gt;repo.=C2=A0 Can you set Matt and myself as Maintainers in the grou=
p, and<br>
&gt; &gt;then I&#39;ll add Brandon and remove myself.=C2=A0 Or you can.<br>
&gt;<br>
&gt; Hi Patrick, I&#39;ve added the maintainer role, thanks!<br>
<br>
Thanks! - Brandon, I&#39;ve added you as maintainer, and I&#39;ve removed<b=
r>
myself.=C2=A0 For reference, this is managed via this group:<br>
<a href=3D"https://github.com/orgs/openbmc/teams/phosphor-hwmon-maintainers=
/members" rel=3D"noreferrer" target=3D"_blank">https://github.com/orgs/open=
bmc/teams/phosphor-hwmon-maintainers/members</a><br>
<br>
&gt;<br>
&gt; -brad<br>
</blockquote></div>

--00000000000010b9dd05c10a8d99--
