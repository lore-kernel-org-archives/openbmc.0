Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22d; helo=mail-qk0-x22d.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ngq53JKK"; 
 dkim-atps=neutral
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzKCD25r6zDqjC
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 02:47:19 +1000 (AEST)
Received: by mail-qk0-x22d.google.com with SMTP id b82so1593248qkc.4
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=glJFW7vZFldqz2/h+NXuzovenW0eIdccVIO3g8KIezU=;
 b=ngq53JKKVJ7oLux+RIGCuVfdPOGYDBOpmwO2ii6tiZ8+Yu/pe9NLBdiCvwCKaDIZiS
 1B/6KaDd2+wic4//gUOF/m2z2b2Dafd7Kc28u+TIOQg7JazXLPejrebIQEzOzhZZmOtE
 BDZCXcGkkIFKwfhXSA4t1a0cbPEESfC3uUzMeeGvlHydMVTIyT5HUjMHtQH6ZL3teFjD
 Ai6ZKfbqdgEpRtJu5yqNqUch+IuJoF5qeNxqwsvaTJCZv++NdEErwVo9Na1n1vNUHgJR
 AQ4Yy4vw1HjwvjqI+HjFJJcoLK3szqwuYqBNOcwMy3VsFGWUJNqH6hdFCSLHh6HCPu1S
 6X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=glJFW7vZFldqz2/h+NXuzovenW0eIdccVIO3g8KIezU=;
 b=jv4WQs8gsKWid2ZZexxcl15Db1mwkNlIbYwY2e7JJX8IDpfC6spiLHspSIsTNBynlV
 v02koGZtsVDRZhwNvH9szW6xgZFuwMCpgSeOiPjOhn4DShTdZRP3tLgEuM2ejlQAOz4P
 6w+y2TWvCM7RGhiXZEXgsvyzxnagwIkpVmZMxFqNK2ly69bMc5ZF/G+KtLQeJ4NJd8qz
 NMCHy0DfUc+qQ26BQYIszHtbzOvCg/MDFiqMZX4DM1G3E+2/k3+MaZkPo+Y9sZFJaTyt
 OhVKOxxOESEpPtONj8BH/ijdL3fJwmH03gw6M2DVTxmdEHeSFQorSTK8e4m7hXeZG8IJ
 e2FQ==
X-Gm-Message-State: AHPjjUiHZh3O0A4mN51Jj5zarufdbPeWfyM2e/5Zy4fUelqb04QVf9Ux
 X7NNV/VKvVRrD2T3ZJ7tL88pU5n2ejLC+c41Og4=
X-Google-Smtp-Source: AOwi7QB9j/GDBonRYoV+QhScEP+NvbUgvcpRgxojvjKhutXXbKUARN0hmFYgKzaE96wfYaffHR6NuJ2Sk6w3xy26FkA=
X-Received: by 10.55.113.70 with SMTP id m67mr8432763qkc.187.1506098837229;
 Fri, 22 Sep 2017 09:47:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.178.89 with HTTP; Fri, 22 Sep 2017 09:47:16 -0700 (PDT)
In-Reply-To: <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
References: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
 <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 22 Sep 2017 13:47:16 -0300
Message-ID: <CAEX+82JJfAEpkZ57tzn_V1_0TfqSaj=-zLRBqK4+GSAeO=aCXw@mail.gmail.com>
Subject: Re: Porting OpenBMC to Raspberry PI 3.
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c05a87a3093740559c9f6e4"
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
X-List-Received-Date: Fri, 22 Sep 2017 16:47:21 -0000

--94eb2c05a87a3093740559c9f6e4
Content-Type: text/plain; charset="UTF-8"

Chris,

Thank you for your answer. I'll start working on those points you've
suggested.

Regards,




*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-09-22 13:33 GMT-03:00 Chris Austen <austenc@us.ibm.com>:

>
> Chris Austen
>
> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
> 09/22/2017 10:49:54 AM:
>
> > From: Javier Romero <xavinux@gmail.com>
> > To: openbmc@lists.ozlabs.org
> > Date: 09/22/2017 10:50 AM
> > Subject: Porting OpenBMC to Raspberry PI 3.
> > Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
> >
> > Hello,
>
> > Have a Raspberry PI 3 and seems that could be useful to port OpenBMC
> > to this device.
>
> > Suggestions on how to start working with this will be welcome.
>
>
> before anything, make sure you have successfully created a build
> https://github.com/openbmc/openbmc#setting-up-your-openbmc-project
> Target Palmetto
>
> Then build the simulator https://github.com/openbmc/
> openbmc#setting-up-your-openbmc-project
>
> Then run the simulator https://github.com/openbmc/openbmc#setting-up-your-
> openbmc-project
>
>
> Once that is done Target a Romulus for build/simulation.  You will notice
> Palmetto is built from ast-2400 and Romulus is ast-2500
> You should notice some layers change between the two.  That gives you a
> base framework.  Next, and this is where no one has done work on the team...
>
> I would try to build an online example of using yocto for raspberry
> images.  Get that to work.  This step has nothing to do with OpenBMC.  It
> has to do about learning how to build a working raspberrypi image.
>
> Once you have done that, the next and most difficult thing... merging the
> two.  document everything in a blog post (maybe your userid in github) and
> that will let people see what you are doing and find helpful hints.
>
>
>
> > Best Regards,
> >
> >
> >
>
> > Javier Romero
> > E-mail: xavinux@gmail.com
> > Skype: xavinux
>

