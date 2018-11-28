Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GYyc1KD9"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434x7X6gBVzDr1m
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 10:04:56 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id c123so5438pfb.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 15:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YNZq8/DO/KjJGrIjvkGAaB69u/EUQV5buTsLnxCEPag=;
 b=GYyc1KD9Lwd3Zd5S7POtkKTdZ11tab5BTc9c6kOpu5L82RoQbhanJWi06QosJRgK6B
 1M6IYJxHahhSQZZB6HM/ZfFiHyIKqOAPD06bRux2TpfFCcaWHJQbIncPUIp2XIlIpmyX
 T/+semVjpg02Oi/Cji3sSlGTgc3kNOJGoWx1glRq6dnRSBAD5DIVd0WrosdXcGTLgIJL
 PgItBFnNf38h/apFO3nK87tMVV+APtf1yckpaQlwAuZlDkaNoNi1X14FQRxQQdsgPslq
 nS3Wm1gWBlod4rtkNtKLNSnrHzZHjzEU2I3PgAPai9E4w75e/92myOdLwxZ3hGxhw01P
 WJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YNZq8/DO/KjJGrIjvkGAaB69u/EUQV5buTsLnxCEPag=;
 b=OJ+oB5umj+HDnmIfrVkhShM9On54Kp7BIrGrxqXhdd9XovvOHNqe3HGAWYBmSJkIIW
 JtTMj8BO7T1XTZrMQXrBu4OkDNJu5ADlZgFyn1gqOUABZf6Xi29U1lurSTZcMnljNivG
 PiLvD5wxHEjxi8x0Nyz2bE2pIKtP52oDv8WyDb6Tz8SHz3z1iJXJgfghpqwYwUV5Nx1a
 2z+DtskZpfERrziW+V6A3gofX2E3EpqCujG3dk1d7Bc1gcmGg8uHEsHh2VyyduboI7UV
 JIfPcmGMlv1ihn/DAg0TBIaoBnHZ7DRbnZ9UKaUF6JgrgbqEdRl1Hz8CGvIvJVJsWNMC
 J0zQ==
X-Gm-Message-State: AA+aEWbqSb+Sd0U8G2XWOQYqJv0cm9p/7XsDiy7cKotkPO8YoMiQowqs
 ztupFpbEJzHQ0DzqeQ0q7r3S0HYfgFD+FjOklhRsgtXi
X-Google-Smtp-Source: AFSGD/VMdLQabz7Hbx97+pMKflYSC65ta3wprK5f3TlHkDUzr3zWq3qVvJlH7C8Li3Dm2PBNK+q77ud+UZu/6oQCNm4=
X-Received: by 2002:a63:588:: with SMTP id 130mr34321353pgf.273.1543446294549; 
 Wed, 28 Nov 2018 15:04:54 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Wed, 28 Nov 2018 17:04:43 -0600
Message-ID: <CANT4NrLihi+AWcXcD4JXxBOu2j26m2PRVvrq1rhuFO54TPOs3g@mail.gmail.com>
Subject: OpenBMC GUI panels ready for review
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001dd920057bc19879"
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
X-List-Received-Date: Wed, 28 Nov 2018 23:04:57 -0000

--0000000000001dd920057bc19879
Content-Type: text/plain; charset="UTF-8"

OpenBMC GUI panels are ready for your review. Links to the mockups and
component descriptions/behaviors are in the respective issues.


LDAP Role Groups https://github.com/openbmc/phosphor-webui/issues/38
LDAP Server Configuration
https://github.com/openbmc/phosphor-webui/issues/39
SNMP Server Management https://github.com/openbmc/phosphor-webui/issues/37
Date and Time Settings https://github.com/openbmc/phosphor-webui/issues/46


Please post all comments and feedback directly in the issue. I am
particularly interested in:

   - Is the workflow intuitive? If not, what was confusing and why?
   - Are the fields or components the correct ones? If not, why?
   - Are there missing fields or components for the feature? If yes, what
   is missing and why is it important?

We will discuss this first set of panels during our next GUI Design
workshop on Wednesday, December 5.

I look forward to your feedback!

-- Susan Jasinski (UX Design Lead)

