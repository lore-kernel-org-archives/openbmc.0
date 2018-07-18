Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::235; helo=mail-lf0-x235.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="In0m2V0p"; 
 dkim-atps=neutral
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41W5x93zldzF35L
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 04:57:16 +1000 (AEST)
Received: by mail-lf0-x235.google.com with SMTP id u14-v6so4213330lfu.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ta7AWj18eklzCov1wMyq4UQMJt4fPw9zyJHbXuIr/bc=;
 b=In0m2V0pFHBgB29svweAq10W+kxp40exZlHBtPHwTT0VAT+a6HwgQ4B5jKbiwViv1p
 5MIMCQjQZWzJlzDVFF1BgAtuvQm6KBVZubMybrEyoQ51vsBISi3cPArwelL28TxbKaZc
 DQZI9iTe0gzlk5hvfK5Oz9zqup/gZuUxtBKxgWH6gGLCfr9+PwPdDXQeSvYCDBohG2Uf
 NdHmp5wWIR3+lodFkqNOs1h6b07YXMsfyPR1QEAyZGzcBYVzYc4fWP6ySGbGph4YA3Kh
 ZvrxMLW1US+5btPxwUQckCA6wUUqKK9XeUVWQMNSyvrLpxL+ajq8hL2U2zh+ZE2HuVKe
 2tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ta7AWj18eklzCov1wMyq4UQMJt4fPw9zyJHbXuIr/bc=;
 b=L2oP0ODKhXwhCTXWMFWoiKyrywn6ZY1O/fBEQIKlfiYkjZZK8BaBlyWqkmLmUha1sM
 2flCPMscJC0FvsIcbk5qHaITa40GnULDtKeCRjr4OdWW70tq3BNOJ6S5Ik27V1tiQ+eJ
 DcWutohqoK1E1TH7Zr/AI1gc6Zc1/ez0ClAf2JDchKmG18kGTLq90JFLqJTiW+LOL6f0
 epnTS4MGHgbk27EJIjgrCyDeHzrfcdVaBHemRDu8B5965/fbQhhgSpzmS5PIcOxuEGnx
 xTBMgh3c9ZkVFExgFYo/MuuFlNO+g2gkG3d2FbFQNb3A3QokmWVf91Z8tFFxoROcGxwV
 mi0g==
X-Gm-Message-State: AOUpUlF8fxY53tLGBPYt6+Jo8Gf6sgW7/T6AVtUKaRN9HCGJK8d2aVyr
 ERhvNjxHWXpD6RUBcQJt5mUQjFWAvyWJn7YpgSs=
X-Google-Smtp-Source: AAOMgpdYkm6Ks7L9cNUwwCAcStJ7/2icdkmJbmxNYOjWOM8ADCBiWzZI68JeUQZN8P4Ksu5icNK7a5RiQxNWFv5fnrY=
X-Received: by 2002:a19:1888:: with SMTP id 8-v6mr4534918lfy.121.1531940232560; 
 Wed, 18 Jul 2018 11:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMNAJg33kMTbK-H=Aq--rxT=-K+7P1efGqR5XqV8ANy9spbwDw@mail.gmail.com>
 <A5B126A5-9C2D-41F0-9E01-D5E01AC96080@fuzziesquirrel.com>
In-Reply-To: <A5B126A5-9C2D-41F0-9E01-D5E01AC96080@fuzziesquirrel.com>
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Wed, 18 Jul 2018 11:57:01 -0700
Message-ID: <CAMNAJg0NsB1XY6toDSMA-ramUOx-HozQ+ZVKjsvB2Ox7mfDDmg@mail.gmail.com>
Subject: Re: Help patching rest_dbus.py
To: bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000061045405714aa168"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 18:57:19 -0000

--00000000000061045405714aa168
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

Thanks for getting back.

We were trying to prototype the use of the bottle web application to
POST/PUT a text/diff file to BMC, apart from the image. This is similar to
the octet-stream http request used for the image upload.

Regarding upstreaming, not sure what would be the interest for this to the
others.

Thanks,
Guhan

