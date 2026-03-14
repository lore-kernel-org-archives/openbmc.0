Return-Path: <openbmc+bounces-1499-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81AC107BCEA
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:23:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXhsj5Whpz3cLH;
	Sat, 14 Mar 2026 11:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773447817;
	cv=pass; b=OuBdEwqGnQP+v9y58jDwmvOVkFThDV+mPNcLRNJOgNKOmQwPB87OC3mpt17ybiXje2rOkRjWN8sBYi/SRNqhjxGSxqjnbtFzcQQ7/sidqP5FpNYp2VJ1AqO9R0HCDQo5CK1a9B9R7D5b7R3mZubT8kxUSnkssuF/tw9EvSQWg8yFL16YhtjEXwKWHd4gIPfJvzaNzQSoayq/HE7Z+VFZvmbbfWKiPyxqrvVZLErFAQTfJt2gITLC/igUDVWD6F6ScU8epvwj3VmJaNpV/+MvIRLifDxUqJftxFovkiqLBsrx79f+O+0B2ZiPt9CWnQ3SdE2Ivw2P6sT11Qt3/ltwPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773447817; c=relaxed/relaxed;
	bh=XM5NmstStZTZdv4RD1IazSQ37HYdrV3gu1Lyck+tW/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAisUQ3FuQKzzHCw++W1F2RIRhQFAOmzLx0LUqf8YljYo17Itf/qoAsF6IBEOvk1KXqZOk5DhjNKBfxvXR/oKsuMYnkuutp/04Pa0jVVRWcU09OELOppYAxxd9MMgI2NfYAe7MYzVaJ5CAx0FNuZ1ZQM2rhrf5gxl5T5pRGTZqSICNOZG22zWUaIH7M0TPZgr8dQrXlnft2KA3MXq98I1Hr1mVskc4aLhRn7hiJdI/4KeJBL7QGFt7SPxKraJHqOpwQoP10792XksdNKjWERcNxHnAj3KhUfSUNg4+Ywt70NVmAPfNu04mkYNUqQs4NnOF1XBWs+Y5hhon69X0s6oQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nKR94XJM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nKR94XJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXhsh0Z76z3bt1
	for <openbmc@lists.ozlabs.org>; Sat, 14 Mar 2026 11:23:35 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-56af4aad3e5so1063521e0c.3
        for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773447812; cv=none;
        d=google.com; s=arc-20240605;
        b=XlUShOQ6DrpuYAJntpxGo6OSB/ScAOxt8WxxwZVwyuVCMM2eCgBvS/PBR/3StCLssk
         0WOEep9InMkF3szo0s3KcRjDGJTrcnaSwh0HUoJsmJqDLsMbm3Y3xFXvJpHR+UOAKUgF
         dexO3QobxG5ScS4ewQ01tvJBfdrQwmeA/fkC/Kl5cuIJHV1N348u9F9ZE788XZi/nzFl
         sv/tQHN1pv5cyLy6oheYzu+T9y4lsEr/S0yvmcm8ovIPTHVgYrOygeOGV7veiBw/58kU
         MRMLC5P0BCPj+PsQkysqjGTJ8NrCdj/ef9PKTLrrz7mfLYeKLBSMXJs3PzmC1Xm2ABmP
         7AKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XM5NmstStZTZdv4RD1IazSQ37HYdrV3gu1Lyck+tW/0=;
        fh=uo2vhNF39cVviXq+IjcdZ4ZRy1Hfb+gFMS/oMNsvFSA=;
        b=cWpXG1LfeUI2LkJsIyOpfotqsYuBZO6TGoFTwO1GBlhqEsSzhs0SX8LmwZnfafKDqD
         yp2Ty+ICRVyF0GpmqA2rnJnVZbM83fRV3kQCAO79KpIqKU6qCW0ZJ944DHWyDJac7do8
         n/oxEx+oC0RC/8BEbo5r9IyrXNwVs48j91Z2IHninZE1kRPkchlevEgzDN/Jx6n1d+zD
         Fq9Vw4cp+WnoVzLBYKTw4s1asgZurCeraP1p/nrK8FCug7crfU9zm8sp4BexfSouJsvM
         y1kOqqPsEq/UMtIP6M3dk+tYNPZzr5wPJh5eOlvRl1FjG3lBa4y30k6v511Sl39kgDYg
         z/Jg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773447812; x=1774052612; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XM5NmstStZTZdv4RD1IazSQ37HYdrV3gu1Lyck+tW/0=;
        b=nKR94XJMynFEEGZQk5dwjLT2W0Q9UwWDylu5o1vI2g2rNHTQXM1uADcPnGn/o9aN+/
         D1/u/wI9xZzsv6RkI+ZlcgLqDdLecRdZ6Rl5QOnc5LLS5WfQtSZVkanGiM26TYIoOuO2
         ZHKo349zZcMhAghXsLDqaxf/H0mFobhxUQykTp0H/ZA4uik/Ulrlj9V9qmooL5d2gmCI
         dndzSK30UCJkFgcO9lo/TUh1lSmKwoWt/x1N+yQwt27k73dwiF3X7QC/0uXUWrEiDAve
         TC31oXyhkyb7O98grxWfF3qVOSiAyyItVPjugdaZlysKEqOKQ+0mBmxvU2bLwtDZ4j9x
         IdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773447812; x=1774052612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM5NmstStZTZdv4RD1IazSQ37HYdrV3gu1Lyck+tW/0=;
        b=LD3p0cq0T7ZlC9CQLoZT2oEQOSmQVHDMuYKd9iVmUSZ4FkbbG4Bp7oYvWAM5ylJYnG
         AWvzEq4PGtb9rRAkrGhU/Z/8m/iEwWAZNCTfAb96hMCxbitSr6zktoICOJDrlxR55PgT
         GsK8p7iFM7aYR8K5RMg19P0/DEUHkeiK20Cplin860yO6gRSf9NbTLPqkmKOtRp2zSv4
         Fkb+fa7De1SqGwEcNDMK7Z849cXHkMzPylu/rxN+1udTH2M8vXgYG4aFwq9YsDrnbWRD
         2B6cr6OnymtfIcYJzmwsHDoJ8D0rX9FcalVmHe+7Uxl8EmAsg5a1xyvnhpWFh9KFY/Jw
         gfKg==
