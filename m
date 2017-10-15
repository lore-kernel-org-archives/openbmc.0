Return-Path: <keno@juliacomputing.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=juliacomputing.com
 (client-ip=2607:f8b0:400e:c05::232; helo=mail-pg0-x232.google.com;
 envelope-from=keno@juliacomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=juliacomputing-com.20150623.gappssmtp.com
 header.i=@juliacomputing-com.20150623.gappssmtp.com header.b="YhjdSnsK"; 
 dkim-atps=neutral
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFbqL18c2zDrFB
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 09:34:37 +1100 (AEDT)
Received: by mail-pg0-x232.google.com with SMTP id m18so5300947pgd.13
 for <openbmc@lists.ozlabs.org>; Sun, 15 Oct 2017 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=juliacomputing-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=2VPokuSiUh1p6EjQyN3WaDLTp3fiCJvzJtre532P/OU=;
 b=YhjdSnsKJd2RCH51tfYpCz4ac2MOxA0kZWuXEbIvi0Oz48KSWYnHlpc5sKs8LEFAzi
 2d6fex9WCoHvOtZKbjOT9LB2c2XmcH+FKnzzvdgPZ29Bj81yXiuzI1sbV5s3vcfNoIxz
 EGPllQSSCReVh117xKd+SoLOMN3bVvZFtdHKiE0DpRA3vwz8t+OrCd2Uf7UesFt7QKbi
 Hw3PX0W6J2Q6gP3qheDfunIOUNQdJRikB7tEYhD4tXg/uc8aN5Vwy+Maw2MIBd5yF3gV
 qJVasrV45mwg1/4CFxsR1BNnCx+m6gR/1GFYDS0SPkjFCykJKi5by5CHBZ1vWF5eUWn3
 PbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2VPokuSiUh1p6EjQyN3WaDLTp3fiCJvzJtre532P/OU=;
 b=qkEfyjind6owxp2xPPS2nuyrWd9qYG5oavQ+gtlikq7l5VGomMiBKGwcnNWer1Ia8A
 NkJakQ17Y4usFq6jgpx1fySKDD7D1d6lSCtXLVZu/zy3D8YgAbpmRdj6wrqfEQce1oNX
 YUF/MiGRPayC8nlIZmbV2/KJgLdYg2kcBcYw5+xHZ0Xps+pvgXVAsLooJ96yhucpLdsZ
 NgejSFylYvFSUEEzOmYRVjZtTpCHZ0OOvS46hufa8CXLm6+FE0Ie7nf6AXgdxnuZv41G
 8FhgCiz2syYyvkhE+VgUfW2bRBrKW5n0z6usDcDM/hdm4ek/B1jX+jZAWJFkQBpDRV8u
 prVA==
X-Gm-Message-State: AMCzsaV796T6iIQlExNX9tJiC+uHsm+g8OdGnsCgdpbhfD5Vi21yzMv3
 XO5LzLdhPz0bi8x0sKP8cg0CW9BikuykAYrdkPuLvZ03Dyo=
X-Google-Smtp-Source: AOwi7QCFa2MhSUwdMIe9sa/14xw0wQ4CiWKSa0uK2BzJZTYxNldKFslSLVbIudPpOnSRmqbmozHNymQSe9EMRqyOnOA=
X-Received: by 10.84.224.1 with SMTP id r1mr6988059plj.65.1508106874567; Sun,
 15 Oct 2017 15:34:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.145.80 with HTTP; Sun, 15 Oct 2017 15:33:53 -0700 (PDT)
From: Keno Fischer <keno@juliacomputing.com>
Date: Sun, 15 Oct 2017 18:33:53 -0400
Message-ID: <CABV8kRx3PVrqLGZ9=V9znSGvwo+rjv9WS8J1dxMTCvBZrvsm0w@mail.gmail.com>
Subject: OpenBMC on Supermicro X11SSH-F
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="f403043724c88ad5da055b9d7eac"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2017 22:34:39 -0000

--f403043724c88ad5da055b9d7eac
Content-Type: text/plain; charset="UTF-8"

Hi folks,

as I mentioned on IRC I've been working on porting OpenBMC to the Supermicro
X11SSH-F board's BMC (an AST2400). It's not complete (lacking most sensors,
but
does have leds and host power control), but there's enough there that I'd
like to
kick of the discussion on how to incorporate this.

I should note that I have no affiliation with Supermicro and no access to
the datasheet
or schematic. What I know about the board was derived by poking the board
with
an oscilloscope.

The patch sets are here (just so people can take a look, some of them need
a bit
of cleanup before I submit them for review):
linux: https://github.com/Keno/openbmc-linux
qemu: https://github.com/Keno/openbmc-qemu
openbmc: https://github.com/Keno/openbmc

With that a couple of questions:
1. Are you interested in having support for this board in tree?
2. If so, am i correct that patches
   a. to the openbmc linux tree should be emailed here
   b. to openbmc itself should be submitted via gerrit?
   c. to qemu should be emailed upstream with the appropriate cc?

I'd like to thank all the people on IRC who've helped me get this up and
running.
I also very much appreciate all the work you've been doing in developing
this in
the open and upstreaming your work. I'm hoping my work on this port can help
amplify the impact this work by making openbmc more widely available.

Keno

--f403043724c88ad5da055b9d7eac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi folks,<div><br></div><div>as I mentioned on IRC I&#39;v=
e been working on porting OpenBMC to the Supermicro</div><div>X11SSH-F boar=
d&#39;s BMC (an AST2400). It&#39;s not complete (lacking most sensors, but<=
/div><div>does have leds and host power control), but there&#39;s enough th=
ere that I&#39;d like to</div><div>kick of the discussion on how to incorpo=
rate this.</div><div><br></div><div>I should note that I have no affiliatio=
n with Supermicro and no access to the datasheet</div><div>or schematic. Wh=
at I know about the board was derived by poking the board with</div><div>an=
 oscilloscope.</div><div><br></div><div>The patch sets are here (just so pe=
ople can take a look, some of them need a bit</div><div>of cleanup before I=
 submit them for review):</div><div>linux:=C2=A0<a href=3D"https://github.c=
om/Keno/openbmc-linux">https://github.com/Keno/openbmc-linux</a></div><div>=
qemu: <a href=3D"https://github.com/Keno/openbmc-qemu">https://github.com/K=
eno/openbmc-qemu</a></div><div>openbmc: <a href=3D"https://github.com/Keno/=
openbmc">https://github.com/Keno/openbmc</a></div><div><br></div><div>With =
that a couple of questions:</div><div>1. Are you interested in having suppo=
rt for this board in tree?</div><div>2. If so, am i correct that patches</d=
iv><div>=C2=A0 =C2=A0a. to the openbmc linux tree should be emailed here</d=
iv><div>=C2=A0 =C2=A0b. to openbmc itself should be submitted via gerrit?</=
div><div>=C2=A0 =C2=A0c. to qemu should be emailed upstream with the approp=
riate cc?</div><div><br></div><div>I&#39;d like to thank all the people on =
IRC who&#39;ve helped me get this up and running.</div><div>I also very muc=
h appreciate all the work you&#39;ve been doing in developing this in</div>=
<div>the open and upstreaming your work. I&#39;m hoping my work on this por=
t can help</div><div>amplify the impact this work by making openbmc more wi=
dely available.</div><div><br></div><div>Keno</div></div>

--f403043724c88ad5da055b9d7eac--
