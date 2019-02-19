Return-Path: <derick.montague@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpou4i2n"; 
 dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443qqN4wY5zDqJK
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 06:02:24 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id x10so3879233wmg.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=k9dURMzikSAs3EX1bnxheEXHlYVaRejEntd+ceWHwsA=;
 b=gpou4i2nsrJX+AZOKHBejDeWDu6hTBQw8GkZiHQcxJ5IyJ5B+2Ebza/aPETd4tIBRE
 wgxobTSmS1wug56An62vdKOSZBMPSh15PY/f4Yma66wANjhP6LyK4H5gb5bN5Tahx/qH
 clN9iuHhxQftgsxaxOcvZi33mFXMyPNWHewIzQXSkvejtCMsfZ5f1mLTeysm3HSsY6ZU
 ll5Nz4eU8hp9yACaXJ/w8vCa9X4f9fheRNs0JEwrbN9exMFzb64TIZJYwz25QV1NIngX
 Z3RYKW6H3R8lbL75SbNyYUrVa341tkoiOrqC7ho3YKroHVgzTpshpjiKEhWcA9fYC77s
 E+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=k9dURMzikSAs3EX1bnxheEXHlYVaRejEntd+ceWHwsA=;
 b=AQGwTYOQfTSy3kWzLYkoiy6CDlfYckKZfV1HJFpEmiIMFwQCY1VPizXlCRF4wzbZ0o
 iitSOEEjZlNt+rOCZ77MB7r5Tp08vUahvvwy5GonwcStua9KUS2VN5OlESLpjfTY8OO1
 PrFApVgd+DT6MelxyGjoeMRd/fwV+teBXCkMVMEfd0vcMCXbc/cDfXheRW9jzoAxuRMy
 XpAfibcMl+Oh3+XW7nkLI/91nju7+Er+BSWaHeqZOJpp9eadU9nH+cZhVmeruzAHTImc
 QJVJbNQ67NJtW7CzpoXmvNJodaHv1bHEcnZLhrWYeE3XlVxnVWt/7OBAFTi20LnP4L4P
 pA0Q==
X-Gm-Message-State: AHQUAuZXlT86LSa696ESJskX74dgo1i5GYK4wSG0Vk3H4Aa6Z4DjENpK
 HetgHQHsdKwyH3SeW5a83G9LJW0zT1odjGHcd+w1WgSH
X-Google-Smtp-Source: AHgI3IYfCkaWRJTFiLacveO58NY23ko+2wRMIdm0vVn+r40/KOknNpb6lR2FKmLwB98FiGVnfr0UiF/qkKqEaYYQN5Q=
X-Received: by 2002:a1c:6342:: with SMTP id x63mr3843290wmb.92.1550602941155; 
 Tue, 19 Feb 2019 11:02:21 -0800 (PST)
MIME-Version: 1.0
References: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
 <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
In-Reply-To: <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
From: Derick <derick.montague@gmail.com>
Date: Tue, 19 Feb 2019 13:02:09 -0600
Message-ID: <CAOUmYFTJhmC-e+tRUrQ=mYVRpGD0aMBGABOxwCWuQ4DmneQSmA@mail.gmail.com>
Subject: Re: GUI translation bundles
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007ed3b0058243e14c"
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
X-List-Received-Date: Tue, 19 Feb 2019 19:02:25 -0000

--0000000000007ed3b0058243e14c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander!

Are you going to use some ready framework for translations or are you going
> to develop a new one?


After some previous discussions, it was decided to use Angular Translate -
https://github.com/angular-translate/angular-translate



> It would be great if the solution provided an option for quick language
> switching.


The suggested pattern would be a simple language switcher on the login page=
.

The problem is that different languages may require the variable part at
> different locations within the string and also may use inclinations, so y=
ou
> can't just break such strings apart and translate "You have" and "new
> messages" separately because the translation may not just require writing
> it like "12 new messages you have", but will also be different for, say, =
21
> and 22 messages. At least for Russian language the latter is definitely a
> problem to think of: we'll say "=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=
=D0=B2=D0=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95",=
 but "=D0=A3 =D0=B2=D0=B0=D1=81 22
> =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=
=D0=B8=D0=AF". I believe other Slavic languages, and at least German and
> French are also affected by similar problems.
> That also concerns your question about "common" phrases. What is "common"
> in English, may differ significantly depending on context in other
> languages.
> I implore you to not forget about such peculiarities. In the past I've ha=
d
> issues with some software packages whose authors didn't think about that,
> and it was a pain translating those packages.


