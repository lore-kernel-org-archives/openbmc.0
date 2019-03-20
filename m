Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bIV5qwgQ"; 
 dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PJtc2GvbzDqB4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 16:50:47 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id v20so1147448qtv.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 22:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=0Cbr4ybBzkcD6RwCfIHRo4DfqCSTpKBEyt8g9iBgl2g=;
 b=bIV5qwgQWCttDdJliAMlAtMaYJlVkZDhYSZmZVIzJllJm0S0PRoWeacz5EXOGcOx/B
 FtgrGlF2CXFowbmnIiEPLmBuqWkd2QTEr6U6m3ghR4UK2BqXSiekH4oFIB5NZPXh3lGx
 RQoAnU+BmPumm24b9ypBiFKhT+Pq8yVa6CM3rPETGYBROP2mNrK8/Px2hglVID2BaCen
 1aH+1aWvAW7buq/5XL7AC1uDiOkDGQeON5M77aGUNEDH9O+rJgP1l+3jsC8qT8lXUdbT
 PjMBj77uItGfLNnlIgvYuzAcFoABBfkrSdH8ja3XUftOI5+BTgJkO2HDEnZmld3qRA0I
 V2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=0Cbr4ybBzkcD6RwCfIHRo4DfqCSTpKBEyt8g9iBgl2g=;
 b=R8qzWHyFPjzhgPSAZ7MS0HgWzOR+mGWyDrAdooWS6qEyeVM1RtWLR/Zj9C4pO0Iy9m
 CyWDeWXhoyHnKeUw/aFxdrSMeq41+X3CXCsKgEwEtKlRBaDlERx8xN7Dq4YHdOv/t04s
 6432ZQKs1x0fP/RcNmPKLTwrN1JRkF8oLnHjf2FmpSULehDlDfjdJ47ppD5tE2o4Rz1Q
 eBK/MH/sIQcteAsbxyduoYJlZe8PyKLFCYzdcwQGhy8QDJ6NWMaZARMmvPGChTsgpPKc
 sDf4f0ScrIMaTnmTcucuaG+gWZV9mJJNNQGFc4tDqy1bj4+T0CqVO2oLjufBhpjLetEg
 Eolw==
X-Gm-Message-State: APjAAAUTqfKm8Oum9DO76aBSh1RgqOUagxnnSM7BxiPA5p2DNsS95Csu
 FYQsLnt3UNTJimu+EIuh1PKqR+G7ipXSvipWECRRGw==
X-Google-Smtp-Source: APXvYqz3dT4RCfzeHpdr+WTXLZ/qmDCSijLhO4TIwP38O7EefDe1NQ4tfR853meueYIelVQKaFlx05OO9sn4GL/MzEo=
X-Received: by 2002:ac8:72d3:: with SMTP id o19mr5484875qtp.274.1553061043863; 
 Tue, 19 Mar 2019 22:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cBOEd3rD5zmgXVMx6m7sUHtt2ts4_H=8B8KxZ7iGMcvUA@mail.gmail.com>
In-Reply-To: <CAG9c7cBOEd3rD5zmgXVMx6m7sUHtt2ts4_H=8B8KxZ7iGMcvUA@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 20 Mar 2019 13:50:32 +0800
Message-ID: <CAG9c7cAkdE=EcKAMn+E0gfKbQ1eeNeZopLjgG_YEs0W7M_6Tcg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.19 00/12] PECI device driver introduction
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jae.hyun.yoo@linux.intel.com
Content-Type: multipart/alternative; boundary="000000000000d5854505848033ec"
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
X-List-Received-Date: Wed, 20 Mar 2019 05:50:52 -0000

--000000000000d5854505848033ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jae,

Can you give some suggestion for my question?
Thanks.

BRs

Henbin Chang <henbinchang@gmail.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi,
>
> We would like to create CPU temperature sensor.
> We could see the hwmon file in the /sys/class/hwmon/
> But we found the content of uevent file was empty.
> That meant the sensor wasn't created through udev->start_hwmon.sh
> Can you give some suggestion?
>
> root@tiogapass:/sys/class/hwmon/hwmon4# cat name
> peci_cputemp.cpu0
> root@tiogapass:/sys/class/hwmon/hwmon4# cat uevent
> root@tiogapass:/sys/class/hwmon/hwmon4#
> root@tiogapass:/sys/class/hwmon/hwmon4#
>

--000000000000d5854505848033ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jae,<div><br></div><div>Can you give some suggestion fo=
r my question?</div><div>Thanks.</div><div><br></div><div>BRs</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Henbin C=
hang &lt;<a href=3D"mailto:henbinchang@gmail.com">henbinchang@gmail.com</a>=
&gt; =E6=96=BC 2019=E5=B9=B43=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=
=8B=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br><=
/div><div>We would like to create CPU temperature sensor.</div><div>We coul=
d see the hwmon file in the /sys/class/hwmon/=C2=A0</div><div>But we found =
the content of uevent file was empty.</div><div>That meant the sensor wasn&=
#39;t created through udev-&gt;start_hwmon.sh</div><div>Can you give some s=
uggestion?</div><div><br></div><div><div>root@tiogapass:/sys/class/hwmon/hw=
mon4# cat name</div><div>peci_cputemp.cpu0</div><div>root@tiogapass:/sys/cl=
ass/hwmon/hwmon4# cat uevent</div><div>root@tiogapass:/sys/class/hwmon/hwmo=
n4#</div><div>root@tiogapass:/sys/class/hwmon/hwmon4#</div></div></div></di=
v>
</blockquote></div>

--000000000000d5854505848033ec--
