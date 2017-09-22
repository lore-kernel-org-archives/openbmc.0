Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22d; helo=mail-qt0-x22d.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WLqle/ug"; 
 dkim-atps=neutral
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzTC54M5rzDqNm
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 08:47:44 +1000 (AEST)
Received: by mail-qt0-x22d.google.com with SMTP id q8so2491711qtb.5
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CE9Kzy+7i2LaOx1mbGm7z0Z/7m2ZGHj+PjAukgkyryw=;
 b=WLqle/ugxxvZ6p1/EdDiMCeGZuSW+hzN7lp94flt69DMTpnVk0Zer1jCxpZpvChxYa
 KEauW6J5+O2WU6z8Ob/70oydy8l9ltlhaWeIuwkI2StXja3nNM7hOPVV4jjIgbP48Pjp
 3QVeHgYhAbrMMDpCAB44fNUKrvrmiUhkqA7+hzFBMk94yeqZmYClgYsQpoYiZ+7p1sSG
 TU4LNfCWoqJJ8zk6PKwE/hlMIAtiRYo3UItZ/D/gJx3vq20WZkoReOGEGJURGEj5SvF1
 wGGwNbnLhNjZDVrDQkR7+c7IXD+MTNNTKpTY9JFusl9P2gFGvqc5/5XCYwkExGSD5zPd
 dlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CE9Kzy+7i2LaOx1mbGm7z0Z/7m2ZGHj+PjAukgkyryw=;
 b=mfEF7xbCJFLYU5BsQM1Z//UnkmFwFoX4ESDxfvRl/afdTA/T2SMkL4HVhrCdWSeywR
 y0/0BySWpwg50kA1cCa4s1pnAogQ3K4JtwMAtA2yCk1+GKrJBIc0hFvT1YvDBE2zUGNd
 zkoTo2TZXoHz0hBYRTz1Hi5ECX97b+GZT4k7dW59PNrH5ck2Nc41IjXoKh+yinyX17fP
 iVa7VzuxQ/otedDa2EHPmGyWx0m5LW5p1qhfNTh1sIDBoj0VPN8PM/e0xS5KWbNxo88U
 G25LGcnjblT9oMrQEbNkOgTEDmZVXNxr4Qf+xQKF7BswN3rE7qrnREQMnMRhcSCI36KH
 18cA==
X-Gm-Message-State: AHPjjUjE7ksxtqSTnHIuA5WLbQu64OGD6o+tcyydnS1UWDMNRjyjsSQs
 UURRWGvjmR09P10lRuQsplkfv+gMjlBPpQM0Yns=
X-Google-Smtp-Source: AOwi7QAhW59tvPUJhxCe5qQyRVrL+ln74/AXSWC+2crvhbELJv5rQotRDCSVIUK4s1Z652vl7rPsF6Q/EHSSwXYow1M=
X-Received: by 10.200.22.188 with SMTP id r57mr1158721qtj.230.1506120462446;
 Fri, 22 Sep 2017 15:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.178.89 with HTTP; Fri, 22 Sep 2017 15:47:42 -0700 (PDT)
In-Reply-To: <OF70CFC593.C16E6AA1-ON862581A3.006F7F1D-862581A3.00702603@notes.na.collabserv.com>
References: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
 <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
 <CAEX+82JJfAEpkZ57tzn_V1_0TfqSaj=-zLRBqK4+GSAeO=aCXw@mail.gmail.com>
 <CAEX+82+yw1TL84Ew3S5i3SkmcxPtJ9B7+TvK1L8gP2-nNqofjQ@mail.gmail.com>
 <OF70CFC593.C16E6AA1-ON862581A3.006F7F1D-862581A3.00702603@notes.na.collabserv.com>
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 22 Sep 2017 19:47:42 -0300
Message-ID: <CAEX+82J2umC2-YdL1+eHR9JzPZpLD+BZqBGGKMQNZFicGbvgBg@mail.gmail.com>
Subject: Re: Porting OpenBMC to Raspberry PI 3.
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c059f3c2733e80559ceff16"
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
X-List-Received-Date: Fri, 22 Sep 2017 22:47:46 -0000

