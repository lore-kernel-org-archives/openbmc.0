Return-Path: <venture@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHYJ423lvzDq9m
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 06:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NJL21+/u"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id q20so2593733pfg.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dMcjM64+g8iMdpMtO6qUxtoK5gJf3X7b/Qdty4Ojbzw=;
 b=NJL21+/uJfLKpSKvfSgy1xUP9bFlU03rw20iTQyone8pyByzpq6MetIqU7FzluEUNP
 7B2g9+LpbdUoWitEsi5Z12FpfbtXzZq4xdNf1JYi9Auv1/ot7Yy+6qVdSr/f/FJ2axfi
 uwaId0Bih+680MJh7ANue1z8g6vZsWEirSVgJWXSY0FqFHHtYs1svMEDZ3lyReK0ijNa
 e7LzO3/O2Tah1jrIt01wmUB5zz2DMaylvP4H/Plu4jbDrUD3sgj9+Ips0ri+RSwFq8YP
 Snpf9geFzD9q7MWBspN+z/bq+6PZUSXHE/AbchtaigzimSxcJxsbNXekk/2zeUdCndKj
 QzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dMcjM64+g8iMdpMtO6qUxtoK5gJf3X7b/Qdty4Ojbzw=;
 b=lhVSvs1fqt54O5vOfb4qFcpORHH1WNkv7XbXk5hwCIp3PjM4Zi64LpFRE9WvROmpyD
 Y5cxvSDBaCKmsbvObEXN3uSxPc5mKI0h+xw5LNiQ2iDeq6vFFqMIcfEYhwmxoaICoC7e
 Lyfo1RzP4KpXEpJmp8bkgwKze9EU7D5XFqQpNNQfauLvrDXcL5x2aQ4wQL5nIcpERWfA
 BbG/mTTjypYdFIWDd4qsL3fEfoOFroFtXOsez7CfqhPzahpOersHyH5Ky8H0KCoBpU/f
 REHHob/uLAkHEF6AZ9INEH5QyyWMCpFRSpTyQLFrv5ONneTZEjFvsDt0AF6oX/oPS303
 IEBQ==
X-Gm-Message-State: AN3rC/6jxjHZBFSS3FPV11THTkqy7ldLHT30K+zegriwqWW9uT1jQxp4
 o5hn+8ra2yBw0fANgX1HTwVTdcVsAi5l
X-Received: by 10.84.229.78 with SMTP id d14mr13164084pln.15.1493758032943;
 Tue, 02 May 2017 13:47:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Tue, 2 May 2017 13:46:52 -0700 (PDT)
In-Reply-To: <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
 <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
 <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
 <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 2 May 2017 13:46:52 -0700
Message-ID: <CAO=notwxa-qD-fJG33s2DsVHOE0NpQQCs4MdJD-dUB8Kj3o4Mg@mail.gmail.com>
Subject: Re: OpenBMC Thermal Design
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=94eb2c1cb35aef592d054e90a41f
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
X-List-Received-Date: Tue, 02 May 2017 20:47:16 -0000

--94eb2c1cb35aef592d054e90a41f
Content-Type: text/plain; charset=UTF-8

Just to give some details, the present design is as follows:
- A zone is a group of fans controlled independently.
 -- The configuration specifies the inputs to the PID loops. -- each loop
takes an input and a goal, and outputs an RPM to achieve the goal.  (the
loop input can be the margin)
 -- The PID loops all feed into a maximum function which then feeds a fan
PID loop that tweaks the duty cycles as write and reads the fan tachs back
until it's where it needs to be.

So we'll be dynamically building a list of PIDs to run and drive the output
for controlling the fans.

Patrick

On Tue, May 2, 2017 at 12:33 PM, Patrick Venture <venture@google.com> wrote:

> Please elaborate on the format or layout of the control configuration file.
> Please elaborate on the mechanism planned to import it into code?  Y'all
> often use python programs to make c++, will that be the case here?
> Please elaborate on how the control program will execute it's "pluggable"
> algorithm?
> Please elaborate on how the fans will be controlled?  Will that be as a
> group per system or independently per zone?
>   -- What is a zone?
>
> Patrick
>
> On Tue, May 2, 2017 at 11:07 AM, Matthew Barth <msbarth@linux.vnet.ibm.com
> > wrote:
>
>> Patrick,
>>
>> As Patrick mentioned a few of us have been working on the fan control
>> infrastructure currently and wrote up a quick outline to share our thoughts
>> on the design layout. Let us know if there are areas you'd like to see more
>> detail.
>>
>> Matt
>>
>
>

--94eb2c1cb35aef592d054e90a41f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just to give some details, the present design is as follow=
s:<div>- A zone is a group of fans controlled independently.</div><div>=C2=
=A0-- The configuration specifies the inputs to the PID loops. -- each loop=
 takes an input and a goal, and outputs an RPM to achieve the goal. =C2=A0(=
the loop input can be the margin)</div><div>=C2=A0-- The PID loops all feed=
 into a maximum function which then feeds a fan PID loop that tweaks the du=
ty cycles as write and reads the fan tachs back until it&#39;s where it nee=
ds to be.</div><div><br></div><div>So we&#39;ll be dynamically building a l=
ist of PIDs to run and drive the output for controlling the fans.</div><div=
><br></div><div>Patrick</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Tue, May 2, 2017 at 12:33 PM, Patrick Venture <span di=
r=3D"ltr">&lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">ventu=
re@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">Please elaborate on the format or layout of the control configu=
ration file.<div>Please elaborate on the mechanism planned to import it int=
o code?=C2=A0 Y&#39;all often use python programs to make c++, will that be=
 the case here?</div><div>Please elaborate on how the control program will =
execute it&#39;s &quot;pluggable&quot; algorithm?</div><div>Please elaborat=
e on how the fans will be controlled?=C2=A0 Will that be as a group per sys=
tem or independently per zone?</div><div>=C2=A0 -- What is a zone?</div><sp=
an class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Patrick</di=
v></font></span></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 2, 2017 at 11:07 A=
M, Matthew Barth <span dir=3D"ltr">&lt;<a href=3D"mailto:msbarth@linux.vnet=
.ibm.com" target=3D"_blank">msbarth@linux.vnet.ibm.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Patrick,<br>
<br>
As Patrick mentioned a few of us have been working on the fan control infra=
structure currently and wrote up a quick outline to share our thoughts on t=
he design layout. Let us know if there are areas you&#39;d like to see more=
 detail.<br>
<br>
Matt<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c1cb35aef592d054e90a41f--
