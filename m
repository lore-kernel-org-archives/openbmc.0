Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E47uLc+n"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418fVt61ZwzF0hg
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 04:19:02 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id y127-v6so12393776itd.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2IdLKry0HrN5VU0QtLTsrQvuGo0F/y0E4kmAQndhvL8=;
 b=E47uLc+naZ+axJtKvcbUNVuA23bTJJ0Ma17VVEHx6vqMgwDDO0Y9YX/I0CntMBVgNw
 9KcTFGa6tkrOGVOuBfytX3774rsFROZJL49V6A7Br1xhf2NU0ad5f0eFHXe2d2W3NSXG
 khg2eRu/EKJ4hTGxQa/mHfIAvr/T43NddMwtEC0hckkCDr2YYjTTrH5ycGeEIdqAuB2I
 0sV50RvMdT8+9/90VCDjCtuU7V8ZogCctdD2KnigUSBKc0vxkWJSrMlglHb08rVX31Hm
 9qJyqy0HVGvDTqSe8SfWFewOWnzkBB1cM0RxWA0CQO7PBtrwZTL0zMO9ObCfp6M3uyGw
 JH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2IdLKry0HrN5VU0QtLTsrQvuGo0F/y0E4kmAQndhvL8=;
 b=cDP04kwCa0xgkkgoBsJAlV9yLrdr8FXUVjZny5iiWUd9zNf6OPEGZ0dyft3QdS1OlP
 HgDOfgHwGWc8aCT24sfq/5cKp+FiRfSz+7KaitjxbFwGVgvmm/GHfnP1pKnYUOYgLSJf
 o/HT6BQCJ7dlVvTpO0Y/a2u2byxnqbPt9uZCLySPh3uafM482K2j+zc/Q/unDcSJfDri
 PFLkAQK9Ehj4KU2z28FDAs5Sii/fXUZm1zkeJYsOMa7bdXdZD9xZQht+V/XxQr4QMLrq
 3ZeFEMjuFtnZ1CAqavtk51tic70EO+2+8zD7Jedb95R9Avq5ii3IqIg3O7rJHMjSz5lW
 i8Lw==
X-Gm-Message-State: APt69E3EA0WP/I56VLAV85l4KdtzLvSe6k4X9OZaI8YKwJhRSVdoW2gt
 O/2WTe1lG5QEDL29PRXLGwNz8tniV9ZMaI6XSPm1UJ6up94=
X-Google-Smtp-Source: ADUXVKLmLX1cUpxgP+RrKJqRfkHkhQrJPoXot1jtufapl9oLOnWDYpVc1zalp9PUFTBgCTqy2vNNe67MzhxTBXdyB6I=
X-Received: by 2002:a24:1d0e:: with SMTP id
 14-v6mr10295016itj.50.1529345938001; 
 Mon, 18 Jun 2018 11:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5003:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 11:18:16
 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 18 Jun 2018 11:18:16 -0700
Message-ID: <CADfYTpEZ3f3PQPd43Grm5rdSx+2f3thYQ5ONqvKV8gFtqzqR+A@mail.gmail.com>
Subject: 6/11 Meeting Notes for OpenBMC Security Working Group
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000602ffb056eee993a"
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
X-List-Received-Date: Mon, 18 Jun 2018 18:19:04 -0000

--000000000000602ffb056eee993a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meeting notes and agendas are recorded in this document
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDU=
WmAOI/edit?usp=3Dsharing>
.

*2018.06.11*
*Attendees: James Mihm, Joseph Reynolds, Brad Bishop, Ed Tanous, Sub,
Christopher Engel, Jayanth, Supreeth Venkatesh*

