X-Gm-Message-State: AOJu0Yy/yVXIyaAmHsFzLzBco6TIDRXd0pJRWjUdu2DX8F1uRr6jJkIC
	4Xj3iWKfp1hDmtjxIYszWK+WUSp2q+80ox9WnUxCYfDdv+5AlzcG9somD4mQbtFQFA3sC6XHfsm
	m12RjHis7eyxiBKOLwTfannhSQtNx4fM=
X-Gm-Gg: ATEYQzxdcby9PMVcZbdGKFMcnGdHLVF1/JKwT3Tw2r+ydKFPMDNsCNqzSUrgnFXEUUP
	nwyKyiGPHObLtLNqFqp4O1qcQgi+hz9UE0qx12mTGXfui0NS1D91OHjG/voRD3C2qoMfUcZ6+p8
	FVDaxXghTy/oS5F/e676gK4mF4g3oI7yhlQFn9IYJ2rsNtpAOBLD3kOAaXatS5Hs0S+NkMGynf3
	/4GujBedJvck7Lf5L6G7J0eQFkkqAR0n6GeVHfsQ1uhbPMD7AKK5zoOBYG7yrO89dhp50rw7l5x
	peNl0z5QE/Vj5o9e2VO7nanGat9wptKftDbAuskgfIGddDsP3isRFol/4vhhPdszONqSzNzVZYc
	XES9bNiTgDHU4rfCk0Q53Yl35/+A=
X-Received: by 2002:a05:6122:c9d:b0:56a:feae:fc2c with SMTP id
 71dfb90a1353d-56b62946fd9mr1901924e0c.14.1773447811859; Fri, 13 Mar 2026
 17:23:31 -0700 (PDT)
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
In-Reply-To: <TY0PR04MB73520E1261674964EA58028AF145A@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 13 Mar 2026 19:23:16 -0500
X-Gm-Features: AaiRm51fYeH3Gdgv5GIPGqw1EIaR584MAybFSdo8kiU7wOK35nCsKAb7X6N3ntM
Message-ID: <CALLMt=oOFyVq6bJa_LXYm31ZqTMbvSn-q1gVm9hz526YMK57rg@mail.gmail.com>
Subject: Re: Quanta CCLA Schedule A update - 20260313
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?TWFydGluIFBlbmcgKOW9reayu+asvSk=?= <Martin.Peng@quantatw.com>, 
	=?UTF-8?B?U3Rld2FyZCBTaGloICjlj7LlgYnoj68p?= <Steward.Shih@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000da85cb064cf0fe1f"

--000000000000da85cb064cf0fe1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 2:55=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE) <
Litzung.Chen@quantatw.com> wrote:

> Hi team,
>
>
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.
>

Thanks for keeping your CCLA up to date. I've uploaded it to the projects
google drive.

Andrew


>
>

--000000000000da85cb064cf0fe1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13,=
 2026 at 2:55=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=90=AE) &lt;<a =
href=3D"mailto:Litzung.Chen@quantatw.com">Litzung.Chen@quantatw.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"msg-7449729205857639917">





<div lang=3D"ZH-TW" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2780278332998732727WordSection1">
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue=
">Hi</span><span class=3D"m_-2780278332998732727apple-converted-space"><spa=
n lang=3D"EN-US" style=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sa=
ns-serif;color:rgb(0,51,204)">
</span></span><span lang=3D"EN-US" style=3D"font-size:10pt;font-family:&quo=
t;Verdana&quot;,sans-serif;color:rgb(0,51,204)">team</span><span lang=3D"EN=
-US" style=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans-serif;col=
or:blue">,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US"><u=
></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D"EN-US" st=
yle=3D"font-size:10pt;font-family:&quot;Verdana&quot;,sans-serif;color:rgb(=
0,51,204)">Please find the attached file for updated Schedule A of CCLA fro=
m Quanta.</span><span lang=3D"EN-US" style=3D"font-size:10pt;font-family:&q=
uot;Verdana&quot;,sans-serif"></span></p></div></div></div></blockquote><di=
v><br></div><div>Thanks for keeping your CCLA up to date. I&#39;ve uploaded=
 it to the projects google drive.</div><div><br></div><div>Andrew=C2=A0</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div c=
lass=3D"msg-7449729205857639917"><div lang=3D"ZH-TW" style=3D"overflow-wrap=
: break-word;"><div class=3D"m_-2780278332998732727WordSection1"><p class=
=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

</div></blockquote></div></div>

--000000000000da85cb064cf0fe1f--

