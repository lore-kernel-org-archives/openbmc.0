Return-Path: <openbmc+bounces-1789-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DCF4485A
	for <openbmc@archiver.kernel.org>; Fri, 10 Apr 2026 13:29:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsd1v3CPsz2yhP;
	Fri, 10 Apr 2026 23:29:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e30" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775827763;
	cv=pass; b=dKAsUHquOLWGFJOq0GlBVs7Dw4VHoRaC/AzG2ZPjUBJFgl0qnj+kOxJlrynCdbJS1XrXtzFwMhAZD+KJ/mSR4Kd3poxz3JaARRTfPb0DCBlGcGA7Hu1FXDibmYkuMsIBDV8eo7WJsDwSrO2i+ytQBIUpQ4oBvhsJx25OcbVlV0UJguE3KnXXnWfvcw2DR9WZjs7lPq8q7htt/IEKxQVAFl9KGtS+8roBHQk9YJCMqzQ8sgJFIUgwOBY+WZluELSKl+hwEYtz+AKcykZVm/PEzmypYGGnW2TgLHwLfiLfKFMS5AudTvPZCUntp9T1fjhD6PpfJXHH4H7/IfheVIMVLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775827763; c=relaxed/relaxed;
	bh=TbYSO4p/FzWyKrY2u1WYNzDfzLe2atasoutLMwM3iiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLnyQ7PaTQ4J7v4lENH6lto2vWN8uZrKifsUNIKgltrIHxICGytBGSycAy9xuGB0aBHbXc4U4HRc7e7/CCajJb1JIWN9PnTry/s5DsWizMM8MJqcvuC6pBYYdmypyUG/3DXZbOOrdHPcTKO+I+jQNAxQ/7FksUmKExNu48V4mJ2+CDcScQmTM7jZ64R1uhCvYgXc5wHwxAl28HtZ/2Va1yTeIvqRCa55okrVfQj3zob434/0SwTzFXKbmMxY6RCG8scaDWAPnR4Mpuom+Sw4qiUGy44rEQLLzy31hiBTOSlBoF1s7P+SmVfLV2dfeeunvDSFqxm9aMYDY0CAtR/xsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSB13fsq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSB13fsq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fsd1s44y5z2ySc
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 23:29:21 +1000 (AEST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-604f834349cso707583137.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775827758; cv=none;
        d=google.com; s=arc-20240605;
        b=KtwcUAuxmglJitv3J2ChCqUlZuypU7Z7AADGN1qn3BcaBL/Jmpcq/oZivd+tHXWa5A
         f74onZPpN0mvEp9KO7cF6151/RwywF2kvOs0vQc5AgBNAJWHnBEusVPKb6/fmeQybcmu
         NfZtg7O3alotLWpJ9YIBqNhmeU51bArG5Q50/VXrpcX3FuyZK+WNaISd7KDTQ0g1CIRG
         1G7zxGrQa/CkDZTUXPOWBlsu4sBsXm/XJAfukamfK6t0h+PSe9FtwwHvV3jj6M1WVt5m
         NufoQP5oklH0S82Ix3KHrV4KGvl5IeJNuzn4pUKvJTomuxgKHI94CVji6JnqKUD+EbLw
         RAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TbYSO4p/FzWyKrY2u1WYNzDfzLe2atasoutLMwM3iiA=;
        fh=7YfzPGQHhwg8YLf34mxOwNlta9ZLqFNWHUBeIy42V/U=;
        b=OD+y2mOFwdYXKX64lrTy6aZd2Wdyp3st5vsS2O2F0oPmOe3paPKHGfDlGUVXNNTx8o
         LRAnBIWI8yt0SXWkQoHuLzeN22RAnFXQAGCwC7VRSVGCKpkm6/R0zcqSA4MkuPWLZXfw
         kbmovRyE2YvbEd3nDKCgYzICFfn3iJhkGd2DEtFEXCSH4keSYKqp+qnBC3QrjMeBXOZT
         95+FLdzDnVyROX2V5mqMgPr523MBxO47lxIN/JORpXlIfYH3Cpp0RGibwu/AZ2bz1BON
         vZDX3ovdPt9KOlYFyLqG+YuwagNMg1X0ASqdIcXUTzpGxBFeYc4SxyjFe096c7x98K6Z
         PjcQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775827758; x=1776432558; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbYSO4p/FzWyKrY2u1WYNzDfzLe2atasoutLMwM3iiA=;
        b=VSB13fsqyZGtB4Qw9IuAuOEirZosPsVVDj17gPoTDc6YOVaulLQyGxeIcilD6FU5E1
         5m0QDggOMPKfI3OQmHLGem4Kqty5o9Lrf9BkCEpThweiDi7oCbkrquisw5ris/LM3NFL
         gLaY4YY1l6bDHg2D+AQrDE1XKg2yOtdIt/sJckCmAHnb4y+qcH9T+be236QHN+RHofre
         WExQ8GKeCl/5sB12mQHIBEfpPHfQADR+hM9GsrVPXDQ9RtLDiWPimgbNsZytNLoKL77m
         hpK4iOdasFtFesY3KNJaUI0XEuvcwgL6ujD7udu4R/1RjtSbPQMfUDaGoWdms403siaM
         NM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827758; x=1776432558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbYSO4p/FzWyKrY2u1WYNzDfzLe2atasoutLMwM3iiA=;
        b=E1IhASdIlgtl8ZmnRZpzzXARC4NE+BPFumYKRjgQJ7pDfJ81PuqW1h5wedWXuOqgY3
         vACOdU41SWJpgXAEVrIcasiL97oBv31erUFgfjPLaN/TuhorNuKvM5FJndHryq520D7a
         k4iRhFEjdbpEB0MTBqBGPT1SzjNKwA0d+1rwIMLy5OxZOeC6HJ4jG/xU4k+8602fVtSM
         4GiTgWR3vHm2ooSROWMkPgpYK14iGiqFS+ZlUc5ZNsZYAwf2QJIlFjJ3+AIdqV4x2IY2
         S+FztG2WH1jyjmtZvtAgmlVokCHrBfen1W+hqEgkY0UXLPKRN3oTMWpeDtRr26s8o5y4
         T0WA==
X-Gm-Message-State: AOJu0YxJ9CV23sg3eAzf68mtfWmQ9lHNPvwWKzWHmHYc2Q4OH4ZtYsjZ
	aVgRnvZ1kzRwHIugKl6ziLPxX7BX4nm6zhPQ1FxzinYHGS/TxtYtbh1IsufVnx6cjUAlPZ7Pye+
	VgmxspxLdkG0/UvqB8VObMYB8X9XAaEjMHWeOnjw=
X-Gm-Gg: AeBDiesAA5eoayFbYUosnwTmvXYWlVeb5TWsdAz5epj1tOrTpvnZEXNQgfCZ0/MFYtb
	t1HacqqQEd/gWRxFzvyOosvY4rVWzXgO+3r8IkYcHY3u5A9pVCjEbwf7OK6T3IuxlVR14T3aHKk
	faK4khsbGWXdP2mLOpBOOP/MeOisv1Dp28yLBydERtdXvWL4axQFKRGLHPbAHZj/dfBXGSlKCvH
	OwfaGTGNrD6pZ2sGNkjVcrn75CnuDJ+0hNu8KFZSncNIXm3NE7+sa6EFIMY8eByd6OHeUVH2UUX
	gzjW8zTU9r2vgX3jBFivzqm+erXkitf0d1kTginbpDPHnq14d30xD3dmsy34UP2Pqg51
X-Received: by 2002:a67:e103:0:b0:602:97a8:10c0 with SMTP id
 ada2fe7eead31-609fe584139mr1093558137.1.1775827757322; Fri, 10 Apr 2026
 06:29:17 -0700 (PDT)
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
References: <CAFme=rmRF03V1RLm4v6071ET-vVzrPjz_oVKCfWoO5G0CMzJUQ@mail.gmail.com>
In-Reply-To: <CAFme=rmRF03V1RLm4v6071ET-vVzrPjz_oVKCfWoO5G0CMzJUQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 10 Apr 2026 08:29:03 -0500
X-Gm-Features: AQROBzDxYD9M8C9kFdhMTMqNcAXk5W6BLqQFWqzk8_nfN891hiWi_OLSorr-EmY
Message-ID: <CALLMt=pmg3CBB5SNVffAPMgVemj_L4Am5bc6egh9y8xAXt5jaQ@mail.gmail.com>
Subject: Re: [DISCUSSION] Drive-level power control support in phosphor-state-manager
To: Eric Yang <eric.yang.wiwynn@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a85525064f1b1e95"

--000000000000a85525064f1b1e95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 3:50=E2=80=AFAM Eric Yang <eric.yang.wiwynn@gmail.co=
m> wrote:

> Hi all,
>
> I've been looking into how OpenBMC currently handles component-level
> power control for storage drives, and would appreciate some input on
> possible directions.
>
> On storage servers or compute servers with NVMe/SSD drive bays, there
> is a practical need to monitor drive power state and perform controlled
> power cycling or reset of individual drives.
>

Curious what the protocol looks like to monitor and perform the power
cycling to these drives from the BMC? Is it something simple like GPIO's or
is there something like MCTP to them?


>
> The State.Drive interface added in change 43155 [1] defines
> RequestedDriveTransition and CurrentDriveState, but I could not find
> any upstream consumer for the transition/state properties. Please
> correct me if I'm missing an existing implementation.
>

How is this managed externally into the BMC? Is there a Redfish API?


>
> If a platform wanted to support drive power control through
> phosphor-state-manager today, the options would be:
> - Map drives as additional chassis/host instances, which carries
>   incorrect semantics and breaks the Redfish model.
> - Write a platform-specific daemon outside of the state-manager
>   framework.
>
> phosphor-state-manager already has a well-established per-instance
> daemon pattern with systemd target orchestration. Following this
> pattern for drives seems like a natural fit.
>

PSM is a wrapper to systemd which starts/stops/monitors specific systemd
targets associated with the function. So would there still be a separate
application with the business logic on how to monitor and power cycle the
drives (like phosphor-power)?


>
> I'd appreciate any thoughts on the following:
> - Is there interest in drive power control as a first-class feature
>   in phosphor-state-manager?
>

I don't see a use case for my company for this function currently but I'm
not opposed to it in PSM if it makes sense. There would need to be some
synergy though. Does the general idea of monitoring and starting systemd
targets work for the use cases here?


> - Should it follow the existing host/chassis daemon pattern, or
>   should it be designed as a more generic component state manager
>   that could cover other device types in the future?
>

My preference is keep it targeted on the use case we know unless someone
has other use cases.


> - Drive instances may benefit from string identifiers (e.g. nvme0)
>   instead of numeric IDs to align with Redfish DriveId. Any concerns
>   with this approach?
>

Seems fine.


> - Should a drive's power state optionally be tied to a specific
>   host's power state (e.g. power off drives when the associated
>   host shuts down), or should drive power be fully independent?


