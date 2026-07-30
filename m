Return-Path: <openbmc+bounces-2339-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B9AC55167
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 00:02:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hB5p70mDbz2yfD;
	Fri, 31 Jul 2026 10:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785389834;
	cv=none; b=Y1bdz1VqFNuY7Wbooai4fDHCs9Iso2/AvrHNOzzx+ZJQLO9DEDt3npWLJ0GRQ5fmgog+tkuRd6/voshXntfBCA1MDW425nvyo//2WyFFkqLNSp4szi4oFSV73SYUJxkY/Sz/WANqurtaRQjmmpXMDSoiQNpFrrcIisHU98QOL5Ul0jFlHVjZ3p9uWOyQMV3D4zwOhzF1S+WnqUtYJFjUA3TOqXwhF02G8JrFcnxG61mmE+zfGaJ4QPoZjOBJS9fQ09/3VCN2Kn+HEnwyobX8+o74d8Tul4tEnJf060ZK8c0t4/oi1tYVI4clEvx190YDvIhvTJY0GPqYUMJAx58nww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785389834; c=relaxed/relaxed;
	bh=LMI4niVQyS2WXHic1gEBE4O5q8vBgy7QYre3jyRdx5w=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=I7DlKanZu6Q/nczOOgmoIqeAc3WfuYs4vL9vQpBrOTsJ2TYZccL0Wd6/AY8tQafxfdbzu9n0QqDLlq3DdllZ2tjxmm5ZHpk35GATJvhOeGke1Ny6lzYXZqi00ccayzyzdZB6XWeNRK2osJSz+fJNDZVdirfkU8zwyCIVjDRWzJy4jZbKdF5pRkSNbdBmyPfjdjhcpI6fnIu68CYWyRK9yIvAa88Z0+V3zVycQ2J5wJwR+OLyM/L+CN471aMshj+V4D1OS53fw1UoAm7i8nzDt1mdBkM5Bwfza+bei2p7fUtmDEhI47lYGoBeThR4LQphDQdop/x12X6K6EGt+A0YVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QRCliBUJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org) smtp.mailfrom=nexthop.ai
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QRCliBUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nexthop.ai (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9dHs0mVZz2xnp
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 15:37:12 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1752279a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785389829; x=1785994629; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMI4niVQyS2WXHic1gEBE4O5q8vBgy7QYre3jyRdx5w=;
        b=QRCliBUJx6GaDHf3NRRT8MYYV7qPp7IO4+wkaMWj3Z3VAwZJzPx0UGMBK8yg0zdVoN
         B08oYz5NZYGBO65PFYQEJfz75afHOGr25kzyR4RCkdo8H4oatbSxgcEcjhRrXOfkLTZ6
         sDi5zvtM5hwO0U7avae5U1I6is3TaJXhpLKSpyhGaAhEtRnN9dcWjsxum8n/+hTV5uco
         rY+29m2ym3yRu+4DfUVPnNtnA9P5u3vKjOG6OjQEL12eUkXsTHmfZXZ/c/9GktlJU4P3
         8xD0WWl/M4tyEG6ORw35TQAGdX7HAGOQdiex0RWGpT3Kce5r0D374m0Ss4UVZU96xGP1
         66pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389829; x=1785994629;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMI4niVQyS2WXHic1gEBE4O5q8vBgy7QYre3jyRdx5w=;
        b=KDZo4ABy6tosj4OHx8poJTZy1RSQQN27wu4yKh1g/+mb/PAhRZt0uckm3DqryTvnxV
         zTv+qMjFx3xXlLns+TezgYC7CZy2W9kWkE8CBRUrCoE5Ox2pcOhMAspNzbBiJ6wNvIo1
         SnC1nCCnemEFQ4oUuKDWFp5VEYG15pq/PLwOUqZw2n+j+ZV7Djeih5MQg8EeellEMiIo
         jWvLnmEh4+UFWxnUaiJbjtByjisbmVDSstWOK7jgSR7IZmAQvFMIKj07I+L+zOATaItL
         o/W15JSjuqJZOrwmGke/VfEa2QN8y3EK0m0sucXs6s9sa6iboqe4WH9aOyaYc90ePWAz
         UmNQ==
X-Gm-Message-State: AOJu0YxQDFTJ0UmS+wSoBjd9PkuZef67cw2fqpe6MGSxhRLsbPES6nwV
	iISaTjwc0FXqAaLGSFJLeuuUDoOrM9FAcGIrVviYsKp8wFEDBiIwF3VNOMVffLjjvh8X+gszkvy
	9RESh
X-Gm-Gg: AR+sD11/Dxky/MYEAsVx6eK3JHr4S39wy1O+okg366EZMJRPDtmumJb8zpaNevjigLT
	Ag8opUItDSBSvIM/MTmZt/9im6CbP+UmWwL8m+XuDVMgsyqGRmAQ/Pc0hPWlCQvG9aDcIqR+tHA
	HygmECqYIwtveZL0mCSZMVd03kjkK4XRXWQrNLuXJfCUl50MCyTOd/0xV2uBM9YTb2MRK5UyO3R
	tTiZi1SfNy8N+/yW0sdGA+NSaedxS8FN3Ws+V2HNwtXvummcP9/lyZHUEvnD0XRL22ukHIkljAP
	CXXEJWpjeDdy4NmQCfwlXMDL2ZQrtsNQj7hWYH81bGFMEQUkebxY0JbjxVuNqhGkycP3nsptvSx
	yMPikz+zph4cHEIUTASU0458mzO3fLOCUYkeVDjUCTmpZhB6XS2Z24wujohIt00uOKBbSlXgrkj
	gHwJAqA9OvmK0TewyYaNNmkHTNyVQnfRgaxgZQnvqmyMrd0ge4KET/we+JdZ2Mb4kN/btif/Hee
	OS7xA==
X-Received: by 2002:a17:90b:3f0c:b0:38d:858c:834d with SMTP id 98e67ed59e1d1-38f9bdb4e33mr1038433a91.17.1785389828683;
        Wed, 29 Jul 2026 22:37:08 -0700 (PDT)
Received: from smtpclient.apple ([106.51.71.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b465f28sm409099a91.5.2026.07.29.22.37.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:37:08 -0700 (PDT)
From: Chinmoy Dey <chinmoy@nexthop.ai>
Message-Id: <F382C4AF-9F06-4EE7-802F-5F229AABA207@nexthop.ai>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D781594E-9618-4B5A-8F72-F2B42EADACEC"
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [Gentle Follow-up] [stdexec] Long-Term Ownership and Maintenance of
 stdexec Dependency
Date: Thu, 30 Jul 2026 11:06:54 +0530
In-Reply-To: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
Cc: Roger Liao <roger@nexthop.ai>,
 judy Joseph <Judy.Joseph@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_D781594E-9618-4B5A-8F72-F2B42EADACEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Hi Team,

Just following up on my earlier email and resending it to make sure it =
hasn=E2=80=99t been missed.

I would appreciate it if you could please take a look when you get a =
chance.

Regards,
Chinmoy



> On 23 Jun 2026, at 5:59=E2=80=AFPM, Chinmoy Dey <chinmoy@nexthop.ai> =
wrote:
>=20
> Hi OpenBMC Community,
>=20
> I would like to start a discussion around the long-term ownership and =
maintenance model for the stdexec dependency that is currently part of =
the OpenBMC dependency chain. As I understand it today:
>=20
> bmcweb references sdbusplus through subprojects/sdbusplus.wrap:
> https://github.com/openbmc/bmcweb=20
> sdbusplus is maintained under the OpenBMC organization:
> https://github.com/openbmc/sdbusplus=20
> =
https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap
> sdbusplus in turn references stdexec through subprojects/stdexec.wrap =
:
> https://github.com/NVIDIA/stdexec=20
> First, I would like to acknowledge and appreciate the work that has =
gone into this implementation. The intent of this note is not to =
question the quality of the code or the contributions made by NVIDIA, =
but rather to discuss whether there may be an opportunity to align this =
dependency more closely with OpenBMC=E2=80=99s long-term governance and =
maintenance model. Since stdexec is now part of a commonly consumed =
dependency path within OpenBMC, it may be worth considering whether a =
community-maintained approach could provide additional benefits, such =
as:
>=20
> Reduced risk from repository access, policy, or ownership changes =
outside the OpenBMC project
> Broader review and maintainer participation and long-term support
> Improved community ownership , transparency and reduce dependency risk
> If there have already been discussions on this topic, or if there is a =
preferred roadmap for the dependency, I would greatly appreciate any =
references or guidance. My goal is simply to explore whether we can =
further strengthen the sustainability, transparency, and long-term =
maintainability of the OpenBMC dependency ecosystem as it continues to =
grow.
>=20
> Thank you for your time and consideration. I look forward to hearing =
the community=E2=80=99s thoughts.
>=20
> Best regards,
>=20
> Chinmoy Dey
>=20
>=20


--Apple-Mail=_D781594E-9618-4B5A-8F72-F2B42EADACEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div><br =
id=3D"lineBreakAtBeginningOfMessage"><div><p class=3D"p1"><span =
style=3D"font-size: 14px;">Hi Team,</span></p><p class=3D"p1"><span =
style=3D"font-size: 14px;">Just following up on my earlier email and =
resending it to make sure it hasn=E2=80=99t been missed.</span></p><p =
class=3D"p1"><span style=3D"font-size: 14px;">I would appreciate it if =
you could please take a look when you get a chance.</span></p><p =
class=3D"p1"><span style=3D"font-size: =
14px;">Regards,<br>Chinmoy</span></p><p class=3D"p1"><br></p><blockquote =
type=3D"cite"><div>On 23 Jun 2026, at 5:59=E2=80=AFPM, Chinmoy Dey =
&lt;chinmoy@nexthop.ai&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div>

<meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DWindows-1252">

<div><p dir=3D"ltr" class=3D"p1" style=3D"text-align: left; text-indent: =
0px;"><span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">Hi OpenBMC Community,</span></p><p class=3D"p1" =
style=3D"text-align: left; text-indent: 0px;"><span style=3D"font-family: =
Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">I would like to =
start a discussion around the long-term ownership and maintenance model =
for the
</span><span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt; color: rgb(81, 167, =
249);"><b><code>stdexec</code></b></span><span style=3D"font-family: =
Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">&nbsp;dependency
 that is currently part of the </span><span style=3D"font-family: Aptos, =
Arial, Helvetica, sans-serif; font-size: 14pt; color: rgb(81, 167, =
249);"><b>OpenBMC</b></span><span style=3D"font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 14pt;">&nbsp;dependency
 chain. As I understand it today:</span></p>
<ul style=3D"text-align: left;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><span style=3D"color: rgb(81, 167, =
249);"><code>bmcweb</code></span>&nbsp;references
<span style=3D"color: rgb(81, 167, =
249);"><code>sdbusplus</code></span>&nbsp;through<span style=3D"color: =
rgb(81, 167, 249);">
<code>subprojects/sdbusplus.wrap</code></span>:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" =
style=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><a href=3D"https://github.com/openbmc/bmcweb" =
data-outlook-id=3D"d8c2b49c-07aa-43d2-acc3-e2c8c7768819">https://github.co=
m/openbmc/bmcweb</a>&nbsp;</div>
</li></ul>
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><span style=3D"color: rgb(81, 167, =
249);"><code>sdbusplus</code></span>&nbsp;is maintained under the =
OpenBMC organization:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" =
style=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><a href=3D"https://github.com/openbmc/sdbusplus" =
data-outlook-id=3D"1fe0a3a9-3766-408b-8060-f3453e915191">https://github.co=
m/openbmc/sdbusplus</a>&nbsp;</div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div dir=3D"ltr" style=3D""><a =
href=3D"https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdex=
ec.wrap" =
data-outlook-id=3D"1447a88a-4fa7-4732-b205-d105cb87620c">https://github.co=
m/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap</a></div>
</li></ul>
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><span style=3D"color: rgb(81, 167, =
249);"><code>sdbusplus</code></span>&nbsp;in turn references
<span style=3D"color: rgb(81, 167, =
249);"><code>stdexec</code></span>&nbsp;through <span style=3D"color: =
rgb(81, 167, 249);">
<code>subprojects/stdexec.wrap</code></span><code> </code>:</div>
</li><ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" =
style=3D"text-align: left; list-style-type: circle;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div><a href=3D"https://github.com/NVIDIA/stdexec" =
data-outlook-id=3D"65d6a77f-f757-46fc-9226-94383fc74d4e">https://github.co=
m/NVIDIA/stdexec</a>&nbsp;</div>
</li></ul>
</ul><p class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span =
style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: =
14pt;">First, I would like to acknowledge and appreciate the work that =
has gone into this implementation.
 The intent of this note is not to question the quality of the code or =