*1. The group needs an online forum for agendas, meeting notes, and
discussion. - Use #openbmc_security IRC chat and git/gerrit for threaded
topic conversations  Joseph: ...and use google docs (this document) to add
agenda items and meeting minutes.2. The "meeting in secret" topic came up
several times. - cve.mitre.org <http://cve.mitre.org>- Some secrets, if
there=E2=80=99s a vulnerability that doesn=E2=80=99t have a mitigation, kee=
p it secret
until there=E2=80=99s a fix- Need to provide a process that allows external
reporting of vulnerabilities- Difference between vulnerabilities in
deployment and in development- AI: read up on cve.mitre.org
<http://cve.mitre.org> processes   Joseph: Where in this website does it
describe how a project like OpenBMC should set up a process for its users
to report vulnerabilities?  The closest things I found was:
https://cve.mitre.org/compatible/guidelines.html
<https://cve.mitre.org/compatible/guidelines.html> x3. I think OpenBMC may
need multiple security frameworks to address different concerns. - Need
different frameworks for different things- Joseph: We need stories for
functional security, product lifecycle, functional security requirements
implemented by development team- Ben: agreed, but CC isn=E2=80=99t the righ=
t
approach- Joseph: Backing off CC.  Joseph: 6/14/2018- I=E2=80=99ve written =
the
OpenBMC lifecycle security story and pushed it for review at
https://gerrit.openbmc-project.xyz/#/c/11120/
<https://gerrit.openbmc-project.xyz/#/c/11120/>.  Please add yourself as a
reviewer if interested.  I plan to abandon the previous security review
(but refactor the material -- thanks for your comments!).4. Protection
Profiles. - Joseph: Not the right person to work on protection profiles-
Ensuring OpenBMC is following the requirements to enable certification is
important, not everyone is getting certifications though- OpenBMC
protection profile could be a piece of a larger certification- James: will
upload Intel security architecture document- Joseph: No need to publish the
CC work since it=E2=80=99s covered by James=E2=80=99 effort, but will still=
 pursue it5.
Authentication, Authorization, and Auditing - Joseph: Is there a way to put
in a AAA server that could be used by an enterprise datacenter?- It=E2=80=
=99s being
worked on=E2=80=A6- Who and what=E2=80=99s the solution like?- There=E2=80=
=99s a mailing list post
on user management, Richard (from Intel?)- Brad: There isn=E2=80=99t any co=
de in
OpenBMC, we need something- Ed: dBus wrapper around PAM, - Brad: dBus
allows you to make a data model, proposal for data model for AAA (user
management)- Look for things by Richard in gerrit- How do we get people to
review things?- Cc ppl on reviews directly, could use a mailing list-
AndrewJ maintains the tools repo but there=E2=80=99s no group for general O=
penBMC
tools (gerrit for auto adding reviews)- AndrewJ wrote a tool, wrapper
around doing git pushes that will automatically cc people in maintainers
file.- Ben: the tool promotes best practices- Gerrit support running this
automatically, just needs to scripted- Brad: ok but no one is volunteering-
AndrewG is the person to talk to about getting admin privileges for anyone
who wants to tackle itLet=E2=80=99s meet weekly, some day 10AM PTSub: Trust=
ed
Computing Group (TCG) and OCP Security Group, what do we want to see being
discussed.  Maybe check out their minutes or get someone from these groups
to come to our meeting*

----------
Nancy

--000000000000602ffb056eee993a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Meeting notes and agendas are recorded in this <a href=3D"=
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUW=
mAOI/edit?usp=3Dsharing">document</a>.<div><br></div><div><b style=3D"font-=
weight:normal" id=3D"gmail-docs-internal-guid-f58f00b5-141c-fc8a-814f-6e3a8=
e9e8ab1"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-weight:700;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre-wrap">2018.06.11</span=
></p></b><div><b style=3D"font-weight:normal" id=3D"gmail-docs-internal-gui=
d-baa9a417-141c-dd83-22f5-f9669a049c8a"><span style=3D"font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap">Attendees: </span><span style=3D"font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">James Mihm, Joseph Reynolds, Brad Bishop, Ed Tanous, Sub, Christoph=
er Engel, Jayanth, Supreeth Venkatesh</span></b><br></div><div><b style=3D"=
font-weight:normal"><span style=3D"font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><br><=
/span></b></div><div><b style=3D"font-weight:normal" id=3D"gmail-docs-inter=
nal-guid-4a7458a9-141b-f151-180c-b5d2d4f680a4"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre-wrap">1. The group needs an online forum for agendas, meeti=
ng notes, and discussion.</span></p><ul style=3D"margin-top:0pt;margin-bott=
om:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre-wrap">Use #openbmc_sec=
urity IRC chat and git/gerrit for threaded topic conversations =C2=A0</span=
><span style=3D"font-family:Arial;color:rgb(17,85,204);background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre-wrap">Joseph: ...and use g=
oogle docs (this document) to add agenda items and meeting minutes.</span><=
/p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre-wrap">2. The &=
quot;meeting in secret&quot; topic came up several times. </span></p><ul st=
yle=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre-wrap"><a href=3D"http://cve.mitre.org">cve.mitre.org</a></span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre-wrap">Some secrets, if=
 there=E2=80=99s a vulnerability that doesn=E2=80=99t have a mitigation, ke=
