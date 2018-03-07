Return-Path: <rlippert@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::22e; helo=mail-qk0-x22e.google.com;
 envelope-from=rlippert@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rf66ZPJ+"; 
 dkim-atps=neutral
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwwS20yNHzF1cJ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 12:05:34 +1100 (AEDT)
Received: by mail-qk0-x22e.google.com with SMTP id s188so736957qkb.2
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 17:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bYbT+Tkew3rBQLn0ADxYQxjAsH38AGYJ+fAndM1O5n4=;
 b=rf66ZPJ+JiNU2amqEMzNeF3sqz0+me1/ulknurY/kHPt0bIwVd6kdj6ntQByLG/kzP
 ltiE0dTwb5fhDhuDnRRVR2KEe/Wf43UCGCxzdBYaFE+/ZTNpByd0gffyyTJeA7xxuL/h
 0lFVdaExBaP0pAZjNNsLBFyKXG1jK7ppaplS++/QltDcF9InnmIofRLYLPsWk/DzrwRC
 bIXKWAPBFxSaLgFv/mWqzPcQoS7DKN6qvZZItaXvWoPen7eInCDfKNjq9UtUdLgkTV2n
 btQuhTpIA1WuCHCv6xxgBZKFhqS7jtUcIXyW0CclFeegCs3hnRj1fa2PUlRiHbjTA5bU
 xBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bYbT+Tkew3rBQLn0ADxYQxjAsH38AGYJ+fAndM1O5n4=;
 b=hN2vbkMPH23aSd81dPlBQfnadfYqrrdwvnRgtBc4Reup+q6lDsdVkDuL5QSSjD89i7
 pyzQ+80CRNkcb106XfmKvJc5PrysPoYoLeRbLUPzaI6NO4z5sp6JKvT0eMGRDePmcnMq
 TztV+sutwYglYxJRfoEIJpGY4k6+gm3bOzhwOHC1WinnCz3YIkmRV15F9IrQua3z9N2e
 ZCkWX8U+kVFPVI3ku1S7ZrVr1eu98BXRawZTu9rLInlHmvPVQlTcnmz6KjnJDxf0bFJl
 dOMwHK/Te5rTtiQieAW2H2KNGua9+3ma3ZM8LpwL4fPMIsX+ufJuxBfkgREa8UR7fI9/
 yBIA==
X-Gm-Message-State: AElRT7HwJh74QEp5LOLNgKNIg3CnxKxEP6T7MUMru085kHCiEqrYjeDl
 mkAariiH0+AucI+/co9jD59x8SgJfJy4UaaLBtpvGg==
X-Google-Smtp-Source: AG47ELvH7N3p2ZJXBNfqn+QeIumCtHNPD2PjKbC24tmaqQkXgeomLbYgnh7jFghYhlV16H8dB10TsZAWwjkUqpUtGN4=
X-Received: by 10.55.145.4 with SMTP id t4mr11455318qkd.135.1520384731648;
 Tue, 06 Mar 2018 17:05:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.60.52 with HTTP; Tue, 6 Mar 2018 17:05:11 -0800 (PST)
In-Reply-To: <87efkyf1xw.fsf@linux.vnet.ibm.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
 <87efkyf1xw.fsf@linux.vnet.ibm.com>
From: Rob Lippert <rlippert@google.com>
Date: Tue, 6 Mar 2018 17:05:11 -0800
Message-ID: <CAFRv3ww59TrnRBWAKZu4LEc5V2iaSW03MEZQgQw6Yrymqt9Meg@mail.gmail.com>
Subject: Re: Exposing POST codes
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Venture <venture@google.com>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c084c88dad6df0566c82761"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 01:05:39 -0000

--94eb2c084c88dad6df0566c82761
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2018 at 5:05 PM, Stewart Smith <stewart@linux.vnet.ibm.com>
wrote:

