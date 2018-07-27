Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::231; helo=mail-io0-x231.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5nDzWUL"; 
 dkim-atps=neutral
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cdvT1KD8zF0jn
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jul 2018 05:15:00 +1000 (AEST)
Received: by mail-io0-x231.google.com with SMTP id z19-v6so4994684ioh.4
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yscd750CEJEHbOfT+rZnYoiobWgJ2LjzTmDrKYO+ZJc=;
 b=W5nDzWULdKjDhYXuyDtTmWYtvbMC3E7PkLl7JO6XvA8uvuh/0H9OjJsEXpBc9yXm2i
 KwJQRGQA25MgX7oqXYYyi+JxKMnavKY/w6GlpwfJIdyCQxA5bLZ54PjHinq9T3rkYcNg
 qbyA9jP3J7PQ5Mkpb7XshwrHM5qxR9/jp3Sy3fgszz+h4Uh0a4b1PpCjCLZu0u17QAmR
 mtYaRCBPotgzMXQeTCj/b16FV5pjpgNZf+5/ZjjsvR5Ne5fFz8f1Z+itIW5DL4YDlFx0
 lit5CP5py3+F03D8Xj5Oe8rCYMP3bbzfOi/9yhXwb8++eXhsFmbSuult07GritvYWO/F
 qAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yscd750CEJEHbOfT+rZnYoiobWgJ2LjzTmDrKYO+ZJc=;
 b=kArNU+quDKz1m87DM9/z4xfEjzMAEJBRtwuaooji9kTlIVJcizRE44jAn738aIPDx/
 fll/kE3Zc2xYVza6uUDO1fmnuIRLjpD16Bb3FTmbR/wdhz5BRNmvT177473Wy2vjZkV/
 A2P6Z8f5llCyIkndGaFVBXh+qDDbd+ypCDTDogNNZoS0r1SCxRQSNiWYj57Q0F499FC8
 81LOhK9pwlrqI9LuIjpN7ohViUTSVg9AmizWk4sPuAIew+hlEeTVLTwbp0wOplk6NIkF
 GnMvWBI2drxYHSAZLE+lVN4chnGoQT3ja8vyUhemNj1f5TFFvpEBvsoG0YSy4FQ4sZwY
 qHGg==
X-Gm-Message-State: AOUpUlH/xor8NEtifxGnX8cPBV3lqsOV0/utMrgFebPSrRNqPtdO1U76
 n6Ov7Ge5GQ1CeVIVOXiJHGdY3jrkhpNbJScDzutnnrNF
X-Google-Smtp-Source: AAOMgpdVf75jQ9yejlBMs9HzRLozNZuD5BjSs8tvoLXrjdtdnH/RCClHmx+xPlkSMLHF/hUNRYjwigNhV4RRt03Aoq4=
X-Received: by 2002:a6b:35f:: with SMTP id 92-v6mr6240632iod.63.1532718898029; 
 Fri, 27 Jul 2018 12:14:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d481:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 12:14:57
 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Fri, 27 Jul 2018 14:14:57 -0500
Message-ID: <CAG5OiwjMSneV+G773drMyb1XVdDbWUe+ASQT-EYDUOhX8M7aqg@mail.gmail.com>
Subject: 7/26 OpenBMC Release Planning WG Meeting Minutes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007529b40571ffedb5"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 19:15:02 -0000

--0000000000007529b40571ffedb5
Content-Type: text/plain; charset="UTF-8"

Hi everyone, thanks for another very productive meeting and for helping to
fill in the spreadsheet.

Meeting Minutes:
https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__
FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing

Agenda backlog for next week:
https://github.com/openbmc/openbmc/wiki/Release-Planning

Regards,
Kurt Taylor (krtaylor)