--0000000000001dd920057bc19879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(69,69,69);font-family:&quot;Open =
Sans&quot;,Arial,Helvetica,sans-serif;white-space:pre-wrap;background-color=
:rgb(247,247,247)">OpenBMC GUI panels are ready for your review.=C2=A0</spa=
n><span style=3D"font-family:&quot;Helvetica Neue&quot;">Links to the mocku=
ps and component descriptions/behaviors are in the respective issues.=C2=A0=
</span><div><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-stretch:normal;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><br></p></div><div><span style=3D=
"color:rgb(69,69,69);font-family:&quot;Open Sans&quot;,Arial,Helvetica,sans=
-serif;white-space:pre-wrap;background-color:rgb(247,247,247)">LDAP Role Gr=
oups </span><a href=3D"https://github.com/openbmc/phosphor-webui/issues/38"=
 class=3D"gmail-linkified" target=3D"_blank" rel=3D"noopener" style=3D"colo=
r:rgb(118,207,166);font-family:&quot;Open Sans&quot;,Arial,Helvetica,sans-s=
erif;white-space:pre-wrap;background-color:rgb(247,247,247)">https://github=
.com/openbmc/phosphor-webui/issues/38</a></div><div><span style=3D"color:rg=
b(69,69,69);font-family:&quot;Open Sans&quot;,Arial,Helvetica,sans-serif;wh=
ite-space:pre-wrap;background-color:rgb(247,247,247)">LDAP Server Configura=
tion </span><a href=3D"https://github.com/openbmc/phosphor-webui/issues/39"=
 class=3D"gmail-linkified" target=3D"_blank" rel=3D"noopener" style=3D"colo=
r:rgb(118,207,166);font-family:&quot;Open Sans&quot;,Arial,Helvetica,sans-s=
erif;white-space:pre-wrap;background-color:rgb(247,247,247)">https://github=
.com/openbmc/phosphor-webui/issues/39</a><br></div><div><span style=3D"colo=
r:rgb(69,69,69);font-family:&quot;Open Sans&quot;,Arial,Helvetica,sans-seri=
f;font-size:14px;white-space:pre-wrap;background-color:rgb(247,247,247)">SN=
MP Server Management </span><a href=3D"https://github.com/openbmc/phosphor-=
webui/issues/37" class=3D"gmail-linkified" target=3D"_blank" rel=3D"noopene=
r" style=3D"color:rgb(118,207,166);font-family:&quot;Open Sans&quot;,Arial,=
Helvetica,sans-serif;font-size:14px;white-space:pre-wrap;background-color:r=
gb(247,247,247)">https://github.com/openbmc/phosphor-webui/issues/37</a><br=
></div><div><span style=3D"color:rgb(69,69,69);font-family:&quot;Open Sans&=
quot;,Arial,Helvetica,sans-serif;font-size:14px;white-space:pre-wrap;backgr=
ound-color:rgb(247,247,247)">Date and Time Settings </span><a href=3D"https=
://github.com/openbmc/phosphor-webui/issues/46" class=3D"gmail-linkified" t=
arget=3D"_blank" rel=3D"noopener" style=3D"color:rgb(118,207,166);font-fami=
ly:&quot;Open Sans&quot;,Arial,Helvetica,sans-serif;font-size:14px;white-sp=
ace:pre-wrap;background-color:rgb(247,247,247)">https://github.com/openbmc/=
phosphor-webui/issues/46</a><br></div><div><div><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;line-height:normal;font-family:&quot;Helvetica Neue&quot=
;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-stretch:normal;line-height:normal=
;font-family:&quot;Helvetica Neue&quot;">Please post all comments and feedb=
ack directly in the issue. I am particularly interested in:</p></div></div>=
<div><ul class=3D"gmail-ul1">
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;"><span class=3D"gmail-s1" style=3D"font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;line-=
height:normal;font-family:Menlo"></span>Is the workflow intuitive? If not, =
what was confusing and why?</li><li class=3D"gmail-li1" style=3D"margin:0px=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:no=
rmal;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Are the fie=
lds or components the correct ones? If not, why?</li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;"><span class=3D"gmail-s1" style=3D"font-vari=
ant-numeric:normal;font-variant-east-asian:normal;line-height:normal;font-f=
amily:Menlo;font-stretch:normal;font-stretch:normal"></span>Are there missi=
ng fields or components for the feature? If yes, what is missing and why is=
 it important?</li>
</ul><div><font face=3D"Helvetica Neue">We will discuss this first set of p=
anels during our next GUI Design workshop on Wednesday, December 5.=C2=A0</=
font></div><div><font face=3D"Helvetica Neue"><br></font></div><div><font f=
ace=3D"Helvetica Neue">I look forward to your feedback!</font></div></div><=
div><font face=3D"Helvetica Neue"><br></font></div><div><font face=3D"Helve=
tica Neue">-- Susan Jasinski (UX Design Lead)</font></div></div>

--0000000000001dd920057bc19879--
