Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::234; helo=mail-wm0-x234.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IXPKOnvC"; 
 dkim-atps=neutral
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409x915fPFzF2Hl
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 16:22:45 +1100 (AEDT)
Received: by mail-wm0-x234.google.com with SMTP id r131so2674978wmb.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jq7ME3AtKJ+0nyYs1PwpjWZ1WReRF6jPA54eU4qURbE=;
 b=IXPKOnvCmUre8EObDkYAopjDpfSAsE/EsLZHDOU2u52k14WHRrBBg5h2EM5qX/XVsj
 eqDacE4q7l1ebP4egDC/l7ZwbSC28dV7UZlVf9jwBZhummvuxOCT5QK6KjdDfoLtD0xc
 v9vnJW/CtYrNngSCNX9/oDPcbqu7RanjK2+LSJ0miM9n1sT03jqnNeLGfFqYLwmHtHox
 SoBBQvfsNPdko4HrgHmtvjvNdPqYiZDcr2ACBlFJpIisAOP0fMyI8CdZWLHPeKKVDxGM
 o+iSRZA2wHDoGo8Wnze7vdWINLqyx+PnGdGJ2Td9BlyTqzLcN5SrDzgSJ9jFXimBepKo
 JEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jq7ME3AtKJ+0nyYs1PwpjWZ1WReRF6jPA54eU4qURbE=;
 b=eZKFS57MkM8Qpcl+jb48IHpOPoE28m1RpJkxliwZmd+Ic3AYx6KnsxSuhoXCpF+Ht+
 0WZRb1Ka0LKbGomtmihENA9awhSgPWN00UFozgN2jqC4+FvU7QF8lQdkaVVKsjPSGIOy
 3HptjfZLZcH0EJQS3LP2zsX89QGn1Npxbx+lDbQOzGiSTUnqC6P9aPsuX5f9HuTMlXQh
 013d2+5BgI2eZ9xRS8rEuWdowjCYtTsXoCZMMGHNR4xIy4HTf08WfvooTgRHvMxbslpa
 kflwxkqKs55yQvuRmhbMh7zEKnAdFaAHgm2nILssODn9PPMwk4NMU1e86Nlva9IaeZx9
 WM/Q==
X-Gm-Message-State: AElRT7EHxZzquiyRFJyBRatFSGw0H5lyuj5A85Mcv4ezHJv0zaSDyc/w
 uk0jaf1uiAtAMOkgJ82tk3e6ZNFLbxLt0ZGVqs/1PzEx
X-Google-Smtp-Source: AIpwx48LYLMICLuLVWeYdscSN8VGTvIzeZ9Kg/l5m+Ll3R9w7z41uIlErXFrkPUBIooh639xF5KjTM4skD+NAMcTpdI=
X-Received: by 10.28.245.9 with SMTP id t9mr1431844wmh.33.1522214561948; Tue,
 27 Mar 2018 22:22:41 -0700 (PDT)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 28 Mar 2018 05:22:31 +0000
Message-ID: <CAJoAoZ=gPx28hiWf-07pVczcBCVuroTRSP1OdK+mT4ooY0Nk7A@mail.gmail.com>
Subject: IPMI Maintainer Call 3/27/2018
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="089e082f8a143d39e205687232cf"
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
X-List-Received-Date: Wed, 28 Mar 2018 05:22:47 -0000

--089e082f8a143d39e205687232cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meeting 3/27/2018

Agenda:


   -

   Discuss centralization of some IPMI functionalities into shared utility
   library - how much of entire IPMI stack can we deduplicate? See
   https://gerrit.openbmc-project.xyz/#/c/9501/1 - simply copying code
   between the two projects is unacceptable.  (This may be partially solved=
 by
   next point=E2=80=A6)
   -

      Decided not to cover this point, it is covered by the next point.
      -

   Present & review IPMI refactor design proposal
   -

      How to present upstream? Brad suggests having the design doc reviewed
      as a .md in Gerrit.
      -

      Vernon will address maintainer comments on Friday when he=E2=80=99s b=
ack from
      vacation, we will convert to.md and put up on openbmc/docs for review
      -

   Interim rules during Tom=E2=80=99s absence - don't get eaten by dropbear=
s!
   -

      If someone is out, we have 2 more maintainers; the other 2
      maintainers should agree on anything.  So basically business as usual=
.
      -

      Tom will ask Deepak <dkodihalli> to review IBM patchsets before they
      make it up to ipmid
      -

      What if two people are out? ...We=E2=80=99ll cross that bridge later.=
 If it=E2=80=99s
      for a day or two, not an issue; if it=E2=80=99s for a week, we might