ep it secret until there=E2=80=99s a fix</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Need to provide a process that allows exter=
nal reporting of vulnerabilities</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">Difference between vulnerabilities in deployment an=
d in development</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">AI: read up on <a href=3D"http://cve.mitre.org">cve.mitre.org</a> p=
rocesses =C2=A0=C2=A0</span><span style=3D"font-family:Arial;color:rgb(17,8=
5,204);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Joseph: Where in this website does it describe how a project like Op=
enBMC should set up a process for its users to report vulnerabilities?=C2=
=A0 The closest things I found was: </span><a href=3D"https://cve.mitre.org=
/compatible/guidelines.html" style=3D"text-decoration:none"><span style=3D"=
font-family:Arial;color:rgb(17,85,204);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://cve.mitre.org/compatibl=
e/guidelines.html</span></a><span style=3D"font-family:Arial;color:rgb(17,8=
5,204);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"> x</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re-wrap">3. I think OpenBMC may need multiple security frameworks to addres=
s different concerns. </span></p><ul style=3D"margin-top:0pt;margin-bottom:=
0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">Need different fram=
eworks for different things</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre-wrap">Joseph: We need stories for functional security, product=
 lifecycle, functional security requirements implemented by development tea=
m</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Ben: ag=
reed, but CC isn=E2=80=99t the right approach</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">Joseph: Backing off CC. =C2=A0</span=
><span style=3D"font-family:Arial;color:rgb(17,85,204);background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre-wrap">Joseph: 6/14/2018- I=
=E2=80=99ve written the OpenBMC lifecycle security story and pushed it for =
review at </span><a href=3D"https://gerrit.openbmc-project.xyz/#/c/11120/" =
style=3D"text-decoration:none"><span style=3D"font-family:Arial;color:rgb(1=
7,85,204);background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://gerrit.openbmc-project.xyz/#/c/11120/</span></a><spa=
n style=3D"font-family:Arial;color:rgb(17,85,204);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre-wrap">.=C2=A0 Please add yourse=
lf as a reviewer if interested.=C2=A0 I plan to abandon the previous securi=
ty review (but refactor the material -- thanks for your comments!).</span><=
/p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre-wrap">4. Prote=
ction Profiles.</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt"><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap">Joseph: Not the right pers=
on to work on protection profiles</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">Ensuring OpenBMC is following the requirements to =
enable certification is important, not everyone is getting certifications t=
hough</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Ope=
nBMC protection profile could be a piece of a larger certification</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">James: will uploa=
d Intel security architecture document</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre-wrap">Joseph: No need to publish the CC work since =
it=E2=80=99s covered by James=E2=80=99 effort, but will still pursue it</sp=
an></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">5. A=
uthentication, Authorization, and Auditing</span></p><ul style=3D"margin-to=
p:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"=
>Joseph: Is there a way to put in a AAA server that could be used by an ent=
erprise datacenter?</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap">It=E2=80=99s being worked on=E2=80=A6</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Who and what=E2=80=99s the solution=
 like?</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Th=
ere=E2=80=99s a mailing list post on user management, Richard (from Intel?)=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Brad: Th=
ere isn=E2=80=99t any code in OpenBMC, we need something</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap">Ed: dBus wrapper around PAM=
, </span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Brad: =
dBus allows you to make a data model, proposal for data model for AAA (user=
 management)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wr=
ap">Look for things by Richard in gerrit</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">How do we get people to review things?</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Cc ppl on rev=
iews directly, could use a mailing list</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">AndrewJ maintains the tools repo but there=
=E2=80=99s no group for general OpenBMC tools (gerrit for auto adding revie=
ws)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Andre=
wJ wrote a tool, wrapper around doing git pushes that will automatically cc=
 people in maintainers file.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre-wrap">Ben: the tool promotes best practices</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap">Gerrit support running thi=
s automatically, just needs to scripted</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Brad: ok but no one is volunteering</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">AndrewG is the pe=
rson to talk to about getting admin privileges for anyone who wants to tack=
le it</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-w=
rap">Let=E2=80=99s meet weekly, some day 10AM PT</span></p><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">Sub: Trusted Computing Group (TCG) a=
nd OCP Security Group, what do we want to see being discussed.=C2=A0 Maybe =
check out their minutes or get someone from these groups to come to our mee=
ting</span></p></b><br class=3D"gmail-Apple-interchange-newline"><br clear=
=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure">----------<br>Nancy</div></div>
</div></div></div>

--000000000000602ffb056eee993a--
