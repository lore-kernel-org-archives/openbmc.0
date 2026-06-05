Return-Path: <openbmc+bounces-2046-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D823CD6E75
	for <openbmc@archiver.kernel.org>; Fri,  5 Jun 2026 01:07:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gWjvz5LV1z2yrr;
	Fri, 05 Jun 2026 11:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1333" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780621196;
	cv=pass; b=M0eFd4TtVNjw+eB0fgPiU66TDJAEq3WHPCtkjk+/BXuhlNR1Jjek7f8uJbPgf5r1EiLUaHzs7tbCSbX3CuI99Mlo/wkE43YY1iMQwJrVQgHl6hQjXZSrBNyPgEfiQfgMv+1Mipbjfr3xn4u1bthLYSd8TfEcey2GW5097AD6kvi/zUgjtz6TFsfEItRmqeBZPCK5499ajlps7dh/M1mJlVOeWz8XhyM2ndvEnmxJndmb2P0o3JGN3ypgRvNw9joaHuk7KWEbEaycLMxm/vnMIJvxWteMoNTxSau6GYdxs/jqUfzWpp4z8cjzyCNRbTx4vK3HUuwiPjgRVe+F5f/ueQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780621196; c=relaxed/relaxed;
	bh=6gmZzeaWCW/AxSYK6IvdXu3iVhM8i/GSZ8efv9Q1EH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6/5xU/S2lCUtJyG1IYdVLSZPm0hou2XG7DgfJ5M9T7dNHzLtHR9D2vKjjPq7Zip7xSKAuvQTExH5umr+Mgc5LQ/oNIWwKEQatVP7uaWf4YdX5gb7v7CyjNavyGDv3Ob9EFIIwH5HJHdwvQJ3T0CZY+EKAlcTnGBsPNxWV9LcpPKmqcggwAEy/BBT5qGln8dlRkLDVwxOT2poUh4RHLJn0CbrDzaPxGIXw3/pwNEw1xPHeWneMblsv+qOzrSVeVhw9EjTbcwc/x39szma8zrRQb6+U1quCo8UyEfl8JDemMARt9VDSIymt41pVS5nQBpEhkPs3U6oILio3MiZUzBhw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tOCtjLEA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=rio.chen.hj.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tOCtjLEA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=rio.chen.hj.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com [IPv6:2607:f8b0:4864:20::1333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWjlG66RMz2yRM
	for <openbmc@lists.ozlabs.org>; Fri, 05 Jun 2026 10:59:53 +1000 (AEST)
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30749947917so2785941eec.1
        for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2026 17:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780621191; cv=none;
        d=google.com; s=arc-20240605;
        b=O/y49r+5DKAXI+ZGWXkNZh3uuwCM/0oC4peeNwylBVtmsHRW4J2kE/t1P6NU5Gnz7O
         fzA1FzW/nCu7t9sscxAAuJASK5hF5DORnilx2jUYCyrIIW7tNyYYJ6gu4NMG1KP01rTm
         Vc9Vc620YR0sWIB2jq+KUuhrdS2U2YgK1gM3v3cXGqpPpGrxQh70u1aagIOpwt2tHkdR
         /Daggbxnl2crDwKwRlWT7ZpCXqVeRkRLJ5bCmssuRv+qErhV5v07rNP3nKqJ4va9xba4
         skdLLQK7RC/tYdSfBN4XPsvbj4vS7MmLRa8Io/LDZeVK9BhGNFqbQ6fIWOpVMiOubN1b
         3RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6gmZzeaWCW/AxSYK6IvdXu3iVhM8i/GSZ8efv9Q1EH4=;
        fh=jgE4hDT3df2VOYVB8PiXtkngkS44kC13o2CPtBSLsks=;
        b=ArMnvJKTuJdmzseOMYshIzBXHsXXkE4oOFI+apWmluCixYTR0hEK4ANCyrSOzj8SKo
         ENqN8+8gSHfGeVSE2kTBMa7HvRixoi5d1WLa+ze1zzunKZ4Q+IcksJM4BXXdbN4N+vZO
         XXmgoWgCPOg3QWym+VY95YAuEwGnHOWJ9BZUUJQR5QBLnPf0+kCjuNzJCTGT7+I9K2nr
         mJIUASdTcW2qRpJBAlpYJRs+e/5qaXRE1cxt1JzfotVMiSD6ipxf1NxjxLGpMe+sEL25
         7uF2qGo2YA66+t9+1EEQpAm8KxiVRCOKH2Eu6VF2CTsUtrFdk5/KghDLLca+z0w96eAD
         FMFw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780621191; x=1781225991; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gmZzeaWCW/AxSYK6IvdXu3iVhM8i/GSZ8efv9Q1EH4=;
        b=tOCtjLEArGP3WeP0LGc83l6zYwRs3VP00PcStyNdLmsqeUKdvZG2bnu6fpXs09+q8C
         G8QQ1ijEJIKxTjDVAsFUaOsNoQu+rSJh3N5DxNQrYMBghC2af/DhwHciJSY9UUavvSmn
         XEeaehV2hiH5bV5q6vnCUCio7b1FMnNhkeGP4NtVPRMGy1R6uSdL+FH5xHh43BqgMosl
         Akk+Z+G4pHUYHlRxzS/ojIPGQ4G510sLJYBwSo/d64z2faXChZh3NrggWPyN4wGW7VEp
         0dCgENW6V/KpDYaufK4G53PjsXPQO4hUy1S4l6N5yTe0Z2WlbagFXL52HIP4YeZ4bAKD
         vNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621191; x=1781225991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmZzeaWCW/AxSYK6IvdXu3iVhM8i/GSZ8efv9Q1EH4=;
        b=A9v/hrmLVAK0EblpL5tpdZpMl3W9wN+uP0cJ9yKa9m/ref/Hou+AEwbFuvO3oloXA2
         lJsPOVkTqclA8MTv2FxduHcWbZhD8/Lq4ROOv+dqCT5nSf4LjE4+b/pJglw8a22Zz6VP
         xM/zDh1vy6qghRqepcXrlu0jrEt3he7wM3825k8sYvsGbbuePQIvpj30JY10f0yyQVV9
         Q9RyRtiFnek1gP0ZBkkVWeA3tO7VCWRgCVGSV4fE3niXM2LbSPwy+QDBz2op0ot/Q579
         qdsW6UMmgDk0Ca4VYXOVKykVQmSu3iHLQSY37sOcZQPtMxo0WlaYaqbUBWJGwBYWzGn4
         zihw==
X-Gm-Message-State: AOJu0YxzPY90Dy5XKgA6qoeLVIm6jC8cKc8a/q3m2+gqC8/0wrA7uf1T
	AlQhBLjo42aCi0RMSAhOTUN32S8jqWNGvt0Juv9Psfd+v2ZWEuNfs/yFPtphuMWCf1Poocc4ZQn
	K8YeRw2sKLd3d6tx8mvlsy/fargg2xgQ=
X-Gm-Gg: Acq92OEvCuqakPHJ96j/SRITj1qW5vQERLttoA3mFDypopiJamABb1f5bs+xmBOUNsp
	kV9ZeRo3bkwr2Cfzk4viX6Yg8/rY4Sa38gGVIW9mr4CvaHI1WyvWEsh/qD1I1xp/1n2qnwdPARx
	J/e+cUrd05rgbphIOwZfSCfD17SH3N9OGTcf+Kz55nJODjlT5ZStLUbetS0CAndng3XfG2mxAzt
	9zYhlPyKjYcfB0kaIhx0cJwzI+z1skN81mm2bbOTnLdqO51Co0nYgbb5tw1qsw1pxt1kwRTlhgw
	KTcU/Y7TCgnbvOw+rmM=
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id
 5a478bee46e88-3077b7d84c8mr519422eec.26.1780621191018; Thu, 04 Jun 2026
 17:59:51 -0700 (PDT)
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
References: <CAHLYVqdjJOecp7eRJDhXDv9K27c6cCE52YzWsJyzWm=5czV8Wg@mail.gmail.com>
 <CALLMt=q1mr9QfWk_HVREuOKk_39Q3uY-FJW507QQnMMaKB_GYA@mail.gmail.com>
In-Reply-To: <CALLMt=q1mr9QfWk_HVREuOKk_39Q3uY-FJW507QQnMMaKB_GYA@mail.gmail.com>
From: rio chen <rio.chen.hj.wiwynn@gmail.com>
Date: Fri, 5 Jun 2026 08:59:40 +0800
X-Gm-Features: AVHnY4Km04Nv7_SYsNA2gjH2S5i4_IJQN6SCo1WaC-tPHW_5JbPDSn4Rek0Tyi8
Message-ID: <CAHLYVqdLnvFeoU8eYqCCNGk6a0Q7x7Fm95RQ-+EsWNwe53a5sg@mail.gmail.com>
Subject: Re: Gerrit Account Issue: Email locked after changing GitHub username
To: Andrew Geissler <geissonator@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009203aa0653772dbb"

--0000000000009203aa0653772dbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it. Thank you for your assistance.

On Wed, Jun 3, 2026 at 9:10=E2=80=AFPM Andrew Geissler <geissonator@gmail.c=
om>
wrote:

>
>
> On Tue, Jun 2, 2026 at 6:46=E2=80=AFPM rio chen <rio.chen.hj.wiwynn@gmail=
.com>
> wrote:
>
>> Hi OpenBMC Admins,
>>
>> I ran into a duplicated account issue on gerrit.openbmc.org during my
>> onboarding process.
>>
>> I recently changed my GitHub username. However, before that change, I ha=
d
>> already initiated the Gerrit account registration with my email:
>> rio.chen.hj.wiwynn@gmail.com
>>
>> Now, when I log into Gerrit with my updated GitHub account, it seems to
>> have created a new blank profile, and I cannot verify my email because i=
t
>> says "Email already in use" (locked in the previous ghost profile).
>>
>> Could you please help clear or unbind my email from the old profile so I
>> can link it to my current GitHub account?
>>
>
> I have removed the email from your previous account and archived your old
> account within gerrit.
>
>

--0000000000009203aa0653772dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it. Thank you for your assistance.=C2=A0</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Jun 3, 2026 at 9:10=E2=80=AFPM Andrew Geissler &lt;<a href=
=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Jun 2, 2026 at 6:46=E2=80=AFPM rio chen &lt;<a hr=
ef=3D"mailto:rio.chen.hj.wiwynn@gmail.com" target=3D"_blank">rio.chen.hj.wi=
wynn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr">Hi OpenBMC Admins,<br><br>I ran into a dupli=
cated account issue on <a href=3D"http://gerrit.openbmc.org" target=3D"_bla=
nk">gerrit.openbmc.org</a> during my onboarding process. <br><br>I recently=
 changed my GitHub username. However, before that change, I had already ini=
tiated the Gerrit account registration with my email:=C2=A0

<span style=3D"color:rgb(31,31,31);font-family:&quot;Google Sans&quot;,Robo=
to;font-size:14px;text-align:center;background-color:rgb(233,238,246)"><a h=
ref=3D"mailto:rio.chen.hj.wiwynn@gmail.com" target=3D"_blank">rio.chen.hj.w=
iwynn@gmail.com</a></span><br><br>Now, when I log into Gerrit with my updat=
ed GitHub account, it seems to have created a new blank profile, and I cann=
ot verify my email because it says &quot;Email already in use&quot; (locked=
 in the previous ghost profile).<br><br>Could you please help clear or unbi=
nd my email from the old profile so I can link it to my current GitHub acco=
unt?<br></div></blockquote><div><br></div><div>I have removed the email fro=
m your previous account and archived=C2=A0your old account within gerrit.=
=C2=A0</div><div><br></div></div></div>
</blockquote></div>

--0000000000009203aa0653772dbb--

