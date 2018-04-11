Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VK2WkjUA"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Lyfc6nL3zF1SR
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 08:01:12 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id 71-v6so4567792ith.2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tGyWyszk+usaqEo2AADBjjSZ/hG2n9oqjuzOqmMnQjQ=;
 b=VK2WkjUAyLdOYPRgkiqi8exzZfcc0wpON4cBBhEUdU38zi8hqcVHZiJf+EQ5J0KoKd
 AWjkORLIyYC8yUBse61lAJ+1eYQRj0v0PZHWU2aJ5Z1jU028nlPdzdybTd0y5aWaDxiM
 Pwrk3YuJ5hyeAC4Bl28WOAdmPOcTRtEU65idk3cmlMjTm2uuLLZqpvz2Emy02oeE35iv
 DEF/HfyJsYKdki0Z8acBMthwS4p02Kvv7ZOcGEqs2UoZMqK/MsWHltE44iMWfD/OAOFw
 cGN5jZiGf4U7NooxKMtxZg47Fy8c5tBxGyrnkKLSMvMZJqtrrVbn7CzP/6pAoyIooHSk
 vTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tGyWyszk+usaqEo2AADBjjSZ/hG2n9oqjuzOqmMnQjQ=;
 b=QEVyl2eM9NJ0KKd4YSvBE/FB5RJTw78kBZQi9iOGuBVms3xpONre4h7ZCAgevHHaOI
 2TBCuT2MlNJelkXu/2e3RYf2egZnlpc3lH3ZVoHZQBQa57HtIYrEBOI+RW9tFblHJLFo
 WQhhmQTayNz1bAdcvC3xhDARlt2SHvki/vbXOOjhtUnDRCIPoc72knhrpsR/8KJRbMkA
 QeMzzCmcR/eg86V/j8OIWio/dsrPnA40H2b4zr0KNspOVYVuZldiJcnnlkewrLczTBAD
 48L0ZalarP68RNXUC0k07hv5z50eDuNKQuL8tqq1WyCtrjxxaK7XZDAUO/dfswl4ffDr
 skRg==
X-Gm-Message-State: ALQs6tB4SJCFuJfdJ3W/muILsrhgjZX5191tXAUVRH5jIqKmtmsjHG4N
 0uEmsERf7EAb4EVH8CqSqnKDfKObNyC9jTmck4s=
X-Google-Smtp-Source: AIpwx49jkK9FJIfPHTUpsugKOISyQwHYA1gX24bh66JaNgX1oJQnfzEybTmk+oqkScHS65wM4sAJSYPSJCCNOiqvPww=
X-Received: by 2002:a24:e14e:: with SMTP id
 n75-v6mr5975717ith.58.1523484070324; 
 Wed, 11 Apr 2018 15:01:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.182.25 with HTTP; Wed, 11 Apr 2018 15:01:09 -0700 (PDT)
In-Reply-To: <CAK8P3a30uzYXUVBV72+OiAUxdVRD+=VdLg_nH4c1TSxGzfvNCw@mail.gmail.com>
References: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
 <CAK8P3a30uzYXUVBV72+OiAUxdVRD+=VdLg_nH4c1TSxGzfvNCw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 12 Apr 2018 01:01:09 +0300
Message-ID: <CAP6Zq1g5FGvOGqp9J8VW4KW-P6qw+BAedq2_6tRbNwMiMWk0Ng@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] arm: npcm: enable L2 cache in NPCM7xx architecture
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm-soc <arm@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d55135056999c635"
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
X-List-Received-Date: Wed, 11 Apr 2018 22:01:13 -0000

--000000000000d55135056999c635
Content-Type: text/plain; charset="UTF-8"

On 10 April 2018 at 17:41, Arnd Bergmann <arnd@arndb.de> wrote:

> On Sun, Apr 8, 2018 at 4:03 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> > This patch Enable ARM L2 cache module in Nuvoton NPCM7xx BMC
> > by adding L2 cache parameters into NPCM7xx DT machine start structure.
> >
> > At patch V7 arm: npcm: add basic support for Nuvoton BMCs we got comments
> > regarding the flags use in L2 cache module.
> > - https://www.spinics.net/lists/arm-kernel/msg613212.html
> >
> > After checking again the L2 cache use in the NPCM7xx,
> > the only L2 cache flag we need to set is L2C_AUX_CTRL_SHARED_OVERRIDE
> > and it is done in the device tree:
> > https://patchwork.kernel.org/patch/10063497/
> >
> > L2 cache flag mask allowed all the flag option.
>
> I've applied the patch to my fixes branch now, but took your description
> above
> instead of the two-line text that you had in the patch itself. I liked
> the longer
> text much better.
>
>       Arnd
>

O.K.

Thanks a lot!

--000000000000d55135056999c635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 10 April 2018 at 17:41, Arnd Bergmann <span dir=3D"ltr">&lt;<a href=
=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sun, Apr 8, 2018=
 at 4:03 PM, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com">tmaimo=
n77@gmail.com</a>&gt; wrote:<br>
&gt; This patch Enable ARM L2 cache module in Nuvoton NPCM7xx BMC<br>
&gt; by adding L2 cache parameters into NPCM7xx DT machine start structure.=
<br>
&gt;<br>
&gt; At patch V7 arm: npcm: add basic support for Nuvoton BMCs we got comme=
nts<br>
&gt; regarding the flags use in L2 cache module.<br>
&gt; - <a href=3D"https://www.spinics.net/lists/arm-kernel/msg613212.html" =
rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/<wbr>arm=
-kernel/msg613212.html</a><br>
&gt;<br>
&gt; After checking again the L2 cache use in the NPCM7xx,<br>
&gt; the only L2 cache flag we need to set is L2C_AUX_CTRL_SHARED_OVERRIDE<=
br>
&gt; and it is done in the device tree:<br>
&gt; <a href=3D"https://patchwork.kernel.org/patch/10063497/" rel=3D"norefe=
rrer" target=3D"_blank">https://patchwork.kernel.org/<wbr>patch/10063497/</=
a><br>
&gt;<br>
&gt; L2 cache flag mask allowed all the flag option.<br>
<br>
</span>I&#39;ve applied the patch to my fixes branch now, but took your des=
cription above<br>
instead of the two-line text that you had in the patch itself. I liked<br>
the longer<br>
text much better.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 Arnd<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">O.K.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks=
 a lot!</div></div>

--000000000000d55135056999c635--