> "Tanous, Ed" <ed.tanous@intel.com> writes:
> > Does POWER have any way of reporting detailed boot progress?  If, for
> > example, the USB link training starts processor init flows, is that
> > logged in a POWER system?  On x86, it would be logged as a POST code.
>
> On POWER (currently at least) there's a few things in play.
>
> On OpenPOWER systems the only thing we currently actively communicate to
> the BMC is the IPMI FW progress sensor, which isn't especially fine
> grained, but it's what we have hooked up.
>
> We do print out more detailed progress information to the console
> though. What we print out to the console is roughly in two categories:
> a) ISTEPs (probably the closest thing we have to POST codes, in that
>    they're numbers), but these also have names because text is more
>    descriptive than numbers.
> b) log messages from OPAL (words, mostly around what we've probed/are
> initing)
>
> One thing to note about the istep numbers is that they can go
> *backwards* if our firmware needs to do a reconfigure loop (e.g. we're
> after a firmware update and needing to flash a seeprom inside the chip,
> or we've discovered a problem with one of the cores and we're going to
> disable it).
>
> On the more enterprise-y POWER systems, there's SRC codes, which
> are a set of incomprehensible hexadecimal numbers in a seemingly random
> order designed to a) fit on a tiny LCD screen on the front of the
> machine and b) not be strings that would have to be translated.
> (I *always* have to google them, and even then, I don't think it helps)
>
> If there's a problem during boot, we'd generally look at the console
> output.... unless boot failure is *really* *REALLY* early, in which case
> it's before we have any communications channel to the BMC open (and you
> have to go and poke at the chip through one of the debug
> interfaces... although we would like to improve this situation)
>
> >> It just seems like the first thing anyone is going to do with these
> numbers is
> >> look them up and map them to something.  Wouldn=E2=80=99t it make sens=
e to have
> >> done that mapping already at the API level so that every user and piec=
e
> of
> >> code using this API doesn=E2=80=99t have to do it themselves?
> > That seems like a reasonable assumption, but practically isn't always
> > an option;  In general the POST code mappings are difficult to come
> > by, especially in initial system bringup, and that is when they are
> > most valuable.  If attempted, the ability to provide a mapping should
> > be made optional, which means the proposed interface still needs to
> > exist.
>
> What if it was a "number and/or string" kind of interface? Would that
> work? On
> x86 if you only have the method of getting a number out, you could just
> have the numbers (unless you have a mapping somewhere), but on POWER we
> could hook this up to get a number and/or string from firmware.
>
> >> I think what I=E2=80=99m hinting at here is that you could add a per-p=
latform
> config file
> >> to your app that maps the codes to some enumerations in the DBus
> >> interface, and apply that mapping before you emit the signal. If you
> wanted
> >> to go back to numbers later you could just reverse the mapping using t=
he
> >> same config file.  Please poke holes.
> >
> > I would argue that this functionality is outside the scope of Patricks
> > patch.  We could very clearly do as you're suggesting, but it would be
> > error prone, and make per-platform configuration more difficult to
> > port, and would likely take a number of months to get correct for all
> > platforms.  As is, Patricks patch adds value outside of his direct
> > platform, as other teams would have an immediate use of it, and is
> > very clear and clean to implement.  Building the platform configurable
> > API you suggest would take a lot more time and effort, for only a
> > little incremental value.  This seems like a case of "Perfect is the
> > enemy of good".  As is, both the API and the daemon are things that I
> > would use today on my platforms.
>
> Would a universal interface look something like this:
>
> - enum ProgressStages
>   (to support things like IPMI fw progress, i.e. generic and well
>   accepted what these mean)
> - int (descriptive integer, platform specific, 0=3Dunknown)
> - string (descriptive, platform specific, can be null)
>
> with each platform implementing whatever parts of that they can.
>
> Looks like x86 post codes would go in the int, maybe a lookup table for
> the string (if available).
>
> For POWER, we'd poke the istep number into the int, and a description
> into the string (from the host, some unknown mechanism to do that).
>
> thoughts?
>

