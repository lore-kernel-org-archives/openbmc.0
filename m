Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dQzJEB38"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41c3P32762zF0gL
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 06:20:00 +1000 (AEST)
Received: by mail-it0-x233.google.com with SMTP id v71-v6so4443849itb.3
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2uuDl2DWc/fp9DWPYdL6Wc9D5l+mWhhRSlpIFkO0iHg=;
 b=dQzJEB386aymRJ4iS1xKU/5DAO5o7xZfx/l1tA1hnlvnkRqFBYZgG4+9aeRFzCktzo
 N/F3EXaWox14/PGihWUvYhPQZqbzv6G7aq8hCE2OoPKLpA9ZsfHq0POTDoDant2RuttY
 GvDgdUAtRi3u7QB66fiZRlCHY60bjw9bJ54erJnTo5wLvQgbJdD3hPDqhdr3aL7VuFL8
 Vd9WtAHXfm/woZ7IDTURHQBnabAZIM3A2LkZwr3OihrxD5rtTufPMH1V2qcoYLrCfqfT
 l/869UW3PMm++jkgvPKcZwsM8hhLEx91Cw1h5VDOJxMGNjcpnLGRH8g5LRhDTwqGjiaE
 ZQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2uuDl2DWc/fp9DWPYdL6Wc9D5l+mWhhRSlpIFkO0iHg=;
 b=LARveZU2ukZbiqkXePLOX/MoZ0doMKnDJxDqcBE8iaUHdBJDUJ9X4XxY7Wlsh7jT72
 P++QYkZPbEETrXdUQQUJVF1eT5QR/Q/OLp3gzfgJV9vFCurMdRsR8qmgNY3W0e8UoP8B
 oEDZTSaUeO3QraqIrQTixnpAfdSnaOCSeteIMiEq6TXdHnB4ifw8QvZ5NNdgY2piRPJK
 s/hSzS4WCtmw3zJV8w5bJYRpTPnId+nL5RUi6hAR2u2Tv9ZVlIuebpm/qr07vIdoPzRL
 As9lZ2PCGkEpzEIx0DrU5IMcPj7hATCFgp/lqhSVatJwgOZfTX0BwHXlpSAWwjCA3gdX
 xn2g==
X-Gm-Message-State: AOUpUlHiKGCRU0P14FMX3nogyDzX5fEhojX5tU7ZLm2Y67ro3YuY8Fiy
 bz4O/J66d8BDocNV35aX/ojtn+oNB9exKS5t3IZB2A==
X-Google-Smtp-Source: AAOMgpemB/4M7cnZcLBFIfXneM4Fq0TieoyHOpZvr22QD4PCghgeWFk1VlpiQNOEKGxJn8K96C/xnB1tQx8Vxsh/8bA=
X-Received: by 2002:a24:d7c5:: with SMTP id
 y188-v6mr3206104itg.50.1532636397905; 
 Thu, 26 Jul 2018 13:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:8801:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 13:19:17
 -0700 (PDT)
In-Reply-To: <OFBC71A75E.C9C8F28D-ON002582D3.004AAE2A-002582D3.004C186B@notes.na.collabserv.com>
References: <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
 <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
 <CALLMt=qUzt55cL47j3+vKOKaqFQpKXiMps0FVJHVwd8jJeF-aQ@mail.gmail.com>
 <OFBC71A75E.C9C8F28D-ON002582D3.004AAE2A-002582D3.004C186B@notes.na.collabserv.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 26 Jul 2018 13:19:17 -0700
Message-ID: <CADfYTpEGA5tahs9dNMyCvUuc65SNd3jnE3A8MyVOHi5PXsYQFA@mail.gmail.com>
Subject: Re: openbmc test work group - wiki
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000011d16c0571ecb880"
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
X-List-Received-Date: Thu, 26 Jul 2018 20:20:08 -0000

--00000000000011d16c0571ecb880
Content-Type: text/plain; charset="UTF-8"

Please include me when you have the kick off meeting

Thanks,

----------
Nancy

On Mon, Jul 23, 2018 at 6:51 AM, Sivas Srr <sivas.srr@in.ibm.com> wrote:

> Thank you Brad Bishop (For offline review),  Kurt Taylor and Andrew
> Geissler for your kind support.
>
> Yes CI can be included.
> ( In my opinion, If we want to do good CI, we may have to do more left
> shift from CT bucket
> as well). Dynamic CI, It should be. If major code drop associate with a
> feature/Area,
> then test bucket of that CT bucket should be executed as part of CI. We
> can discuss on this.
>
> For eg. IPMI user management features getting enabled then entire IPMI
> bucket can be run part of CI.
>
> Test work group meeting:
>
> As test based on release planning, Would like to have this meeting  either
> on the same day after the release plan meeting or a day after the release
> plan meeting.
>
> Currently release plan meeting happens on Thursday 3 PM CST.
> Proposal to have test work group meeting is either on Thursday evening 7
> or 8 PM CST.
>
> Thank you again for all your inputs.
>
>
>
> Sivas R. S
> E-mail: sivas.srr@in.ibm.com
> E2E FSP Test Architecture, OpenBMC Test Lead, Lab Management
> Automation is good, Identifying Defect earlier is better always
> 9902233500
> 08046678273
>
>
>
> ----- Original message -----
> From: Andrew Geissler <geissonator@gmail.com>
> Sent by: "openbmc" <openbmc-bounces+sivas.srr=in.ibm.com@lists.ozlabs.org>
> To: Kurt Taylor <kurt.r.taylor@gmail.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: openbmc test work group - wiki
> Date: Fri, Jul 20, 2018 11:12 PM
>
> On Fri, Jul 20, 2018 at 10:58 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
> >
> > On 7/19/18 10:47 PM, Sivas Srr wrote:
> >
> >
> > Hi All,
> >
> > Have https://github.com/openbmc/openbmc/wiki/Test-work---group  created
> this page in our
> > wiki for upcoming test work group. Please review and provide your inputs
> / raise questions if you need any clarification.
> >
> >
> > Thanks Sivas! I'll join and help however I can. When would be a good
> time for a kickoff meeting?
> >
> > It looks like the initial list is a good summary, where do we start,
> what is the most painful thing to fix? Also, is there room for remote
> (third-party) CI testing in this WG?
>
> Second this one, Brad and I were just chatting a bit on this the other
> day, how could we scale the HW CI testing with third parties.  Would
> def like it if we could discuss within this WG (and any other
> improvements to our CI process)
>
> >
> > Kurt Taylor (krtaylor)
> >
> > Sivas R. S
> > E-mail: sivas.srr@in.ibm.com
> >
> > Automation is good, Identifying Defect earlier is better always
> > 9902233500
> > 08046678273
> >
> >
>
>
>
>

--00000000000011d16c0571ecb880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please include me when you have the kick off meeting<div><=
br></div><div>Thanks,</div></div><div class=3D"gmail_extra"><br clear=3D"al=
l"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">-=
---------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Mon, Jul 23, 2018 at 6:51 AM, Sivas Srr <=
span dir=3D"ltr">&lt;<a href=3D"mailto:sivas.srr@in.ibm.com" target=3D"_bla=
nk">sivas.srr@in.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div class=3D"m_8919110495936005460socmaildefaultfont" dir=3D"ltr" st=
yle=3D"font-family:Arial,Helvetica,sans-serif;font-size:10.5pt"><div dir=3D=
"ltr">Thank you Brad Bishop (For offline review),=C2=A0 Kurt Taylor and And=
rew Geissler for your kind support.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Yes CI can be included.</div>
<div dir=3D"ltr">( In my opinion, If we want to do good CI, we may have to =
do more left shift from CT bucket</div>
<div dir=3D"ltr">as well). Dynamic CI, It should be. If major code drop ass=
ociate with a feature/Area,</div>
<div dir=3D"ltr">then test bucket of that CT bucket should be executed as p=
art of CI. We can discuss on this.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">For eg. IPMI user management features getting enabled then=
 entire IPMI bucket can be run part of CI.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Test work group meeting:</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">As test based on release planning, Would like to have this=
 meeting=C2=A0 either on the same day after the release plan meeting or a d=
ay after the release plan meeting.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Currently release plan meeting happens on Thursday 3 PM CS=
T.</div>
<div dir=3D"ltr">Proposal to have test work group meeting is either on Thur=
sday evening 7 or 8 PM CST.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Thank you again for all your inputs.</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr"><div class=3D"m_8919110495936005460socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt"><div class=3D"m_89191=
10495936005460socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt"><div class=3D"m_8919110495936005460socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt"><div class=3D"m_89191=
10495936005460socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt"><div class=3D"m_8919110495936005460socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt"><div dir=3D"ltr" styl=
e=3D"margin-top:20px"><div style=3D"font-size:12pt;font-weight:bold;font-fa=
mily:sans-serif;color:#7c7c5f">Sivas R. S</div>
<div style=3D"font-size:8pt;font-family:sans-serif;margin-top:10px"><div><s=
pan style=3D"font-weight:bold;color:#336699">E-mail: </span><a href=3D"mail=
to:sivas.srr@in.ibm.com" style=3D"color:#555" target=3D"_blank">sivas.srr@i=
n.ibm.com</a></div>
<div>E2E FSP Test Architecture, OpenBMC Test Lead, Lab Management</div><spa=
n class=3D"">
<div>Automation is good, Identifying Defect earlier is better always</div>
<div>9902233500</div>
<div>08046678273</div></span></div></div></div></div></div></div></div></di=
v><div><div class=3D"h5">
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<blockquote dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px;margin-left:=
5px;padding-left:5px;direction:ltr;margin-right:0px">----- Original message=
 -----<br>From: Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com=
