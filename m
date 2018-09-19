Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fLRHtOS1"; 
 dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Ftzl1nyPzF09n
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 07:58:51 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id c14-v6so7806399wmb.4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UUHzhRDtl1VAFRFzOiByA1/+2r/60T+iFUf/besECMk=;
 b=fLRHtOS13LCARASSvCQu3/vRoN+MIM+ANEhT+3rO/XMrL7H7CNy1JdJLsvhFS82jW5
 yQo+xdfEnvBIl482lC6VobKkIsmKsK4VvNFfPBBpfEqGqxnhlDZas/YvyWoA8bYvnZ6s
 cA9MGUj0U3Fc4FV2ZL32sc7ibATn4IGCFLIOQ9YKMJpCZz1toCwIXU7BfLeZbEreuAwt
 Lnu5rE1Day0rC1zOcCHGWZrnVzhshSIcc/D57f++HT30A5jmR0fajtToo0TZ+SzurqZS
 HX29Vln26hEsp1VykRaM40hvSm8ok/wOu+Y1cQiERa5V2yRL05b3X0SsPg5Wd6tC4WBY
 Y6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UUHzhRDtl1VAFRFzOiByA1/+2r/60T+iFUf/besECMk=;
 b=pfUdsUlMsTVi3TEaHlhuaf7ZLLHWkGavR0cURLLvMBB6ajX1i6c5/FIXV8nLVYMEYj
 s6JXe5WZjYydaoEYBl+kcXncjR4DFnCsrxo5QimAoQgOQVgHoicuizilmlmTzHgnQRQl
 1PJ7V6UMujz6rbzxbIxkpvCVxDsv+Kh4j3peesguaAIL2yyDQoLkNGQXYipr8zsV8jKg
 5OVQIyQlX7eiajFzxtyobDFyFHCiQH6RaVXekyHd1bkczg6/GTyWBNPJCtd47qYOMFpn
 UP8hmfjZjY5F6JPxEzZi+v0RySsnttimpRz71BW6a1gEFtOeW+4UrspS4w1qHznGwcRL
 yp7w==
X-Gm-Message-State: APzg51CBd54Ix7M+L3XYV92S0Jnkd9NzbwbOAcBB6DmKo2n62THytZFv
 GK/TILlVb+QhGYgPvTlFbCnWY3Qzq+hZMtBFOxRxQzl81Bw=
X-Google-Smtp-Source: ANB0VdY9DajmM/5iYSVPaENl+i42shZmfDW0Clz2agoVDgZK9JauQKs2qWchWNNQDzLk56ryHDY32RmzC50ESU7IPNM=
X-Received: by 2002:a1c:9141:: with SMTP id
 t62-v6mr21326376wmd.69.1537394328773; 
 Wed, 19 Sep 2018 14:58:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:20c7:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 14:58:07
 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 19 Sep 2018 14:58:07 -0700
Message-ID: <CADfYTpGe=R4ntLf7=7dTpz8=ZoA0EYgFs=vUgAAkuEJW8FaEWg@mail.gmail.com>
Subject: Update meeting time: Security Work Group meeting
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d90b9905764082d6"
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
X-List-Received-Date: Wed, 19 Sep 2018 21:59:00 -0000

--000000000000d90b9905764082d6
Content-Type: text/plain; charset="UTF-8"

The OpenBMC Security Workgroup is switching to a two week cadence.
The next meeting will be Oct 3, Wednesday at 10am PDT (noon CST).

The agenda, access information, and minutes are here:
https://github.com/openbmc/openbmc/wiki/Security-working-group

----------
Nancy

On Wed, Sep 5, 2018 at 9:37 AM, Joseph Reynolds <jrey@us.ibm.com> wrote:

> The OpenBMC Security Workgroup meets Wednesdays at 10am PDT (noon CST).
> The agenda, access information, and minutes are here:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
> Recent topics are: how to implement best practices from selected upstream
> projects, and how to get started with static code analysis.
>
>
>

--000000000000d90b9905764082d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:9.6px;text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">The OpenBMC<spa=
n>=C2=A0</span></span><span class=3D"gmail-il" style=3D"font-size:9.6px;tex=
t-decoration-style:initial;text-decoration-color:initial">Security</span><s=
pan style=3D"font-size:9.6px;text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline"><span>=C2=A0</span>Workgroup is sw=
itching to a two week cadence.</span><div><span style=3D"font-size:9.6px;te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">The next meeting will be Oct 3,=C2=A0</span><span style=3D"font-s=
ize:9.6px">Wednesday at=C2=A0</span><span class=3D"gmail-aBn" tabindex=3D"0=
" style=3D"border-bottom:1px dashed rgb(204,204,204);font-size:9.6px"><span=
 class=3D"gmail-aQJ" style=3D"top: 2px; z-index: -1;">10am PDT</span></span=
><span style=3D"font-size:9.6px">=C2=A0(</span><span class=3D"gmail-aBn" ta=
bindex=3D"0" style=3D"border-bottom:1px dashed rgb(204,204,204);font-size:9=
.6px"><span class=3D"gmail-aQJ" style=3D"top: 2px; z-index: -1;">noon CST</=
span></span><span style=3D"font-size:9.6px">).</span></div><div><font size=
=3D"1"><br></font><div><span style=3D"font-size:9.6px;text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">The agend=
a, access information, and minutes are here:<span>=C2=A0</span></span><br s=
tyle=3D"font-size:9.6px;text-decoration-style:initial;text-decoration-color=
:initial"><a href=3D"https://github.com/openbmc/openbmc/wiki/Security-worki=
ng-group" rel=3D"noreferrer" target=3D"_blank" style=3D"color:rgb(17,85,204=
);font-size:9.6px">https://github.com/openbmc/<wbr>openbmc/wiki/<span class=
=3D"gmail-il">Security</span>-working-<wbr>group</a><br><div class=3D"gmail=
_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Wed, Sep 5, 2018 at 9:37 AM, Joseph Reyno=
lds <span dir=3D"ltr">&lt;<a href=3D"mailto:jrey@us.ibm.com" target=3D"_bla=
nk">jrey@us.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>The OpenBMC Security Workgroup meets Wednesdays at 10am PDT (noon CST).<br=
>
The agenda, access information, and minutes are here: <br>
<a href=3D"https://github.com/openbmc/openbmc/wiki/Security-working-group" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/<wbr>openbm=
c/wiki/Security-working-<wbr>group</a><br>
Recent topics are: how to implement best practices from selected upstream <=
br>
projects, and how to get started with static code analysis.<br>
<br>
<br>
</blockquote></div><br></div></div></div></div>

--000000000000d90b9905764082d6--