I implemented port 80h POST codes for POWER9 hostboot a while back:
https://github.com/open-power/hostboot/blob/c93bef31ae6ce781f9e0a11bb9224b6=
728ff120f/src/usr/initservice/istepdispatcher/istepdispatcher.C#L2312

On Zaius machines we are using that support with Patrick's snoop daemon and
a separate daemon that receives the code via dbus and outputs it over the
front 7seg debug display.
It has proven useful for getting early error/debug reports from technicians
at scale e.g. "5 machines stopped at code 35h, 2 at 72h" provides a quick
overview of what the problems are for me to debug further (since I have the
decoder ring, and the istep names would be useless to them anyways).

-Rob

--94eb2c084c88dad6df0566c82761
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 5, 2018 at 5:05 PM, Stewart Smith <span dir=3D"ltr">&lt;<a =
href=3D"mailto:stewart@linux.vnet.ibm.com" target=3D"_blank">stewart@linux.=
vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><span class=3D"gmail-">&quot;Tanous, Ed&quot; &lt;<a href=3D"m=
ailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt; writes:<br>
&gt; Does POWER have any way of reporting detailed boot progress?=C2=A0 If,=
 for<br>
&gt; example, the USB link training starts processor init flows, is that<br=
>
&gt; logged in a POWER system?=C2=A0 On x86, it would be logged as a POST c=
ode.<br>
<br>
</span>On POWER (currently at least) there&#39;s a few things in play.<br>
<br>
On OpenPOWER systems the only thing we currently actively communicate to<br=
>
the BMC is the IPMI FW progress sensor, which isn&#39;t especially fine<br>
grained, but it&#39;s what we have hooked up.<br>
<br>
We do print out more detailed progress information to the console<br>
though. What we print out to the console is roughly in two categories:<br>
a) ISTEPs (probably the closest thing we have to POST codes, in that<br>
=C2=A0 =C2=A0they&#39;re numbers), but these also have names because text i=
s more<br>
=C2=A0 =C2=A0descriptive than numbers.<br>
b) log messages from OPAL (words, mostly around what we&#39;ve probed/are<b=
r>
initing)<br>
<br>
One thing to note about the istep numbers is that they can go<br>
*backwards* if our firmware needs to do a reconfigure loop (e.g. we&#39;re<=
br>
after a firmware update and needing to flash a seeprom inside the chip,<br>
or we&#39;ve discovered a problem with one of the cores and we&#39;re going=
 to<br>
disable it).<br>
<br>
On the more enterprise-y POWER systems, there&#39;s SRC codes, which<br>
are a set of incomprehensible hexadecimal numbers in a seemingly random<br>
order designed to a) fit on a tiny LCD screen on the front of the<br>
machine and b) not be strings that would have to be translated.<br>
(I *always* have to google them, and even then, I don&#39;t think it helps)=
<br>
<br>
If there&#39;s a problem during boot, we&#39;d generally look at the consol=
e<br>
output.... unless boot failure is *really* *REALLY* early, in which case<br=
>
it&#39;s before we have any communications channel to the BMC open (and you=
<br>
have to go and poke at the chip through one of the debug<br>
interfaces... although we would like to improve this situation)<br>
<span class=3D"gmail-"><br>
&gt;&gt; It just seems like the first thing anyone is going to do with thes=
e numbers is<br>
&gt;&gt; look them up and map them to something.=C2=A0 Wouldn=E2=80=99t it =
make sense to have<br>
&gt;&gt; done that mapping already at the API level so that every user and =
piece of<br>
&gt;&gt; code using this API doesn=E2=80=99t have to do it themselves?<br>
&gt; That seems like a reasonable assumption, but practically isn&#39;t alw=
ays<br>
&gt; an option;=C2=A0 In general the POST code mappings are difficult to co=
me<br>
&gt; by, especially in initial system bringup, and that is when they are<br=
>
&gt; most valuable.=C2=A0 If attempted, the ability to provide a mapping sh=
ould<br>
&gt; be made optional, which means the proposed interface still needs to<br=
>
&gt; exist.<br>
<br>
</span>What if it was a &quot;number and/or string&quot; kind of interface?=
 Would that work? On<br>