the contributions made by NVIDIA, but rather to discuss whether there =
may be an opportunity to align this dependency more closely with =
OpenBMC=E2=80=99s long-term governance and maintenance model.
 Since </span><span style=3D"font-family: Aptos, Arial, Helvetica, =
sans-serif; font-size: 14pt; color: rgb(81, 167, =
249);"><code>stdexec</code></span><span style=3D"font-family: Aptos, =
Arial, Helvetica, sans-serif; font-size: 14pt;">&nbsp;is now
 part of a commonly consumed dependency path within </span><span =
style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: =
14pt; color: rgb(81, 167, 249);">OpenBMC</span><span style=3D"font-family:=
 Aptos, Arial, Helvetica, sans-serif; font-size: 14pt;">,
 it may be worth considering whether a community-maintained approach =
could provide additional benefits, such as:</span></p>
<ul style=3D"text-align: left;">
<li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div>Reduced risk from repository access, policy, or ownership changes =
outside the OpenBMC project</div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div dir=3D"ltr" style=3D"font-size: 18.666666px;"><span =
style=3D"background-color: rgb(255, 255, 255);">Broader review and =
maintainer participation and long-term support</span></div>
</li><li style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">
<div>Improved community ownership ,&nbsp;transparency and reduce <span =
style=3D"font-size: 18.666666px; background-color: rgb(255, 255, 255);">
dependency risk</span></div>
</li></ul><p class=3D"p2" style=3D"text-align: left; text-indent: =
0px;"><span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; =
font-size: 14pt;">If there have already been discussions on this topic, =
or if there is a preferred roadmap for the
 dependency, I would greatly appreciate any references or guidance. My =
goal is simply to explore whether we can further strengthen the =
sustainability, transparency, and long-term maintainability of the =
OpenBMC dependency ecosystem as it continues to grow.</span></p><p =
class=3D"p1" style=3D"text-align: left; text-indent: 0px;"><span =
style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size: =
14pt;">Thank you for your time and consideration. I look forward to =
hearing the community=E2=80=99s thoughts.</span></p><p class=3D"p1" =
style=3D"text-align: left; text-indent: 0px;"><span style=3D"font-family: =
Aptos, Arial, Helvetica, sans-serif; font-size: 12pt;">Best =
regards,</span></p><p class=3D"p1" style=3D"text-align: left; =
text-indent: 0px;"><span style=3D"font-family: Aptos, Arial, Helvetica, =
sans-serif; font-size: 12pt;">Chinmoy Dey</span></p>
<div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, =
sans-serif; font-size: 12pt;">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr" style=3D"color: =
inherit; background-color: inherit;">
</div>
</div>

</div></blockquote></div><br></div></body></html>=

--Apple-Mail=_D781594E-9618-4B5A-8F72-F2B42EADACEC--

