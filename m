Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=209.85.216.176; helo=mail-qt0-f176.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f9ESgFv3"; 
 dkim-atps=neutral
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
 [209.85.216.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424kXj3BbXzF1nv
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 10:07:16 +1000 (AEST)
Received: by mail-qt0-f176.google.com with SMTP id d4-v6so6113991qtn.13
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkaB9jpQZdRQVLdteMuHVdeMtFk7r3A7mhbAZAcxnCA=;
 b=f9ESgFv3Gp/8f/jLeWYYPARa5NobjiCEwE+tz5qq7LgGceTYiTbGjQtCm1yigp4q9z
 SOekFG1epGcduFz67S4e73O3HtJABRLlcjBBSa5olTqNIElI3ZghCuIqZ1UyVB63e9cF
 D4FYFS7QyY4T4gfk9sc9tJ2ZsxvPO7vkwcSWKzuw2+fHZCWNyFo8eDvZ7cnZH2HysVOd
 LsHR88vOXWu9IvCQqR+df7oQMk9vyST9vuPdgA5rvarCaKAKxexI1YQSwhUWcf4UItUC
 j1EfHbCfHFzMxS3qY5mJZ6yIL1sElmRB6Rdz8q8TX5IVCqQlcaFTRqz1KlRn9HGB6pBY
 rfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkaB9jpQZdRQVLdteMuHVdeMtFk7r3A7mhbAZAcxnCA=;
 b=PP2UxACGCRlb6C6WJZe730AyVCB+VsPlc6e1oyPkW5nr4gGqcfsJVrMLDV7RIBvKBH
 2jK68nwSTNsDiVPRqRO8PHVwmE6L5di8UjgRNcv3334NKb6xGH3sDLKfX3IkCe1h1eLH
 Yk8HQy9WwWnU9DePcFSvMlDA+vnT2T9oWM8J/i1RASDMTGDnGFAUCS6ST0dE3h/gShxU
 MMxNrUzjMYiag3M6WAxAWmAEEZ28ovKOHpBlzyzjoAzY72NESTTR6FtFdTkKi11zc4Qf
 AD0DhiAlxUk+E0WvAg0DN/G+ef3Z8Y5r0mw9mdsikDOz6UXBRe1iifNYjGaExcF7P42V
 guTg==
X-Gm-Message-State: APzg51By0lUx1gFP30fMIVBIRc4ZcN8BT53/OtWoRRnj/FPgAerU/5nf
 aBrpFRnK5/qJ1JpvRfkzTFfq+pWnWVfWFeFSsgNLOg==
X-Google-Smtp-Source: ANB0VdYOv2rmJVZ11KbqCjas07huK+YZTKI+a7w559PmfgZAEpObLiGzsBpjc4/o0G95CCo79Rz3zKMipw8I7v2bAgY=
X-Received: by 2002:ac8:528c:: with SMTP id
 s12-v6mr33224598qtn.311.1536106033688; 
 Tue, 04 Sep 2018 17:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
 <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
In-Reply-To: <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 4 Sep 2018 17:07:02 -0700
Message-ID: <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
Subject: Re: SOL Logging
To: Rebecca Broekhuis <beccabroek@gmail.com>
Cc: a.amelkin@yadro.com, openbmc@lists.ozlabs.org, a.senichev@yadro.com
Content-Type: multipart/alternative; boundary="0000000000007aa2ab0575148ed1"
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
X-List-Received-Date: Wed, 05 Sep 2018 00:07:18 -0000

--0000000000007aa2ab0575148ed1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wonder if there's a different and more useful way we can provide the
console scrollback. Thinking about this, it's not just a GUI issue, right -
we deliver our console over TCP to a client elsewhere and would have the
same dedupe issues if we needed to start providing backlog.  Speaking with
almost no experience implementing server-side sockets, is it possible for
us to keep that ring buffer in the console socket as well?

I'm also interested in how you all are getting the console over to webui.
Is it delivered via Redfish? (This is totally different from what we are
doing, so apologies if that's a fundamental question, but I'm certainly
keen to know now :) )

