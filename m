Return-Path: <openbmc+bounces-2385-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63709C2A09B
	for <openbmc@archiver.kernel.org>; Fri,  7 Aug 2026 05:56:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hGYLY32ltz3bwf;
	Fri, 07 Aug 2026 15:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786081550;
	cv=none; b=J2qGubhxQRoHOFcB6Si3eShTmL7boAjSzdNP/SyB1zHIKWpQeuPiHlPcoPqAiNYyW1iTIXNXguqsRoEE0V8pkIL5s4aSkMd9kk9+01siB40+b1Ysm2hd69r4gNKT2raFAD/eUHccRcbJ+aMKi3Oumbf9b1fQGilvHBLCvnDbj/uKpSoAZxvD8OpdEZBPdsawUPJhmuaEx4lg7uzUPkvdzxZXjUYfQsuIq0fPp4ClrAf4Bcinvw0eP8PO1USPdUiLpTyjyXVPBW6Hk1J+9NZgZSDq1Sh+TBNaIR/29LfdxoAJhMtbc86vPobUj+TTGUfoMAz1ZFLW4fzVXH/VryPLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786081550; c=relaxed/relaxed;
	bh=b/jt9H3gtcup7tke4M1zBCZ5Timmt38pMWAcEEaeiBA=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=ZYO0gcxIOFzYdE3QkydAD9/UADFyBhpgSblV94sVrPkbVnmtcO7Z7/k9b41qHCugd3XzUiIc+HOlARzuGJmpBhCBJl5+yl6wTqc5qq2V2OFhz01wff7P9kxV6WjT7itH8J7HIfNcT1WRM8cDfCFJO+eMy8BCZqZ1WjEGNmReCZ6e6yIQvfxTeADaTtSfsTjSEAxqFZ5YLG8pjzZQ/sBasi9kzwXd97ovYZmyx9BFXlF73QzOavXd9nfBOzOp67N/eXq7VxwXcrKg/f8NbhkUZTwFt8G+R486T0EZSVOh88VTetNzgeA/4wJ/PRakKLjd/N2OFpMkV+PIvBEXFzCdGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SgYShf4k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org) smtp.mailfrom=nexthop.ai
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SgYShf4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nexthop.ai (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=chinmoy@nexthop.ai; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hGY654DB5z2yPR
	for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2026 15:45:48 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2093473b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2026 22:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786081546; x=1786686346; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/jt9H3gtcup7tke4M1zBCZ5Timmt38pMWAcEEaeiBA=;
        b=SgYShf4ke3wClBX2NSnk+H1ETn8oUkvOlbWUbmtMugZTJhHhF49k8XthmJ6wvrvluh
         3ICyFoduMmGKb5TW+/20fgkq7vWDM4tgA/a7szqrKb2eCcLp51V0hgSrm8f3GRRqyg0x
         Y8HD1xy+/MuexsZPDChCZ4lObS/UpR/2N39PI0eLvulyKiSDj4EgcRfuqmVeaVq+a+nS
         H8l5ns06CFoBAye+FpZYUR/ZoYMZ3HsPk0NSOWYRRog6m1Y8RSnZ6C/2v7dH/0bkGAfc
         wb+V9LEY6EYd1MVlTd5E63+qTrhfTjX2NPicXAl84uujCnVW8xDL01uAJQKpiVmYKICp
         Ypkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081546; x=1786686346;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/jt9H3gtcup7tke4M1zBCZ5Timmt38pMWAcEEaeiBA=;
        b=f1UcYAudUOtbQuKiNNiAlUc6RGf3pFBgvIHlK9u/0MJfC98dODHHrHdlGv7p0hgUCl
         hnspxu23P0hMFtkXNUvlqv34I+i9b2sJNoGNfKTyY17efou78BogPxoFCkRKUJlMVliU
         aLa9gJEvjv2oOkagzpjP4VrHqGW/D/PfKNKJsb+BI/LJi8V/C5A2mzkOehtV34Gy/o8o
         QGQiXqCjfsRPgv2Dv38r2nqtwj4lz+V41l4v+U+g6tJBP9REA/EOhPoaZ9DZnPAx3r9U
         +WBuCL/WYLvau2v2KJG0r3SCbFNpwrhRPPivrD9zxvx6JWocwr0JueHjhEDd529hWU7H
         5eDA==
X-Gm-Message-State: AOJu0Yxnr/hfN13SIPUz+Qh07ezKqOdQkJ2R0WT5IUCFoO5AjfR0xGo8
	+Gjh9lDHZysXg5D2pdOWg4/29MTILZejmpM6VU/UMY50FrRw/uUMAsaGN9HXxY713HI=
X-Gm-Gg: AR+sD11bOP/ly66JHdf0VkPStiQFhQvWEbdzn6DvLG3Gd6lUM5xepWgFc+J31mptFIi
	J7kx/XZSThSAIwfqWjzslP8rg1sycizaHog5ta+WW6mwbq/LzVTvqgA2e+vIdDa2HiFhv6Vbvyy
	NobtoUm+mafTCOjmPddgO4QLsPO1FtSJftpGkkikXJo14L7QMp2Hk+PrK9JQz1sO6p+4ttypAIw
	Ad1e7YqazN7zyd/ligeZ6OBl8v0RjmtBCSn/k+0Yp4EILSFzLKBGsPvtpaqAjocRTFmyEAeWkVG
	Wra5wzx+vAz8e4x8GpkxBUEhAXxi3uGxdIOXEqSmhsUDhCDLinOybgVZdZXJlA/rIusb8VGKB29
	gLoN2WXtznJ84NNKWNnX5t4C0OtF1ecuNMEwWyEBN0Qiy5HAvp3r3jxWSRNYOj935ZO34+27NSO
	rg4MJNY4CGvJfAWpRsBxYVC4aO+Sul10CkZrqE3SQStkCMrZFLdZxkQAtZdXFf7zwCQlP7rrigg
	hUOTw==
X-Received: by 2002:a05:6a00:18a1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-84f4fdbfe84mr7087316b3a.16.1786081546125;
        Thu, 06 Aug 2026 22:45:46 -0700 (PDT)
Received: from smtpclient.apple ([106.51.71.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51f192sm397185b3a.30.2026.08.06.22.45.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2026 22:45:45 -0700 (PDT)
From: Chinmoy Dey <chinmoy@nexthop.ai>
Message-Id: <BD031FDE-364F-422B-AC7E-7918D12E5D29@nexthop.ai>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4CA2E050-8913-4465-AC98-D0045AAB53BE"
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
Subject: Re: [stdexec] Long-Term Ownership and Maintenance of stdexec
 Dependency
Date: Fri, 7 Aug 2026 11:15:32 +0530
In-Reply-To: <amzxSli1xmTpKCB1@heinlein>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Roger Liao <roger@nexthop.ai>
To: Patrick Williams <patrick@stwcx.xyz>
References: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
 <amzxSli1xmTpKCB1@heinlein>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_4CA2E050-8913-4465-AC98-D0045AAB53BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Patrick,

Thank you for the detailed clarification. I sincerely appreciate the =
deep expertise, sustained effort, and careful technical judgment that =
you and the OpenBMC community bring to this work. My question was purely =
about understanding the dependency=E2=80=99s long-term maintenance =
model, not NVIDIA=E2=80=99s involvement or the quality of stdexec.

I appreciate the clear and pragmatic direction you outlined for its =
continued use and future transition. This context is helpful, and I will =
keep it in mind in any future discussion.

Thank you.

Regards, Chinmoy Dey


> On 1 Aug 2026, at 12:32=E2=80=AFAM, Patrick Williams =
<patrick@stwcx.xyz> wrote:
>=20
> On Tue, Jun 23, 2026 at 12:29:03PM +0000, Chinmoy Dey wrote:
>> Hi OpenBMC Community,
>>=20
>> I would like to start a discussion around the long-term ownership and =
maintenance model for the stdexec dependency that is currently part of =
the OpenBMC dependency chain. As I understand it today:
>>=20
>>  *
>> bmcweb references sdbusplus through subprojects/sdbusplus.wrap:
>>     *
>> https://github.com/openbmc/bmcweb
>>  *
>> sdbusplus is maintained under the OpenBMC organization:
>>     *
>> https://github.com/openbmc/sdbusplus
>>     *
>> =
https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap
>>  *
>> sdbusplus in turn references stdexec through subprojects/stdexec.wrap =
:
>>     *
>> https://github.com/NVIDIA/stdexec
>>=20
>> First, I would like to acknowledge and appreciate the work that has =
gone into this implementation. The intent of this note is not to =
question the quality of the code or the contributions made by NVIDIA, =
but rather to discuss whether there may be an opportunity to align this =
dependency more closely with OpenBMC=E2=80=99s long-term governance and =
maintenance model. Since stdexec is now part of a commonly consumed =
dependency path within OpenBMC, it may be worth considering whether a =
community-maintained approach could provide additional benefits, such =
as:
>>=20
>>  *
>> Reduced risk from repository access, policy, or ownership changes =
outside the OpenBMC project
>>  *
>> Broader review and maintainer participation and long-term support
>>  *
>> Improved community ownership , transparency and reduce dependency =
risk
>>=20
>> If there have already been discussions on this topic, or if there is =
a preferred roadmap for the dependency, I would greatly appreciate any =
references or guidance. My goal is simply to explore whether we can =
further strengthen the sustainability, transparency, and long-term =
maintainability of the OpenBMC dependency ecosystem as it continues to =
grow.
>>=20
>> Thank you for your time and consideration. I look forward to hearing =
the community=E2=80=99s thoughts.
>=20
> I didn't respond to this before because honestly it sounded like a
> competitor to NVIDIA trying to assert a "we shouldn't use any software
> from my competitor" stance.  Nexthop isn't even an OpenBMC =
contributor; why
> should you have any influence on this?  At least sign the CCLA before
> you try to "assert influence".
>=20
> For background, stdexec was the reference implementation of P2300
> (std::execution) during the standards process.  It is currently the =
only
> complete implementation.  We are using it because it is a reference
> implementation of a very useful aspect of C++26, which we have based
> future async programming around.
>=20
> The day GCC and Clang have a native P2300 support, we will start work =
to move
> off stdexec and use the native support.  If you look at the way our
> headers are structured it is even designed so that all stdexec usage =
is
> replaceable with std::execution.
>=20
> I don't see any cause for concern of using the stdexec library anymore
> than I would have concern for using nlohmann::json (which is =
maintained
> by a single person).  If for some reason NVIDIA moves the repository =
in
> a direction that isn't useful for us we can always pin the SRCREV to a
> point that does work for us, but I really don't foresee them doing =
that.
>=20
> I'm the only one in OpenBMC (as far as I know) that has contributed to
> stdexec and I sure don't want to maintain our own private fork of the
> P2300 specification.  If you were to print it out, the specification =
is about
> 190 pages and the implementation is some expert level C++.  The =
primary
> author is such a C++ expert that there is a primitive named after him
> (niebloids) and was also the primary author of the std::ranges =
specification.
> I'm not going to compete with that and I doubt anyone else in the =
project is
> going to either.  Where the guy works shouldn't matter when his code
> speaks for itself.
>=20
> --=20
> Patrick Williams


--Apple-Mail=_4CA2E050-8913-4465-AC98-D0045AAB53BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><p class=3D"wnfdntu _1ibi0s3f5 =
_1ibi0s3ce _1ibi0s3ea" dir=3D"auto" data-pm-slice=3D"1 1 []">Hi =
Patrick,</p><p class=3D"wnfdntu _1ibi0s3f5 _1ibi0s3ce _1ibi0s3ea" =
dir=3D"auto">Thank you for the detailed clarification. I sincerely =
appreciate the deep expertise, sustained effort, and careful technical =
judgment that you and the OpenBMC community bring to this work. My =
question was purely about understanding the dependency=E2=80=99s =
long-term maintenance model, not NVIDIA=E2=80=99s involvement or the =
quality of stdexec.</p><p class=3D"wnfdntu _1ibi0s3f5 _1ibi0s3ce =
_1ibi0s3ea" dir=3D"auto">I appreciate the clear and pragmatic direction =
you outlined for its continued use and future transition. This context =
is helpful, and I will keep it in mind in any future discussion.</p><p =
class=3D"wnfdntu _1ibi0s3f5 _1ibi0s3ce _1ibi0s3ea" dir=3D"auto">Thank =
you.</p><p class=3D"wnfdntu _1ibi0s3f5 _1ibi0s3ce _1ibi0s3ea" =
dir=3D"auto">Regards, Chinmoy Dey</p><div><br><blockquote =
type=3D"cite"><div>On 1 Aug 2026, at 12:32=E2=80=AFAM, Patrick Williams =
&lt;patrick@stwcx.xyz&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>On Tue, Jun 23, 2026 at =
12:29:03PM +0000, Chinmoy Dey wrote:<br><blockquote type=3D"cite">Hi =
OpenBMC Community,<br><br>I would like to start a discussion around the =
long-term ownership and maintenance model for the stdexec dependency =
that is currently part of the OpenBMC dependency chain. As I understand =
it today:<br><br> &nbsp;*<br>bmcweb references sdbusplus through =
subprojects/sdbusplus.wrap:<br> =
&nbsp;&nbsp;&nbsp;&nbsp;*<br>https://github.com/openbmc/bmcweb<br> =
&nbsp;*<br>sdbusplus is maintained under the OpenBMC organization:<br> =
&nbsp;&nbsp;&nbsp;&nbsp;*<br>https://github.com/openbmc/sdbusplus<br> =
&nbsp;&nbsp;&nbsp;&nbsp;*<br>https://github.com/openbmc/sdbusplus/blob/mas=
ter/subprojects/stdexec.wrap<br> &nbsp;*<br>sdbusplus in turn references =
stdexec through subprojects/stdexec.wrap :<br> =
&nbsp;&nbsp;&nbsp;&nbsp;*<br>https://github.com/NVIDIA/stdexec<br><br>Firs=
t, I would like to acknowledge and appreciate the work that has gone =
into this implementation. The intent of this note is not to question the =
quality of the code or the contributions made by NVIDIA, but rather to =
discuss whether there may be an opportunity to align this dependency =
more closely with OpenBMC=E2=80=99s long-term governance and maintenance =
model. Since stdexec is now part of a commonly consumed dependency path =
within OpenBMC, it may be worth considering whether a =
community-maintained approach could provide additional benefits, such =
as:<br><br> &nbsp;*<br>Reduced risk from repository access, policy, or =
ownership changes outside the OpenBMC project<br> &nbsp;*<br>Broader =
review and maintainer participation and long-term support<br> =
&nbsp;*<br>Improved community ownership , transparency and reduce =
dependency risk<br><br>If there have already been discussions on this =
topic, or if there is a preferred roadmap for the dependency, I would =
greatly appreciate any references or guidance. My goal is simply to =
explore whether we can further strengthen the sustainability, =
transparency, and long-term maintainability of the OpenBMC dependency =
ecosystem as it continues to grow.<br><br>Thank you for your time and =
consideration. I look forward to hearing the community=E2=80=99s =
thoughts.<br></blockquote><br>I didn't respond to this before because =
honestly it sounded like a<br>competitor to NVIDIA trying to assert a =
"we shouldn't use any software<br>from my competitor" stance. =
&nbsp;Nexthop isn't even an OpenBMC contributor; why<br>should you have =
any influence on this? &nbsp;At least sign the CCLA before<br>you try to =
"assert influence".<br><br>For background, stdexec was the reference =
implementation of P2300<br>(std::execution) during the standards =
process. &nbsp;It is currently the only<br>complete implementation. =
&nbsp;We are using it because it is a reference<br>implementation of a =
very useful aspect of C++26, which we have based<br>future async =
programming around.<br><br>The day GCC and Clang have a native P2300 =
support, we will start work to move<br>off stdexec and use the native =
support. &nbsp;If you look at the way our<br>headers are structured it =
is even designed so that all stdexec usage is<br>replaceable with =
std::execution.<br><br>I don't see any cause for concern of using the =
stdexec library anymore<br>than I would have concern for using =
nlohmann::json (which is maintained<br>by a single person). &nbsp;If for =
some reason NVIDIA moves the repository in<br>a direction that isn't =
useful for us we can always pin the SRCREV to a<br>point that does work =
for us, but I really don't foresee them doing that.<br><br>I'm the only =
one in OpenBMC (as far as I know) that has contributed to<br>stdexec and =
I sure don't want to maintain our own private fork of the<br>P2300 =
specification. &nbsp;If you were to print it out, the specification is =
about<br>190 pages and the implementation is some expert level C++. =
&nbsp;The primary<br>author is such a C++ expert that there is a =
primitive named after him<br>(niebloids) and was also the primary author =
of the std::ranges specification.<br>I'm not going to compete with that =
and I doubt anyone else in the project is<br>going to either. =
&nbsp;Where the guy works shouldn't matter when his code<br>speaks for =
itself.<br><br>-- <br>Patrick =
Williams<br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_4CA2E050-8913-4465-AC98-D0045AAB53BE--

