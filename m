Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22e; helo=mail-qk0-x22e.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCbmLrXF"; 
 dkim-atps=neutral
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzN4f0Sg2zDrJL
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 04:56:49 +1000 (AEST)
Received: by mail-qk0-x22e.google.com with SMTP id z143so1936223qkb.3
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MSDxJuHGRISu/g3JhCbjNPShaJgVbljhp2rrmay2WvA=;
 b=WCbmLrXFTdbHx7U9wFyBmZkj+YhBKtgWZUCLpfNOxYkw3FOSS9EyC6Wz15EbqWbSe8
 iHSnHet34whbxjecDmFrx+/dYEwvYh307P98XOrwu9DvDs3Nwfi8BAs89Zd8XcQPf4wp
 9/vD6eh1UmunTVMTHuU6zQxi8p5rOTk0Uq1AQuqeh4zYVJfCxId7sG2J4JXiyfpunFqs
 j1CwTFITwW+z+SdW7GG07q+7hS0Rqs4wR7wnYee6a6D923NlJTq2Cj8nvv96Bz9NLavL
 qOYO1IyQP0ut0p8lXw4aCvULNaEfg4Vwkj5LjplDpI8xxxhEHtKdmMqxFYjD4LVvLIgn
 J1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MSDxJuHGRISu/g3JhCbjNPShaJgVbljhp2rrmay2WvA=;
 b=Uoopr56gRRn4zHML+YS2gVae5VABEIybfkv1pwSe97gWrlxVGTapRsjRT4SsyOueHY
 EzIy36Si53y+sX3dyLVFircLdmGDT5KZph87Hz5OXatd8IpyWwsFKwR6NCo634opj1PQ
 Lpslljo1+Q27IoYnwwnnR2yU55O623OBgA3Fckc5LzJTxDz5zXMm75MHvlrOeIm3gy2N
 XVab5LWVBK45rrLFHSxDxG8s5LB7dtra7QBJXXtsyjlR2OJE/tR+ZrRVBzdJ9FzNaoO4
 Ew0IvznZV+vKqP6ze9oWv8bBjx7cba0ak/oh+Nrbn7RUbjbwZ3ZuZrjYbULaGTVCMIeL
 RdbA==
X-Gm-Message-State: AHPjjUh1mTz3af5S1+G7glLjyPbx/UzOxi3RpApuRAaY86ghtFYFA0cc
 RLQSBkm1XaU5yJhkMpn1l0TPeqPVM2mKGZF439M=
X-Google-Smtp-Source: AOwi7QAccM+JQ9oaLg8UQ5lQH1AMOs7c9IRU1WB7zA93K7VRyrfcKfiSA/8lSKhOQkd1F8OH1o3+1oilNwy1JuKQtLE=
X-Received: by 10.55.15.65 with SMTP id z62mr246326qkg.2.1506106607298; Fri,
 22 Sep 2017 11:56:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.158.111 with HTTP; Fri, 22 Sep 2017 11:56:45 -0700 (PDT)
In-Reply-To: <CAEX+82JJfAEpkZ57tzn_V1_0TfqSaj=-zLRBqK4+GSAeO=aCXw@mail.gmail.com>
References: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
 <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
 <CAEX+82JJfAEpkZ57tzn_V1_0TfqSaj=-zLRBqK4+GSAeO=aCXw@mail.gmail.com>
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 22 Sep 2017 15:56:45 -0300
Message-ID: <CAEX+82+yw1TL84Ew3S5i3SkmcxPtJ9B7+TvK1L8gP2-nNqofjQ@mail.gmail.com>
Subject: Re: Porting OpenBMC to Raspberry PI 3.
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1147c4705275e80559cbc581"
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
X-List-Received-Date: Fri, 22 Sep 2017 18:56:51 -0000

--001a1147c4705275e80559cbc581
Content-Type: text/plain; charset="UTF-8"

Seems that obmc on Raspberry PI is not a primary use case...

https://github.com/openbmc/openbmc/issues/399


*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-09-22 13:47 GMT-03:00 Javier Romero <xavinux@gmail.com>:

