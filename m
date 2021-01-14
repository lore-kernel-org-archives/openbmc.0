Return-Path: <SRS0=cbAk=GR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8BFC433E0
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 19:33:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 180E923B6B
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 19:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 180E923B6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGvcR1WlfzDrpn
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ORzOzkPX; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGvZg4HFvzDrp4
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:31:53 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id m10so7788486lji.1
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyU09CwCHFeJ7XMSmX2vUdKXlhkJEiu80MNCmVDildw=;
 b=ORzOzkPXfvSqTYJ3pJWb+wJa4EYLEHpWm0SMR7dtTFh9mQ+BI9dabgAk6Y9NS5GGZj
 FQQPnXgGeCnw6sINYUClyqIbw4ZKi5ZFvvJA+49EHO1dIPSecoqaPHISLNRu5mxj6kkW
 sMqt09FnGoCsyBTt8/tb3A4Ji126VheUBot2xAq6r/lgFF8/r0mjCH2Wtuis9L5qTu+v
 +9xICW1d5pH075vDRnph1skGVAeVNdUWRkgKNHAnq0KFbsmILQx8t28VtsG0QCxfKr5i
 UCmnQ37sFL+aoht0Mnh0G6ILVRyEDaWO/TOrwSfiieqeh5cZtkweqAtmWy9yqX7rOua9
 mGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyU09CwCHFeJ7XMSmX2vUdKXlhkJEiu80MNCmVDildw=;
 b=R3c/9zszfH7ALhqcEM0lJYgTJmOtRIeNj0vC0J9yP0miRay2F1gMb9AmVedGUn/JhO
 nv6p+LUYISQ6toglfNUUDTpNufaZjdBQeRdmP2in7PXu2v6UCNbMmzPrt6GL7wgbWyct
 J4wHXRhSVGlzpeGOMIEaoupRUF5aWhFu7zT5nZBFVUo8QqCGwvfFahe2dyRzfzOCfKXs
 pGAVbPgjjN9fKBvosLn0EpX7JjgZTjnd5OUtqhcrFPphI8dfVueLIEqlaWYsrZubBX/k
 fm7r4HHGaW7FRDXgRv03F7qIyPYyphppsqYk1PaPZInKArsr4jzQw2TUyXNYK0vCUKcp
 t+7Q==
X-Gm-Message-State: AOAM533eRxQBkSXtlVFFySMV8wHcybUMrQ3v3Nk4FelkPcPCYvSGg5hn
 hbj6eioKBj62tvQ1Ilz2DXVjcLj31PDCvuemaGikmtt23v4=
X-Google-Smtp-Source: ABdhPJzpEYn/ekbCVEkghVPuf8qALw6UMYLw8ZORzsP1PWZnSUnTCgRtVJDRjPRuBCg+0VRyJHlQvOjh3HKf798EXH0=
X-Received: by 2002:adf:e552:: with SMTP id z18mr9173966wrm.29.1610642332483; 
 Thu, 14 Jan 2021 08:38:52 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 14 Jan 2021 08:38:41 -0800
Message-ID: <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="00000000000016ccff05b8dee499"
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
Cc: Willy Tu <wltu@google.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, chunhui.jia@linux.intel.com,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--00000000000016ccff05b8dee499
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 6:40 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Tue, Jan 12, 2021 at 06:54:14PM -0800, Willy Tu wrote:
> >> Team,
> >> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. =
I
> >see several functionality in this repo like sensors and storage commands
> >are generic enough to be used by other platform who is using entity
> >manager. So I feel that we should have these functionalities to be moved
> to
> >a separate common repo which can be used by everyone and this repo can
> only
> >contain Intel OEM specific IPMI command support.
> >>
> >> My 2 cents =F0=9F=98=8A
> >
> >Hi All,
> >
> >I guess I'll start working on this if no one has any objection to it.
>
> Awesome!
>
> >As mentioned in the beginning of the thread. The plan is to break down t=
he
> >intel-ipmi-oem repo into two parts.
> >- True OEM at Intel
> >- Dynamic Sensor stacks (new repo)
>
> Why is dynamic sensor stacks a new repo?  I would like to see this done
> in the existing ipmid repo.  If the default implementations there today
> are undesired, I'd be fine with seeing those moved to the
> openpower-ipmi-oem repository.
>

I only suggested a new repo originally because today it's a separate repo,
and the long ago patch to add it directly to ipmid got the feedback that
was too different than the existing to go there.  If we're now ok with it
going in IPMID, I'd prefer that as well.

Would people prefer it to be a package config on IPMID to select between
the two implementations?


>
> FWIW I would like to make use of dynamic SDR on my new systems (I work
> for IBM) but I still have to maintain support for Witherspoon, which
> relies on the old fixed & hardcoded sensor identifiers.
>
> -brad
>

--00000000000016ccff05b8dee499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 14, 2021 at 6:40 AM Brad =
Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesq=
uirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, Jan 12, 2021 at 06:54:14PM -0800, Willy Tu wrote:<br>
&gt;&gt; Team,<br>
&gt;&gt; Intel-ipmi-oem should be broken and 2 parts, genric and oem specif=
ic. I<br>
&gt;see several functionality in this repo like sensors and storage command=
s<br>
&gt;are generic enough to be used by other platform who is using entity<br>
&gt;manager. So I feel that we should have these functionalities to be move=
d to<br>
&gt;a separate common repo which can be used by everyone and this repo can =
only<br>
&gt;contain Intel OEM specific IPMI command support.<br>
&gt;&gt;<br>
&gt;&gt; My 2 cents =F0=9F=98=8A<br>
&gt;<br>
&gt;Hi All,<br>
&gt;<br>
&gt;I guess I&#39;ll start working on this if no one has any objection to i=
t.<br>
<br>
Awesome!<br>
<br>
&gt;As mentioned in the beginning of the thread. The plan is to break down =
the<br>
&gt;intel-ipmi-oem repo into two parts.<br>
&gt;- True OEM at Intel<br>
&gt;- Dynamic Sensor stacks (new repo)<br>
<br>
Why is dynamic sensor stacks a new repo?=C2=A0 I would like to see this don=
e <br>
in the existing ipmid repo.=C2=A0 If the default implementations there toda=
y <br>
are undesired, I&#39;d be fine with seeing those moved to the <br>
openpower-ipmi-oem repository.<br></blockquote><div><br></div><div>I only s=
uggested a new repo originally because today it&#39;s a separate repo, and =
the long ago patch to add it directly to ipmid got the feedback that was to=
o different than the existing to go there.=C2=A0 If we&#39;re now ok with i=
t going in IPMID, I&#39;d prefer that as well.</div><div><br></div><div>Wou=
ld people prefer it to be a package config on IPMID to select between the t=
wo implementations?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
FWIW I would like to make use of dynamic SDR on my new systems (I work <br>
for IBM) but I still have to maintain support for Witherspoon, which <br>
relies on the old fixed &amp; hardcoded sensor identifiers.<br>
<br>
-brad<br>
</blockquote></div></div>

--00000000000016ccff05b8dee499--
