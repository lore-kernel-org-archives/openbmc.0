Return-Path: <openbmc+bounces-2229-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E69C44501
	for <openbmc@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gvrnd5g5Cz2xpn;
	Wed, 08 Jul 2026 05:26:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783452405;
	cv=pass; b=Dzo44nQoVUwomY4Ob19OF6lc3bCmrWVMy57koe4E1e2v8d6sAoByx3nnePufS6agpB5xeQVXr3k9qm4+BGhyWSkopdyfIdrMmqfEhY+vWXHL3tlJV+LyST7fQ/noEsyWxBegKDh3YW2Tc1PmD9LPUM1vEUbM/+JrdZlDHoqX6e7BFbea5AmAKn3zgaQOFijYhZR+1QrCtbp1XkWac89Uk7sdnulWsrT6+PmDuo/X5PqHAYl2uEoQ/A8tdcPtoJ9CXWhQdkX2M4I4X5W4vFj9FVf9Oxz9xGDW24zb4mX6+90Y1tM4QYFxVKnuw+2jLfwFfXhZzhhnA5MxcSgmkTxWLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783452405; c=relaxed/relaxed;
	bh=fCmNfHhnWd1PpyobIFko4yWWqxxrbBRP7wBBgF264zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwWHZ/Oq7tNZkMfrkB15uOlNtyc68Y2BzmmAXaGm875dR89Q7zNNKRQunhK1Ds6cTdV1W9aJG081K/oz38Uj5sdefkdht2hbSvA3opY439i9vCW8oUqPLEtVuxQNkog4ZZ/v+w8lKi+phghHcMbFqGtvNNimlXTxZZWXUVH0IAvLG2gTXcrJgFn5Q7Tc7q4p30hfHygkd6q5JVgBTf3CDBBuyT8Q4GRizlyn9JqEuNapahqj+vFBksU9hFR5k9m5iQR13ysjwDj6KHZ6NRi+CQmrwPmBxOak9VCgngDzv/QhXzT0g//BvTlRmZjr5rnmoFlQjMgaiAoLaWeX5QaAGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eub4XU1j; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eub4XU1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gvrnb4q1Hz2xC3
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:26:42 +1000 (AEST)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5bdcbb1f3f2so2791808e0c.3
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 12:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452399; cv=none;
        d=google.com; s=arc-20260327;
        b=nPhblUXauef+zPfCibVI5VMBS/DuBpvCz3VI9R3ub9k0vhGkrPqgeuEL0pq6jCBaG+
         WeTZ6y+Rz46+f3QV1twB7quSPNSXIginzI6+uCNla826UIHTmObRHTQCRaNA8KoZI4oj
         Plnp58E2E+AAwMs5+odlGESKIftu6v9naj41YY/TpBXOIyhXT4qdy2scuVz+SSF/aUUp
         qzgliczgHXeF59hTJwfwkqKhnkmVO4QrRUYdnilPjYcg3VPfg/kHWwjFrmT3Ysk0MFx5
         kr92gXUTDNBu4tbqi50zJjqoGVgFKl3kTRIipYJJlwWjy9KHhSHaY6x6ihoNwq1cHLkK
         7JLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fCmNfHhnWd1PpyobIFko4yWWqxxrbBRP7wBBgF264zc=;
        fh=guSDjApOc2g2qM6jHtoNdVgklsMOKfgFdkHesFUgAes=;
        b=QYR6wIhp9QlwZGkmSh4vDhO2GOoqgmqcTOjW9CiVL3aafjFuVv2LsHm0jP5eNtkajU
         r6pbn/24lniRw8f8xn230mlJ9xiKNhf8mfkkcyLDHlDu3vKNMP5HyJyva1yG0M9tycYY
         0hC2wdX1vS6qanFL/TUS9nfVkQBWbrOffzso1Q2wGlvZDh8I8PvqcuIPPQ95g16JLNE7
         NnbixXwITj0VjlQrvR6Ay5MDuIFRaighx9ksWsE1XijD3xJmS85KsZ+zvlFfGgXNciRB
         mbq5Oc08tXRKZ10njX6U3gs/ar6uo9n48wfvOBEj3fRPFiHuhsi/0jpSu6P5EOkAlXxv
         MX0g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783452399; x=1784057199; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCmNfHhnWd1PpyobIFko4yWWqxxrbBRP7wBBgF264zc=;
        b=eub4XU1jMN7asmIX/71XzaWcTrhO4ruwdQFSnPSi667CniTiLaHTkmQtuAxVRsfYX+
         CCnN0JBNAlU+AboPL9eX2jIq+UBApFCrZCY0E5vfyZatgYiZcJ0ji4bnMp8E3+tjxlGx
         27hGWsZDUpjS02dE618sp8/zgsEdJXWyzOpaF1hoq+ltZh8Faz3ubKsHHLyaRRfLTQyV
         mzSn/Qa1hYssbdnO31NcBs2rEAb1QhNtkVK81OXq24XFC0ZilpblSQiP79wosNbknTKM
         k+QL3SGygh5wvVrsMH6r7w7GbCQRlb89CsagTDctMhffebqxet0KoNQCJKDtFz4YHOdg
         qc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452399; x=1784057199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fCmNfHhnWd1PpyobIFko4yWWqxxrbBRP7wBBgF264zc=;
        b=Qd2Uy75PjAUwcdjOzOgcW0TX1cpgvcngEqVhQdixZ54SLzLej15lfVm1hqa8PYPxrw
         4fTMnM1uY5Vrnrlfrs6nwd+OGXcHU72Rae3cfwvacpowiUmbpyQ2YHACKS8JpHjb9IOe
         tFd1cAnPglF+91qQ7qY10Yz9LMZqy3tt+bvJYvDsyswvOwuhOHKznu4/jzDqXAgQlJ3L
         Kr0u1AnBveIr4lYm3EYvGG/BEM+6Gsrej1k6gHwuIo9nV586Z0gI1tuT/3GGfS0SsKQb
         dHDACW696M08Q2qbGW6cATy9RfkS1cyrmNIWBBcnOMYKD1bMe4ZY5sqbiSOd3XuoXyzY
         pikQ==
