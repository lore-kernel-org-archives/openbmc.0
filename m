Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2b; helo=mail-yw1-xc2b.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJvOVEmu"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Sm6r4VPVzDqGW
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 07:28:18 +1100 (AEDT)
Received: by mail-yw1-xc2b.google.com with SMTP id j128so8062250ywg.12
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 13:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ha6MRGtr+Rda75z/wsKJqNHTWJACYYeJ7XJnOfAnBZc=;
 b=cJvOVEmua9NRyb68N1PZZkUL8kbDGV9CMOrVx3E8Riu3C/S/xkkfgz8DPsWtQ/zEqh
 8IWgP9bPm77r7SsMfCQX9nBPzJtj8mPQYW7WUYdFdhCKPzPS/+JIqnVAK84VBwo22oEG
 K2OjosFRjDpj2fSgGrbEwSTwKQh/Uvs84H1ORQaCgYVbfXPGcFLv/+gi1zI66YFKUOfF
 Ms5RdtMyKDDPdqWsTbZPn+z8K5EGj/NAY+/FWDXh4mERqME6JC6sNr6BI1o4WMwMN3CA
 TRamhKVJ2bbAcN/fyXUgp7a04Y+gH2e7adSYcj1QeSFQwSY835RqVALhDzhv/t0esbVm
 X94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ha6MRGtr+Rda75z/wsKJqNHTWJACYYeJ7XJnOfAnBZc=;
 b=Q4XYZC4CLOZPrv7gjFFSRsbh9gwhSPo7hB7D3J2Z3K/Z5U1kuAkGEDuxNt/fTkfuFZ
 U0ksxZk+fw+VtWYDUKUBmgG8N70dBHs4mwZjzdxystDqUDwM7/ti3ks95nXbdaSFQvrX
 9B3s9BLSWnlpQ32iKjxCFoRrc8wxFSf9CBhrwLaI4xAt13GGtEl9aJnbBS40UJJURYKp
 OYotyDS/IiSSkGqG6EaaeJZ/QY5wGgaWtqcOOz1weNcR2xdVJKnOYlf4LfpkC7E/v8t4
 fSMbXU4bTVdz7AEcSye6mN0hzKfy1wL8KNzAg5vQRtlr5waiIuvjABZr4Pc0DvXE3UrY
 Z33w==
X-Gm-Message-State: APjAAAW75q4c+Qe2edYQCsnmQa7lO8S7HyTLYIlHkGDupH8diy6tP5/3
 +tHl6+MdTVbhOWNosYUTHzgK+wohrybVOK4Po7xaXw0I
X-Google-Smtp-Source: APXvYqzAtnYg42ypE65V6BjkteADjXdONkKknnJ5EftWtLMQKMixcZ9Nljy00GNo9gk7ciuHJSFUduSJhRhLNrMJEvA=
X-Received: by 2002:a81:1693:: with SMTP id 141mr10218263yww.448.1553545694478; 
 Mon, 25 Mar 2019 13:28:14 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 25 Mar 2019 15:28:03 -0500
Message-ID: <CAMTupoQw2r=6DZ1FDh6iSeJF7SgQT0Uy20qFk22_bH_s5dJ98w@mail.gmail.com>
Subject: GUI Workgroup Notes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004304020584f10b8d"
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
X-List-Received-Date: Mon, 25 Mar 2019 20:28:21 -0000

--0000000000004304020584f10b8d
Content-Type: text/plain; charset="UTF-8"

Hello all,

Here are the notes from the GUI Workgroup meeting that took place last
Wednesday March 20th.

Attendees: Becca Shaw, Nicole Conser, Jandra Aranguren, Ryan Arnell, Appu
Puli, Rahul Maheshwari

Notes:
- IBM shared proposed designs for Network Settings. Current design
proposals can be viewed at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutliple_VLAN

- Discussed the time of the meeting. Concluded that changing it back to
7:30 AM CST would be best to accommodate for India and China geos.