Feels dependent on your system design. If powering off a chassis also
powers off the drives, then you can just put the systemd target responsible
for powering the drives off in the chassis-poweroff systemd target.


> [1] https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/43155
>
> Best Regards,
> Eric Yang
>
>

--000000000000a85525064f1b1e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 9, =
2026 at 3:50=E2=80=AFAM Eric Yang &lt;<a href=3D"mailto:eric.yang.wiwynn@gm=
ail.com">eric.yang.wiwynn@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
I&#39;ve been looking into how OpenBMC currently handles component-level<br=
>
power control for storage drives, and would appreciate some input on<br>
possible directions.<br>
<br>
On storage servers or compute servers with NVMe/SSD drive bays, there<br>
is a practical need to monitor drive power state and perform controlled<br>
power cycling or reset of individual drives.<br></blockquote><div><br></div=
><div>Curious what the protocol looks like to monitor and perform the power=
 cycling to these drives from the BMC? Is it something simple like GPIO&#39=
;s or is there something like MCTP to them?</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
The State.Drive interface added in change 43155 [1] defines<br>
RequestedDriveTransition and CurrentDriveState, but I could not find<br>
any upstream consumer for the transition/state properties. Please<br>
correct me if I&#39;m missing an existing implementation.<br></blockquote><=
div><br></div><div>How is this managed externally into the BMC? Is there a =
Redfish API?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
If a platform wanted to support drive power control through<br>
phosphor-state-manager today, the options would be:<br>
- Map drives as additional chassis/host instances, which carries<br>
=C2=A0 incorrect semantics and breaks the Redfish model.<br>
- Write a platform-specific daemon outside of the state-manager<br>
=C2=A0 framework.<br>
<br>
phosphor-state-manager already has a well-established per-instance<br>
daemon pattern with systemd target orchestration. Following this<br>
pattern for drives seems like a natural fit.<br></blockquote><div><br></div=
><div>PSM is a wrapper to systemd which starts/stops/monitors specific syst=
emd
 targets associated with the function. So would there still be a=20