--94eb2c059f3c2733e80559ceff16
Content-Type: text/plain; charset="UTF-8"

Yes, I see Chris.
Thanks for your answer.
So, I will need a C language advvanced programming skill ?





*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-09-22 17:24 GMT-03:00 Chris Austen <austenc@us.ibm.com>:

> As you can see there has been a desire for over a year to have it
> supported. Raspberrypi supported is interesting since it allows for an easy
> reference board to develop and learn from. It provides other communities to
> get involved and it presents a very cheap model for test automation. The
> developers talking on that issue had other systems and timelines that got
> in the way of providing the community a cheap usable hardware reference.
>
> As you yourself discovered, OpenBMC kernel development can be difficult
> without system level specs. With the Pi you remove the problem.
>
>
>
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
>
> Javier Romero <xavinux@gmail.com> wrote on 09/22/2017 01:56:45 PM:
>
> > From: Javier Romero <xavinux@gmail.com>
> > To: Chris Austen <austenc@us.ibm.com>
> > Cc: openbmc@lists.ozlabs.org
> > Date: 09/22/2017 01:56 PM
> > Subject: Re: Porting OpenBMC to Raspberry PI 3.
>
> >
> > Seems that obmc on Raspberry PI is not a primary use case...
> >
> > https://github.com/openbmc/openbmc/issues/399
> >
> > Javier Romero
> > E-mail: xavinux@gmail.com
> > Skype: xavinux
> >
> > 2017-09-22 13:47 GMT-03:00 Javier Romero <xavinux@gmail.com>:
> > Chris,
>
> > Thank you for your answer. I'll start working on those points
> you'vesuggested.
>
> > Regards,
> >
>
> >
> > Javier Romero
> > E-mail: xavinux@gmail.com
> > Skype: xavinux
> >
> > 2017-09-22 13:33 GMT-03:00 Chris Austen <austenc@us.ibm.com>:
> >
> > Chris Austen
> >
> > "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
> > wrote on 09/22/2017 10:49:54 AM:
> >
> > > From: Javier Romero <xavinux@gmail.com>
> > > To: openbmc@lists.ozlabs.org
> > > Date: 09/22/2017 10:50 AM
> > > Subject: Porting OpenBMC to Raspberry PI 3.
> > > Sent by: "openbmc" <openbmc-bounces+austenc=us.
> ibm.com@lists.ozlabs.org>
> > >
> > > Hello,
> >
> > > Have a Raspberry PI 3 and seems that could be useful to port OpenBMC
> > > to this device.
> >
> > > Suggestions on how to start working with this will be welcome.
> >
> >
> > before anything, make sure you have successfully created a build
> > https://github.com/openbmc/openbmc#setting-up-your-openbmc-project
> > Target Palmetto
> >
> > Then build the simulator https://github.com/openbmc/openbmc#setting-
> > up-your-openbmc-project
> >
> > Then run the simulator https://github.com/openbmc/openbmc#setting-
> > up-your-openbmc-project
> >
> >
> > Once that is done Target a Romulus for build/simulation.  You will
> > notice Palmetto is built from ast-2400 and Romulus is ast-2500
> > You should notice some layers change between the two.  That gives
> > you a base framework.  Next, and this is where no one has done work
> > on the team...
> >
> > I would try to build an online example of using yocto for raspberry
> > images.  Get that to work.  This step has nothing to do with
> > OpenBMC.  It has to do about learning how to build a working
> > raspberrypi image.
> >
> > Once you have done that, the next and most difficult thing...
> > merging the two.  document everything in a blog post (maybe your
> > userid in github) and that will let people see what you are doing
> > and find helpful hints.
> >
> >
> >
> > > Best Regards,
> > >
> > >
> > >
> >
> > > Javier Romero
> > > E-mail: xavinux@gmail.com
> > > Skype: xavinux
>
>