Emily

On Wed, Aug 29, 2018 at 1:09 PM Rebecca Broekhuis <beccabroek@gmail.com>
wrote:

>
> >The downside of that is the large amount of backlog to be transferred at
> >the start of the console session, which is typically when you need the
> >current data the most. In most cases, this could just be stale data from
> >a previous boot. Because of this, I think it'll be a net *loss* in
> >usability.
>
> I was looking at how AMI and supermicro's console works in the UI, and
> when the console session is started
> it is pre populated with just 30 or so log messages, nothing more. Would
> it be possible to combine both channels, replaying only the N most recent
> log statements?
> I may be misunderstanding what is possible here.
>
> I am also wondering if an implementation like this:
>  a) is adequate
>  b) would be a net gain in usability (considering the amount of backlog t=
o
> be transferred at the start of the session would be smaller)
>
> Becca
>
> On Wed, Aug 29, 2018 at 6:37 AM Alexander Amelkin <a.amelkin@yadro.com>
> wrote:
>
>>
>> 25.08.2018 00:02, Tanous, Ed wrote:
>>
>> I would like to start a discussion around the feature of SOL logging, an=
d
>> how to best implement it.
>>
>>
>>
>> There is a proposal here
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/
>> that proposes dumping the SOL console text buffer from Javascript into a
>> file, and presenting it to the user as a download.  On its face, it seem=
s
>> to work as designed.  This has some pretty severe limitations, in that y=
ou
>> can only dump the console log from your session, and your session is
>> essentially destroyed when you switch pages in the webui, or hit refresh=
.
>> I think this is overly limiting, and of the production BMC stacks that I
>> know of, none of them implement SOL logging in this way.
>>
>>
>>
>> Instead, other BMCs implement it as a circular buffer inside the BMC
>> itself, which allows SOL to log data all the time, not just while the us=
er
>> is logged in.  I think architecting it this way would be much more usefu=
l
>> for admins consuming OpenBMC, and make us more useful as a solution.  Do=
ing
>> it this way also can make the SOL log available to IPMI and Redfish, as
>> well as a file download, which improves the usability quite a bit.  Most
>> places I see the SOL logging requested is for audit type purposes, which
>> the javascript based version can=E2=80=99t do.
>>
>>
>>
>> I=E2=80=99m looking for feedback from the community here.  As written, I=
 don=E2=80=99t
>> think the javascript console export is a useful feature given its
>> limitations.  Do others agree?  Am I off base?  Are there use models whe=
re
>> having a log of only the current session is useful?  Should we document =
the
>> limitations so we can respond to bugs in the future?
>>
>>
>>
>> That's exactly what we have implemented in our BMC for YADRO VESNIN.
>> We have a circular buffer that constantly logs host console output and
>> also preserves the first several pages of each host boot. That way we
>> always have the last host boot "dmesg" as well as the very last few page=
s
>> before the host dies (or the logs were gathered).
>>
>> Alexander.
>>
>

--0000000000007aa2ab0575148ed1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wonder if there&#39;s a different and more useful way we=
 can provide the console scrollback. Thinking about this, it&#39;s not just=
 a GUI issue, right - we deliver our console over TCP to a client elsewhere=
 and would have the same dedupe issues if we needed to start providing back=
