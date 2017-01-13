Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0F3L1YMYzDqWR
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 18:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uq0/Pq6K"; 
 dkim-atps=neutral
Received: by mail-qt0-x232.google.com with SMTP id v23so40641017qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9PtSE6Wu8F3roE29lJaTYWzByffxyAkXOv94L5GwXzY=;
 b=uq0/Pq6K+Rc9LpKdSune5CPcIZTySjlNpdxpYtDgve9/lXFKrBboNa2srxk1t/mf/j
 6tCdKdPBdnNmSE0chwUa3Mk06kzUk8d3pA/vVkkGFhk9z6H61owaE4Vbs468ag47Aqwm
 oJAXslOMRnSybRGRSYK/rnQk13OMl5/5gkknfzs3a2F1JyjNfBKBnxiCwFDs1Rg5iksn
 PGKBffdvOR1G7MHncdsxlXxbjz4/JGO3yZknbnjQyTZi1W5ejbKTIC29pb2Utym8cey2
 qwSTbxylEbpvNh2ZbwZS5mroWxDG3Strd7m6hXTjb2WG+3NHGG8O7EwVCF8VbBf/8lq1
 bp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9PtSE6Wu8F3roE29lJaTYWzByffxyAkXOv94L5GwXzY=;
 b=Q8f0o8vKyJmkfLdLxkuLR4s4CvUG99wPZaeCAvKaNcjWjdo14nYX3SI0jtlkbogsqr
 hRcXnU5O4PMtPstsQGr1+g4tDmnzwF6vCS0zM7xQWF9pjOL6w20OMu7MiT6wQcmUAC9o
 ssg1yoMAj+5px45sBeteVAKMqDkWsQjziTm0kw7Qb3afN8J98qIKsJBvaD5VyysjDrRz
 UvSObexyc/fqAdrOknleHk0AWEI0Fs6LnBRr6vQ3o+KGQO7drhDaaf6/rTwwZoqipM8s
 Pp1shP+zPk/Zck2T0O2nZdpPlDX7wJ7fgzY0m3l3GFF/GnmAZ6w7oF9FUHXmtWSTZVsJ
 LYng==
X-Gm-Message-State: AIkVDXJHxDTAmVH8HLkzUhuT7c/arEYbPNF3Q8t9I0QXhkZD90TxjVqTxIIBKWQAO1Pv7HhFrbK0N60EsMv7uA==
X-Received: by 10.200.1.2 with SMTP id e2mr4610979qtg.142.1484293371263; Thu,
 12 Jan 2017 23:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Thu, 12 Jan 2017 23:42:50 -0800 (PST)
From: Mine <mine260309@gmail.com>
Date: Fri, 13 Jan 2017 15:42:50 +0800
Message-ID: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
Subject: RFC: new design of phosphor-time-manager on sdbusplus
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045f39e42300d60545f4fb41
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
X-List-Received-Date: Fri, 13 Jan 2017 07:42:55 -0000

--f403045f39e42300d60545f4fb41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I=E2=80=99d like to discuss the design of phosphor-time-manager with the ne=
w
sdbusplus interfaces.

Please see below background and new design, let me know if you have any
comments.
Thanks!
Background

Legacy time-manager expose below interfaces and methods:

   - curr_time_mode
   - curr_time_owner
   - requested_time_mode
   - requested_time_owner
   - GetTime(target)
   - SetTime(target, time)

The implementation of Get/SetTime() will check the current time mode and
owner, and do below:

   - For GetTime(<target>):
      - If target is =E2=80=9Cbmc=E2=80=9D, return BMC time;
      - If target is =E2=80=9Chost=E2=80=9D, return Host time;
      - Else, return error
   - For SetTime(target, time):
      - If target is =E2=80=9Cbmc=E2=80=9D:
         - If mode is NTP, return error
         - If owner is =E2=80=9CHOST=E2=80=9D, return error
         - Set BMC time
      - If target is =E2=80=9Chost=E2=80=9D:
         - If owner is =E2=80=9CBMC=E2=80=9D, return error
         - Set Host time
         - If owner is =E2=80=9CSPLIT=E2=80=9D, save the diff between BMC t=
ime and Host
         time;

New Design

Now with sdbusplus, we have EpochTime interface, with elapsed property.

After discussion with Li Yi and Vishwa, we decided to implement as below:

Create two objects:

   - BmcEpoch
   - HostEpoch

They both implements EpochTime interface.

For BmcEpoch:

   - When elapsed() is called, return BMC time;
   - When elapsed(us) is called, use above SetTime(=E2=80=9Cbmc=E2=80=9D) l=
ogic

For HostEpoch:

   - When elapsed() is called, return HOST time;
   - When elapsed(us) is called, use above SetTime(=E2=80=9Chost=E2=80=9D) =
logic.

And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or =E2=80=9Creq=
uested_time_mode/owner=E2=80=9D
properties on DBUS.

--
BRs,
Lei YU