X-Gm-Message-State: AOJu0YygcxaMwaUtkdYvjeMqCeeUvmuzMNt+Ry1UZlj3oiwxbfJHYgVJ
	2Ha3W0s3va4u6b6QkFqdm0WsmhPQra/RdZBgd1LlQH0naqIsIfOkZJvSeI9wTVBv1i3uL+pJVWV
	H5HmzPZUbu4qSQatKOyhMCYqqmq+Z/TE=
X-Gm-Gg: AfdE7cnZ/F95Oo8oaAmpSoYoKgsM3mfMRuIHhqO6jxmo5FHjMmNV8u8UsLLncae8XSm
	3ggbGsNj0ibZY1gUQ+t8n5sYRwoEeodig/luoTWaYui6I26Yx6+wBIxw7UlBXtkFZzPCVYoUJdy
	Csfzzv/+wzT2t3mCp/9/GEnEL74yLQxa6K0zvW7L8Qpt9XAZOkyJrqjwMK+/ffvCUAdKp0A076m
	8q+ur9XIoIYMpov3ECu2yb3/WZtUMHngWRNo/KZ/7TLg0K4ZzICwEVsvP8PWEn9Byc2KvvqLDXe
	Ci92VpP9ctOSAm0FrHOIcg9J+mI2o80564w35F8aWLMujyfdCHp/JbcI2g==
X-Received: by 2002:a05:6102:418e:b0:73e:9fae:5842 with SMTP id
 ada2fe7eead31-744b7be2ff7mr3980108137.9.1783452399091; Tue, 07 Jul 2026
 12:26:39 -0700 (PDT)
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
References: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
 <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352537F1867EC8D7C71541FF1E4A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB735254690EB4CB7F14A65D7CF1F3A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352CD034A25888705A3EEE1F190A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB73523F823FE93C6F564A3A4EF191A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB73520E1261674964EA58028AF145A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352EC6C4F71D31B00BC590FF145A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352458DCDFD5529EC6D3008F1F12@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB7352458DCDFD5529EC6D3008F1F12@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 7 Jul 2026 14:26:22 -0500
X-Gm-Features: AVVi8Cef49AR9GgOWnSrdT_pS1hmHbb-V-0w7cLt1xmrIwmwGJ8znEI1BvV0ekc
Message-ID: <CALLMt=qZ5REnO0EaVWpc67UyX3R4whgk5JiyJF6VjunvoA-pDQ@mail.gmail.com>
Subject: Re: Quanta CCLA Schedule A update - 20260706
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000b8c46106560a5e81"

--000000000000b8c46106560a5e81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:19=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE) <Litzung.Chen@quantatw.com>
wrote:

> Hi team,
>
>
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.
>

Thanks for keeping your CCLA updated. I have uploaded it to the OpenBMC
projects google drive.

>

--000000000000b8c46106560a5e81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, =
2026 at 1:19=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=90=AE) &lt;<a h=
ref=3D"mailto:Litzung.Chen@quantatw.com">Litzung.Chen@quantatw.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"msg474427737095993545">





<div lang=3D"ZH-TW" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-4929491048236608671WordSection1">
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue=
">Hi</span><span class=3D"m_-4929491048236608671apple-converted-space"><spa=
n lang=3D"EN-US" style=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sa=
ns-serif;color:rgb(0,51,204)">
</span></span><span lang=3D"EN-US" style=3D"font-size:10pt;font-family:&quo=
t;Verdana&quot;,sans-serif;color:rgb(0,51,204)">team</span><span lang=3D"EN=
-US" style=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans-serif;col=
or:blue">,</span><span lang=3D"EN-US"></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US">=
=C2=A0</span></p><p class=3D"MsoNormal" style=3D"text-align:justify"><span =
lang=3D"EN-US" style=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans=
-serif;color:rgb(0,51,204)">Please find the attached file for updated Sched=
ule A of CCLA from Quanta.</span></p></div></div></div></blockquote><div><b=
r></div><div>Thanks for keeping your CCLA updated. I have uploaded it to th=
e OpenBMC projects google drive.=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div class=3D"msg474427737095993545"><div lang=3D"ZH-TW"=
 style=3D"overflow-wrap: break-word;"><div class=3D"m_-4929491048236608671W=
ordSection1">
</div>
</div>

</div></blockquote></div></div>

--000000000000b8c46106560a5e81--