separate application with the business logic on how to monitor and power
 cycle the drives (like phosphor-power)?

<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
I&#39;d appreciate any thoughts on the following:<br>
- Is there interest in drive power control as a first-class feature<br>
=C2=A0 in phosphor-state-manager?<br></blockquote><div><br></div><div>I don=
&#39;t see a use case for my company for this function currently but I&#39;=
m not opposed to it in PSM if it makes sense. There would need to be some s=
ynergy though. Does the general idea of monitoring and starting systemd tar=
gets work for the use cases here?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
- Should it follow the existing host/chassis daemon pattern, or<br>
=C2=A0 should it be designed as a more generic component state manager<br>
=C2=A0 that could cover other device types in the future?<br></blockquote><=
div><br></div><div>My preference is keep it targeted on the use case we kno=
w unless someone has other use cases.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
- Drive instances may benefit from string identifiers (e.g. nvme0)<br>
=C2=A0 instead of numeric IDs to align with Redfish DriveId. Any concerns<b=
r>
=C2=A0 with this approach?<br></blockquote><div><br></div><div>Seems fine.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- Should a drive&#39;s power state optionally be tied to a specific<br>
=C2=A0 host&#39;s power state (e.g. power off drives when the associated<br=
>
=C2=A0 host shuts down), or should drive power be fully independent?</block=
quote><div><br></div><div>Feels dependent on your system design. If powerin=
g off a chassis also powers off the drives, then you can just put the syste=
md target responsible for powering the drives off in the chassis-poweroff s=
ystemd target.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
[1] <a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interface=
s/+/43155" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/=
c/openbmc/phosphor-dbus-interfaces/+/43155</a><br>
<br>
Best Regards,<br>
Eric Yang<br>
<br>
</blockquote></div></div>

--000000000000a85525064f1b1e95--

