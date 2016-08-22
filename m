Return-Path: <raltherr@google.com>
Received: from mail-yb0-x234.google.com (mail-yb0-x234.google.com
 [IPv6:2607:f8b0:4002:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJ25953djzDrcG
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 04:23:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=WtVcoD1P; 
 dkim-atps=neutral
Received: by mail-yb0-x234.google.com with SMTP id e31so42470198ybi.3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GVGwB3Hdxq02Zhvfbb6IEuoZ0kOHGKiIoNGMs7NsSLI=;
 b=WtVcoD1PwWZCkKsfeRWoBdAxB4sLL81qnD/oXbr4EJpgZ75gTRge3cm+5ywEOqexaD
 zQTDY4bY1VHn1rXtpMbLqBhSwF6SwxESSLGqjS+AoDfeAH9Nw41lL7OJUVVVIEfHSHzZ
 s4K206DO4E570b0XaTvEMfMif+5wLWmMJjibGo2PqjRPTjanmyR/H8smDmZtAo2q97Mh
 YNemFBV/66/vw1TpNOX1AfaZNprx9zcfLrB6WzNuF04RP/pEF6kNF8YRDv+E3du1/ezK
 2ATWDh7wuc2PfeYJBOknXnLBEmflJILmDxmkeNwQhD9HV0gtktMFYy6uST2Sfkarryjj
 JlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GVGwB3Hdxq02Zhvfbb6IEuoZ0kOHGKiIoNGMs7NsSLI=;
 b=bC6VPt0pDSCDa9cQiOxWb+BzD/Cy1xmQ42JUulDfyaPa1p7n4KwH4nzRBj1675DNJM
 q+qsAB1dJ5wDKQUAID39FGflKYPqnWSP4nnstLLPRlly7+RkBqK99YjzItvXm5MpYW6C
 Zk7nllVDwDLKmdriWo2UjNi1Ad49pXvt5tlowitZWCrOQwSw7GqaR0HICIL1Iq58PwlP
 4kLDnd+ehB7uJH5zojXx2BmvwHujHcFBhT12cUO3DUh8yikMjtGSMz8pnIGZwGccShS4
 +xeiibPNxfCnweYgW6ED4EWtAW7wJ8iqkz/H8vXNjqBV9FbIstN4LwSw2l1Ock/iIaYN
 iMSA==
X-Gm-Message-State: AEkoous6qe03zX5FegCdV3tTftIKIRXnb3UJNHuhYsNw7EkpH8qd1xA08Qk/LmTHk3NbLhlgOwLF8RP1tEI+A7xK
X-Received: by 10.37.66.72 with SMTP id p69mr7997550yba.124.1471890218446;
 Mon, 22 Aug 2016 11:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Mon, 22 Aug 2016 11:23:37 -0700 (PDT)
In-Reply-To: <DB4PR05MB094160F672C38AEB237AC40BD51C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB094160F672C38AEB237AC40BD51C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 22 Aug 2016 11:23:37 -0700
Message-ID: <CAPLgG=ku_uMtNmGhJRTummn3DOK=WDO4oGLy2TONoZfZAqwXpw@mail.gmail.com>
Subject: Re: Latest Linux dev-4.7 branch
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11c0106c9eea61053aad25d4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 18:23:42 -0000

--001a11c0106c9eea61053aad25d4
Content-Type: text/plain; charset=UTF-8

I'm guessing this got resolved via IRC so this is just in case someone else
looks on the mailing list.  dev-4.7 is a branch on
https://github.com/openbmc/linux.  You may need to select the dev-4.7
branch by clicking the "Branch" button on the left just above the list of
files.  Joel (shenki@) keeps his work in progress dev-4.7 branch at
https://github.com/shenki/linux.

On Tue, Aug 9, 2016 at 4:29 AM, Shay Slobodkin <shays@mellanox.com> wrote:

> Hi,
>
>
>
> We saw some recently added code into Linux branch dev-4.7 which we can use.
>
> Also have some of our code we want to push into it, and want to rebase on
> top of latest code.
>
>
>
> Where can we find the latest Linux dev-4.7 branch?
>
>
>
> We were looking under:
>
> https://github.com/openbmc/linux/
>
>
>
> though latest code there is branch 4.6.
>
>
>
> Thanks,
>
> Shay
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a11c0106c9eea61053aad25d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m guessing this got resolved via IRC so this is just=
 in case someone else looks on the mailing list. =C2=A0dev-4.7 is a branch =
on=C2=A0<a href=3D"https://github.com/openbmc/linux">https://github.com/ope=
nbmc/linux</a>.=C2=A0 You may need to select the dev-4.7 branch by clicking=
 the &quot;Branch&quot; button on the left just above the list of files.=C2=
=A0 Joel (shenki@) keeps his work in progress dev-4.7 branch at=C2=A0<a hre=
f=3D"https://github.com/shenki/linux">https://github.com/shenki/linux</a>.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug =
9, 2016 at 4:29 AM, Shay Slobodkin <span dir=3D"ltr">&lt;<a href=3D"mailto:=
shays@mellanox.com" target=3D"_blank">shays@mellanox.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-5279781069665316238WordSection1">
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We saw some recently added code into Linux branch de=
v-4.7 which we can use.<u></u><u></u></p>
<p class=3D"MsoNormal">Also have some of our code we want to push into it, =
and want to rebase on top of latest code.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Where can we find the latest Linux dev-4.7 branch?<u=
></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We were looking under:<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/linux/" target=
=3D"_blank">https://github.com/openbmc/<wbr>linux/</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">though latest code there is branch 4.6.<u></u><u></u=
></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Shay<u></u><u></u></p>
</div>
</div>

<br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a11c0106c9eea61053aad25d4--
