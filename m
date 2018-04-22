Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="peo4SFLr"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40TcXQ2p8CzF217
 for <openbmc@lists.ozlabs.org>; Mon, 23 Apr 2018 03:48:53 +1000 (AEST)
Received: by mail-qk0-x22b.google.com with SMTP id v2so13852644qkh.10
 for <openbmc@lists.ozlabs.org>; Sun, 22 Apr 2018 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhWq4MAH5paxdlzt9B4iIjZSMl5bEyr/d3FDlDhXylg=;
 b=peo4SFLrmy1Z6GHEWTX82K7+LO5+zVPgS0j7OwHS/t8ZsdTjZXTfp2lZYSqyn1jTMG
 ZO1EKn0uU5ot8nbyFvOzZPeHYDe9jGdSjZle2ZY7pYjedNjL+dUcIY0HEvjbleHCvI9I
 CTAcxHhuVB2ZOyoZlm5BID0PH9CcczLD+WBbsf67boFSkE0iDmFoSFKfeSPsFtq5LlbM
 Wn8EWqSZnjAjWzUl9YfmFuyzyJ71+HvLk3YiknDLEL2duVT/uSq63/2bXM6H69wfxWAd
 ap0vll0OvqrH14UR33sw8NYmy3ACHLRSqisMLUriCAZUdFbWIyBju97PJjyTaU7yClDk
 /EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhWq4MAH5paxdlzt9B4iIjZSMl5bEyr/d3FDlDhXylg=;
 b=gheGtrKla78D6EGRlLcTTVUywhz9gelDJgznJePpJHKqmXUqDyix4qB6fydGUsDCT8
 Zmpdylt2G/zmF2Gm3OdbIEOpBzXGQtC3nynoADPV02EoXmlB22Kf3IBZ0izKMo2crQPd
 2Dkrm0bHSJ7ISIGCanpb9SU/z04fr23E3JuyqIV6GXRaUar+bkp3/SX6iOpjqkyf7erC
 KkSmBg284aWZNUjZNVyOBo/fBIblc4Iikc3y49YvFb7BfgUOxwKTgAZUs4LvhfKGiQWd
 dKljtYMcH/FSs7vRsMHvWjZDR0ApOkCXs2bU1lyktzMBWdI796tkenUs/TKBrMUNR4+a
 JyBQ==
X-Gm-Message-State: ALQs6tDX2kBAyxXfMfpR7G/MmKwN6cxwVlnFNObuEATOwg5xkPRK3dDq
 m80G4xudDMVOfjg95gq1k4p1itH6qWMc03AX+j3g9Q==
X-Google-Smtp-Source: AB8JxZppur66nDZEBze87vJttI0zQa4TrYRC4jfomZqsIQiVPhwCMEaulGnOj0B0WaUqO7m+4DLoQR/lA5TW/g9P16o=
X-Received: by 10.55.87.3 with SMTP id l3mr18851907qkb.110.1524419330785; Sun,
 22 Apr 2018 10:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6Zq1jiKZVZPXQ8X_jJxKUse7CkR_Y7NxM3zMSWShhK3xcYcw@mail.gmail.com>
In-Reply-To: <CAP6Zq1jiKZVZPXQ8X_jJxKUse7CkR_Y7NxM3zMSWShhK3xcYcw@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Sun, 22 Apr 2018 17:48:39 +0000
Message-ID: <CAJoAoZm7HfUOBA3S1a3Gao0tgDvi=gVXrhDpqMtGE8onu1A-ZQ@mail.gmail.com>
Subject: Re: Does Gerrit identification has changed?
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114e319cb3e9b6056a738830"
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
X-List-Received-Date: Sun, 22 Apr 2018 17:48:55 -0000

--001a114e319cb3e9b6056a738830
Content-Type: text/plain; charset="UTF-8"

Hi Tomer,

This is a result of AndrewG's recent migration of our Gerrit server to new
hosting.  Check out this thread:
https://lists.ozlabs.org/pipermail/openbmc/2018-April/011476.html  In the
replies, the new fingerprint you should be seeing is also listed.  You will
likely have to delete and re-add the entry from your SSH config.

Emily

On Sun, Apr 22, 2018 at 4:49 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Hello,
>
> I get the following message when I try to communicate with Gerrit:
>
> *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
> *@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @*
> *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
> *IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!*
> *Someone could be eavesdropping on you right now (man-in-the-middle
> attack)!*
> *It is also possible that the RSA host key has just been changed.*
> *The fingerprint for the RSA key sent by the remote host is*
> *1b:85:48:a8:46:19:b5:06:fc:6f:92:a2:81:e6:a7:4b.*
> *Please contact your system administrator.*
>
> *RSA host key for [gerrit.openbmc-project.xyz
> <http://gerrit.openbmc-project.xyz>]:29418 has changed and you have
> requested strict checking.*
> *Host key verification failed.*
> *fatal: Could not read from remote repository.*
>
> *Please make sure you have the correct access rights*
> *and the repository exists.*
>
> Does Gerrit identification has changed?
>
> Thanks,
>
> Tomer
>

--001a114e319cb3e9b6056a738830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomer,<div><br></div><div>This is a result of AndrewG&#=
39;s recent migration of our Gerrit server to new hosting.=C2=A0 Check out =
this thread:=C2=A0<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/201=
8-April/011476.html">https://lists.ozlabs.org/pipermail/openbmc/2018-April/=
011476.html</a>=C2=A0 In the replies, the new fingerprint you should be see=
ing is also listed.=C2=A0 You will likely have to delete and re-add the ent=
ry from your SSH config.</div><div><br></div><div>Emily</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Apr 22, 2018 at 4:49 AM Tom=
er Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com">tmaimon77@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello=
,<div><br></div><div>I get the following message when I try to communicate =
with=C2=A0Gerrit:</div><div><br></div><div><div><b>@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></div><div><b>@=C2=A0 =C2=A0 WARNING=
: REMOTE HOST IDENTIFICATION HAS CHANGED!=C2=A0 =C2=A0 =C2=A0@</b></div><di=
v><b>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></div><=
div><b>IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!</b></div><div>=
<b>Someone could be eavesdropping on you right now (man-in-the-middle attac=
k)!</b></div><div><b>It is also possible that the RSA host key has just bee=
n changed.</b></div><div><b>The fingerprint for the RSA key sent by the rem=
ote host is</b></div><div><b>1b:85:48:a8:46:19:b5:06:fc:6f:92:a2:81:e6:a7:4=
b.</b></div><div><b>Please contact your system administrator.</b></div><div=
><b>RSA host key for [<a href=3D"http://gerrit.openbmc-project.xyz" target=
=3D"_blank">gerrit.openbmc-project.xyz</a>]:29418 has changed and you have =
requested strict checking.<br></b></div><div><b>Host key verification faile=
d.</b></div><div><b>fatal: Could not read from remote repository.</b></div>=
<div><b><br></b></div><div><b>Please make sure you have the correct access =
rights</b></div><div><b>and the repository exists.</b></div></div><div><br>=
</div><div>Does Gerrit identification has changed?=C2=A0<br></div><div><br>=
</div><div>Thanks,</div><div><br></div><div>Tomer</div></div>
</blockquote></div>

--001a114e319cb3e9b6056a738830--
