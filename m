Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwHS5py2"; 
 dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NmK95GqnzDqKW
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 19:23:25 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id y36so11335141qtb.3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=geHlEuXOR4O1Ara5Z3JVGc/stNRI4/cELOTfUgyDXr8=;
 b=fwHS5py2ACIzPG8nKoR5HUA+ov8zZ3dcmswGoremjql6IRHhfxL+oVWoLpKShoNZS8
 mXFPa40WxCV2VUD3nKSNXtaUzs05X3Dvjbe520WXwOtIJSwx9hWqSriIdKKa+Wktk/S+
 /awQfR+SHdBBKVuft9QWHbdevs1wEr41BKTxHLHimQFS+jbVGiLFrGeCEAIcn8EdG85H
 Jc9Kj0O7qPqUltw4j2DbVu3fY9NZlygmCv4a2LtlHu49DXudylF0jeeBSGcS/jUPoq8D
 M95fH3XyzgVS9e218/uxH09pZsMRBNefhlLgqt+haRubQ53C7mM1cQKjC3N4IYb8GhGP
 /Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=geHlEuXOR4O1Ara5Z3JVGc/stNRI4/cELOTfUgyDXr8=;
 b=bUia0YEyEttGyQZhd1il6glW+J5GGgZ/IJcMzUEChOxgrWvZpFkBmBQIk1T4TAAPzB
 Odq7RJrbay5/Wp/IjwwRz6B+Z2LhAHkDKqLYKZLuIh2qOnLaZQ8Fkpyc925dlM8w6vYs
 3pE+Bv/KBuD3L7nn0R7GGmlAKVKVBicaoclyMzG8yfEmhkycgPB5vfiR7hkgD2MqNwH1
 nJg3GaHDjpQy9s9vMdr4UfrGXboUwXK0rDar6yjMaGTTG2VHz5ttzmmqZAbuyx6jRcCA
 k7/RlpEvaEtrPBRkpS4mu2WEP3Kmu4bfxfVx7EzVJO4FBNVk1RpCD6wEDULSLIzD3xGu
 LYJg==
X-Gm-Message-State: APjAAAWG8TyLvSuuAlKOZY9/UXpYB3Z8ijq8rRgYMnkZrv9r+M1DEbxV
 5SXC5LzmEpVyWm5H6wahwICd3EMUcfpjPDu8g6FHLQ==
X-Google-Smtp-Source: APXvYqzEJBzaKMKTo+hN3V+vmvtJYMmRIG4sTO4JswSea4ANgG60xwxya2c7kd5TldWy1pFuGMLEpe2fieHES+xj3Zg=
X-Received: by 2002:a0c:92e7:: with SMTP id c36mr835469qvc.80.1552983803059;
 Tue, 19 Mar 2019 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cD-x3sAO_F+=2Qi-NKOoOmLp5P-i_vnzSgnuvr047xCUw@mail.gmail.com>
 <CAARXrtkh_-bH+_DETtB0vUjQHwPUJmakX+p9tihaNgYcmnhoUQ@mail.gmail.com>
In-Reply-To: <CAARXrtkh_-bH+_DETtB0vUjQHwPUJmakX+p9tihaNgYcmnhoUQ@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 19 Mar 2019 16:23:12 +0800
Message-ID: <CAG9c7cBZtD4hQszVYMCMW_Kx0nmw-WcOy9XU8sv-sT-jD9V5Ow@mail.gmail.com>
Subject: Re: Phosphor Hwmon not work
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ec635805846e372e"
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
X-List-Received-Date: Tue, 19 Mar 2019 08:23:26 -0000

--000000000000ec635805846e372e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it, thanks for your help.

Lei YU <mine260309@gmail.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:06=E5=AF=AB=E9=81=93=EF=BC=9A

> > Can anyone give the suggestion?
>
> The same issue as https://github.com/openbmc/openbmc/issues/3499 and it
> already has a fix.
>

--000000000000ec635805846e372e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it, thanks for your help.<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Lei YU &lt;<a href=3D"mai=
lto:mine260309@gmail.com">mine260309@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=
=B43=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:06=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">&gt; Can anyone give the suggestion?<br>
<br>
The same issue as <a href=3D"https://github.com/openbmc/openbmc/issues/3499=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/i=
ssues/3499</a> and it<br>
already has a fix.<br>
</blockquote></div>

--000000000000ec635805846e372e--