" target=3D"_blank">geissonator@gmail.com</a>&gt;<br>Sent by: &quot;openbmc=
&quot; &lt;openbmc-bounces+sivas.srr=3D<a href=3D"mailto:in.ibm.com@lists.o=
zlabs.org" target=3D"_blank">in.<wbr>ibm.com@lists.ozlabs.org</a>&gt;<br>To=
: Kurt Taylor &lt;<a href=3D"mailto:kurt.r.taylor@gmail.com" target=3D"_bla=
nk">kurt.r.taylor@gmail.com</a>&gt;<br>Cc: OpenBMC Maillist &lt;<a href=3D"=
mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org=
</a>&gt;<br>Subject: Re: openbmc test work group - wiki<br>Date: Fri, Jul 2=
0, 2018 11:12 PM<br>=C2=A0<br><tt><font size=3D"3" face=3D"">On Fri, Jul 20=
, 2018 at 10:58 AM krtaylor &lt;<a href=3D"mailto:kurt.r.taylor@gmail.com" =
target=3D"_blank">kurt.r.taylor@gmail.com</a>&gt; wrote:</font></tt><br><tt=
><font size=3D"3" face=3D"">&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"">&gt;=C2=A0On 7/19/18 10:47 PM, Sivas Srr wrote:</font></tt><br><tt><f=
ont size=3D"3" face=3D"">&gt;</font></tt><br><tt><font size=3D"3" face=3D""=
>&gt;</font></tt><br><tt><font size=3D"3" face=3D"">&gt;=C2=A0Hi All,</font=
></tt><br><tt><font size=3D"3" face=3D"">&gt;</font></tt><br><tt><font size=
=3D"3" face=3D"">&gt;=C2=A0Have <a href=3D"https://github.com/openbmc/openb=
mc/wiki/Test-work---group" target=3D"_blank">https://github.com/openbmc/<wb=
r>openbmc/wiki/Test-work---group</a> =C2=A0created this page in our</font><=
/tt><br><tt><font size=3D"3" face=3D"">&gt;=C2=A0wiki for upcoming test wor=
k group. Please review and provide your inputs / raise questions if you nee=
d any clarification.</font></tt><br><tt><font size=3D"3" face=3D"">&gt;</fo=
nt></tt><br><tt><font size=3D"3" face=3D"">&gt;</font></tt><br><tt><font si=
ze=3D"3" face=3D"">&gt;=C2=A0Thanks Sivas! I&#39;ll join and help however I=
 can. When would be a good time for a kickoff meeting?</font></tt><br><tt><=
font size=3D"3" face=3D"">&gt;</font></tt><br><tt><font size=3D"3" face=3D"=
">&gt;=C2=A0It looks like the initial list is a good summary, where do we s=
tart, what is the most painful thing to fix? Also, is there room for remote=
 (third-party) CI testing in this WG?</font></tt><br><br><tt><font size=3D"=
3" face=3D"">Second this one, Brad and I were just chatting a bit on this t=
he other</font></tt><br><tt><font size=3D"3" face=3D"">day, how could we sc=
ale the HW CI testing with third parties.=C2=A0 Would</font></tt><br><tt><f=
ont size=3D"3" face=3D"">def like it if we could discuss within this WG (an=
d any other</font></tt><br><tt><font size=3D"3" face=3D"">improvements to o=
ur CI process)</font></tt><br><br><tt><font size=3D"3" face=3D"">&gt;</font=
></tt><br><tt><font size=3D"3" face=3D"">&gt;=C2=A0Kurt Taylor (krtaylor)</=
font></tt><br><tt><font size=3D"3" face=3D"">&gt;</font></tt><br><tt><font =
size=3D"3" face=3D"">&gt;=C2=A0Sivas R. S</font></tt><br><tt><font size=3D"=
3" face=3D"">&gt;=C2=A0E-mail: <a href=3D"mailto:sivas.srr@in.ibm.com" targ=
et=3D"_blank">sivas.srr@in.ibm.com</a></font></tt><br><tt><font size=3D"3" =
face=3D"">&gt;</font></tt><br><tt><font size=3D"3" face=3D"">&gt;=C2=A0Auto=
mation is good, Identifying Defect earlier is better always</font></tt><br>=
<tt><font size=3D"3" face=3D"">&gt;=C2=A09902233500</font></tt><br><tt><fon=
t size=3D"3" face=3D"">&gt;=C2=A008046678273</font></tt><br><tt><font size=
=3D"3" face=3D"">&gt;</font></tt><br><tt><font size=3D"3" face=3D"">&gt;</f=
ont></tt></blockquote>
<div dir=3D"ltr">=C2=A0</div></div></div></div><br>

</blockquote></div><br></div>

--00000000000011d16c0571ecb880--
