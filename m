Return-Path: <SRS0=4HNa=ND=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D13C4338F
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 22:38:55 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE486103E
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 22:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE486103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm1nT2pdTz306Y
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 08:38:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Db3ZnRi3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=ama213000@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Db3ZnRi3; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm1mh0fKMz2yyf
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 08:38:11 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id h18so8784961ilc.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izS8kUBDwjoRudoC0ykczsMjzi7tO+ybozbA1z/wT7o=;
 b=Db3ZnRi3qTmUH/8TN5QZNbYOmjnYESPzRoS/FaK9gw9DTKDwbUBlfB311/496ajKUQ
 kH1J1nsz/HvExMvv8vn71Hx5giYz2IRAh9tIrn+X9hZcQMu+wYSjsh0KjvyvmbLE6ZpF
 fW/M6ys/ZwwYNF/ezl6RqDMqFCdo8pQdAbm2Xk1BCxeZwG6ZWSRyN+XXoEOMmLeu0YPK
 tJX3qDoT+NGmdH8QNQW7+/iL8ObRYMQCW9I2amScrc+HFK8+v5Jab5rl33fuYXyEeMfG
 3heDGs77gfKCkIj1Ws4Nt52LQ+zdKw+eKMFMg6lCXkUbqQmHLQMkotShkci6TD3QdXbU
 1Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izS8kUBDwjoRudoC0ykczsMjzi7tO+ybozbA1z/wT7o=;
 b=X2YYzesh/UCr3Tk7W2lVzs46sDh8RQWh33CN534f4InzdAIP7e9vz8x1E3suIiwwKC
 0hxi+XH1DueKBmNVAfptHSIcuoiSNi9JajmL8QYAhLzJeZt8JruC/v1dI1UCYRYRwcJV
 IyH8I8zL2EQxkHr7E38wPLpFYK/GtBd83EPNRB4KjztSYlhiq6pmhVUTb3HRyiI5R6UB
 I3JT9m7anbZ/F42wy7QsTDzrZBC56T42mHdJehxMaLLEN5Th51iSjtbV+bWux+mrvC46
 vxrpbgT5qB4Iaf96OlOZRQB8putFwGB2r5uL5CR8/vuedSLR2ikFRrzAre1DkASQJg5z
 ukbQ==
X-Gm-Message-State: AOAM5312vEyzEQksVbsOLONRCGBVqfVEFRHAs4Qjp5meN35hugYjPno4
 x39jZDAFNL6eyQ1jSf7ZRTlOGH/Fx1aWXkSlkYs=
X-Google-Smtp-Source: ABdhPJz/iB+DrQ2jAkWW6qJM4dVy18nmiLZ3n2McbW31oHQFmj+OUwRr4ya+wvNO2XnY4HpgfxxO1LpMPAKTg/ovoz0=
X-Received: by 2002:a92:190f:: with SMTP id 15mr571903ilz.45.1628807887778;
 Thu, 12 Aug 2021 15:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
In-Reply-To: <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
From: Ali Ahmed <ama213000@gmail.com>
Date: Thu, 12 Aug 2021 17:37:57 -0500
Message-ID: <CAKJqRLX5+p4Zr=_uZtAanXsz-4b3yGXw7Zc3w678iLtmurZ7iw@mail.gmail.com>
Subject: Re: Turning off the D-Bus REST API by default
To: "i.kononenko" <i.kononenko@yadro.com>
Content-Type: multipart/alternative; boundary="0000000000008ef6ac05c96463d5"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--0000000000008ef6ac05c96463d5
Content-Type: text/plain; charset="UTF-8"

Hey Igor,

Yes, but we are currently working to merge TPM Policy into bmcweb, and then
webui-vue can move over to using Redfish for this property.
You can see the review status here:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44044.

Ed if you get a chance can you take a look at this review?


On Thu, Aug 12, 2021 at 3:31 PM i.kononenko <i.kononenko@yadro.com> wrote:

> Ali,
>
> On 12.08.2021 17:10, Ali Ahmed wrote:
>
> > After this commit to use phosphor-webui or D-Bus REST, you will need
> > to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
> > and will not be impacted. Let me know if you have any concerns.
>
> As far I knew, the webui-vue uses REST API to retrieve the TPM status.
> Please, look to the link below [1]
>
> Links:
> [1]
> https://github.com/openbmc/webui-vue/blob/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore.js#L73
> >
> > -Ali Ahmed
> >
>
> --
> Best regards,
>
> Igor Kononenko
>

--0000000000008ef6ac05c96463d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Igor,<div><br></div><div>Yes, but we are currently wor=
king to merge TPM Policy into bmcweb, and then webui-vue can move over to u=
sing Redfish for this property.</div><div>You can see the review status her=
e:=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44=
044">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44044</a>.</div>=
<div><br></div><div>Ed if you get a chance can you take a look at this revi=
ew?</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 12, 2021 at 3:31 PM i.kononenko &lt;<a =
href=3D"mailto:i.kononenko@yadro.com">i.kononenko@yadro.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">Ali,<br>
<br>
On 12.08.2021 17:10, Ali Ahmed wrote:<br>
<br>
&gt; After this commit to use phosphor-webui or D-Bus REST, you will need<b=
r>
&gt; to set -Drest=3Denabled in your bbappend. Note: webui-vue uses Redfish=
<br>
&gt; and will not be impacted. Let me know if you have any concerns.<br>
<br>
As far I knew, the webui-vue uses REST API to retrieve the TPM status.<br>
Please, look to the link below [1]<br>
<br>
Links: <br>
[1]=C2=A0 <a href=3D"https://github.com/openbmc/webui-vue/blob/6dba4be6125c=
10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore=
.js#L73" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/we=
bui-vue/blob/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Ope=
rations/BootSettingsStore.js#L73</a> <br>
&gt; <br>
&gt; -Ali Ahmed<br>
&gt; <br>
<br>
-- <br>
Best regards,<br>
<br>
Igor Kononenko<br>
</blockquote></div>

--0000000000008ef6ac05c96463d5--
