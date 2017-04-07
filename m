Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzwmW5KSdzDqHl
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 20:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FLDaXJbU"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id f204so16025091ybc.2
 for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2017 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=4wdGpply6VoCVDD9E/FTfRdj9N73X+NWI7s0xQIZAm8=;
 b=FLDaXJbUGENOXJImy2h1wN2w09OOOuAHRz66+wdVr++QGWA3Qtm9lR4RXfyXyI99ub
 djCm437dHN08Pgfo9wptBAMUkE2McSHCVBOcuYDipYUKe5Fh/dM48H5KZEo/UqkApjqm
 CDd8XElDD7S7bN5MxNT4EE6YMHpD7S+siHjXCom8MatJsDXH3AxJ99c8pWPlWHB87cqP
 aGtcxPNi/vK5Mq6WkUp/RX4o0eesxV3EaKwGa/ZtAAti9QDw9JjAKQ8nZZBWkp9lNPc7
 +Xzm86gmsUVwQPIqLZiPsh+x36O+60KU2row2UEqwDc9MgDVz625IW3x9tHQfP5vd0li
 l1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=4wdGpply6VoCVDD9E/FTfRdj9N73X+NWI7s0xQIZAm8=;
 b=ll+FlsIRpwH37XC8JO1xIlH8mnQUDQPKptn+8KV57V3VOi52LYRLNLtOdM+Lf7MUL3
 Lvw1QppYtguEedoyMcp9zrWpsiTIh4DYXuICG8Ca0XOin/JsYbOLFACfR7aMwkAxKNau
 yL4UpwzZNW1KE+CLG5Ykz+KoX9hoSSOd+ylnx9KgtPbRoKB0kRbYB74n07U7bXoP5HBb
 U8yA6GqZiy4JpmHctVDWKRBqSl6czyRrEB6LwtCDpUWWGn7A56Tcz38/OaBwp/57Xcnm
 i0EXtj0Uc5HMCNGQNEv/3JL4UK2xlguQxXL+l5xyw4rY48ZzWUmbTWFcuHYWJnLbhP8U
 DH4g==
X-Gm-Message-State: AFeK/H0cFoqClqOJvpiA0oR15+E7yHsGa8tIpELtoeaXByHUdqugjdX0FMX3pl6imMfI6DMFLLh/61tsgCBBvA==
X-Received: by 10.37.70.66 with SMTP id t63mr25626053yba.196.1491560953068;
 Fri, 07 Apr 2017 03:29:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.20.87 with HTTP; Fri, 7 Apr 2017 03:28:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Apr 2017 19:58:52 +0930
X-Google-Sender-Auth: 31tp9wJkI9ZNH83a6jvCBAg6xVU
Message-ID: <CACPK8XfnZN6j85b+YfNMvh4RkiT3mtMxw5GHX5Javo4-ZBXbuQ@mail.gmail.com>
Subject: Aspeed for-next pushed for 4.12
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113c3dfec4f560054c91180f
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
X-List-Received-Date: Fri, 07 Apr 2017 10:29:16 -0000

--001a113c3dfec4f560054c91180f
Content-Type: text/plain; charset=UTF-8

Here's a merge of the changes I will be sending to the arm maintainers for
inclusion in 4.12.

https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?h=for-next

I've done plenty of testing of this merged into linux-next. Feel free to
take a look and/or use it in your testing.

If you're booting this kernel from a cold power on, note that the ADC
driver won't work without resetting the AHB bridge:

devmem 0x1e6e200c 32 0x2

On the dev- kernels we have a reset in the aspeed_init_early code path. We
need to work out why that's the case, and add it to upstream if it's
required.

Cheers,

Joel

--001a113c3dfec4f560054c91180f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Here&#39;s a merge of the changes I will=
 be sending to the arm maintainers for inclusion in 4.12.<div dir=3D"auto">=
<br></div><div dir=3D"auto"><a href=3D"https://git.kernel.org/pub/scm/linux=
/kernel/git/joel/aspeed.git/log/?h=3Dfor-next">https://git.kernel.org/pub/s=
cm/linux/kernel/git/joel/aspeed.git/log/?h=3Dfor-next</a><br></div><div dir=
=3D"auto"><br></div><div>I&#39;ve done plenty of testing of this merged int=
o linux-next. Feel free to take a look and/or use it in your testing.</div>=
<div><br></div><div>If you&#39;re booting this kernel from a cold power on,=
 note that the ADC driver won&#39;t work without resetting the AHB bridge:<=
/div><div><br></div><div>devmem 0x1e6e200c 32 0x2</div><div><br></div><div>=
On the dev- kernels we have a reset in the aspeed_init_early code path. We =
need to work out why that&#39;s the case, and add it to upstream if it&#39;=
s required.</div><div><br></div><div>Cheers,</div><div><br></div><div>Joel<=
/div></div>
</div>

--001a113c3dfec4f560054c91180f--
