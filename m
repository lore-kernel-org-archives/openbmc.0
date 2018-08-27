Return-Path: <beccabroek@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c42; helo=mail-yw1-xc42.google.com;
 envelope-from=beccabroek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ajXZR37G"; 
 dkim-atps=neutral
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zYwp1sNDzDqSL
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 00:21:42 +1000 (AEST)
Received: by mail-yw1-xc42.google.com with SMTP id l9-v6so5607456ywc.11
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hLMVDAnH2DWywcvTaoEsliZERbcQFLFIkkQxCaQcG38=;
 b=ajXZR37GVoTTXeFtojNODmXy6eyibkZPQHdAtwVtc+eLQyUl/bXw4pIqciw3C58VP8
 y2kOssb5PcigXIEb6/xiwGwkB8xnUnz+Ek/vaLcRDTnaIpw0jJLFc0td6fPbWukqZZZh
 o4LIQV9OLVgUm1+xwGfTke3QTAK6T+laPE7ad73FSe44IqoqV4c725cxslLZTkJwbUag
 VVsAl/BEhLMmeMLUcT9KbIv7ectuaWS7enCXNJYCQCjsp+5M+ya6dcwtbTRWEqj7GnjD
 2x2b7Fajd/8vzXqmSOjLpV/RTYD3uOhTOjoCFLQUi4kSHxUCJnoUuKqmLuIZ6k18kvQa
 J95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLMVDAnH2DWywcvTaoEsliZERbcQFLFIkkQxCaQcG38=;
 b=ZX74wLeFu8UnJK7KLSs5JQ1QZ/WmCYijGQ/qYCdoqwn3/UsI79yuswrDxSNcrhOavz
 imEhF+2ftgHhZr4m2LSQ7dIvbUOOaDL82JdzVYWBVnWi5a+6MxotfWafOJsL6CtT2kQ/
 ykypYcpncUNF9QBZdE7dftVRCwyp+tHDZaK0p1u4X14tl9bq13ZvYqy91TrGk9XtJiow
 POvXXnJ0o6ScV9zsrbvQb/2MCoLPE/jq8rmRu4EvK3W61RuVXACi6bdgj5/I/Ouxgli7
 UblPQDYdEIZK3s7RgM5tw8sixv6cVFplAwWAeCp68tSYwjLFReZnOpkbYFPMQTQzDbRb
 qbIw==
X-Gm-Message-State: APzg51D239gfLhGdrDuVBeyWExwn6R27O9vSLAguCpiFjA/w/iFXOvkJ
 wdZdUEEg29Dl5y0f+O2W7Bl0itROL1wT0G2L2s4=
X-Google-Smtp-Source: ANB0VdZ5vShAw/jnddUau18r9W92PsLWITEOqJoWAXKw/uA9ank7apBFbPn+k60F2nTBFPMKi1ZiJ/i3mGGviTUdoAM=
X-Received: by 2002:a81:5855:: with SMTP id
 m82-v6mr6781943ywb.300.1535379700031; 
 Mon, 27 Aug 2018 07:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <CALLMt=onADDRBk1w-zkxSEq-8XQQxbOrkP-zAVP9x+pFbN1oAA@mail.gmail.com>
In-Reply-To: <CALLMt=onADDRBk1w-zkxSEq-8XQQxbOrkP-zAVP9x+pFbN1oAA@mail.gmail.com>
From: Rebecca Broekhuis <beccabroek@gmail.com>
Date: Mon, 27 Aug 2018 09:21:28 -0500
Message-ID: <CABzWfr=g7s7SMDqovsoRA1aX71ZpRaHZzPefM3vB40h5SUP86g@mail.gmail.com>
Subject: Re: SOL Logging
To: geissonator@gmail.com
Cc: ed.tanous@intel.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009da5a205746b71b6"
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
X-List-Received-Date: Mon, 27 Aug 2018 14:21:48 -0000

--0000000000009da5a205746b71b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree with what you're saying about the javascript implementation of this
being limited. Besides the session being destroyed upon leaving the page, I
am also seeing that we are losing console messages in the front end when
the websocket closes for a moment (which it is consistently doing during
power on). We lose those messages sent during the time it takes to re-open
the connection. They aren't displayed in the terminal emulator and
therefore aren't exported to the text file when the user clicks 'export'. I
could see that as another reason to implement the ability to download the
existing obmc-console.log, since the pure javascript way of exporting to a
text file could be an incomplete log in some cases.

There might be a another way to address missing messages as a result of the
websocket closing, but from my current understanding it seems like another
reason having the javascript export exclusively would be an unreliable
option.

I can also see how having both downloads available could be confusing to
the user -- I'd be happy to run this by the design team to see if they have
input.

-- Becca

On Mon, Aug 27, 2018 at 7:49 AM Andrew Geissler <geissonator@gmail.com>
wrote:

> On Fri, Aug 24, 2018 at 4:03 PM Tanous, Ed <ed.tanous@intel.com> wrote:
> >
> > I would like to start a discussion around the feature of SOL logging,
> and how to best implement it.
> >
> >
> >
> > There is a proposal here
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/
> that proposes dumping the SOL console text buffer from Javascript into a
> file, and presenting it to the user as a download.  On its face, it seems
> to work as designed.  This has some pretty severe limitations, in that yo=
u
> can only dump the console log from your session, and your session is
> essentially destroyed when you switch pages in the webui, or hit refresh.
> I think this is overly limiting, and of the production BMC stacks that I
> know of, none of them implement SOL logging in this way.
> >
> >
> >
> > Instead, other BMCs implement it as a circular buffer inside the BMC
> itself, which allows SOL to log data all the time, not just while the use=
r
> is logged in.  I think architecting it this way would be much more useful
> for admins consuming OpenBMC, and make us more useful as a solution.  Doi=
ng
> it this way also can make the SOL log available to IPMI and Redfish, as
> well as a file download, which improves the usability quite a bit.  Most
> places I see the SOL logging requested is for audit type purposes, which
> the javascript based version can=E2=80=99t do.
>
> We use https://github.com/openbmc/obmc-console for this currently.  It
> creates a file at /var/log/obmc-console.log and even has a
> customizable size for the file to wrap at. I guess the advantage of
> having it in the GUI is the user could ensure a full dump of the
> console (vs. just grabbing the existing obmc-console.log which may
> have wrapped). Being able to view the SOL output has it happens in the
> GUI, then having an option to export it sounds kind of useful.  Also
> be nice to be able to retrieve and view the existing obmc-console.log
> from the system in case you missed it in the GUI.  Maybe that latter
> part is enough though, reduces GUI complexity and testing. Something
> good to run by our usability/design team Gunnar/Rebecca?
>
> >
> >
> > I=E2=80=99m looking for feedback from the community here.  As written, =
I don=E2=80=99t
> think the javascript console export is a useful feature given its
> limitations.  Do others agree?  Am I off base?  Are there use models wher=
e
> having a log of only the current session is useful?  Should we document t=
he
> limitations so we can respond to bugs in the future?
> >
> >
> >
> > Thanks,
> >
> >
> >
> > -Ed
>

--0000000000009da5a205746b71b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I agree with what you&#39;re saying about the javascript i=
mplementation of this being limited. Besides the session being destroyed up=
on leaving the page, I am also seeing that we are losing console messages i=
n the front end when the websocket closes for a moment (which it is consist=
ently doing during power on). We lose those messages sent during the time i=
t takes to re-open the connection. They aren&#39;t displayed in the termina=
l emulator and therefore aren&#39;t exported to the text file when the user=
 clicks &#39;export&#39;. I could see that as another reason to implement t=
he ability to download the existing obmc-console.log, since the pure javasc=
ript way of exporting to a text file could be an incomplete log in some cas=
es.<div><br></div><div>There might be a another way to address missing mess=
ages as a result of the websocket closing, but from my current understandin=
g it seems like another reason having the javascript export exclusively wou=
ld be an unreliable option.<br><br>I can also see how having both downloads=
 available could be confusing to the user -- I&#39;d be happy to run this b=
y the design team to see if they have input.</div><div><br></div><div>-- Be=
cca</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug =
27, 2018 at 7:49 AM Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail=
.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Fri, Aug 24, 2018 at 4:03 PM Tanous, Ed &lt;<a href=3D"mailto:ed=
.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I would like to start a discussion around the feature of SOL logging, =
and how to best implement it.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; There is a proposal here <a href=3D"https://gerrit.openbmc-project.xyz=
/#/c/openbmc/phosphor-webui/+/12063/" rel=3D"noreferrer" target=3D"_blank">=
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/</a> =
that proposes dumping the SOL console text buffer from Javascript into a fi=
le, and presenting it to the user as a download.=C2=A0 On its face, it seem=
s to work as designed.=C2=A0 This has some pretty severe limitations, in th=
at you can only dump the console log from your session, and your session is=
 essentially destroyed when you switch pages in the webui, or hit refresh.=
=C2=A0 I think this is overly limiting, and of the production BMC stacks th=
at I know of, none of them implement SOL logging in this way.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Instead, other BMCs implement it as a circular buffer inside the BMC i=
tself, which allows SOL to log data all the time, not just while the user i=
s logged in.=C2=A0 I think architecting it this way would be much more usef=
ul for admins consuming OpenBMC, and make us more useful as a solution.=C2=
=A0 Doing it this way also can make the SOL log available to IPMI and Redfi=
sh, as well as a file download, which improves the usability quite a bit.=
=C2=A0 Most places I see the SOL logging requested is for audit type purpos=
es, which the javascript based version can=E2=80=99t do.<br>
<br>
We use <a href=3D"https://github.com/openbmc/obmc-console" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/obmc-console</a> for this c=
urrently.=C2=A0 It<br>
creates a file at /var/log/obmc-console.log and even has a<br>
customizable size for the file to wrap at. I guess the advantage of<br>
having it in the GUI is the user could ensure a full dump of the<br>
console (vs. just grabbing the existing obmc-console.log which may<br>
have wrapped). Being able to view the SOL output has it happens in the<br>
GUI, then having an option to export it sounds kind of useful.=C2=A0 Also<b=
r>
be nice to be able to retrieve and view the existing obmc-console.log<br>
from the system in case you missed it in the GUI.=C2=A0 Maybe that latter<b=
r>
part is enough though, reduces GUI complexity and testing. Something<br>
good to run by our usability/design team Gunnar/Rebecca?<br>
<br>
&gt;<br>
&gt;<br>
&gt; I=E2=80=99m looking for feedback from the community here.=C2=A0 As wri=
tten, I don=E2=80=99t think the javascript console export is a useful featu=
re given its limitations.=C2=A0 Do others agree?=C2=A0 Am I off base?=C2=A0=
 Are there use models where having a log of only the current session is use=
ful?=C2=A0 Should we document the limitations so we can respond to bugs in =
the future?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -Ed<br>
</blockquote></div>

--0000000000009da5a205746b71b6--
