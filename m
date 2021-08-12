Return-Path: <SRS0=4HNa=ND=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5B2C4320E
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 14:10:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217A86024A
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 14:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 217A86024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlpWP36Jzz3bVp
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 00:10:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=K5JoNpk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=ama213000@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K5JoNpk/; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlpVd02t3z3089
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 00:10:16 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id q16so6206561ioj.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mwwyIOhrQKE4wQGPykQqqI1cYG/avylwen8FHRqxtJo=;
 b=K5JoNpk/7572OFM7lqk0h9Z6M4y8baD5XIZ2Jy98Rd73sgdErRf13/8hBgoDnKo5qZ
 3MR0trJ/wq0cv+oV2jH6CjODpwDoRXog+/ZXV5diJFuHVIwW3qGTsbOuo8N7LZxQ+mjB
 aKfTI/FmahKLLAu0iHxANJAcTbeVgBmqFhAq/Lk7wR34G/ParAq9Ol0rzqpZrys6xLKG
 qrJpOupw2sixu/hj7ImMUhoGlpw4Iw4XIEXQllghaZjFhanSHmHhrKFnjr7N7A3wyMYh
 vXM2RIpejWlxW6yDzEYi+XzbFl1RuhVKbMKAysLkr1bO6KQvMVq88ZYvfRnu6ZKLC7vQ
 B2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mwwyIOhrQKE4wQGPykQqqI1cYG/avylwen8FHRqxtJo=;
 b=YiUi4iCzvJUWfpuLXXA4oHNVk+LEcX/gx6kHCR8OHmkkGO+SPjxSop4VxhKYc3VPKE
 xtOzklLS0JRseHzH5Lok3MHWQN55FK0ywdnQM12iCYwq+gRF1zrse+EKgyk2J2sxAQ01
 vzA5Jv1i6t6PQXvNL7QrIybHfknaDAF7ObD8oXR7IzWN1I+mGowsZeVyTK/80SLWmGfI
 VfQ7bqtpWv7J6zLhKaL5ERkHzb7zAJG4OuDyzwcOYndqmkBBpNILDMxto6uLruzhIYgL
 VK5NpVU7uYvyexCObOTMGqiClJkV6uV9Bq7aSnnlOagL1xwRpEpPw8ju1CufDbEaivFK
 j2AA==
X-Gm-Message-State: AOAM5316Xz3oHPco2OSUmXi4FF1UvVcoaBrw169esAoJ9Kw1Um8F6v1m
 PgpBUMbRdg9FTfd2BvjQv0FPSHsbBxNoEHETp/eAh1fTVXc=
X-Google-Smtp-Source: ABdhPJwhUzTseqcpUNXKYLPomyNhWeIYUH7qIORQCPtG+LALjI7PvY04GPP0Qs1DcIp5kRw3j+lyTWMFAtWDuYVfABE=
X-Received: by 2002:a5d:8b51:: with SMTP id c17mr3176008iot.119.1628777412436; 
 Thu, 12 Aug 2021 07:10:12 -0700 (PDT)
MIME-Version: 1.0
From: Ali Ahmed <ama213000@gmail.com>
Date: Thu, 12 Aug 2021 09:10:01 -0500
Message-ID: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
Subject: Turning off the D-Bus REST API by default
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000016257905c95d4b7f"
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

--00000000000016257905c95d4b7f
Content-Type: text/plain; charset="UTF-8"

I know there was some previous discussion on this.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 is making
the default setting for D-BUS REST API disabled. The D-Bus REST allows
authenticated users access to privileged information that may be above
their permission level.

After this commit to use phosphor-webui or D-Bus REST, you will need
to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
and will not be impacted. Let me know if you have any concerns.

-Ali Ahmed

--00000000000016257905c95d4b7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizing:inh=
erit;margin-top:4px;margin-bottom:4px;padding:8px;font-size:12px;line-heigh=
t:1.50001;font-variant-ligatures:none;white-space:pre-wrap;word-break:norma=
l;border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-righ=
t-radius:4px;border-bottom-left-radius:4px;color:rgb(209,210,211);font-fami=
ly:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace">I know there wa=
s some previous discussion on this.=20
<a target=3D"_blank" class=3D"gmail-c-link" href=3D"https://gerrit.openbmc-=
project.xyz/c/openbmc/bmcweb/+/29344" rel=3D"noopener noreferrer" style=3D"=
box-sizing:inherit;color:inherit;text-decoration:none">https://gerrit.openb=
mc-project.xyz/c/openbmc/bmcweb/+/29344</a> is making the default setting f=
or D-BUS=C2=A0<span style=3D"color:rgb(209,210,211)">REST</span><span style=
=3D"color:rgb(209,210,211)"> API disabled. The D-Bus REST allows authentica=
ted users access to privileged information that may be above their permissi=
on level.</span></pre><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizin=
g:inherit;margin-top:4px;margin-bottom:4px;padding:8px;font-size:12px;line-=
height:1.50001;font-variant-ligatures:none;white-space:pre-wrap;word-break:=
normal;border-top-left-radius:4px;border-top-right-radius:4px;border-bottom=
-right-radius:4px;border-bottom-left-radius:4px;color:rgb(209,210,211);font=
-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace">After this=
 commit to use phosphor-webui or D-Bus REST, you will need to set -Drest=3D=
enabled in your bbappend. Note: webui-vue uses Redfish and will not be impa=
cted. Let me know if you have any concerns. </pre><pre class=3D"gmail-c-mrk=
dwn__pre" style=3D"box-sizing:inherit;margin-top:4px;margin-bottom:4px;padd=
ing:8px;font-size:12px;line-height:1.50001;font-variant-ligatures:none;whit=
e-space:pre-wrap;word-break:normal;border-top-left-radius:4px;border-top-ri=
ght-radius:4px;border-bottom-right-radius:4px;border-bottom-left-radius:4px=
;color:rgb(209,210,211);font-family:Monaco,Menlo,Consolas,&quot;Courier New=
&quot;,monospace">-Ali Ahmed</pre></div>

--00000000000016257905c95d4b7f--