--f403045f39e42300d60545f4fb41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"outline:none;color:rgb(18,18,18);font-family:a=
rial,helvetica,sans-serif;font-size:14px;margin:0px 0px 1.2em">I=E2=80=99d =
like to discuss the design of=C2=A0<code style=3D"outline:none;font-size:0.=
85em;font-family:consolas,inconsolata,courier,monospace;margin:0px 0.15em;p=
adding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);bac=
kground-color:rgb(248,248,248);border-radius:3px;display:inline">phosphor-t=
ime-manager</code>=C2=A0with the new sdbusplus interfaces.</p><p style=3D"o=
utline:none;color:rgb(18,18,18);font-family:arial,helvetica,sans-serif;font=
-size:14px;margin:0px 0px 1.2em">Please see below background and new design=
, let me know if you have any comments.<br>Thanks!</p><h3 id=3D"gmail-backg=
round" style=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetic=
a,sans-serif;margin:1.3em 0px 1em;padding:0px;font-size:1.3em">Background</=
h3><p style=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetica=
,sans-serif;font-size:14px;margin:0px 0px 1.2em">Legacy time-manager expose=
 below interfaces and methods:</p><ul style=3D"outline:none;color:rgb(18,18=
,18);font-family:arial,helvetica,sans-serif;font-size:14px;margin:1.2em 0px=
;padding-left:2em"><li style=3D"outline:none;margin:0.5em 0px">curr_time_mo=
de</li><li style=3D"outline:none;margin:0.5em 0px">curr_time_owner</li><li =
style=3D"outline:none;margin:0.5em 0px">requested_time_mode</li><li style=
=3D"outline:none;margin:0.5em 0px">requested_time_owner</li><li style=3D"ou=
tline:none;margin:0.5em 0px">GetTime(target)</li><li style=3D"outline:none;=
margin:0.5em 0px">SetTime(target, time)</li></ul><p style=3D"outline:none;c=
olor:rgb(18,18,18);font-family:arial,helvetica,sans-serif;font-size:14px;ma=
rgin:0px 0px 1.2em">The implementation of=C2=A0<code style=3D"outline:none;=
font-size:0.85em;font-family:consolas,inconsolata,courier,monospace;margin:=
0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,=
234,234);background-color:rgb(248,248,248);border-radius:3px;display:inline=
">Get/SetTime()</code>=C2=A0will check the current time mode and owner, and=
 do below:</p><ul style=3D"outline:none;color:rgb(18,18,18);font-family:ari=
al,helvetica,sans-serif;font-size:14px;margin:1.2em 0px;padding-left:2em"><=
li style=3D"outline:none;margin:0.5em 0px">For=C2=A0<code style=3D"outline:=
none;font-size:0.85em;font-family:consolas,inconsolata,courier,monospace;ma=
rgin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb=
(234,234,234);background-color:rgb(248,248,248);border-radius:3px;display:i=
nline">GetTime(&lt;target&gt;)</code>:<ul style=3D"outline:none;margin:0px;=
padding-left:1em"><li style=3D"outline:none;margin:0.5em 0px">If target is =
=E2=80=9Cbmc=E2=80=9D, return BMC time;</li><li style=3D"outline:none;margi=
n:0.5em 0px">If target is =E2=80=9Chost=E2=80=9D, return Host time;</li><li=
 style=3D"outline:none;margin:0.5em 0px">Else, return error</li></ul></li><=
li style=3D"outline:none;margin:0.5em 0px">For=C2=A0<code style=3D"outline:=
none;font-size:0.85em;font-family:consolas,inconsolata,courier,monospace;ma=
rgin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb=
(234,234,234);background-color:rgb(248,248,248);border-radius:3px;display:i=
nline">SetTime(target, time)</code>:<ul style=3D"outline:none;margin:0px;pa=
dding-left:1em"><li style=3D"outline:none;margin:0.5em 0px">If target is =
=E2=80=9Cbmc=E2=80=9D:<ul style=3D"outline:none;margin:0px;padding-left:1em=
"><li style=3D"outline:none;margin:0.5em 0px">If mode is NTP, return error<=
/li><li style=3D"outline:none;margin:0.5em 0px">If owner is =E2=80=9CHOST=
=E2=80=9D, return error</li><li style=3D"outline:none;margin:0.5em 0px">Set=
 BMC time</li></ul></li><li style=3D"outline:none;margin:0.5em 0px">If targ=
et is =E2=80=9Chost=E2=80=9D:<ul style=3D"outline:none;margin:0px;padding-l=
eft:1em"><li style=3D"outline:none;margin:0.5em 0px">If owner is =E2=80=9CB=
MC=E2=80=9D, return error</li><li style=3D"outline:none;margin:0.5em 0px">S=
et Host time</li><li style=3D"outline:none;margin:0.5em 0px">If owner is =
=E2=80=9CSPLIT=E2=80=9D, save the diff between BMC time and Host time;</li>=
</ul></li></ul></li></ul><h3 id=3D"gmail-new-design" style=3D"outline:none;=
color:rgb(18,18,18);font-family:arial,helvetica,sans-serif;margin:1.3em 0px=
 1em;padding:0px;font-size:1.3em">New Design</h3><p style=3D"outline:none;c=