On Wed, Jul 18, 2018 at 6:22 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Jul 17, 2018, at 2:10 PM, guhan balasubramanian <guhan.sac@gmail.com=
>
> wrote:
> >
> > Hi,
> >
> > We are trying to make some custom changes to the phosphor web
> application.
>
> Can you describe what the custom changes are?  Maybe upstreaming your
> changes
> is possible and you don=E2=80=99t need a bbappend at all.
>
> > Since the web application is present in meta-phosphor, we were trying t=
o
> patch the web application from our own meta layer.
> >
> > From the tmp/work/ directory, I was able to create a git patch for the
> rest_dbus.py file in phosphor-gevent and phosphor-rest.
> >
> > But since the source is not included directly, I get a quilt error
> saying that there is no file to patch.
> >
> > The web (bottle) application I see, is included through the following
> variable:
> > SYSTEMD_ENVIRONMENT_FILE_${PN} +=3D "obmc/wsgi_app"
> >
> > Can someone please help with what I am missing or the best way to go
> about this?
> >
> > -----
> > bash-4.2$ tree phosphor-rest/
> > phosphor-rest/
> > =E2=94=9C=E2=94=80=E2=94=80 phosphor-rest
> > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 0001-rest-dbus-test.patch
> > =E2=94=94=E2=94=80=E2=94=80 phosphor-rest.bbappend
> >
> > 1 directory, 2 files
> > bash-4.2$ cat phosphor-rest/phosphor-rest.bbappend
> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/phosphor-rest:"
> > SRC_URI +=3D " \
> >      file://0001-rest-dbus-test.patch \
> > "
> > bash-4.2$
> > -------
> >
> >
> > Thanks,
> > Guhan
>

--00000000000061045405714aa168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad,<div><br></div><div>Thanks for getting back.</div>=
<div><br></div><div>We were trying to prototype the use of the bottle web a=
pplication to POST/PUT a text/diff file to BMC, apart from the image. This =
is similar to the octet-stream http request used for the image upload.=C2=
=A0</div><div><br></div><div>Regarding upstreaming, not sure what would be =
the interest for this to the others.=C2=A0</div><div><br></div><div>Thanks,=
</div><div>Guhan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Wed, Jul 18, 2018 at 6:22 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb=
@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; On Jul 17, 2018, at 2:10 PM, guhan balasubramanian &lt;<a href=3D"mail=
to:guhan.sac@gmail.com" target=3D"_blank">guhan.sac@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; We are trying to make some custom changes to the phosphor web applicat=
ion.<br>
<br>
Can you describe what the custom changes are?=C2=A0 Maybe upstreaming your =
changes<br>
is possible and you don=E2=80=99t need a bbappend at all.<br>
<br>
&gt; Since the web application is present in meta-phosphor, we were trying =
to patch the web application from our own meta layer. <br>
&gt; <br>
&gt; From the tmp/work/ directory, I was able to create a git patch for the=
 rest_dbus.py file in phosphor-gevent and phosphor-rest. <br>
&gt; <br>
&gt; But since the source is not included directly, I get a quilt error say=
ing that there is no file to patch. <br>
&gt; <br>
&gt; The web (bottle) application I see, is included through the following =
variable: <br>
&gt; SYSTEMD_ENVIRONMENT_FILE_${PN} +=3D &quot;obmc/wsgi_app&quot;<br>
&gt; <br>
&gt; Can someone please help with what I am missing or the best way to go a=
bout this? <br>
&gt; <br>
&gt; -----<br>
&gt; bash-4.2$ tree phosphor-rest/<br>
&gt; phosphor-rest/<br>
&gt; =E2=94=9C=E2=94=80=E2=94=80 phosphor-rest<br>
&gt; =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 0001-rest-dbus-test.=
patch<br>
&gt; =E2=94=94=E2=94=80=E2=94=80 phosphor-rest.bbappend<br>
&gt; <br>
&gt; 1 directory, 2 files<br>
&gt; bash-4.2$ cat phosphor-rest/phosphor-rest.bbappend <br>
&gt; FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/phosphor-rest:&quot;<br>
&gt; SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-rest-dbus-test.patch \<br>
&gt; &quot;<br>
&gt; bash-4.2$ <br>
&gt; -------<br>
&gt; <br>
&gt; <br>
&gt; Thanks,<br>
&gt; Guhan<br>
</blockquote></div>

--00000000000061045405714aa168--
