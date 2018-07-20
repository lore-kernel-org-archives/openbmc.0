Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZpX6wFG"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XPY41Lx4zDqC3
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 07:44:23 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id q20-v6so16423226ith.0
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oxsorT/SAfQWdmcBKGyktYAKT3t0Yq+3DoKbdixN8RM=;
 b=UZpX6wFGSj15nA+R2PrFBhRYflpwuwr3sARJNxkspGflogtbEdCpUphBRb0MyYrHRx
 5BV5fUKB2qTgICmIX0Jby2LSisRSMA2vKFU/o9baqwhLNQjx2wgKNlRPD4bwYe3fuRwc
 B1cM/3lXjFlryyop1C+ZtM1i+oRPT36Kx8VXpfnUv+cBFyY1BGqvmu3PDtTkn9uhH4mG
 yc2CuWEhxb81MTwIIBBJldL1bfcZlT9sqzjlq83LexfZCLh2J70mAf7JlEF8w8P5HzxH
 C4g3CrSAUneQ2lyeUYVzL+DKcQaaMhfC6LeNgQ2Nu158a0XC2FblDlq3tandHp0rsrTK
 sXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oxsorT/SAfQWdmcBKGyktYAKT3t0Yq+3DoKbdixN8RM=;
 b=UdaVXx93r91+j9fMLRfP+qxd9WW+WLdTqZlpj6uRZX4s6MdgmFYAmoDwANHZDmZOWU
 5FzGHcYmWAtOEgRWOqsUQlfYUmN2Aa2qGx0WpwycwQYRHpXuQvIA45aJg91J9KUBI561
 vhhGAjAdisaGr2nlcItAP/jliWDvG3ujS4hnJYlkkfvRKEsKXlCI8espnjOCnOacVB2f
 Dvk28ffFR5WDyatIlyn2icAj2mq6ZXCZXk38I7ezJRaoFkmk+lbPbZ5xQtTnHrDtnEp5
 CiyM9g6KSx0k/Al9TqYxFuwJGdyFl+FJV2fNVCqs4eeSJZK1akskBl6RioBtHULBToB2
 Egkw==
X-Gm-Message-State: AOUpUlHPkgkKsXBTsOA3myKzSk++8MTZP7FsK3/8+GTfd+XPPc2W4qc3
 SoE3vd7b7vW6OYXgRmwFvsvLxz5ilvBotXQjBpPOOGwx
X-Google-Smtp-Source: AAOMgpf6hPLic8LNx7PXPMZms5wejg/Y77cnHTPc83HAQOWufPESnCq2YbWYuMkl6qIgNuxsS1OQXod2OJCC2PRRZqo=
X-Received: by 2002:a02:6624:: with SMTP id
 k36-v6mr3336068jac.42.1532123061327; 
 Fri, 20 Jul 2018 14:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d481:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 14:44:20
 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Fri, 20 Jul 2018 16:44:20 -0500
Message-ID: <CAG5OiwiSut9OVp3sz25Jr9sjuvtV20DAMu9dg9vVOTxN9GmEmA@mail.gmail.com>
Subject: 7/19 OpenBMC Release Planning WG Meeting Minutes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d29c940571753290"
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
X-List-Received-Date: Fri, 20 Jul 2018 21:44:25 -0000

--000000000000d29c940571753290
Content-Type: text/plain; charset="UTF-8"

Thanks everyone, good meeting - let me know if I missed anything.

Agenda for the 26th will be here:

https://github.com/openbmc/openbmc/wiki/Release-Planning

Meeting minutes live here:

https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing

Kurt Taylor (krtaylor)


7/19/18

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

      *Andrew Geissler, IBM
      -

      Kun Yi, Google
      -

      Tao Ren, Facebook
      -

      Maury Zipse, IBM
      -

      Yugi Mani, Microsoft
      -

      *Nancy Yuen, Google
      -

      *Sai Dasari, Facebook
      -

      *James Mihm, Intel
      -

      *Dick Wilkins, Phoenix
      -

   Not attending
   -

      *Ali Larijani, Microsoft
      -

   Review of Agreements from previous meeting (see previous meeting minutes)
   -

   Work items spreadsheet update
   -

      Review of descriptions and ranking
      -

      Discussion to clarify the specific items, add descriptions
      -

   Milestones:
   -

      Design: Mid August
      -

      Code1: Mid September
      -

      Code2: End of October
      -

      Feature freeze: December 3, 2018
      -

      Release: January 21-25, 2019
      -

      Need better definition of what the release milestones are, what they
      are used for
      -

      Concern on the length of the feature freeze duration, Dec 3rd seems
      like too long, unfortunate timing over the holidays observed in December
      -

      Long discussion on release, freeze, branching
      -

      Agreement: 6 month release cycles
      -

      Agreement: 4 weeks before release for feature freeze milestone -
      feature merge complete
      -

      Backlog: Descriptions of milestones, documentation for release
      process agreements
      -

      Backlog: Do we need to move the release out a couple of weeks to move
      freeze past the beginning of the year?
      -

   Release process (master and stable branch)
   -

      Freeze and branch immediately so that development can continue, will
      docs/bugs/testing happen?
      -

      Freeze/test and then branch at release date to encourage all
      developers to test, fix and document - might facilitate a shorter merge
      freeze
      -

      Agreement: Wait until we get closer to the Freeze date to decide on
      the branching approach