This is a great point! I would expect, in the example you provided, for the
property value to be the complete sentence, e.g. { new_messages: "You have
{variable} new messages" }.

Derick Montague
* * * * * * * * * * * * * * * *
Mobile: 512-609-0760
http://www.derick-montague.me


On Mon, Feb 18, 2019 at 3:19 AM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

> Hi, Susan!
>
> 15.02.2019 23:17, susan jasinski wrote:
>
> > I=E2=80=99d like some feedback about how to breakdown translation bundl=
es for
> the GUI.
> >
> > My initial thought is to create a bundle per panel since companies
> > have the option to pick and choose which upstream panels they want to
> > use. Would this be an overwhelming amount of bundles? Does this idea
> > scale well as we grow the number of panels? Does this scale well as
> > new panels are added after existing panels have already been
> > translated?
> >
> > In addition, there could a =E2=80=9Cglobal=E2=80=9D bundle for navigati=
on and header,
> > Should this include words/phrases that are common across many panels
> > such as =E2=80=9Csave=E2=80=9D and =E2=80=9Ccancel=E2=80=9D?
> >
> > Also, should GUI notifications/messages be in their own bundle or put
> > into their respective panel=E2=80=99s bundle?
> >
> > Can you think of other factors that should guide this decision?
>
> Are you going to use some ready framework for translations or are you
> going to develop a new one?
>
> It would be great if the solution provided an option for quick language
> switching.
>
> I once implemented such a solution, it used a json map of English strings
> to local strings. All translatable objects had a special class name, and
> the client-side Javascript code used that class to find all
> to-be-translated objects and on the fly changed their innerHTML using the
> map (saving the original content in an object's property). The con was th=
at
> the implementation was only able to process simple strings and couldn't b=
e
> applied to objects containing variable text (e.g. values embedded in text
> like "You have 12 new messages"). The problem is that different languages
> may require the variable part at different locations within the string an=
d
> also may use inclinations, so you can't just break such strings apart and
> translate "You have" and "new messages" separately because the translatio=
n
> may not just require writing it like "12 new messages you have", but will
> also be different for, say, 21 and 22 messages. At least for Russian
> language the latter is definitely a problem
> to think of: we'll say "=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=D0=B2=
=D0=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95", but "=
=D0=A3 =D0=B2=D0=B0=D1=81 22 =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5
> =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=AF". I believe other =
Slavic languages, and at least German and
> French are also affected by similar problems.
>
> That also concerns your question about "common" phrases. What is "common"
> in English, may differ significantly depending on context in other
> languages.
>
> I implore you to not forget about such peculiarities. In the past I've ha=
d
> issues with some software packages whose authors didn't think about that,
> and it was a pain translating those packages.
>
> As to bundling, I think that if something is shipped as a separate bundle=
,
> can be removed or added, then the translation data must go along with the
> rest of the bundle. The translation engine however must either be a
> separate bundle per se or be embedded into the core of WebUI.
>
> Alexander Amelkin
>
>
>

--0000000000007ed3b0058243e14c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Alexander!</div><div =
dir=3D"ltr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Are=
 you going to use some ready framework for translations or are you going to=
 develop a new one?</blockquote><div><br></div><div>After some previous dis=
cussions, it was decided to use Angular Translate -=C2=A0<a href=3D"https:/=
/github.com/angular-translate/angular-translate">https://github.com/angular=
-translate/angular-translate</a>=C2=A0</div><div><br></div><div>=C2=A0</div=
><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It woul=
d be great if the solution provided an option for quick language switching.=
</blockquote><div><br></div><div>The suggested pattern would be a simple la=
nguage switcher on the login page.</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">The problem is that different languages may r=
equire the variable part at different locations within the string and also =
may use inclinations, so you can&#39;t just break such strings apart and tr=
anslate &quot;You have&quot; and &quot;new messages&quot; separately becaus=
e the translation may not just require writing it like &quot;12 new message=
s you have&quot;, but will also be different for, say, 21 and 22 messages. =
At least for Russian language the latter is definitely a problem to think o=
f: we&#39;ll say &quot;=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=D0=B2=D0=
=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95&quot;, but=
 &quot;=D0=A3 =D0=B2=D0=B0=D1=81 22 =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5 =D1=81=
=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=AF&quot;. I believe other Sla=
vic languages, and at least German and French are also affected by similar =
problems.<br>That also concerns your question about &quot;common&quot; phra=
ses. What is &quot;common&quot; in English, may differ significantly depend=
ing on context in other languages.<br>I implore you to not forget about suc=
h peculiarities. In the past I&#39;ve had issues with some software package=
s whose authors didn&#39;t think about that, and it was a pain translating =
those packages.</blockquote><div><br></div><div>This is a great point! I wo=
uld expect, in the example you provided, for the property value to be the c=
omplete sentence, e.g. { new_messages: &quot;You have {variable} new messag=
es&quot; }.=C2=A0</div><div>=C2=A0</div><div><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><=
span style=3D"font-family:arial;font-size:small">Derick Montague</span><div=
 style=3D"font-family:arial;font-size:small">* * * * * * * * * * * * * * * =
*=C2=A0</div><div style=3D"font-family:arial;font-size:small">Mobile:=C2=A0=
<span title=3D"Call with Google Voice">512-609-0760</span><br></div><div st=
yle=3D"font-family:arial;font-size:small"><a href=3D"http://www.derick-mont=
ague.me" target=3D"_blank">http://www.derick-montague.me</a></div></div></d=
iv></div></div></div></div></div><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 18, 2019 at 3:19 AM Alexan=
der Amelkin &lt;<a href=3D"mailto:a.amelkin@yadro.com">a.amelkin@yadro.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i, Susan!<br>
<br>
15.02.2019 23:17, susan jasinski wrote:<br>
<br>
&gt; I=E2=80=99d like some feedback about how to breakdown translation bund=
les for the GUI.<br>
&gt;<br>
&gt; My initial thought is to create a bundle per panel since companies<br>
&gt; have the option to pick and choose which upstream panels they want to<=
br>
&gt; use. Would this be an overwhelming amount of bundles? Does this idea<b=
r>
&gt; scale well as we grow the number of panels? Does this scale well as<br=
>
&gt; new panels are added after existing panels have already been<br>
&gt; translated?<br>
&gt;<br>
&gt; In addition, there could a =E2=80=9Cglobal=E2=80=9D bundle for navigat=
ion and header,<br>
&gt; Should this include words/phrases that are common across many panels<b=
r>
&gt; such as =E2=80=9Csave=E2=80=9D and =E2=80=9Ccancel=E2=80=9D?<br>
&gt;<br>
&gt; Also, should GUI notifications/messages be in their own bundle or put<=
br>
&gt; into their respective panel=E2=80=99s bundle?<br>
&gt;<br>
&gt; Can you think of other factors that should guide this decision?<br>
<br>
Are you going to use some ready framework for translations or are you going=
 to develop a new one?<br>
<br>
It would be great if the solution provided an option for quick language swi=
tching.<br>
<br>
I once implemented such a solution, it used a json map of English strings t=
o local strings. All translatable objects had a special class name, and the=
 client-side Javascript code used that class to find all to-be-translated o=
bjects and on the fly changed their innerHTML using the map (saving the ori=
ginal content in an object&#39;s property). The con was that the implementa=
tion was only able to process simple strings and couldn&#39;t be applied to=
 objects containing variable text (e.g. values embedded in text like &quot;=
You have 12 new messages&quot;). The problem is that different languages ma=
y require the variable part at different locations within the string and al=
so may use inclinations, so you can&#39;t just break such strings apart and=
 translate &quot;You have&quot; and &quot;new messages&quot; separately bec=
ause the translation may not just require writing it like &quot;12 new mess=
ages you have&quot;, but will also be different for, say, 21 and 22 message=
s. At least for Russian language the latter is definitely a problem<br>
to think of: we&#39;ll say &quot;=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=
=D0=B2=D0=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95&q=
uot;, but &quot;=D0=A3 =D0=B2=D0=B0=D1=81 22 =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5=
 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=AF&quot;. I believe ot=
her Slavic languages, and at least German and French are also affected by s=
imilar problems.<br>
<br>
That also concerns your question about &quot;common&quot; phrases. What is =
&quot;common&quot; in English, may differ significantly depending on contex=
t in other languages.<br>
<br>
I implore you to not forget about such peculiarities. In the past I&#39;ve =
had issues with some software packages whose authors didn&#39;t think about=
 that, and it was a pain translating those packages.<br>
<br>
As to bundling, I think that if something is shipped as a separate bundle, =
can be removed or added, then the translation data must go along with the r=
est of the bundle. The translation engine however must either be a separate=
 bundle per se or be embedded into the core of WebUI.<br>
<br>
Alexander Amelkin<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000007ed3b0058243e14c--