olor:rgb(18,18,18);font-family:arial,helvetica,sans-serif;font-size:14px;ma=
rgin:0px 0px 1.2em">Now with sdbusplus, we have EpochTime interface, with=
=C2=A0<code style=3D"outline:none;font-size:0.85em;font-family:consolas,inc=
onsolata,courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:=
pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,248=
);border-radius:3px;display:inline">elapsed</code>=C2=A0property.</p><p sty=
le=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetica,sans-ser=
if;font-size:14px;margin:0px 0px 1.2em">After discussion with Li Yi and Vis=
hwa, we decided to implement as below:</p><p style=3D"outline:none;color:rg=
b(18,18,18);font-family:arial,helvetica,sans-serif;font-size:14px;margin:0p=
x 0px 1.2em">Create two objects:</p><ul style=3D"outline:none;color:rgb(18,=
18,18);font-family:arial,helvetica,sans-serif;font-size:14px;margin:1.2em 0=
px;padding-left:2em"><li style=3D"outline:none;margin:0.5em 0px"><code styl=
e=3D"outline:none;font-size:0.85em;font-family:consolas,inconsolata,courier=
,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:=
1px solid rgb(234,234,234);background-color:rgb(248,248,248);border-radius:=
3px;display:inline">BmcEpoch</code></li><li style=3D"outline:none;margin:0.=
5em 0px"><code style=3D"outline:none;font-size:0.85em;font-family:consolas,=
inconsolata,courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-spa=
ce:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,=
248);border-radius:3px;display:inline">HostEpoch</code></li></ul><p style=
=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetica,sans-serif=
;font-size:14px;margin:0px 0px 1.2em">They both implements EpochTime interf=
ace.</p><p style=3D"outline:none;color:rgb(18,18,18);font-family:arial,helv=
etica,sans-serif;font-size:14px;margin:0px 0px 1.2em">For=C2=A0<code style=
=3D"outline:none;font-size:0.85em;font-family:consolas,inconsolata,courier,=
monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1=
px solid rgb(234,234,234);background-color:rgb(248,248,248);border-radius:3=
px;display:inline">BmcEpoch</code>:</p><ul style=3D"outline:none;color:rgb(=
18,18,18);font-family:arial,helvetica,sans-serif;font-size:14px;margin:1.2e=
m 0px;padding-left:2em"><li style=3D"outline:none;margin:0.5em 0px">When=C2=
=A0<code style=3D"outline:none;font-size:0.85em;font-family:consolas,incons=
olata,courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre=
-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,248);b=
order-radius:3px;display:inline">elapsed()</code>=C2=A0is called, return BM=
C time;</li><li style=3D"outline:none;margin:0.5em 0px">When=C2=A0<code sty=
le=3D"outline:none;font-size:0.85em;font-family:consolas,inconsolata,courie=
r,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border=
:1px solid rgb(234,234,234);background-color:rgb(248,248,248);border-radius=
:3px;display:inline">elapsed(us)</code>=C2=A0is called, use above SetTime(=
=E2=80=9Cbmc=E2=80=9D) logic</li></ul><p style=3D"outline:none;color:rgb(18=
,18,18);font-family:arial,helvetica,sans-serif;font-size:14px;margin:0px 0p=
x 1.2em">For=C2=A0<code style=3D"outline:none;font-size:0.85em;font-family:=
consolas,inconsolata,courier,monospace;margin:0px 0.15em;padding:0px 0.3em;=
white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb=
(248,248,248);border-radius:3px;display:inline">HostEpoch</code>:</p><ul st=
yle=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetica,sans-se=
rif;font-size:14px;margin:1.2em 0px;padding-left:2em"><li style=3D"outline:=
none;margin:0.5em 0px">When=C2=A0<code style=3D"outline:none;font-size:0.85=
em;font-family:consolas,inconsolata,courier,monospace;margin:0px 0.15em;pad=
ding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);backg=
round-color:rgb(248,248,248);border-radius:3px;display:inline">elapsed()</c=
ode>=C2=A0is called, return HOST time;</li><li style=3D"outline:none;margin=
:0.5em 0px">When=C2=A0<code style=3D"outline:none;font-size:0.85em;font-fam=
ily:consolas,inconsolata,courier,monospace;margin:0px 0.15em;padding:0px 0.=
3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color=
:rgb(248,248,248);border-radius:3px;display:inline">elapsed(us)</code>=C2=
=A0is called, use above SetTime(=E2=80=9Chost=E2=80=9D) logic.</li></ul><p =
style=3D"outline:none;color:rgb(18,18,18);font-family:arial,helvetica,sans-=
serif;font-size:14px;margin:0px 0px 1.2em">And there will be no =E2=80=9Ccu=
rr_time_mode/owner=E2=80=9D or =E2=80=9Crequested_time_mode/owner=E2=80=9D =
properties on DBUS.</p><p style=3D"outline:none;color:rgb(18,18,18);font-fa=
mily:arial,helvetica,sans-serif;font-size:14px;margin:0px 0px 1.2em">--<br>=
BRs,<br>Lei YU</p></div>

--f403045f39e42300d60545f4fb41--