--94eb2c05a87a3093740559c9f6e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Chris,<br><br></div>Thank you for your answer. I=
&#39;ll start working on those points you&#39;ve suggested.<br><br></div>Re=
gards,<br><br><br></div><div class=3D"gmail_extra"><br clear=3D"all"><div><=
div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Romero<br></b></i></di=
v><div style=3D"text-align:left"><span style=3D"color:rgb(19,79,92)"><i><b>=
<span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"color:rgb(0,0,255)">=
 </span></span><span style=3D"color:rgb(0,0,255)"><a href=3D"mailto:xavinux=
@gmail.com" target=3D"_blank">xavinux@gmail.com</a></span><br></b></i></spa=
n></div><div style=3D"text-align:left"><i><b><span style=3D"color:rgb(19,79=
,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <span style=3D"color:r=
gb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xavinux</span><br></u>=
</span></span></b></i></div><div style=3D"text-align:left"><br></div> </div=
></div></div>
<br><div class=3D"gmail_quote">2017-09-22 13:33 GMT-03:00 Chris Austen <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:austenc@us.ibm.com" target=3D"_blank">a=
ustenc@us.ibm.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p=
><font size=3D"2"><br>Chris Austen<br></font><br><tt><font size=3D"2">&quot=
;openbmc&quot; &lt;openbmc-bounces+austenc=3D<a href=3D"mailto:us.ibm.com@l=
ists.ozlabs.org" target=3D"_blank">us.<wbr>ibm.com@lists.ozlabs.org</a>&gt;=
 wrote on 09/22/2017 10:49:54 AM:<br><br>&gt; From: Javier Romero &lt;<a hr=
ef=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&gt;=
</font></tt><br><tt><font size=3D"2">&gt; To: <a href=3D"mailto:openbmc@lis=
ts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a></font></tt><b=
r><tt><font size=3D"2">&gt; Date: 09/22/2017 10:50 AM</font></tt><br><tt><f=
ont size=3D"2">&gt; Subject: Porting OpenBMC to Raspberry PI 3.</font></tt>=
<br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-boun=
ces+austenc=3D<a href=3D"mailto:us.ibm.com@lists.ozlabs.org" target=3D"_bla=
nk">us.<wbr>ibm.com@lists.ozlabs.org</a>&gt;</font></tt><span class=3D""><b=
r><tt><font size=3D"2">&gt; <br>&gt; Hello,<br></font></tt><br><tt><font si=
ze=3D"2">&gt; Have a Raspberry PI 3 and seems that could be useful to port =
OpenBMC<br>&gt; to this device.<br></font></tt><br><tt><font size=3D"2">&gt=
; Suggestions on how to start working with this will be welcome.<br></font>=
</tt><br><br></span><font size=3D"2">before anything, make sure you have su=
ccessfully created a build </font><br><a href=3D"https://github.com/openbmc=
/openbmc#setting-up-your-openbmc-project" target=3D"_blank"><tt><font size=
=3D"2">https://github.com/openbmc/<wbr>openbmc#setting-up-your-<wbr>openbmc=
-project</font></tt></a><br><tt><font size=3D"2">Target Palmetto</font></tt=
><br><br><tt><font size=3D"2">Then build the simulator </font></tt><a href=
=3D"https://github.com/openbmc/openbmc#setting-up-your-openbmc-project" tar=
get=3D"_blank"><tt><font size=3D"2">https://github.com/openbmc/<wbr>openbmc=
#setting-up-your-<wbr>openbmc-project</font></tt></a><br><br><tt><font size=
=3D"2">Then run the simulator </font></tt><a href=3D"https://github.com/ope=
nbmc/openbmc#setting-up-your-openbmc-project" target=3D"_blank"><tt><font s=
ize=3D"2">https://github.com/openbmc/<wbr>openbmc#setting-up-your-<wbr>open=
bmc-project</font></tt></a><br><br><br><tt><font size=3D"2">Once that is do=
ne Target a Romulus for build/simulation.=C2=A0 You will notice Palmetto is=
 built from ast-2400 and Romulus is ast-2500</font></tt><br><tt><font size=
=3D"2">You should notice some layers change between the two.=C2=A0 That giv=
es you a base framework.=C2=A0 Next, and this is where no one has done work=
 on the team...</font></tt><br><br><tt><font size=3D"2">I would try to buil=
d an online example of using yocto for raspberry images.=C2=A0 Get that to =
work.=C2=A0 This step has nothing to do with OpenBMC.=C2=A0 It has to do ab=
out learning how to build a working raspberrypi image. =C2=A0</font></tt><b=
r><br><tt><font size=3D"2">Once you have done that, the next and most diffi=
cult thing... merging the two. =C2=A0document everything in a blog post (ma=
ybe your userid in github) and that will let people see what you are doing =
and find helpful hints.</font></tt><span class=3D""><br><br><br><br><tt><fo=
nt size=3D"2">&gt; Best Regards,<br>&gt; <br>&gt; =C2=A0</font></tt><br><tt=
><font size=3D"2">&gt; <br></font></tt><br><tt><font size=3D"2">&gt; Javier=
 Romero</font></tt><br><tt><font size=3D"2">&gt; E-mail: <a href=3D"mailto:=
xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></font></tt><br><=
tt><font size=3D"2">&gt; Skype: xavinux</font></tt><br>
</span></p></div>
</blockquote></div><br></div>

--94eb2c05a87a3093740559c9f6e4--
