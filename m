Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c32; helo=mail-yw1-xc32.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0TNOJ9L"; 
 dkim-atps=neutral
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zW1V2ldVzDq78
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 05:11:07 +1100 (AEDT)
Received: by mail-yw1-xc32.google.com with SMTP id u200so1361383ywu.10
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 10:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=q+e6zJDv/astvSJUvX4q6nKhLe5++iEbW6OIB3X/fPQ=;
 b=d0TNOJ9LqFWNpP4nYMhl2XWv3taWxwzmsnzw/R9wSQhIFE0cVqIU+bP8RsK/r/7Xrf
 1SJGUI6cd//MYbEOac/QrW8bZiaH83Bz62MFeQqnz9sZc7Lg9amZ+9VFv65mxeFV01VE
 AazVK1qQYo0UHEM16VfHeM95By7VwC6ltgyh135CIG3GNRgx65SG0mtvIcCnYKtrK8v7
 HHmMqr/jWBCpxwc/HnrGBxzDqQ0VXF9PvyC3lZNpOjw250qLMf73+09A94IkmdMdAR+a
 LpXYeg7t0uw7M+inXPExersTe7PXhbJwMV2l/Ud+B8ebgQI6aCxn0lwuQEGozOs5LkDP
 L1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q+e6zJDv/astvSJUvX4q6nKhLe5++iEbW6OIB3X/fPQ=;
 b=J5JUxvqbxXoJMg9mXrEhVkb49iHimaVIOSX03wNjI9ukF8sUTkV3jBcJeJvA0VxMHG
 arGbkreLKabTs5PrgMtxA92XRdWEl7qXlXv34Ox6JGrGyJv0BPIs7TTYOpCEJbVGP+T2
 GRzZPNEN7Wn3BOYSyblUG4JHI2uQuKj23nkaZPOmTUQS/fjmd7xZYEzwtJpe0HQoD469
 YKBX/QZvJ2sCYcbLXH0okrsgs1GAPEVxs2/RGAMl+/4mKaqMA/rtP09YaXsiwT2IfpNB
 2kuqm2nbNRTtzPwpj8Wzn2fNAF8sZ475t2hu9CeKpb373clKZMV1h1hBt8c7TzQgjd+5
 37Qg==
X-Gm-Message-State: AHQUAua0NFmDAm27f97GZl8iqqLXqp06znol3oOSi1kkkFL8tRr8mFkE
 FU1K8c/Lj0yCCJn2MiajpDSbWBJxQYHKR7IQ05EwW/tY
X-Google-Smtp-Source: AHgI3IZf99T7U3ZEzV9NAbLlShFpDnVIL3rKvMHy0vB6TNhoSs4da8L8VoIOtJmQ94UCcap62kteuWF9BvTF5HvjhI0=
X-Received: by 2002:a81:1690:: with SMTP id 138mr1256307yww.276.1549995064553; 
 Tue, 12 Feb 2019 10:11:04 -0800 (PST)
MIME-Version: 1.0
From: ja az <jandraara@gmail.com>
Date: Tue, 12 Feb 2019 12:10:53 -0600
Message-ID: <CAMTupoQ2XY7WD1hREOFFZtAD7F8mA6Ct_w7OemQ5OoaZD3fG_w@mail.gmail.com>
Subject: UI Design Update & Feedback - Network Settings
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000039f6020581b659b7"
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
X-List-Received-Date: Tue, 12 Feb 2019 18:11:11 -0000

--00000000000039f6020581b659b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all! The UI design team has been working on designing for the *Network
Settings *page and would love to get your feedback on it, as you all have
more technical knowledge and perhaps speak with customers. Right now this
is a static image (nothing has been coded), so none of the buttons actually
work.

You can view the design at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutl=
iple_VLAN

If you click on the bottom right corner of the interface where it says =E2=
=80=98#
Comments', you'll be able to place comments in context of whatever you
refer to by clicking where you want to add a comment. You can also view
others=E2=80=99 comments and respond.