> Chris,
>
> Thank you for your answer. I'll start working on those points you've
> suggested.
>
> Regards,
>
>
>
>
> *Javier Romero*
>
> *E-mail: xavinux@gmail.com <xavinux@gmail.com>*
>
> *Skype: xavinux*
>
>
> 2017-09-22 13:33 GMT-03:00 Chris Austen <austenc@us.ibm.com>:
>
>>
>> Chris Austen
>>
>> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
>> 09/22/2017 10:49:54 AM:
>>
>> > From: Javier Romero <xavinux@gmail.com>
>> > To: openbmc@lists.ozlabs.org
>> > Date: 09/22/2017 10:50 AM
>> > Subject: Porting OpenBMC to Raspberry PI 3.
>> > Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org
>> >
>> >
>> > Hello,
>>
>> > Have a Raspberry PI 3 and seems that could be useful to port OpenBMC
>> > to this device.
>>
>> > Suggestions on how to start working with this will be welcome.
>>
>>
>> before anything, make sure you have successfully created a build
>> https://github.com/openbmc/openbmc#setting-up-your-openbmc-project
>> Target Palmetto
>>
>> Then build the simulator https://github.com/openbmc/ope
>> nbmc#setting-up-your-openbmc-project
>>
>> Then run the simulator https://github.com/openbmc/ope
>> nbmc#setting-up-your-openbmc-project
>>
>>
>> Once that is done Target a Romulus for build/simulation.  You will notice
>> Palmetto is built from ast-2400 and Romulus is ast-2500
>> You should notice some layers change between the two.  That gives you a
>> base framework.  Next, and this is where no one has done work on the team...
>>
>> I would try to build an online example of using yocto for raspberry
>> images.  Get that to work.  This step has nothing to do with OpenBMC.  It
>> has to do about learning how to build a working raspberrypi image.
>>
>> Once you have done that, the next and most difficult thing... merging the
>> two.  document everything in a blog post (maybe your userid in github) and
>> that will let people see what you are doing and find helpful hints.
>>
>>
>>
>> > Best Regards,
>> >
>> >
>> >
>>
>> > Javier Romero
>> > E-mail: xavinux@gmail.com
>> > Skype: xavinux
>>
>
>

--001a1147c4705275e80559cbc581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seems that obmc on Raspberry PI is not a primary use case.=
..<br><br><a href=3D"https://github.com/openbmc/openbmc/issues/399">https:/=
/github.com/openbmc/openbmc/issues/399</a><br></div><div class=3D"gmail_ext=
ra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>Jav=
ier Romero<br></b></i></div><div style=3D"text-align:left"><span style=3D"c=
olor:rgb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<span sty=
le=3D"color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,255)"=
><a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</=
a></span><br></b></i></span></div><div style=3D"text-align:left"><i><b><spa=
n style=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</sp=
an> <span style=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,25=
5)">xavinux</span><br></u></span></span></b></i></div><div style=3D"text-al=
ign:left"><br></div> </div></div></div>
<br><div class=3D"gmail_quote">2017-09-22 13:47 GMT-03:00 Javier Romero <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">x=
avinux@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><div>Chris,<br><br></div>Thank you for your answer. I&#39;ll =
start working on those points you&#39;ve suggested.<br><br></div>Regards,<b=
r><br><br></div><div class=3D"gmail_extra"><span class=3D""><br clear=3D"al=
l"><div><div class=3D"m_2081800970424371050gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>=
Javier Romero<br></b></i></div><div style=3D"text-align:left"><span style=
=3D"color:rgb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<spa=
n style=3D"color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,=
255)"><a href=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.=
com</a></span><br></b></i></span></div><div style=3D"text-align:left"><i><b=
><span style=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype=
:</span> <span style=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0=
,0,255)">xavinux</span><br></u></span></span></b></i></div><div style=3D"te=
xt-align:left"><br></div> </div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">2017-09-22 13:=
33 GMT-03:00 Chris Austen <span dir=3D"ltr">&lt;<a href=3D"mailto:austenc@u=
s.ibm.com" target=3D"_blank">austenc@us.ibm.com</a>&gt;</span>:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div><p><font size=3D"2"><br>Chris Austen<br></font>=
<br><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3D=
<a href=3D"mailto:us.ibm.com@lists.ozlabs.org" target=3D"_blank">us.ib<wbr>=
m.com@lists.ozlabs.org</a>&gt; wrote on 09/22/2017 10:49:54 AM:<br><br>&gt;=
 From: Javier Romero &lt;<a href=3D"mailto:xavinux@gmail.com" target=3D"_bl=