need to elect
      Supreme Leader
      -

   https://github.com/openbmc/openbmc/issues/2943 - Discuss this issue
   -

      For default user account, there=E2=80=99s no support to set or change=
 the
      password today.
      -

      Intel is working on some management in this area
      -

      IBM interested in putting throwaway code
      -

      Previously, Intel added OEM password for root and did not distribute
      it.  (We don=E2=80=99t want IPMI users able to get in as root) Many m=
oons ago=E2=80=A6.
      -

      FB seems to very much want to be able to login as root
      -

      Separate from Unix user, SSH login, REST login, etc
      -

      Google has serious security concerns
      -

      IBM needs this for release coming up soon for partial functionality
      -

      Possible for IBM to only apply as downstream patch?  (+1 from Vernon
      & Emily)
      -

   What about change to add username (-U) to use ipmitool over network?
   -

      Vernon: would prefer username was required (security concern). RAKP
      includes username as part of keygen
      -

   When to meet w/ time change?
   -

      9:30 Pacific (no change for Pacific), 1hr earlier for India
      -

   Brief OCP recap
   -

   Vernon is on vacation now until Fri
   -

   Tom will be on vacation Fri until 4/21
   -

   No change to maintainer approval rules in that time

--089e082f8a143d39e205687232cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"inbox-inbox-docs-internal-guid-80e1d789-6b0e-0=
d10-d679-2dc1d09e0546"><p style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"background-color:transparent;font-family:Arial;fo=
nt-size:11pt;white-space:pre-wrap">Meeting 3/27/2018</span><br></p><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">Agenda:</span></p><br><ul style=3D"margin-top:0=
pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Discuss centralization of some IPMI functionalities into=
 shared utility library - how much of entire IPMI stack can we deduplicate?=
 See </span><a href=3D"https://gerrit.openbmc-project.xyz/#/c/9501/1" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;color:rgb(17,8=
5,204);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">https://gerrit.openbmc-project.xyz/#/c/9501/1</span><=
/a><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap"> - simply copying code between the two projects is unaccep=
table. =C2=A0(This may be partially solved by next point=E2=80=A6)</span></=
p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Decided not to cover thi=
s point, it is covered by the next point.</span></p></li></ul><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Present &amp; re=
view IPMI refactor design proposal</span></p></li><ul style=3D"margin-top:0=
pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">How to present upstream? Brad suggests having the design=
 doc reviewed as a .md in Gerrit.</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">Vernon will address maintaine=
r comments on Friday when he=E2=80=99s back from vacation, we will convert =
<a href=3D"http://to.md">to.md</a> and put up on openbmc/docs for review</s=
pan></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Interim rules during Tom=E2=80=99s absence - don&#39;t get e=
aten by dropbears!</span></p></li><ul style=3D"margin-top:0pt;margin-bottom=
:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">If someone is out, we have 2 more maintainers; the other 2 maintainers s=
hould agree on anything.=C2=A0 So basically business as usual.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
Tom will ask Deepak &lt;dkodihalli&gt; to review IBM patchsets before they =
make it up to ipmid</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">What if two people are out? ...We=E2=80=99l=
l cross that bridge later. If it=E2=80=99s for a day or two, not an issue; =
if it=E2=80=99s for a week, we might need to elect Supreme Leader</span></p=
></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a hre=
f=3D"https://github.com/openbmc/openbmc/issues/2943" style=3D"text-decorati=
on-line:none"><span style=3D"font-size:11pt;color:rgb(17,85,204);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;text-decoration-line:underline;vertical-align:baseline;white-space:pre-w=
rap">https://github.com/openbmc/openbmc/issues/2943</span></a><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p"> - Discuss this issue</span></p></li><ul style=3D"margin-top:0pt;margin-=
bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">For default user account, there=E2=80=99s no support to set or cha=
nge the password today.</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Intel is working on some management in =
this area</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">IBM interested in putting throwaway code</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
Previously, Intel added OEM password for root and did not distribute it. =
=C2=A0(We don=E2=80=99t want IPMI users able to get in as root)  Many moons=
 ago=E2=80=A6.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">FB seems to very much want to be able to login a=
s root</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Separate from Unix user, SSH login, REST login, etc</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Google has serious security concerns</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">IBM needs this for=
 release coming up soon for partial functionality</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">Possible for =
IBM to only apply as downstream patch? =C2=A0(+1 from Vernon &amp; Emily)</=
span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">What about change to add username (-U) to use ipmitool over=
 network?</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Vernon=
: would prefer username was required (security concern). RAKP includes user=
name as part of keygen</span></p></li></ul><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">When to meet w/ time change?</span>=
</p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">9:30 Pacific (no chang=
e for Pacific), 1hr earlier for India</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">Brief OCP recap</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Vernon is on vacation now until Fri</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Tom will be on vaca=
tion Fri until 4/21</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">No change to maintainer approval rules in t=
hat time</span></p></li></ul></span></div>

--089e082f8a143d39e205687232cf--