log.=C2=A0 Speaking with almost no experience implementing server-side sock=
ets, is it possible for us to keep that ring buffer in the console socket a=
s well?<div><br></div><div>I&#39;m also interested in how you all are getti=
ng the console over to webui.=C2=A0 Is it delivered via Redfish? (This is t=
otally different from what we are doing, so apologies if that&#39;s a funda=
mental question, but I&#39;m certainly keen to know now :) )</div><div><br>=
</div><div>Emily</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Wed, Aug 29, 2018 at 1:09 PM Rebecca Broekhuis &lt;<a href=3D"mailto:be=
ccabroek@gmail.com">beccabroek@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><br>&gt;The downside of that is the l=
arge amount of backlog to be transferred at<br>&gt;the start of the console=
 session, which is typically when you need the<br>&gt;current data the most=
. In most cases, this could just be stale data from<br>&gt;a previous boot.=
 Because of this, I think it&#39;ll be a net *loss* in<br>&gt;usability.<br=
><div><br></div></div><div dir=3D"ltr"><div>I was looking at how AMI and su=
permicro&#39;s console works in the UI, and when the console session is sta=
rted</div><div>it is pre populated with just 30 or so log messages, nothing=
 more. Would it be possible to combine both channels, replaying only the N =
most recent log statements?=C2=A0</div><div>I may be misunderstanding what =
is possible here.</div><div><br></div><div>I am also wondering if an implem=
entation like this:</div><div>=C2=A0a) is adequate</div><div>=C2=A0b) would=
 be a net gain in usability (considering the amount of backlog to be transf=
erred at the start of the session would be smaller)</div><div><br></div><di=
v>Becca</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, =
Aug 29, 2018 at 6:37 AM Alexander Amelkin &lt;<a href=3D"mailto:a.amelkin@y=
adro.com" target=3D"_blank">a.amelkin@yadro.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <div class=3D"m_7927845120496673542m_5796614707251720308moz-cite-prefix=
">25.08.2018 00:02, Tanous, Ed wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div class=3D"m_7927845120496673542m_5796614707251720308WordSection1"=
>
        <p class=3D"MsoNormal">I would like to start a discussion around
          the feature of SOL logging, and how to best implement it.<u></u><=
u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal">There is a proposal here <a href=3D"https://=
gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/" target=3D"_=
blank">
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/</a>
          that proposes dumping the SOL console text buffer from
          Javascript into a file, and presenting it to the user as a
          download.=C2=A0 On its face, it seems to work as designed.=C2=A0 =
This
          has some pretty severe limitations, in that you can only dump
          the console log from your session, and your session is
          essentially destroyed when you switch pages in the webui, or
          hit refresh.=C2=A0 I think this is overly limiting, and of the
          production BMC stacks that I know of, none of them implement
          SOL logging in this way.<u></u><u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal">Instead, other BMCs implement it as a
          circular buffer inside the BMC itself, which allows SOL to log
          data all the time, not just while the user is logged in.=C2=A0 I
          think architecting it this way would be much more useful for
          admins consuming OpenBMC, and make us more useful as a
          solution.=C2=A0 Doing it this way also can make the SOL log
          available to IPMI and Redfish, as well as a file download,
          which improves the usability quite a bit.=C2=A0 Most places I see
          the SOL logging requested is for audit type purposes, which
          the javascript based version can=E2=80=99t do.<u></u><u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal">I=E2=80=99m looking for feedback from the co=
mmunity
          here.=C2=A0 As written, I don=E2=80=99t think the javascript cons=
ole export
          is a useful feature given its limitations.=C2=A0 Do others agree?=
=C2=A0
          Am I off base?=C2=A0 Are there use models where having a log of
          only the current session is useful?=C2=A0 Should we document the
          limitations so we can respond to bugs in the future?<u></u><u></u=
></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u><br>
        </p>
      </div>
    </blockquote>
    That&#39;s exactly what we have implemented in our BMC for YADRO VESNIN=
.<br>
    We have a circular buffer that constantly logs host console output
    and also preserves the first several pages of each host boot. That
    way we always have the last host boot &quot;dmesg&quot; as well as the =
very
    last few pages before the host dies (or the logs were gathered).<br>
    <br>
    Alexander.<br>
  </div>

</blockquote></div>
</blockquote></div>

--0000000000007aa2ab0575148ed1--