--94eb2c059f3c2733e80559ceff16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Yes, I see Chris.</div><div></div><div></div>Tha=
nks for your answer.<br></div>So, I will need a C language advvanced progra=
mming skill ?<br><div><br><br><br></div></div><div class=3D"gmail_extra"><b=
r clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Ro=
mero<br></b></i></div><div style=3D"text-align:left"><span style=3D"color:r=
gb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"=
color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,255)"><a hr=
ef=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></sp=
an><br></b></i></span></div><div style=3D"text-align:left"><i><b><span styl=
e=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <s=
pan style=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xa=
vinux</span><br></u></span></span></b></i></div><div style=3D"text-align:le=
ft"><br></div> </div></div></div>
<br><div class=3D"gmail_quote">2017-09-22 17:24 GMT-03:00 Chris Austen <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:austenc@us.ibm.com" target=3D"_blank">a=
ustenc@us.ibm.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p=
><font size=3D"2">As you can see there has been a desire for over a year to=
 have it supported.  Raspberrypi supported is interesting since it allows f=
or an easy reference board to develop and learn from.  It provides other co=
mmunities to get involved and it presents a very cheap model for test autom=
ation.  The developers talking on that issue had other systems and timeline=
s that got in the way of providing the community a cheap usable hardware re=
ference.</font><br><br><font size=3D"2">As you yourself discovered, OpenBMC=
 kernel development can be difficult without system level specs.  With the =
Pi you remove the problem.  </font><br><br><br><font size=3D"2"><br>Chris A=
usten<br>POWER Systems Enablement Manager <br>(512) 286-5184 (T/L: 363-5184=
)</font><span class=3D""><br><br><tt><font size=3D"2">Javier Romero &lt;<a =
href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&g=
t; wrote on 09/22/2017 01:56:45 PM:<br><br>&gt; From: Javier Romero &lt;<a =
href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&g=
t;</font></tt><br></span><tt><font size=3D"2">&gt; To: Chris Austen &lt;<a =
href=3D"mailto:austenc@us.ibm.com" target=3D"_blank">austenc@us.ibm.com</a>=
&gt;</font></tt><br><tt><font size=3D"2">&gt; Cc: <a href=3D"mailto:openbmc=
@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a></font></t=
t><br><tt><font size=3D"2">&gt; Date: 09/22/2017 01:56 PM</font></tt><br><t=
t><font size=3D"2">&gt; Subject: Re: Porting OpenBMC to Raspberry PI 3.</fo=
nt></tt></p><div><div class=3D"h5"><br><tt><font size=3D"2">&gt; <br>&gt; S=
eems that obmc on Raspberry PI is not a primary use case...<br>&gt; <br>&gt=
; <a href=3D"https://github.com/openbmc/openbmc/issues/399" target=3D"_blan=
k">https://github.com/openbmc/<wbr>openbmc/issues/399</a></font></tt><br><t=
t><font size=3D"2">&gt; <br>&gt; Javier Romero</font></tt><br><tt><font siz=
e=3D"2">&gt; E-mail: <a href=3D"mailto:xavinux@gmail.com" target=3D"_blank"=
>xavinux@gmail.com</a></font></tt><br><tt><font size=3D"2">&gt; Skype: xavi=
nux</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; 2017-09-22 13:47 GMT-=
03:00 Javier Romero &lt;<a href=3D"mailto:xavinux@gmail.com" target=3D"_bla=
nk">xavinux@gmail.com</a>&gt;:</font></tt><br><tt><font size=3D"2">&gt; Chr=
is,<br></font></tt><br><tt><font size=3D"2">&gt; Thank you for your answer.=
 I&#39;ll start working on those points you&#39;vesuggested.<br></font></tt=
><br><tt><font size=3D"2">&gt; Regards,<br>&gt; <br></font></tt><br><tt><fo=
nt size=3D"2">&gt; <br>&gt; Javier Romero</font></tt><br><tt><font size=3D"=
2">&gt; E-mail: <a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavi=
nux@gmail.com</a></font></tt><br><tt><font size=3D"2">&gt; Skype: xavinux</=
font></tt><br><tt><font size=3D"2">&gt; <br>&gt; 2017-09-22 13:33 GMT-03:00=
 Chris Austen &lt;<a href=3D"mailto:austenc@us.ibm.com" target=3D"_blank">a=