Please feel free to give feedback on what you see fit. The main things we
are looking for, though are:
1. Is it true that without enabling an interface, IP addresses and DNS
servers cannot be modified?
2. What is the relationship between VLAN interfaces and network interfaces
(ex. Eth01)? And do you have thoughts on if information should be presented
per VLAN interface (the associated IP addresses and DNS servers) or per
network interface?

3. What interactions does a user have with VLAN interfaces? (Ex. How would
they modify if at all)
4. How many IP addresses would users typically have? (A rough order is
fine)
5. If any, what is the use case for using both dynamic and static IP
addresses/DNS servers?

6. In the case of static, does it make sense for DNS servers and IP
addresses to be created at the same time? Or are these typically separate
actions?



Best,

Jandra Aranguren

--00000000000039f6020581b659b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font col=
or=3D"#444444"><font face=3D"verdana, sans-serif" style=3D"">Hi all! The UI=
 design team has been working on designing for the <b style=3D"">Network Se=
ttings </b>page and would love to get your feedback on it, as you all have =
more technical knowledge and perhaps speak with customers. Right now this i=
s a static image (nothing has been coded), so none of the buttons actually =
work. <br>
<br>
You can view the design at:=C2=A0</font><span style=3D"font-family:verdana,=
sans-serif"><a href=3D"https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/31900=
2386_V2_Networking_Mutliple_VLAN">https://ibm.invisionapp.com/share/RQNYHJ0=
VBDY#/319002386_V2_Networking_Mutliple_VLAN</a></span></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"verdana, sans-serif" color=3D"#444444">If you click on the bottom righ=
t corner of the interface where it says =E2=80=98# Comments&#39;, you&#39;l=
l be able to place comments in context of whatever you refer to by clicking=
 where you want to add a comment. You can also view others=E2=80=99 comment=
s and respond. <br>
<br>
Please feel free to give feedback on what you see fit. The main things we a=
re looking for, though are:<br>
1. Is it true that without enabling an interface, IP addresses and DNS serv=
ers cannot be modified?<br>
2. What is the relationship between VLAN interfaces and network interfaces =
(ex. Eth01)? And do you have thoughts on if information should be presented=
 per VLAN interface (the associated IP addresses and DNS servers) or per ne=
twork interface?<span class=3D"gmail-Apple-converted-space">=C2=A0</span></=
font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"verdana, sans-serif" color=3D"#444444">3. What interactions does a use=
r have with VLAN interfaces? (Ex. How would they modify if at all) <br>
4. How many IP addresses would users typically have? (A rough order is fine=
) <br>
5. If any, what is the use case for using both dynamic and static IP addres=
ses/DNS servers?<span class=3D"gmail-Apple-converted-space">=C2=A0</span></=
font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"verdana, sans-serif" color=3D"#444444">6. In the case of static, does =
it make sense for DNS servers and IP addresses to be created at the same ti=
me? Or are these typically separate actions?<span class=3D"gmail-Apple-conv=
erted-space" style=3D"">=C2=A0</span></font></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;line-height:normal"><font face=3D"verdana, sans-serif" c=
olor=3D"#444444"><span class=3D"gmail-Apple-converted-space" style=3D""><br=
></span></font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-stretch:normal;line-heigh=
t:normal"><font face=3D"verdana, sans-serif" color=3D"#444444"><span class=
=3D"gmail-Apple-converted-space" style=3D""><br></span></font></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;line-height:normal"><font face=3D"ver=
dana, sans-serif" color=3D"#444444"><span class=3D"gmail-Apple-converted-sp=
ace" style=3D"">Best,</span></font></p><p class=3D"gmail-p1" style=3D"margi=
n:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stret=
ch:normal;line-height:normal"><font face=3D"verdana, sans-serif" color=3D"#=
444444"><span class=3D"gmail-Apple-converted-space" style=3D"">Jandra Arang=
uren</span></font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;line-he=
ight:normal"><font face=3D"verdana, sans-serif" color=3D"#444444"><span cla=
ss=3D"gmail-Apple-converted-space" style=3D""><br></span></font></p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-stretch:normal;line-height:normal;color:rgb(69,69,6=
9)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-Apple-converted=
-space" style=3D""><br></span></font></p></div>

--00000000000039f6020581b659b7--
