Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqCnw0Ad"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wgBg6npnzDr5J
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 16:08:26 +1000 (AEST)
Received: by mail-qt0-x235.google.com with SMTP id e8-v6so21872091qth.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 23:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Pk3LKXqOKL2R92PV+CIesVODwtPKqhz9RP3KYuB0gN8=;
 b=jqCnw0AdTyJcuEFWThHfWULfgfnftk/8DHe9sRfxym9fsn4Esp0pSrb52dObFmcP+f
 gs0aPEYTxVYWyG+6oj00gQA4M4BDEIE4HQr3KBdiQWFfp8YOfF3+qCY5sQhkPJ3Kh0W2
 Xs58ngy8zERbYilkHM+WNXqJ1DyulThPQwSpb+6CpPXlFzuCKts6h2MOeeVCWuXaqcpM
 BhHfLXam1MPWtmlOTYsNhKtARelHBHykgAI+ZYGpPH07M4K7RY5avX6LJL/ZyeNkCHGH
 YaQSsfGQTglyg+C/wNRFOS2hmsHNrezx2vb/4uNt1vQ+VjPJjbV+8R1AyB4UIfHbvoVz
 C0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Pk3LKXqOKL2R92PV+CIesVODwtPKqhz9RP3KYuB0gN8=;
 b=adwMYmQBc//z47Zbnfgd+5dLrS5ci/23LRqx2G0UoelfAUOxcJS/xKLKLWp9OV0VmR
 oMamxA++y4S6x7h/vGDK9KVvSOIE67V4QGQfvVpiDD+LV3cuz14fuB4Q97e1u5Q6AmCb
 zL771B4oBoFwbSiCA5Nn7hW3hLZ/G/UVaCreRRNLVzns4/Otou2DNVLLETcUwVZimJYG
 4mNJGDvUblZfZl1fK6ybW5pwwsvMf/W3XQdrWftaso7Hl2777cRvC2W3X0uy92YOA2pH
 TWtcttpXueH8qsS18wLAzOOZIb+M4UqZ95meP2lxWicp/YtWsHw3Q7qZLjSshJo0GAXe
 18Mg==
X-Gm-Message-State: APt69E1thSWT2p8k9VhGgUENlyk1f1wvRvkhElc5wRRKiJMPONYWsEiu
 hRJGZieUDZX9cF8OEgD69/m3xLkxLltUlxD034Bbcg==
X-Google-Smtp-Source: ADUXVKLnMcig/lFX+9drOxszaAm4m7c8BBatE3DZAVGLVAZUadRpNUNkI+ALYO4dPti9qKTSFcZTxg+6gMTT8FULInU=
X-Received: by 2002:aed:2413:: with SMTP id
 r19-v6mr1284751qtc.110.1527660503506; 
 Tue, 29 May 2018 23:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2d65:0:0:0:0:0 with HTTP; Tue, 29 May 2018 23:08:22
 -0700 (PDT)
In-Reply-To: <CAARXrt=7NO+qyMTX7w=bKT4sKUFyFeD+fAQ3Aa3N-bddDHsOgQ@mail.gmail.com>
References: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
 <CAARXrt=5dFZwqeW4+sradJYwYaaFr4-rQbVP-MhQf=j6LQCQuA@mail.gmail.com>
 <CAG9c7cDZpOFbuwXXDQKTJ0cVE54ihxH_tezcssngF+jpwnyMvg@mail.gmail.com>
 <CAARXrt=7NO+qyMTX7w=bKT4sKUFyFeD+fAQ3Aa3N-bddDHsOgQ@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 30 May 2018 14:08:22 +0800
Message-ID: <CAG9c7cDAHUjsU0FWBxr3JRRz4JKsXiTLri6evn9ciBZJWHxS7w@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a62284056d662dbb"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 06:08:28 -0000

--000000000000a62284056d662dbb
Content-Type: text/plain; charset="UTF-8"

>
> The "_append_df-openpower" means this is valid only when openpower
> distro feature is enabled.
> You are on x86 build so there is not openpower distro feature, so you
> still do not get this recipe.
> You can remove "_append_df-openpower" and it should work.


It did work.

Thanks for your help.

--000000000000a62284056d662dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:14px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
The &quot;_append_df-openpower&quot; means this is valid only when openpowe=
r<br></span><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">distro feature is enabled.<br></span><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:14=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">You are on x86 build so there is not openpower dist=
ro feature, so you<br></span><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">still do not get this=
 recipe.<br></span><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">You can remove &quot;_append_df=
-openpower&quot; and it should work.</span>

</blockquote><div class=3D"gmail_extra"><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">It did work.</div><div class=3D"gmail_quote"><=
br></div><div class=3D"gmail_quote">Thanks for your help.</div></div></div>

--000000000000a62284056d662dbb--