ustenc@us.ibm.com</a>&gt;:</font></tt><br><tt><font size=3D"2">&gt; <br>&gt=
; Chris Austen<br>&gt; <br>&gt; &quot;openbmc&quot; &lt;openbmc-bounces+aus=
tenc=3D<a href=3D"mailto:us.ibm.com@lists.ozlabs.org" target=3D"_blank">us.=
<wbr>ibm.com@lists.ozlabs.org</a>&gt; <br>&gt; wrote on 09/22/2017 10:49:54=
 AM:<br>&gt; <br>&gt; &gt; From: Javier Romero &lt;<a href=3D"mailto:xavinu=
x@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&gt;<br>&gt; &gt; To: <=
a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.=
ozlabs.org</a><br>&gt; &gt; Date: 09/22/2017 10:50 AM<br>&gt; &gt; Subject:=
 Porting OpenBMC to Raspberry PI 3.<br>&gt; &gt; Sent by: &quot;openbmc&quo=
t; &lt;openbmc-bounces+austenc=3D<a href=3D"mailto:us.ibm.com@lists.ozlabs.=
org" target=3D"_blank">us.<wbr>ibm.com@lists.ozlabs.org</a>&gt;<br>&gt; &gt=
; <br>&gt; &gt; Hello,<br>&gt; <br>&gt; &gt; Have a Raspberry PI 3 and seem=
s that could be useful to port OpenBMC<br>&gt; &gt; to this device.<br>&gt;=
 <br>&gt; &gt; Suggestions on how to start working with this will be welcom=
e.<br>&gt; <br>&gt; <br>&gt; before anything, make sure you have successful=
ly created a build <br>&gt; <a href=3D"https://github.com/openbmc/openbmc#s=
etting-up-your-openbmc-project" target=3D"_blank">https://github.com/openbm=
c/<wbr>openbmc#setting-up-your-<wbr>openbmc-project</a><br>&gt; Target Palm=
etto<br>&gt; <br>&gt; Then build the simulator <a href=3D"https://github.co=
m/openbmc/openbmc#setting-" target=3D"_blank">https://github.com/openbmc/<w=
br>openbmc#setting-</a><br>&gt; up-your-openbmc-project<br>&gt; <br>&gt; Th=
en run the simulator <a href=3D"https://github.com/openbmc/openbmc#setting-=
" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc#setting-</a><br=
>&gt; up-your-openbmc-project<br>&gt; <br>&gt; <br>&gt; Once that is done T=
arget a Romulus for build/simulation.=C2=A0 You will <br>&gt; notice Palmet=
to is built from ast-2400 and Romulus is ast-2500<br>&gt; You should notice=
 some layers change between the two.=C2=A0 That gives <br>&gt; you a base f=
ramework.=C2=A0 Next, and this is where no one has done work <br>&gt; on th=
e team...<br>&gt; <br>&gt; I would try to build an online example of using =
yocto for raspberry <br>&gt; images.=C2=A0 Get that to work.=C2=A0 This ste=
p has nothing to do with <br>&gt; OpenBMC.=C2=A0 It has to do about learnin=
g how to build a working <br>&gt; raspberrypi image. =C2=A0<br>&gt; <br>&gt=
; Once you have done that, the next and most difficult thing... <br>&gt; me=
rging the two. =C2=A0document everything in a blog post (maybe your <br>&gt=
; userid in github) and that will let people see what you are doing <br>&gt=
; and find helpful hints.<br>&gt; <br>&gt; <br>&gt; <br>&gt; &gt; Best Rega=
rds,<br>&gt; &gt; <br>&gt; &gt; =C2=A0<br>&gt; &gt; <br>&gt; <br>&gt; &gt; =
Javier Romero<br>&gt; &gt; E-mail: <a href=3D"mailto:xavinux@gmail.com" tar=
get=3D"_blank">xavinux@gmail.com</a><br>&gt; &gt; Skype: xavinux</font></tt=
><br>
</div></div><p></p></div>
</blockquote></div><br></div>

--94eb2c059f3c2733e80559ceff16--