7/26/18

   -

   Note: call in numbers and info may change frequently for the next few
   weeks, please check your email before assuming the number is the same as
   last week
   -

   Attended (*) Primary company contact
   -

      Kurt Taylor, IBM (WG lead)
      -

      Brad Bishop, IBM
      -

      Kun Yi, Google
      -

      Maury Zipse, IBM
      -

      *Nancy Yuen, Google
      -

      *Sai Dasari, Facebook
      -

      *James Mihm, Intel
      -

      *Dick Wilkins, Phoenix
      -

   Not Attending
   -

      Tao Ren, Facebook
      -

      *Andrew Geissler, IBM
      -

      *Ali Larijani, Microsoft
      -

      Yugi Mani, Microsoft
      -

   Review of Agreements from previous meeting (see previous meeting minutes)
   -

   Milestones:
   -

      Design: End of August
      -

      Code1: End of September
      -

      Code2: Mid November
      -

      Feature freeze: January 7, 2019
      -

      Release: February 4-7, 2019
      -

      Agreement on Feature freeze and Release date shift to past the first
      of the year as proposed, July to shift to maintain 6 month (August 5-10th)
      -

      Agreement on August 31st as the Design milestone date - workgroup
      formed and high-level design complete
      -

   Work items spreadsheet discussion - duplicate topics? WG leads?
   -

      Walked through most of the work items, clarification on description,
      current state
      -

      Resume discussion next week with row 30 SSIF
      -

   Need to move the meeting time - Monday or Wednesday? Same time?

--0000000000007529b40571ffedb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><br></div>Hi everyone, thanks for=
 another very productive meeting and for helping to fill in the spreadsheet=
.<br><br></div>Meeting Minutes:<br><a class=3D"gmail-m_6774135261892209841g=
mail-moz-txt-link-freetext" href=3D"https://docs.google.com/document/d/1yo9=
lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=3Dsharing" target=3D"_bla=
nk">https://docs.google.com/<wbr>document/d/<wbr>1yo9lZp56jkwDM1eXJRE8p__<w=
br>FqlAjq7qcdIi1W7hAD5Y/edit?usp=3D<wbr>sharing</a><br><br></div>Agenda bac=
klog for next week:<br><a class=3D"gmail-m_6774135261892209841gmail-moz-txt=
-link-freetext" href=3D"https://github.com/openbmc/openbmc/wiki/Release-Pla=
nning" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/wiki/Relea=
se-Planning</a><br><br></div>Regards,<br></div>Kurt Taylor (krtaylor)<br><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" id=3D"gmail-docs-internal-guid-d3934192-dd22-7bba-3715-0a16257f2486"><spa=
n style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:700;font-style:normal;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">7/26/18</=
span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Note: call in=
 numbers and info may change frequently for the next few weeks, please chec=
k your email before assuming the number is the same as last week</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap">Attended (*) Primary company contact </span></p></li><ul style=
=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre-wrap">Kurt Taylor, IBM (WG lead)</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre-wrap">Brad Bishop, IBM</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Kun Yi, Googl=
e</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">Maury Zipse, IBM</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">*Nancy Yue=
n, Google</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre-wrap">*Sai Dasari, Facebook</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">*James Mihm, Intel</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre-wrap">*Dick Wilkins, Phoenix</span><=
/p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre-wrap">Not Attending</span></p></li><ul style=3D"margin-top:0pt=
;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre-wrap">Tao Ren, Facebook</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">*Andre=
w Geissler, IBM</span></p></li><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">*Ali Larijani, Microsoft</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">Yugi Mani, Microsoft</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre-wrap">Review of Agree=
ments from previous meeting (see previous meeting minutes)</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-w=
rap">Milestones:</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0=
pt"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">Design: End of August</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre-wrap">Code1: End of Se=
ptember</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Code2: Mid November</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"=
>Feature freeze: January 7, 2019</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">Release: February 4=
-7, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:70=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Agreement</span><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre-wrap"> on Feature freeze and Release date s=
hift to past the first of the year as proposed, July to shift to maintain 6=
 month (August 5-10th)</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre-wrap">Agreement</span><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap"> on August 31st as th=
e Design milestone date - workgroup formed and high-level design complete</=
span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">Work items spreadsheet discussion - duplicate topi=
cs? WG leads?</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"=
><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re-wrap">Walked through most of the work items, clarification on descriptio=
n, current state</span></p></li><li dir=3D"ltr" style=3D"list-style-type:ci=
rcle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Resume discussion next week with ro=
w 30 SSIF</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre-wrap">Need to move the meeting time - Monday =
or Wednesday? Same time?</span></p></li></ul><br></div>

--0000000000007529b40571ffedb5--