ank">xavinux@gmail.com</a>&gt;</font></tt><br><tt><font size=3D"2">&gt; To:=
 <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@list=
s.ozlabs.org</a></font></tt><br><tt><font size=3D"2">&gt; Date: 09/22/2017 =
10:50 AM</font></tt><br><tt><font size=3D"2">&gt; Subject: Porting OpenBMC =
to Raspberry PI 3.</font></tt><br><tt><font size=3D"2">&gt; Sent by: &quot;=
openbmc&quot; &lt;openbmc-bounces+austenc=3D<a href=3D"mailto:us.ibm.com@li=
sts.ozlabs.org" target=3D"_blank">us.ib<wbr>m.com@lists.ozlabs.org</a>&gt;<=
/font></tt><span><br><tt><font size=3D"2">&gt; <br>&gt; Hello,<br></font></=
tt><br><tt><font size=3D"2">&gt; Have a Raspberry PI 3 and seems that could=
 be useful to port OpenBMC<br>&gt; to this device.<br></font></tt><br><tt><=
font size=3D"2">&gt; Suggestions on how to start working with this will be =
welcome.<br></font></tt><br><br></span><font size=3D"2">before anything, ma=
ke sure you have successfully created a build </font><br><a href=3D"https:/=
/github.com/openbmc/openbmc#setting-up-your-openbmc-project" target=3D"_bla=
nk"><tt><font size=3D"2">https://github.com/openbmc/ope<wbr>nbmc#setting-up=
-your-openbmc-<wbr>project</font></tt></a><br><tt><font size=3D"2">Target P=
almetto</font></tt><br><br><tt><font size=3D"2">Then build the simulator </=
font></tt><a href=3D"https://github.com/openbmc/openbmc#setting-up-your-ope=
nbmc-project" target=3D"_blank"><tt><font size=3D"2">https://github.com/ope=
nbmc/ope<wbr>nbmc#setting-up-your-openbmc-<wbr>project</font></tt></a><br><=
br><tt><font size=3D"2">Then run the simulator </font></tt><a href=3D"https=
://github.com/openbmc/openbmc#setting-up-your-openbmc-project" target=3D"_b=
lank"><tt><font size=3D"2">https://github.com/openbmc/ope<wbr>nbmc#setting-=
up-your-openbmc-<wbr>project</font></tt></a><br><br><br><tt><font size=3D"2=
">Once that is done Target a Romulus for build/simulation.=C2=A0 You will n=
otice Palmetto is built from ast-2400 and Romulus is ast-2500</font></tt><b=
r><tt><font size=3D"2">You should notice some layers change between the two=
.=C2=A0 That gives you a base framework.=C2=A0 Next, and this is where no o=
ne has done work on the team...</font></tt><br><br><tt><font size=3D"2">I w=
ould try to build an online example of using yocto for raspberry images.=C2=
=A0 Get that to work.=C2=A0 This step has nothing to do with OpenBMC.=C2=A0=
 It has to do about learning how to build a working raspberrypi image. =C2=
=A0</font></tt><br><br><tt><font size=3D"2">Once you have done that, the ne=
xt and most difficult thing... merging the two. =C2=A0document everything i=
n a blog post (maybe your userid in github) and that will let people see wh=
at you are doing and find helpful hints.</font></tt><span><br><br><br><br><=
tt><font size=3D"2">&gt; Best Regards,<br>&gt; <br>&gt; =C2=A0</font></tt><=
br><tt><font size=3D"2">&gt; <br></font></tt><br><tt><font size=3D"2">&gt; =
Javier Romero</font></tt><br><tt><font size=3D"2">&gt; E-mail: <a href=3D"m=
ailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></font></tt=
><br><tt><font size=3D"2">&gt; Skype: xavinux</font></tt><br>
</span></p></div>
</blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a1147c4705275e80559cbc581--
