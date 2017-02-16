Return-Path: <nolan.hergert@gmail.com>
Received: from mail-ot0-x230.google.com (mail-ot0-x230.google.com
 [IPv6:2607:f8b0:4003:c0f::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPQWh2yyWzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 06:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H65sFe0w"; 
 dkim-atps=neutral
Received: by mail-ot0-x230.google.com with SMTP id 32so17502643oth.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RhT1kHjB0bUOK082/FyW4GlxuFLQdKq/YYbG+zug4CI=;
 b=H65sFe0wW26AeJjIakg2fGJOa+pEQhPkE3muASzzdUOMRgrP59Yf61wVtZJ90ZWyrm
 FpqP6+990ESIHtWZsg4QTJ9LjCVG8muQar0Q7zIKOf20aRV6iGOu+M7sNrNLsjK8iIMk
 CQHT9OKStaDrBHilz7Xne+WjmivY/SH0qWF3+i08bQvRHVUKKcN5g75uP0QuLsK3DO1C
 dJeSv/LawxOYQARppqVgqoYPnc8OlOSyGA2rAA52XGXpdaUOABW6Bp4QGEkSpe8vc7eP
 nFb7osdcGKSx/AcMsRN4BiWUOxYIh+ZBvPnWb5E0flsrXVSbC6y9pE/ZNl9MyY6byIcb
 2Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RhT1kHjB0bUOK082/FyW4GlxuFLQdKq/YYbG+zug4CI=;
 b=kQHir4AHP85TRMioEPMqYv9oL9A2vEdsBaUSseD8N16m/PMeSsucl5Zkw7M/OvbbG0
 PTXAKElO1e2JFeR140y3Q07APk7Tzq1uDC48k3RiJGpOja7FHg82q8gi4MPg00bvtmq2
 v8VbSLW5HeIHP++w9d4MWbtDAIi2HdG8QFH4EjNccMvaeVZLUHikw9YigDBHI4j1ZjOS
 cKahmtCNe/SrzmBPSkAkTY2IPj0BW76RBenVqaAOemdwYdMQAcWbbGD0/Zt8+ziZXqMA
 ux/BF7o1f9+ks1wMmo79auLSh863tcIxIaPUwTrwuX6A1Lym0Wq4/IWSJOKn6Hp+Mb5N
 AO4g==
X-Gm-Message-State: AMke39lzTxrAT63yeGUKhu+p/Fb5KJHws2+wpS1ArSuMLn2HJvLHCepWk5Sj3UWIQJPWCcW3c975+beHnp4D6g==
X-Received: by 10.157.7.133 with SMTP id 5mr2293095oto.264.1487271742007; Thu,
 16 Feb 2017 11:02:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.45.169 with HTTP; Thu, 16 Feb 2017 11:01:51 -0800 (PST)
From: Nolan Hergert <nolan.hergert@gmail.com>
Date: Thu, 16 Feb 2017 11:01:51 -0800
Message-ID: <CALQ6q7Zf=OHFaZFxDVR0W6y0GxmnXddK0px2M69muY10guQMvA@mail.gmail.com>
Subject: AST2500 Watchdog Timer Device Tree Entry
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=94eb2c0470baddef820548aa6fb2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2017 19:02:25 -0000

--94eb2c0470baddef820548aa6fb2
Content-Type: text/plain; charset=UTF-8

To Joel in particular,

Thanks for making a WDT driver for the Aspeed chips already! It makes
diving into these things a lot easier.

I didn't understand some of the things in the aspeed-g5.dtsi file though:

wdt1: wdt@1e785000 {
compatible = "aspeed,ast2500-wdt";
reg = <0x1e785000 0x1c>;
};

wdt2: wdt@1e785020 {
compatible = "aspeed,ast2500-wdt";
reg = <0x1e785020 0x1c>;
status = "disabled";
};

wdt3: wdt@1e785040 {
compatible = "aspeed,wdt";
reg = <0x1e785074 0x1c>;
status = "disabled";
};


  * Register lengths are 0x1C instead of 0x20. The skipped register in the
datasheet for AST2500 is determining which hw modules to reset, which
sounds like something we'd want to configure.
  * wdt3 compatible string is different.
  * wdt3 register offset appears wrong.

Looking to get some feedback. Thanks!

Nolan

--94eb2c0470baddef820548aa6fb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To Joel in particular,<div><br></div><div>Thanks for makin=
g a WDT driver for the Aspeed chips already! It makes diving into these thi=
ngs a lot easier.=C2=A0</div><div><br></div><div>I didn&#39;t understand so=
me of the things in the aspeed-g5.dtsi file though:</div><div><br></div><di=
v><div>wdt1: wdt@1e785000 {</div><div><span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>compatible =3D &quot;aspeed,ast2500-wdt&q=
uot;;</div><div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:p=
re">	</span>reg =3D &lt;0x1e785000 0x1c&gt;;</div><div>};</div><div><br></d=
iv><div>wdt2: wdt@1e785020 {</div><div><span class=3D"gmail-Apple-tab-span"=
 style=3D"white-space:pre">	</span>compatible =3D &quot;aspeed,ast2500-wdt&=
quot;;</div><div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:=
pre">	</span>reg =3D &lt;0x1e785020 0x1c&gt;;</div><div><span class=3D"gmai=
l-Apple-tab-span" style=3D"white-space:pre">	</span>status =3D &quot;disabl=
ed&quot;;</div><div>};</div><div><br></div><div>wdt3: wdt@1e785040 {</div><=
div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>=
compatible =3D &quot;aspeed,wdt&quot;;</div><div><span class=3D"gmail-Apple=
-tab-span" style=3D"white-space:pre">	</span>reg =3D &lt;0x1e785074 0x1c&gt=
;;</div><div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre"=
>	</span>status =3D &quot;disabled&quot;;</div><div>};</div></div><div><br>=
</div><div><br></div><div><div>=C2=A0 * Register lengths are 0x1C instead o=
f 0x20. The skipped register in the datasheet for AST2500 is determining wh=
ich hw modules to reset, which sounds like something we&#39;d want to confi=
gure.</div><div>=C2=A0 * wdt3 compatible string is different.=C2=A0</div><d=
iv>=C2=A0 * wdt3 register offset appears wrong.</div></div><div><br></div><=
div>Looking to get some feedback. Thanks!</div><div><br></div><div>Nolan</d=
iv><div><br></div></div>

--94eb2c0470baddef820548aa6fb2--
