Return-Path: <s.kachkin@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=s.kachkin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="alMHZ3LS"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxlBg6ljVzDrn7;
 Thu, 14 Dec 2017 05:11:39 +1100 (AEDT)
Received: by mail-lf0-x231.google.com with SMTP id i2so3692819lfe.9;
 Wed, 13 Dec 2017 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SrOrE+UzXaaaT+gKwVZ0t2Xx8pIHbjGXqKx9JVmy84E=;
 b=alMHZ3LSyA+wcAofdnwEqo0tQe4hTVV8WrPHJ7810yXgyfpnUUBEI0wcOMhcbPb73e
 EOQXisBKTS1JGiGuj0s51qVGghbLfvF+kxDROsmuORk5//AfaivARfjjQiX6t7G7HKts
 Eiwr1gBI5kDHhlkcd15qYWluRut8zjVUWcBOWilnhvnv8eU59rUYGGfqVjIMQiwTHsUF
 W5+9WWA+O9C8g2f5P0Dst67G94HY73aAb2/gZayxGoPDwqS7Y7YqVSqyRQu1cAIxmDTv
 +vSwSV/Q3DwOUW/dnyHC6m22rQgxsqb/mWt917lrOVwaq4FW+jofys5zBBNxRynZtos4
 X9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SrOrE+UzXaaaT+gKwVZ0t2Xx8pIHbjGXqKx9JVmy84E=;
 b=Yli3WaT3sYN3pzn2SJmEpJNTz2aNQO9gKY+DVR9dAHUM08jppH0vaW0WNOde3vTh5G
 HFMMFb7mEbsgHzxk1JAEwBeKvcLdd3l9xGBsXRQ1Top9fmp/R7HyU1NKD/q7q1uR7lY1
 pXElLy1tBnzukB5ZH8edG2MpnKMfqt1ZvleE/2fCcSH56vG5W29pb+VMuV4iDaYiYdP2
 PnJ3TcXAYS6wh/MV+MieNBJxYMfajelJSTGbGJ+0r7WgS8itDy4B9sgYuY+p5Em6qAVW
 AIWe5dkYNilBn3SEmpOlEx1bH094FRZbMZHfKOb3W0ylYPtv2lByVoNEnIbIDnwEcEMl
 DXoQ==
X-Gm-Message-State: AKGB3mJnAt7fsJ/1nD+IQTkRP1xEsVmQFAhg1qy8hic+/vMKdh8eWO1x
 HIC8wB2/qJmu2WLGcbgH/hivbJ2u2g1CKmrGDhsAgw==
X-Google-Smtp-Source: ACJfBoteYIEdVxDCpWEIWZKO1l6tu5j51xhoKrJE9e/Lc8+S1BxVstlMeTC8I7mYmkU6NAaTBAW3R7httjXHeTs7Swc=
X-Received: by 10.25.38.199 with SMTP id m190mr2083447lfm.95.1513188695579;
 Wed, 13 Dec 2017 10:11:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.208.205 with HTTP; Wed, 13 Dec 2017 10:11:35 -0800 (PST)
From: Sergey Kachkin <s.kachkin@gmail.com>
Date: Wed, 13 Dec 2017 21:11:35 +0300
Message-ID: <CALg5i8NuAD-8k33M36NYiQyG09=xJ6AbZjAqRd7S2jRBRyNSBg@mail.gmail.com>
Subject: correctable errors logging in OpenBMC on P8
To: openbmc@lists.ozlabs.org, skiboot@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a11405a74ada18905603cb25e"
X-Mailman-Approved-At: Fri, 15 Dec 2017 01:42:05 +1100
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
X-List-Received-Date: Wed, 13 Dec 2017 18:11:43 -0000

--001a11405a74ada18905603cb25e
Content-Type: text/plain; charset="UTF-8"

Hi team,

i've got a question regarding correctable errors logging in OpenBMC on P8
platform.  When a machine completely crashed due to checkstop, eSEL is
generated and we have some data for post-mortem analysis, but do we have
any support for correctable errors like ECC, or correctable MCs?

Also is there any way to inject correctable error manually (like we can
inject a dimm UE with putscom)? This may be really valuable for RAS
complience verification.

     Actually i have real use case right now. One of SPEC2006 tests
(456.hmmer) causes following error  on a P8  test server (OpenBMC) which
doesn't cause any eSEL events:

[12323.883272] Harmless Hypervisor Maintenance interrupt [Recovered]
[12323.883323]  Error detail: Processor Recovery done
[12323.883361]     HMER: 2040400000000000
[12323.883392] Harmless Hypervisor Maintenance interrupt [Recovered]
[12323.883442]  Error detail: Processor Recovery done
[12323.883482]     HMER: 2040400000000000
[15281.455845] hmmer_base.Linu[78208]: unhandled signal 11 at
0000000000000004 nip 00000000100304a4 lr 000000001003d9ac code 30001

So i really do not have any data to root cause this. Could it be a software
error?
Anyway this is detected by OPAL and wondering why no any eSEL generated?

thanks in advance,

regards,
Sergey

--001a11405a74ada18905603cb25e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi team,=C2=A0<div><br></div><div>i&#39;ve got a question =
regarding correctable errors logging in OpenBMC on P8 platform.=C2=A0 When =
a machine completely crashed due to checkstop, eSEL is generated and we hav=
e some data for post-mortem analysis, but do we have any support for correc=
table errors like ECC, or correctable MCs?=C2=A0</div><div><br></div><div>A=
lso is there any way to inject correctable error manually (like we can inje=
ct a dimm UE with putscom)? This may be really valuable for RAS complience =
verification.=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0Actually i=
 have real use case right now. One of SPEC2006 tests (456.hmmer) causes fol=
lowing error=C2=A0 on a P8=C2=A0 test server (OpenBMC) which doesn&#39;t ca=
use any eSEL events:=C2=A0<br></div><div><tt><br>
    </tt><tt>[12323.883272] Harmless Hypervisor Maintenance interrupt
      [Recovered]</tt><tt><br>
    </tt><tt>[12323.883323]=C2=A0 Error detail: Processor Recovery done</tt=
><tt><br>
    </tt><tt>[12323.883361] =C2=A0=C2=A0=C2=A0 HMER: 2040400000000000</tt><=
tt><br>
    </tt><tt>[12323.883392] Harmless Hypervisor Maintenance interrupt
      [Recovered]</tt><tt><br>
    </tt><tt>[12323.883442]=C2=A0 Error detail: Processor Recovery done</tt=
><tt><br>
    </tt><tt>[12323.883482] =C2=A0=C2=A0=C2=A0 HMER: 2040400000000000</tt><=
tt><br>
    </tt><tt>[15281.455845] hmmer_base.Linu[78208]: unhandled signal 11
      at 0000000000000004 nip 00000000100304a4 lr 000000001003d9ac code
      30001</tt><br></div><div><tt><br></tt></div><div>So i really do not h=
ave any data to root cause this. Could it be a software error?=C2=A0</div><=
div>Anyway this is detected by OPAL and wondering why no any eSEL generated=
?=C2=A0</div><div><br></div><div>thanks in advance,=C2=A0</div><div><br></d=
iv><div>regards,</div><div>Sergey=C2=A0</div></div>

--001a11405a74ada18905603cb25e--