x86 if you only have the method of getting a number out, you could just<br>
have the numbers (unless you have a mapping somewhere), but on POWER we<br>
could hook this up to get a number and/or string from firmware.<br>
<span class=3D"gmail-"><br>
&gt;&gt; I think what I=E2=80=99m hinting at here is that you could add a p=
er-platform config file<br>
&gt;&gt; to your app that maps the codes to some enumerations in the DBus<b=
r>
&gt;&gt; interface, and apply that mapping before you emit the signal. If y=
ou wanted<br>
&gt;&gt; to go back to numbers later you could just reverse the mapping usi=
ng the<br>
&gt;&gt; same config file.=C2=A0 Please poke holes.<br>
&gt;<br>
&gt; I would argue that this functionality is outside the scope of Patricks=
<br>
&gt; patch.=C2=A0 We could very clearly do as you&#39;re suggesting, but it=
 would be<br>
&gt; error prone, and make per-platform configuration more difficult to<br>
&gt; port, and would likely take a number of months to get correct for all<=
br>
&gt; platforms.=C2=A0 As is, Patricks patch adds value outside of his direc=
t<br>
&gt; platform, as other teams would have an immediate use of it, and is<br>
&gt; very clear and clean to implement.=C2=A0 Building the platform configu=
rable<br>
&gt; API you suggest would take a lot more time and effort, for only a<br>
&gt; little incremental value.=C2=A0 This seems like a case of &quot;Perfec=
t is the<br>
&gt; enemy of good&quot;.=C2=A0 As is, both the API and the daemon are thin=
gs that I<br>
&gt; would use today on my platforms.<br>
<br>
</span>Would a universal interface look something like this:<br>
<br>
- enum ProgressStages<br>
=C2=A0 (to support things like IPMI fw progress, i.e. generic and well<br>
=C2=A0 accepted what these mean)<br>
- int (descriptive integer, platform specific, 0=3Dunknown)<br>
- string (descriptive, platform specific, can be null)<br>
<br>
with each platform implementing whatever parts of that they can.<br>
<br>
Looks like x86 post codes would go in the int, maybe a lookup table for<br>
the string (if available).<br>
<br>
For POWER, we&#39;d poke the istep number into the int, and a description<b=
r>
into the string (from the host, some unknown mechanism to do that).<br>
<br>
thoughts?<br></blockquote><div><br></div><div>I implemented port 80h POST c=
odes for POWER9 hostboot a while back:</div><div><a href=3D"https://github.=
com/open-power/hostboot/blob/c93bef31ae6ce781f9e0a11bb9224b6728ff120f/src/u=
sr/initservice/istepdispatcher/istepdispatcher.C#L2312">https://github.com/=
open-power/hostboot/blob/c93bef31ae6ce781f9e0a11bb9224b6728ff120f/src/usr/i=
nitservice/istepdispatcher/istepdispatcher.C#L2312</a><br></div><div><br></=
div><div>On Zaius machines we are using that support with Patrick&#39;s sno=
op daemon and a separate daemon that receives the code via dbus and outputs=
 it over the front 7seg debug display.</div><div>It has proven useful for g=
etting early error/debug reports from technicians at scale e.g. &quot;5 mac=
hines stopped at code 35h, 2 at 72h&quot; provides a quick overview of what=
 the problems are for me to debug further (since I have the decoder ring, a=
nd the istep names would be useless to them anyways).</div><div><br></div><=
div>-Rob</div></div></div></div>

--94eb2c084c88dad6df0566c82761--
