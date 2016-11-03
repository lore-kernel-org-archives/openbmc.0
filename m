Return-Path: <maxims@google.com>
Received: from mail-yb0-x22a.google.com (mail-yb0-x22a.google.com
 [IPv6:2607:f8b0:4002:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8xmY2Hj5zDvPD
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 07:45:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=QJasF0wa; 
 dkim-atps=neutral
Received: by mail-yb0-x22a.google.com with SMTP id v78so24232737ybe.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Hd8CJ2R99ej9KOSUgCTGkPEnllJs9H1U4ink6VbaqfQ=;
 b=QJasF0wami5DalkcBmdlgUaOAkWcxzk6us5M7T/2uKgDLvkiqgTosK0Jrv2OzYnF3w
 iwnzypf8xD4vWfYAiiU9XGNNsvKUgu+ye1Blxr65eokoe2O9exuKrK/eqWWwk5H0XktN
 /XIVy/Wq9gvW2Crq8dCgmqjJKoa7ibQuLCJR4rPdZj07EX7zVBht+TG0jGlh1EjeKxKM
 X8XySAZzwrvI1nAY7vfW8S4Xy2sRwqQzUx78p4mgp+7zUeVYdnMRISvE5DjSuPUgShOs
 lsw/Gdv2ZIWWO2UQ1ya0xhkoReW4+DkP1kWjQbsTxfHIjc7X3xMYo1I5SKFwBFrv+s33
 AYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Hd8CJ2R99ej9KOSUgCTGkPEnllJs9H1U4ink6VbaqfQ=;
 b=hGo5WZ8A5+VuzOm7WgN+qfkyQ2kS8NSSoTvArWb8AIqovL7byqNeF3m0cuM63Et9S5
 pkfe0Q0J9BQjvK76YH+OzESbTJXkBbtSjMUVcAb264e/dNNGaIXtidr4sm+NcOzTO8hM
 iuV33TOcKaQBt6GiJongRMHfXAwm8L9lUDyy1sFb5S0fnwHzbTk79mARZISAmztHFdoa
 00rn8abrkPYfjqWTeuVwYuffRfzS+hPH+FeVNZxH2vUlw34bX5ED7+i/ff3m1opXNo8w
 mSFMEQdNZRAXFiz3Q45uZQO4YxXLDC+3EKrHOQMt92ac61/qmhM7sl1NnrXWalgQSxMe
 4Low==
X-Gm-Message-State: ABUngvex1KnKdhOUBbrjF7C6YbFV8+vC4XIk5FlC/TzB+WrajKd0I/xa/nnk3GZna0mdSQ6eji5a7oIn/DrDqJym
X-Received: by 10.37.171.136 with SMTP id v8mr3015398ybi.158.1478205898665;
 Thu, 03 Nov 2016 13:44:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Thu, 3 Nov 2016 13:44:58 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 3 Nov 2016 13:44:58 -0700
Message-ID: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
Subject: U-Boot upstreaming
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1889a27f39c705406ba1f8
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
X-List-Received-Date: Thu, 03 Nov 2016 20:45:02 -0000

--94eb2c1889a27f39c705406ba1f8
Content-Type: text/plain; charset=UTF-8

Hi Cedric,

My manager (Rick Alther) mentioned that you were working on some minimal
"upstreamable" commit for Aspeed in U-Boot. How far were you able to get?

This is also what I was thinking of doing, so we should be able to join
forces on this.

I talked to Simon Glass recently (he's an active contributor to mainline
U-Boot) and basically that's the path that he also recommended -- just
getting minimal amount of code in, that can just boot to a prompt. He also
said that DRAM driver would have to be part of it.

So, the way I see it, there are two big chunks of work here:
 1. Setting up the whole structure. This would include actually adding a
board, minimum amount of supporting code, debug serial console init,
 2. DDR3/DDR4 driver. This is the biggest part of what we have in
platform.S now. A lot of work, but relatively straightforward, just rewrite
~1.5k lines of assembly in C.

Personally, I don't have preference on who does what, as long as we don't
step on each other's toes. It would probably be easier for me to take (1),
because I can easily talk to two people who are in our time zone and have a
lot of mainline U-Boot experience.

Thoughts?

-- 
*M*axim *S*loyko

--94eb2c1889a27f39c705406ba1f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cedric,<div><br></div><div>My manager (Rick Alther) men=
tioned that you were working on some minimal &quot;upstreamable&quot; commi=
t for Aspeed in U-Boot. How far were you able to get?</div><div><br></div><=
div>This is also what I was thinking of doing, so we should be able to join=
 forces on this.</div><div><br></div><div>I talked to Simon Glass recently =
(he&#39;s an active contributor to mainline U-Boot) and basically that&#39;=
s the path that he also recommended -- just getting minimal amount of code =
in, that can just boot to a prompt. He also said that DRAM driver would hav=
e to be part of it.</div><div><br></div><div>So, the way I see it, there ar=
e two big chunks of work here:</div><div>=C2=A01. Setting up the whole stru=
cture. This would include actually adding a board, minimum amount of suppor=
ting code, debug serial console init,=C2=A0</div><div>=C2=A02. DDR3/DDR4 dr=
iver. This is the biggest part of what we have in platform.S now. A lot of =
work, but relatively straightforward, just rewrite ~1.5k lines of assembly =
in C.</div><div><br></div><div>Personally, I don&#39;t have preference on w=
ho does what, as long as we don&#39;t step on each other&#39;s toes. It wou=
ld probably be easier for me to take (1), because I can easily talk to two =
people who are in our time zone and have a lot of mainline U-Boot experienc=
e.</div><div><br></div><div>Thoughts?<br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b=
>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--94eb2c1889a27f39c705406ba1f8--