--000000000000d29c940571753290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Thanks everyone, good meeting - let me know if I missed=
 anything.<br></p><p>Agenda for the 26th will be here:</p>
    <p><a class=3D"gmail-moz-txt-link-freetext" href=3D"https://github.com/=
openbmc/openbmc/wiki/Release-Planning">https://github.com/openbmc/openbmc/w=
iki/Release-Planning</a><br>
    </p>
    <p>Meeting minutes live here:<br>
    </p>
    <p><a class=3D"gmail-moz-txt-link-freetext" href=3D"https://docs.google=
.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=3Dsha=
ring">https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcd=
Ii1W7hAD5Y/edit?usp=3Dsharing</a></p>
    <p>Kurt Taylor (krtaylor)</p><p><br></p><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" id=3D"gmail-docs-internal-guid-=
9ce40598-b9a5-5396-f95c-a0c174625777"><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;fo=
nt-style:normal;font-variant:normal;text-decoration:underline;vertical-alig=
n:baseline;white-space:pre-wrap">7/19/18</span></p><ul style=3D"margin-top:=
0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre-wrap">Note: call in numbers and info may change freq=
uently for the next few weeks, please check your email before assuming the =
number is the same as last week</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Attended (*) Primary =
company contact </span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0=
pt"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">Kurt Taylor, IBM (WG lead)</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Brad Bishop, =
IBM</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre-wrap">*Andrew Geissler, IBM</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Kun=
 Yi, Google</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre-wrap">Tao Ren, Facebook</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"=
>Maury Zipse, IBM</span></p></li><li dir=3D"ltr" style=3D"list-style-type:c=
ircle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre-wrap">Yugi Mani, Microsoft</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre-wrap">*Nancy Yuen, Google</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">*Sai Dasari, Facebook=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">*James Mihm, Intel</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre-wrap">*Dick Wil=
kins, Phoenix</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Not attending</span></p></li><ul st=
yle=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-styl=
e-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap">*Ali Larijani, Microsoft</=
span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">Review of Agreements from previous meeting (see pr=
evious meeting minutes)</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre-wrap">Work items spreadsheet update<=
/span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"lt=
r" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Revie=
w of descriptions and ranking</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Discussion to clarify=
 the specific items, add descriptions</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre-wrap">Milestones:=
</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"l=
tr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Desi=
gn: Mid August</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circ=
le;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre-wrap">Code1: Mid September</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Code2: End of October</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Feature freeze: Decem=
ber 3, 2018</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre-wrap">Release: January 21-25, 2019</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">Need better definition of what the release milestones are, what=
 they are used for</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre-wrap">Concern on the length of the feat=
ure freeze duration, Dec 3rd seems like too long, unfortunate timing over t=
he holidays observed in December</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span sty=
le=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">Long discussion on =
release, freeze, branching</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre-wrap">Agreement</span><span sty=
le=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">: 6 month release c=
ycles</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:700;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre-wrap">Agreement</span><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre-wrap">: 4 weeks before release for feature fre=
eze milestone - feature merge complete</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:700;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Backlog</span=
><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre-wrap">: Descrip=
tions of milestones, documentation for release process agreements</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre-wrap">Backlog</span><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap">: Do we need to move the release out a couple of weeks to=
 move freeze past the beginning of the year?</span></p></li></ul><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Rele=
ase process (master and stable branch)</span></p></li><ul style=3D"margin-t=
op:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:circle;f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">Freeze and branch immediately so that dev=
elopment can continue, will docs/bugs/testing happen?</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap=
">Freeze/test and then branch at release date to encourage all developers t=
o test, fix and document - might facilitate a shorter merge freeze</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap">Agreement</span><span style=3D"font-size:11pt;font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre-wrap">: Wait until we get closer to the Freeze date to decid=
e on the branching approach</span></p></li></ul></ul></div>

--000000000000d29c940571753290--
