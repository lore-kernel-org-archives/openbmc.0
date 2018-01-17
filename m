Return-Path: <emilyshaffer@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::22f; helo=mail-wr0-x22f.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tG7eFswS"; 
 dkim-atps=neutral
Received: from mail-wr0-x22f.google.com (mail-wr0-x22f.google.com
 [IPv6:2a00:1450:400c:c0c::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMNL14S2PzF0WN
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 10:18:00 +1100 (AEDT)
Received: by mail-wr0-x22f.google.com with SMTP id 100so20670866wrb.7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7iaLljtxLPRraZ8t+kpDOzDTBpudhoALaG6H60gfuUk=;
 b=tG7eFswSKf1U1jYtdyo5G3PJNA0L0bPkZC2aHJkQ0ZJiFImdKXftxKF+TY+hnA7RGq
 498elKXrq3X4AyvrdQKjLgoFZYZcA2nRln4swWaqLttoSe/n4n44fZmfEN7rgmeLEDjb
 OvAyw6/JT4hCN9DxMgNm14ct5mo5HTKolJ5sFVv4w/F7SWlLpVUS16qgeyn8XQyZkaRq
 u9Y6xJo4Pqf1jh+97pcI30ggBnu4lPLJhYJGzCKX3FW6YK2jUekWrzzhlHUol1Elr97H
 SZXpK2XU7QUFc8L4m3Jp3Jd6/voG51Gp+ok5Ro6Vuq7pEnm+f4VCZ8K71YsfP8JVptsU
 a+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7iaLljtxLPRraZ8t+kpDOzDTBpudhoALaG6H60gfuUk=;
 b=nJMJ+05nRTFTp0vEngY1qLkJ+/RTF6a/it9Vc+n9vpW93U9ZvZSTS5K6vdonBANi/O
 SSHyAJNFgjUluUgb4fxGeuSCvIiGCeQEJ7PgW/21veGu0wQoQhRZ9UEcl08Q4VzJ2tmK
 hvkipFXaHh+hHme+acj5IQQ4BW8aR3ALEgopiCt3aTz25Xz9D6DNPmUKkBkF6uUgBrOh
 8c5rngX+fi8Zm5JCiCDjRg1r2N8bBvadzSCW6AAG1N1IPXsWjtK6spicg/QciE9uSewE
 IZ6knn78qvbHfg1WKCfK3avj7/MVayoHt+SiX22Rft/k2tO6GNV8agkf+ixSPbm4r/+l
 19ww==
X-Gm-Message-State: AKwxytfT/wvGoxgdmoeUp15+kgOjXdf1rMZSiZsrt0l6WOrIyaMlkDm4
 DAN/blLSsl7qt6MPFrtVacoxalsZTXWKF4RUV0bLuMz+
X-Google-Smtp-Source: ACJfBouD4xZRZH0xVkYcFatk0A5d1mktxXzpzxyGOBxcE+9I9n8ConuHyald8idkHibkoKmKYHnylqKIlC87jEQ+Fmk=
X-Received: by 10.223.157.20 with SMTP id k20mr3906984wre.275.1516231076736;
 Wed, 17 Jan 2018 15:17:56 -0800 (PST)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 17 Jan 2018 23:17:45 +0000
Message-ID: <CAJoAoZm0kXUcxqg1XnLL2ALAC715q_+Q+o-p23t97yXXE+pi9w@mail.gmail.com>
Subject: IPMI Maintainer Call Notes - 1/16/2018
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f403043893bcba449f0563010ea9"
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
X-List-Received-Date: Wed, 17 Jan 2018 23:18:03 -0000

--f403043893bcba449f0563010ea9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meeting: 1/16/2018

Attendees: Emily, Tom, Vernon

Agenda:

   -

   Discuss how to share IPMI stack review practices with community: 48 hour
   minimum review soak, =E2=85=94 maintainer approvals, how and when to ini=
tiate
   design discussions
   -

      Add README to cover communication channels
      -

      README should include testing guidelines. (Do we need a Tested: line,
      or do we need new unit tests included with commit, or=E2=80=A6?)
      -

      Net-ipmid has infrastructure for unit tests
      -

      Host-ipmid maybe works with make check - Emily will look into it
      -

      Robot test cases for new commands - ideally, committers adding new
      commands should also add robot cases.
      -

      New command: parse input, dbus calls, response. All via ipmitool
      -

      Robot test is run nightly(ish) vs master. And is run against internal
      IBM releases. Exercises REST and IPMI. Stored [
      https://github.com/openbmc/openbmc-test-automation]
      -

      If we could already have an easy howto for writing new commands, or
      example test, then it=E2=80=99s easy to require that as a part of com=
mit.
      -

      As maintainers, we should try to find time to add sample tests.
      -

      Decision: *New commands should have written test included (robot or
      unit), maintainers should make time to add test suite for people
to use as
      example*


   -

   Cover goals for 2018 (what needs to be implemented)
   -

      IBM: Entire standard by end of Q1. DCMI spec - all mandatory commands
      (or close). SDR support needs to be expanded - virtual, hardware sens=
ors;
      FRU records (fru print, sdr list, sensor list). Planning to build on
      existing SDR work. IBM also interested in IPMI user management (but l=
ower
      priority) - IPMI password instead of default account/default pw; user
      should be able to change pw.  Mostly missing mandatory commands.
      -

      Intel: Sensor/fru/sdr needs - already written, pushing soon!
      Interface changes to support min/max/etc - sensors automatically prob=
ed
      based on FRU API=E2=80=A6 SDRs automatically generated from sensor co=
nfig over
      dbus. Works with ipmitool sensor list. FRU API on DBus that everyone =
will
      conform with. Chassis probe, json load, expansion probe, =E2=80=A6.
Possible it=E2=80=99ll
      go to Intel fork so we can see it. Working on networking IPMI command=
s,
      get/set network parameters (LAN config), trying to fill out as
much of the
      spec as possible.  Either refactoring or adding more functionality. A=
lso
      have effort on user management [doc change here]. Very interested in
      refactor effort. Firmware update work (eventually) - figuring out whi=
ch
      standard to use. Both in-band and out-of-band - let=E2=80=99s get
everyone on same
      page
      -

      Google: FRUs.  Entity association record (p536) - SDR. Voltage
      regulator (08h).  (Possibly talk to James Feist about whether
he=E2=80=99s done it
      already.)
      -

   Discuss existing design flaws and potential refactor efforts
   -

      SDR infrastructure.  Vernon had mentioned autogenerated SDR @ Intel.
      Based on probing FRU to find which groups of sensors exist.
Based on that,
      there=E2=80=99s a JSON file with those sensors=E2=80=99 configs. Syst=
ems are in
      configuration groups based on card that=E2=80=99s present or not.  A =
device tree
      overlay call happens for hwmon sensors and a scanning daemon is
started for
      each group (on first boot).  Vernon, get Ed & James to put this
into Intel
      public fork so we can look at it.  FRUs detected by BMC.  Base FRU in
      flash, other FRUs discovered over DBus? Write own FRU parser as neces=
sary
      for own FRU format.  IBM gets FRU location info from hostboot pushed =
over
      IPMI.  BMC can store FRU format info if it ever shows up from
hostboot, so
      it will work with hostboot as source of truth or BMC as source of tru=
th.
      Maybe James F can talk about it on community telecom.
      -

      Getting rid of sdbus -> move to sdbusplus (inline with OpenBMC effort
      project-wide)
      -

      Split network ipmid into network daemon to network & dbus (similar to
      btbridged) - do we want to then keep both IPMI daemons, or note which
      bridge sourced the request and handle it based on that. Security
concern -
      network is attack vector, minimize how much network comm can touch.
      Running network daemon as user with few permissions/access is safer -=
 if
      it=E2=80=99s compromised, still no risk.  Inline with effort to make =
all daemons
      nonroot (except systemd).  Inline with SELinux talk from
hackathon - maybe
      we can get some guidance from Dell. Separating daemons into users is
      orthogonal but still helpful
      -

   Determine best way for asynchronous communication between the three of
   us.
   -

      Email good for people during work hours, or for extended
      conversations.  Riot good for pings, high-priority small things. No
      frivolous communication on Riot (since we get notifications)
      -

   Do we want to communicate result of these maintainer meetings??
   -

      Send an email with the governance info for commits etc.  Emily will
      ping Brad and find out how much information to share

--f403043893bcba449f0563010ea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"inbox-inbox-docs-internal-guid-b75fb513-0666-9=
cb0-ddfa-d743cc8fafcb"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">Meeting: 1/16/2018</=
span></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Attendees: Emily, Tom, Vernon</span></p><br><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">Agenda:</span></p><ul style=3D"margin-top:0pt=
;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Discuss how to share IPMI stack review practices with comm=
unity: 48 hour minimum review soak, =E2=85=94 maintainer approvals, how and=
 when to initiate design discussions</span></p></li><ul style=3D"margin-top=
:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre-wrap">Add README to cover communication channels</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">README should include testing guidelines. (Do we need a Tested: line, or=
 do we need new unit tests included with commit, or=E2=80=A6?)</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
Net-ipmid has infrastructure for unit tests</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Host-ipmid maybe wo=
rks with make check - Emily will look into it</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">Robot test cases =
for new commands - ideally, committers adding new commands should also add =
robot cases.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">New command: parse input, dbus calls, response. Al=
l via ipmitool</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">Robot test is run nightly(ish) vs master. And is=
 run against internal IBM releases. Exercises REST and IPMI. Stored [<a hre=
f=3D"https://github.com/openbmc/openbmc-test-automation">https://github.com=
/openbmc/openbmc-test-automation</a>]</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">If we could already have=
 an easy howto for writing new commands, or example test, then it=E2=80=99s=
 easy to require that as a part of commit.</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">As maintainers, we s=
hould try to find time to add sample tests.</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Decision: *New comm=
ands should have written test included (robot or unit), maintainers should =
make time to add test suite for people to use as example*</span></p></li></=
ul></ul><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Cover goals for 2018 (w=
hat needs to be implemented)</span></p></li><ul style=3D"margin-top:0pt;mar=
gin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">IBM: Entire standard by end of Q1. DCMI spec - all mandatory c=
ommands (or close). SDR support needs to be expanded - virtual, hardware se=
nsors; FRU records (fru print, sdr list, sensor list). Planning to build on=
 existing SDR work. IBM also interested in IPMI user management (but lower =
priority) - IPMI password instead of default account/default pw; user shoul=
d be able to change pw.=C2=A0 Mostly missing mandatory commands.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Intel: Sensor/fru/sdr needs - already written, pushing soon! Interface c=
hanges to support min/max/etc - sensors automatically probed based on FRU A=
PI=E2=80=A6 SDRs automatically generated from sensor config over dbus. Work=
s with ipmitool sensor list. FRU API on DBus that everyone will conform wit=
h. Chassis probe, json load, expansion probe, =E2=80=A6. Possible it=E2=80=
=99ll go to Intel fork so we can see it. Working on networking IPMI command=
s, get/set network parameters (LAN config), trying to fill out as much of t=
he spec as possible.=C2=A0 Either refactoring or adding more functionality.=
 Also have effort on user management [doc change here]. Very interested in =
refactor effort. Firmware update work (eventually) - figuring out which sta=
ndard to use. Both in-band and out-of-band - let=E2=80=99s get everyone on =
same page</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Google: FRUs.=C2=A0 Entity association record (p536) =
- SDR. Voltage regulator (08h). =C2=A0(Possibly talk to James Feist about w=
hether he=E2=80=99s done it already.)</span></p></li></ul><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">Discuss existing des=
ign flaws and potential refactor efforts</span></p></li><ul style=3D"margin=
-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">SDR infrastructure.=C2=A0 Vernon had mentioned aut=
ogenerated SDR @ Intel.=C2=A0 Based on probing FRU to find which groups of =
sensors exist.=C2=A0 Based on that, there=E2=80=99s a JSON file with those =
sensors=E2=80=99 configs. Systems are in configuration groups based on card=
 that=E2=80=99s present or not.=C2=A0 A device tree overlay call happens fo=
r hwmon sensors and a scanning daemon is started for each group (on first b=
oot).=C2=A0 Vernon, get Ed &amp; James to put this into Intel public fork s=
o we can look at it.=C2=A0 FRUs detected by BMC.=C2=A0 Base FRU in flash, o=
ther FRUs discovered over DBus? Write own FRU parser as necessary for own F=
RU format.=C2=A0 IBM gets FRU location info from hostboot pushed over IPMI.=
=C2=A0 BMC can store FRU format info if it ever shows up from hostboot, so =
it will work with hostboot as source of truth or BMC as source of truth.=C2=
=A0 Maybe James F can talk about it on community telecom. </span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Gett=
ing rid of sdbus -&gt; move to sdbusplus (inline with OpenBMC effort projec=
t-wide)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Split network ipmid into network daemon to network &amp=
; dbus (similar to btbridged) - do we want to then keep both IPMI daemons, =
or note which bridge sourced the request and handle it based on that. Secur=
ity concern - network is attack vector, minimize how much network comm can =
touch.=C2=A0 Running network daemon as user with few permissions/access is =
safer - if it=E2=80=99s compromised, still no risk.=C2=A0 Inline with effor=
t to make all daemons nonroot (except systemd).=C2=A0 Inline with SELinux t=
alk from hackathon - maybe we can get some guidance from Dell. Separating d=
aemons into users is orthogonal but still helpful</span></p></li></ul><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Determ=
ine best way for asynchronous communication between the three of us.</span>=
</p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Email good for people =
during work hours, or for extended conversations.=C2=A0 Riot good for pings=
, high-priority small things. No frivolous communication on Riot (since we =
get notifications)</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Do we want to communicate result of the=
se maintainer meetings??</span></p></li><ul style=3D"margin-top:0pt;margin-=
bottom:0pt"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">Send an email with the governance info for commits etc.=C2=A0 Emil=
y will ping Brad and find out how much information to share</span></p></li>=
</ul></ul></span></div>

--f403043893bcba449f0563010ea9--