- Discussed how companies share what they are working on in relation to the
GUI. Concluded that everything must be documented in an issue in the
phosphor repo (https://github.com/openbmc/phosphor-webui) so that everyone
is aware of what is being worked on at any given moment. This discussion
will be continued during the next session.

- Demonstrated how to use InVision to provide comments on wireframes (no
license needed to view/comment)

- Decided to share current firmware design proposals next meeting so that
people in China can also give their feedback. Current design proposals can
be viewed at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319006100_V2-1-_Firmware


The next workgroup meeting will be Wednesday, April 3rd. Please add any
items you wish to discuss to the agenda:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Best,
GUI Design Team

--0000000000004304020584f10b8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span s=
tyle=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-=
size:13.6px">Hello all,</span><div><span style=3D"background-color:transpar=
ent;color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberatio=
n Mono&quot;,Menlo,Courier,monospace;font-size:13.6px"><br></span></div><di=
v><span style=3D"background-color:transparent;color:rgb(36,41,46);font-fami=
ly:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monosp=
ace;font-size:13.6px">Here are the notes from the GUI Workgroup meeting tha=
t took place last Wednesday March 20th.=C2=A0</span></div><div><span style=
=3D"background-color:transparent;color:rgb(36,41,46);font-family:SFMono-Reg=
ular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size=
:13.6px"><br></span></div><div><span style=3D"background-color:transparent;=
color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mo=
no&quot;,Menlo,Courier,monospace;font-size:13.6px">Attendees:=C2=A0</span><=
span style=3D"background-color:transparent;font-family:SFMono-Regular,Conso=
las,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46)=
;font-size:13.6px">Becca Shaw, Nicole Conser, Jandra Aranguren, Ryan Arnell=
, Appu Puli,=C2=A0</span><span style=3D"background-color:transparent;font-f=
amily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,mon=
ospace;color:rgb(36,41,46);font-size:13.6px">Rahul Maheshwari</span></div><=
div><br></div><div><span style=3D"background-color:transparent;color:rgb(36=
,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Men=
lo,Courier,monospace;font-size:13.6px">Notes:=C2=A0</span></div><div><span =
style=3D"background-color:transparent;color:rgb(36,41,46);font-family:SFMon=
o-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font=
-size:13.6px">- IBM shared proposed designs for Network Settings.=C2=A0</sp=
an><span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&=
quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:13.6px">Curren=
t design proposals can be viewed at:=C2=A0</span><span style=3D"font-size:1=
3.6px;color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberat=
ion Mono&quot;,Menlo,Courier,monospace"><a href=3D"https://ibm.invisionapp.=
com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutliple_VLAN">https://ibm.i=
nvisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutliple_VLAN</a>=
</span></div><div><div><font color=3D"#24292e" face=3D"SFMono-Regular, Cons=
olas, Liberation Mono, Menlo, Courier, monospace"><span style=3D"font-size:=
13.6px"><br></span></font><div><span style=3D"background-color:transparent;=
font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Couri=
er,monospace;color:rgb(36,41,46);font-size:13.6px">- Discussed the time of =
the meeting. Concluded that changing it back to 7:30 AM=C2=A0</span><span s=
tyle=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-=
size:13.6px">CST would be best to accommodate for India and China geos.</sp=
an></div><div><span style=3D"background-color:transparent;font-family:SFMon=
o-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;colo=
r:rgb(36,41,46);font-size:13.6px"><br></span></div><div><span style=3D"back=
ground-color:transparent;font-family:SFMono-Regular,Consolas,&quot;Liberati=
on Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-size:13.6px"=
>- Discussed how companies share what they are working on in relation to th=
e GUI.=C2=A0</span><span style=3D"background-color:transparent;font-family:=
SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace=
;color:rgb(36,41,46);font-size:13.6px">Concluded that everything must be do=
cumented in an issue in the phosphor repo=C2=A0</span><span style=3D"backgr=
ound-color:transparent;font-family:SFMono-Regular,Consolas,&quot;Liberation=
 Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-size:13.6px">(=
<a href=3D"https://github.com/openbmc/phosphor-webui">https://github.com/op=
enbmc/phosphor-webui</a>) so that everyone is aware of what=C2=A0</span><sp=
an style=3D"background-color:transparent;font-family:SFMono-Regular,Consola=
s,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);f=
ont-size:13.6px">is being worked on at any given moment. This discussion wi=
ll be continued during the next session.=C2=A0</span></div><div><span style=
=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&quot;=
Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-size=
:13.6px"><br></span></div><div><span style=3D"background-color:transparent;=
font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Couri=
er,monospace;color:rgb(36,41,46);font-size:13.6px">- Demonstrated how to us=
e InVision to provide comments on wireframes (no license needed to view/com=
ment)</span></div><div><span style=3D"background-color:transparent;font-fam=
ily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monos=
pace;color:rgb(36,41,46);font-size:13.6px"><br></span></div><div><span styl=
e=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&quot=
;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-siz=
e:13.6px">- Decided to share current firmware design proposals next meeting=
 so that people=C2=A0</span><span style=3D"background-color:transparent;fon=
t-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,=
monospace;color:rgb(36,41,46);font-size:13.6px">in China can also give thei=
r feedback. Current design proposals can be viewed at:=C2=A0</span><font co=
lor=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, Menlo, C=
ourier, monospace"><span style=3D"font-size:13.6px"><a href=3D"https://ibm.=
invisionapp.com/share/RQNYHJ0VBDY#/319006100_V2-1-_Firmware">https://ibm.in=
visionapp.com/share/RQNYHJ0VBDY#/319006100_V2-1-_Firmware</a></span></font>=
</div></div></div><div><span style=3D"background-color:transparent;font-fam=
ily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monos=
pace;color:rgb(36,41,46);font-size:13.6px"><br></span></div><div><span styl=
e=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&quot=
;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-siz=
e:13.6px"><br></span></div><div><span style=3D"background-color:transparent=
;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Cour=
ier,monospace;color:rgb(36,41,46);font-size:13.6px">The next workgroup meet=
ing will be Wednesday, April 3rd. Please add any items you wish to discuss =
to the agenda:=C2=A0</span><font color=3D"#24292e" face=3D"SFMono-Regular, =
Consolas, Liberation Mono, Menlo, Courier, monospace"><span style=3D"font-s=
ize:13.6px"><a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-w=
ork-group">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a=
></span></font></div><div><span style=3D"background-color:transparent;font-=
family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,mo=
nospace;color:rgb(36,41,46);font-size:13.6px"><br></span></div><div><span s=
tyle=3D"background-color:transparent;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41,46);font-=
size:13.6px"><br></span></div><div><span style=3D"background-color:transpar=
ent;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,C=
ourier,monospace;color:rgb(36,41,46);font-size:13.6px">Best,</span></div><d=
iv><span style=3D"background-color:transparent;font-family:SFMono-Regular,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,41=
,46);font-size:13.6px">GUI Design Team=C2=A0</span></div></div></div></div>=
</div>

--0000000000004304020584f10b8d--
