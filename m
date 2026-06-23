Return-Path: <openbmc+bounces-2130-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F081FCD4F26
	for <openbmc@archiver.kernel.org>; Tue, 23 Jun 2026 23:54:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glMPD6bQ2z2yYf;
	Wed, 24 Jun 2026 09:54:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782217752;
	cv=none; b=SMbqMGHcqOOio1gUvi5Z8IkXfMWK3BPRIiOyoBVfN7+/RyBGJNsT8oFlzQRpE57DNCsyNG/MfFLBPNn4QxAcRdat7iL7yq1ZnkN6OHGXT+S1J36OfcOaWz3nHzW2FD9KTMD3WBRVTeweGv5jTjgLIdMgNzFQ4Z40Xw/LG/K2DQNM/x5x2pYy0FYSz7NXOA5YRJAySUzzF6HiNTfabO6lcf87ia6who57a/390HGHjtFNym4KbJ5fq/roEA0v2ky5QUKrBbgRa7dn+R79xIKeMOji34jBNaQQhD0e/rUp1x0QR+AZ7iUL+0gaheloYKaLCg61IEP6XOcFU/FGLgYSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782217752; c=relaxed/relaxed;
	bh=lbRqpgAWhO8e5RmlKYqBlCMj2EBpzJNi0TbnXYCOsZg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Uqvjx7INhkPJCrIaPNbb3kujs+or6epmWl0NjDDhmP8ZGGdsBr5LmhLzrXkY0Y7a3bIJINJJROTAh7SIC6HEAkfHflvEFDiJ06GXd0SCc+SpPoh001xMm2akApgsJlVtubw7C5hfSV/5cgdVjon0E4SFWlvgufVbR1Ndqn8LCukzVzAVA2EbmVCWou3htowFUHeJI0IwgXbg2wMg3xRGeJoposHPQjwDza23p4BkVdHArlCwFTyNgaVslSEMKawxxiWXEJ2oVtCR9UP4AdSr1xsSw+aQRJg+GPqIH/xhnY+Fg7flB6/pVKIJ/6abDeUr2BAn8s1Y1BYm5pTp1HEPpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=RIrHRG2M; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org) smtp.mailfrom=nexthop.ai
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=RIrHRG2M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nexthop.ai (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gl4BG3G4gz2xM7
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2026 22:29:09 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c8d00e782d3so1033246a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2026 05:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1782217746; x=1782822546; darn=lists.ozlabs.org;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lbRqpgAWhO8e5RmlKYqBlCMj2EBpzJNi0TbnXYCOsZg=;
        b=RIrHRG2M/N2yKUjK8Nth+f4sSTOgI3oClXTtGk8O/+/vm6ZXI3mIYMxPBvFMHsiRdK
         J83KIw4KOvPchHbvFRjtDcfQHJl2wJowJweqgXkS2WM9VpXmrQkJJ5cZfTyAF6VjFIeO
         wdgNyuvsTaDG74lqlawJmO/10Z/hTdsBPA5/fXjBrfBUrHd45VKnfNbsnAWBlpVBbuqp
         lIehRM4AYfpluOAm7RokOPnf9ENZrWI0Coyj+IQTSTJvE9HmSvH4ZwzNhuZIkhl+9TwM
         RPsvJd0MZLlBmOCHQ1Cmo63cAnMXjgcfcRA9tJGHDBHvP9Elb9Fqc3XE0mtHSvQisdvo
         24IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217746; x=1782822546;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbRqpgAWhO8e5RmlKYqBlCMj2EBpzJNi0TbnXYCOsZg=;
        b=mI8cKXeItjoqQ1Z/FhG/6St/BF7LsuAXekYrf1AlSNivcjejhF+D35on5yOVchuE87
         icsdiZKvZoERMkdnaiCZICVBuuVh8NA4kNPbDG0uleHEBayO64VGWumMwAINIr6wECYU
         Jpb7r0PNOOUOX0mwOMKPK9n0urKtfCKUzt8qCNRgHmz4MLS+s176+WJTElGQlZm7n65U
         LRf64jdVHDPYBjan7qCvGw/z04gWGnVTQnYvtMITnRty1ooWd0jGuO5K73R2I3OpACah
         d6WV52urpaIjC+Bf84Zx1Vgr2QqSrKD+/B25O1qI0dxJsaL5bzFbHijpEE4FeKV2a92y
         5HSg==
X-Gm-Message-State: AOJu0YwktmwWsGypRBS5toj5tXrVu0YSPrMYnihPMdaPDpX8d1kav6NG
	V3WbuH9EAudQ6vgxBqTlBw6jML/Ir9hu1VBGE+Agzf3YQUnkh3x9W/iL4iWgT2Ypxvf3ZOZQYtq
	6FHbA
X-Gm-Gg: AfdE7cknU5L/BV0Ghh6qczOlX4xDTBc9LbvApFu5qm8ZkAgef5D4F7VVi15K/d9pX8v
	3oGU6b27rAqcpDdccsbhR4k9lsow8AoWo8h58rcdcaEA8YE82xEbkRHhjxLkFDtx6pZh2AsbgB4
	pkHAy52CaCrd59u90WzHiYF2yFDNZTKsCQUxadsQzKsKqMa4Nhj3ulQVpotTk4Dip2qoljjN1Dd
	nx0EI/N61ZUB+W11Sd9M+xRyk3AV2M/63Bt9tQNubUtc1WSxbYaHR4J8B10wqBDbojoMER/BobJ
	0X67ufaqcpHzfWhgh6jRckcbNiFrttlXnZePfgWGn7q7ZLw6b5ZqNrpfrcze3t39IaJqJ9w1kdt
	xopAbND2gQT02+Fh1O02GbxyG4bqvWL4fiFKvoWLc058Vctq1sWSKCl+VmLfWpK4BkNcwnkY3UP
	RavnMAK0Jx0stslLajgt7t0Io8PaG3o4X9teUhfOEkyGLmkxjMrnBuAytKthkr3B1xt3OmRg==
X-Received: by 2002:a05:6a20:3d06:b0:3b5:6b5a:4f30 with SMTP id adf61e73a8af0-3bd18fb3e55mr2795719637.6.1782217746241;
        Tue, 23 Jun 2026 05:29:06 -0700 (PDT)
Received: from PUVP216MB3248.KORP216.PROD.OUTLOOK.COM ([2603:1046:300:6::5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9026bca363sm2032303a12.25.2026.06.23.05.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:29:05 -0700 (PDT)
From: Chinmoy Dey <chinmoy@nexthop.ai>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Roger Liao <roger@nexthop.ai>
Subject: [stdexec] Long-Term Ownership and Maintenance of stdexec Dependency
Thread-Topic: [stdexec] Long-Term Ownership and Maintenance of stdexec
 Dependency
Thread-Index: AQHdAwgkKA4Ok0DeNkGEMjteHw6CKw==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 23 Jun 2026 12:29:03 +0000
Message-ID:
	<PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-reactions: allow
Content-Type: multipart/alternative;
	boundary="_000_PUVP216MB324896F920CC47B13D11DCD4AEEE2PUVP216MB3248KORP_"
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

--_000_PUVP216MB324896F920CC47B13D11DCD4AEEE2PUVP216MB3248KORP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC Community,

I would like to start a discussion around the long-term ownership and maint=
enance model for the stdexec dependency that is currently part of the OpenB=
MC dependency chain. As I understand it today:

  *
bmcweb references sdbusplus through subprojects/sdbusplus.wrap:
     *
https://github.com/openbmc/bmcweb
  *
sdbusplus is maintained under the OpenBMC organization:
     *
https://github.com/openbmc/sdbusplus
     *
https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap
  *
sdbusplus in turn references stdexec through subprojects/stdexec.wrap :
     *
https://github.com/NVIDIA/stdexec

First, I would like to acknowledge and appreciate the work that has gone in=
to this implementation. The intent of this note is not to question the qual=
ity of the code or the contributions made by NVIDIA, but rather to discuss =
whether there may be an opportunity to align this dependency more closely w=
ith OpenBMC=92s long-term governance and maintenance model. Since stdexec i=
s now part of a commonly consumed dependency path within OpenBMC, it may be=
 worth considering whether a community-maintained approach could provide ad=
ditional benefits, such as:

  *
Reduced risk from repository access, policy, or ownership changes outside t=
he OpenBMC project
  *
Broader review and maintainer participation and long-term support
  *
Improved community ownership , transparency and reduce dependency risk

If there have already been discussions on this topic, or if there is a pref=
erred roadmap for the dependency, I would greatly appreciate any references=
 or guidance. My goal is simply to explore whether we can further strengthe=
n the sustainability, transparency, and long-term maintainability of the Op=
enBMC dependency ecosystem as it continues to grow.

Thank you for your time and consideration. I look forward to hearing the co=
mmunity=92s thoughts.

Best regards,

Chinmoy Dey


--_000_PUVP216MB324896F920CC47B13D11DCD4AEEE2PUVP216MB3248KORP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<p dir=3D"ltr" class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><=
span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: =
14pt; color: rgb(0, 0, 0);">Hi OpenBMC Community,</span></p>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; colo=
r: rgb(0, 0, 0);">I would like to start a discussion around the long-term o=
wnership and maintenance model for the
</span><span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; fon=
t-size: 14pt; color: rgb(81, 167, 249);"><b><code>stdexec</code></b></span>=
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 14pt; color: rgb(0, 0, 0);">&nbsp;dependency
 that is currently part of the </span><span style=3D"font-family: Aptos, Ar=
ial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, 249);"><b>=
OpenBMC</b></span><span style=3D"font-family: Aptos, Arial, Helvetica, sans=
-serif; font-size: 14pt; color: rgb(0, 0, 0);">&nbsp;dependency
 chain. As I understand it today:</span></p>
<ul style=3D"text-align: left;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><span style=3D"color: rgb(81, 167, 249);"><code>bmcweb</code></span>&n=
bsp;references
<span style=3D"color: rgb(81, 167, 249);"><code>sdbusplus</code></span>&nbs=
p;through<span style=3D"color: rgb(81, 167, 249);">
<code>subprojects/sdbusplus.wrap</code></span>:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" s=
tyle=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><a href=3D"https://github.com/openbmc/bmcweb" data-outlook-id=3D"d8c2b=
49c-07aa-43d2-acc3-e2c8c7768819">https://github.com/openbmc/bmcweb</a>&nbsp=
;</div>
</li></ul>
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><span style=3D"color: rgb(81, 167, 249);"><code>sdbusplus</code></span=
>&nbsp;is maintained under the OpenBMC organization:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" s=
tyle=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><a href=3D"https://github.com/openbmc/sdbusplus" data-outlook-id=3D"1f=
e0a3a9-3766-408b-8060-f3453e915191">https://github.com/openbmc/sdbusplus</a=
>&nbsp;</div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-si=
ze: 14pt; color: rgb(0, 0, 0);">
<div dir=3D"ltr" style=3D"color: rgb(0, 0, 0);"><a href=3D"https://github.c=
om/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap" data-outlook-id=
=3D"1447a88a-4fa7-4732-b205-d105cb87620c">https://github.com/openbmc/sdbusp=
lus/blob/master/subprojects/stdexec.wrap</a></div>
</li></ul>
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><span style=3D"color: rgb(81, 167, 249);"><code>sdbusplus</code></span=
>&nbsp;in turn references
<span style=3D"color: rgb(81, 167, 249);"><code>stdexec</code></span>&nbsp;=
through <span style=3D"color: rgb(81, 167, 249);">
<code>subprojects/stdexec.wrap</code></span><code> </code>:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" s=
tyle=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div><a href=3D"https://github.com/NVIDIA/stdexec" data-outlook-id=3D"65d6a=
77f-f757-46fc-9226-94383fc74d4e">https://github.com/NVIDIA/stdexec</a>&nbsp=
;</div>
</li></ul>
</ul>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; colo=
r: rgb(0, 0, 0);">First, I would like to acknowledge and appreciate the wor=
k that has gone into this implementation.
 The intent of this note is not to question the quality of the code or the =
contributions made by NVIDIA, but rather to discuss whether there may be an=
 opportunity to align this dependency more closely with OpenBMC=92s long-te=
rm governance and maintenance model.
 Since </span><span style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 14pt; color: rgb(81, 167, 249);"><code>stdexec</code></span>=
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 14pt; color: rgb(0, 0, 0);">&nbsp;is now
 part of a commonly consumed dependency path within </span><span style=3D"f=
ont-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; color: rg=
b(81, 167, 249);">OpenBMC</span><span style=3D"font-family: Aptos, Arial, H=
elvetica, sans-serif; font-size: 14pt; color: rgb(0, 0, 0);">,
 it may be worth considering whether a community-maintained approach could =
provide additional benefits, such as:</span></p>
<ul style=3D"text-align: left;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 1=
4pt; color: rgb(0, 0, 0);">
<div>Reduced risk from repository access, policy, or ownership changes outs=
ide the OpenBMC project</div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-si=
ze: 14pt; color: rgb(0, 0, 0);">
<div dir=3D"ltr" style=3D"font-size: 18.666666px;"><span style=3D"backgroun=
d-color: rgb(255, 255, 255);">Broader review and maintainer participation a=
nd long-term support</span></div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-si=
ze: 14pt; color: rgb(0, 0, 0);">
<div>Improved community ownership ,&nbsp;transparency and reduce <span styl=
e=3D"font-size: 18.666666px; background-color: rgb(255, 255, 255);">
dependency risk</span></div>
</li></ul>
<p class=3D"p2" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; colo=
r: rgb(0, 0, 0);">If there have already been discussions on this topic, or =
if there is a preferred roadmap for the
 dependency, I would greatly appreciate any references or guidance. My goal=
 is simply to explore whether we can further strengthen the sustainability,=
 transparency, and long-term maintainability of the OpenBMC dependency ecos=
ystem as it continues to grow.</span></p>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 14pt; colo=
r: rgb(0, 0, 0);">Thank you for your time and consideration. I look forward=
 to hearing the community=92s thoughts.</span></p>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">Best regards,</span></p>
<p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span style=
=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">Chinmoy Dey</span></p>
<div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-serif;=
 font-size: 12pt;">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr" style=3D"color: inherit=
; background-color: inherit;">
</div>
</body>
</html>

--_000_PUVP216MB324896F920CC47B13D11DCD4AEEE2PUVP216MB3248KORP_--

