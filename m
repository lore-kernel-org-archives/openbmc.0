Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9pjm46z"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vh9S6MvtzF3LS
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 08:49:32 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id b5so260317plr.4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=40ZVqcnLKFi1AxJgp6QWwYMCS2PvgLkZ8LjMOQz5yIY=;
 b=a9pjm46ztnRoL5m3Ct+SOX/iho5LKnBjO0R7lrsypWBk3HxO1+Czpq9pCkC0XgkcGU
 NOSxnHffIj1EHt+r5idxbB2I3L5XtKVWTLbNdyl8Dwis4mu6m0S3UvQ0ZMubQuirdthr
 csiWvXqqFc1FNubI2nNLWtyrBgUWkktBCWPYmLigqKesNw1V3qBGCNjyd5UiT8aAWVNy
 xxdP24fQoGIi2qqHvTb3ZvXDkd/iSC+gia1hxBQxasdX6IZ3s56LS5oYGGX+vmULASTz
 q6HqSVMEIcolaicgB6S8kQDsUsmqP/NrA8ImEmscAFzBCp0nsXdCOsP+l35t2mPZHziq
 tJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=40ZVqcnLKFi1AxJgp6QWwYMCS2PvgLkZ8LjMOQz5yIY=;
 b=HJAjGUnUlmVM2kjHZYA7Sy8BdP/Ug1/Pdrs9auTICsee9h50UgWvdUCSeVnvEscshD
 HDnAO3UBIxkTDbhhR2vn8OEmzLSbGp+vXZOgine0tg5EK5Q/HaIBejVx8MG2u0+WeBwL
 LN20IiiEliDW0TBsjHuacvCbr5l5UG801hl0hm+Bk2xNrv7/OIF3elZySOjJI1KRhTIc
 Jq2UYjkRoU9RJBVlsMnSMFQ8U+AjOM0Pb0ZUCMPtytqbMDL88HpF3bfHdM+h8KrgwG0B
 jVtdpu+Pj+/B/Z9he6uiPBB0Jy3npOPejnw7By8BJgMIidZUMpeg1v0AIcYcrn2v97k+
 VVIw==
X-Gm-Message-State: AGRZ1gKUTB/XK9K0ocVYf34sC7NTE/uE8hal6v4/QqBGGGpfIA1Bzmk6
 k/VuwjCmrjqwjQHDQw4gQp2dxlcAU0gD9gNy/x1p7++n
X-Google-Smtp-Source: AJdET5dgJscj9yAUNn5UxJ9lK+eohwDNQaQlIkfwb+xPkrin4ne1TVsjWQJDFcJ5iAaVYVnDlzNuQ/KD4wYsmzHw7vQ=
X-Received: by 2002:a17:902:8f8f:: with SMTP id
 z15-v6mr6845059plo.257.1542145770145; 
 Tue, 13 Nov 2018 13:49:30 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Tue, 13 Nov 2018 15:49:19 -0600
Message-ID: <CANT4Nr+vaqa+A+_eY3nbO6rMMXuRMw4STv17AXjTWSmHv=3OKw@mail.gmail.com>
Subject: OpenBMC GUI Style Guide proposal
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d24d3b057a92ca5c"
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
X-List-Received-Date: Tue, 13 Nov 2018 21:49:33 -0000

--000000000000d24d3b057a92ca5c
Content-Type: text/plain; charset="UTF-8"

One of the topics from the GUI Design workgroup is how the GUI style guide
is shared with the whole community. The attendees agreed that we should get
feedback from the broader community on the proposal to make the guide more
"open".


To start with, the purpose of the guide is not to replace the bootstrap
library. Instead, this guide will help front-end designers and developers
provide consistent patterns, behaviors, and interactions such as colors,
form and validation behaviors, accessibility interactions, terminology,
animations, etc.


Today, the first version of the style guide is shared as a series of
flattened images (png). And the source files are not easily accessible to
the community https://ibm.invisionapp.com/share/EBNYECMH3Y2.


I am proposing to build a website served through Github Pages. This would
allow users to easily find and navigate to the information they need. It
also allows users to interact with the content.  An example of this can be
found here: https://bradfrost.github.io/style-guide-guide/.


With this solution, the code will be stored in a style guide repo allowing
for the community to provide feedback using Github issues, as well as the
ability to make changes using the standard development process.


A Github issue has been created to track feedback on this topic. Please
post your feedback here:
https://github.com/openbmc/phosphor-webui/issues/41


Thank you in advance for your feedback -- Susan Jasinski

--000000000000d24d3b057a92ca5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:no=
rmal;font-family:&quot;Helvetica Neue&quot;">One of the topics from the GUI=
 Design workgroup is how the GUI style guide is shared with the whole commu=
nity. The attendees agreed that we should get feedback from the broader com=
munity on the proposal to make the guide more &quot;open&quot;.</p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:12px;line-height:normal;fon=
t-family:&quot;Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" style=3D=
"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-stretch:normal;font-size:12px;line-height:normal;font-family:&quot;Helveti=
ca Neue&quot;">To start with, the purpose of the guide is not to replace th=
e bootstrap library. Instead, this guide will help front-end designers and =
developers provide consistent patterns, behaviors, and interactions such as=
 colors, form and validation behaviors, accessibility interactions, termino=
logy, animations, etc.=C2=A0</p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norm=
al;font-size:12px;line-height:normal;font-family:&quot;Helvetica Neue&quot;=
"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-stretch:normal;font-size:12px;line=
-height:normal;font-family:&quot;Helvetica Neue&quot;">Today, the first ver=
sion of the style guide is shared as a series of flattened images (png). An=
d the source files are not easily accessible to the community <a href=3D"ht=
tps://ibm.invisionapp.com/share/EBNYECMH3Y2">https://ibm.invisionapp.com/sh=
are/EBNYECMH3Y2</a>.=C2=A0=C2=A0</p><p class=3D"gmail-p1" style=3D"margin:0=
px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:=
normal;font-size:12px;line-height:normal;font-family:&quot;Helvetica Neue&q=
uot;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:12px;=
line-height:normal;font-family:&quot;Helvetica Neue&quot;">I am proposing t=
o build a website served through Github Pages. This would allow users to ea=
sily find and navigate to the information they need. It also allows users t=
o interact with the content.=C2=A0 An example of this can be found here:=C2=
=A0<a href=3D"https://bradfrost.github.io/style-guide-guide/">https://bradf=
rost.github.io/style-guide-guide/</a>.=C2=A0</p>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:no=
rmal;font-family:&quot;Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" =
style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-stretch:normal;font-size:12px;line-height:normal;font-family:&quot=
;Helvetica Neue&quot;">With this solution, the code will be stored in a sty=
le guide repo allowing for the community to provide feedback using Github i=
ssues, as well as the ability to make changes using the standard developmen=
t process.=C2=A0</p>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:no=
rmal;font-family:&quot;Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" =
style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-stretch:normal;font-size:12px;line-height:normal;font-family:&quot=
;Helvetica Neue&quot;">A Github issue has been created to track feedback on=
 this topic. Please post your feedback here:=C2=A0 <a href=3D"https://githu=
b.com/openbmc/phosphor-webui/issues/41">https://github.com/openbmc/phosphor=
-webui/issues/41</a></p><p class=3D"gmail-p1" style=3D"margin:0px;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-=
size:12px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></=
p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:=
normal;font-family:&quot;Helvetica Neue&quot;">Thank you in advance for you=
r feedback -- Susan Jasinski</p>











<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><br></p><=
/div></div>

--000000000000d24d3b057a92ca5c--
