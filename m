Return-Path: <beccabroek@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c09::22d; helo=mail-yb0-x22d.google.com;
 envelope-from=beccabroek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vPdBAOGK"; 
 dkim-atps=neutral
Received: from mail-yb0-x22d.google.com (mail-yb0-x22d.google.com
 [IPv6:2607:f8b0:4002:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420xXh0N9tzF33P
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 06:09:06 +1000 (AEST)
Received: by mail-yb0-x22d.google.com with SMTP id t10-v6so2525214ybb.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 13:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knXvpfb9Ujdafyx/KXPiBOko+fNTW6elAIh/QLlz0vo=;
 b=vPdBAOGKbu74o8/XFYOvCCvENXQiHrz8KWN5B2UMiS+qIeG+3yTFD+4nd7SiJjZYJy
 uNdEqtB7wnlvRFR8vE0LFLzeb2cC7Rod6h1v9dBy1zk8lW6ayilOfztMKPPe3UGicsSW
 by8RnvrDdVzv19kRXK0cVbHXEAMRP4MkzSOU3VAolgWqwL2NqwF8UveK8h5qFZIctSXj
 uzQkPFhiUdk87E3Mz9Qc9xKSReCU66Anykf95VyL8HsdXBKNzNKBUS3SNTRxXpF5df4z
 m3xDMvAZQZLdtOvWeXLrI0BVop3e8QYZ7S60GN/qMwwUi4vXwgNPhtI1T/Wx5EfaagK+
 Io6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knXvpfb9Ujdafyx/KXPiBOko+fNTW6elAIh/QLlz0vo=;
 b=fI/TZO1sgPazysbgZ5KoDCEoV/5i2n7fR8fH6AjbZviDINyjWPGxDeH84xkcRswvtE
 Xw8kYnCvP8EgeG1j5yrr2RPoLCO177eQUAlOPk3phB1TWhSkUed2I6lXEMWQL8AJuBUl
 X6E2W+vYRgdVvi/gh8mvKF6bY4C1OaUT0Y7l+yn7PP+MlN0ixp/uaYQ5C2zxMNcue7ZD
 vKdBTitrVakWwkK9QfZFlhMafGkjnoCkNh5ykndnYyd9HP4h06WP//yoOlwqGRXvYEGj
 5ra1P3i0HprJeeol6OrTALiCmSq8thCWxVFR0t1r7lTZY7AfsBwb21G3LlnsmyuRtn84
 oCDQ==
X-Gm-Message-State: APzg51B17c3lPkklwb5dyWS9mhvM53W7ElXSg/GK58I2iPuWXXjOnBM2
 Zm221qYkXB3kq6sN17XxM24jryEak3vCGOhUzWI=
X-Google-Smtp-Source: ANB0VdbN+q7BZNR09/kymAyOcQBD33vBq7U42vr61g8Goi2PUDt7MvBFvZV5hVcNFkti7GTygVUilwmX+ATP3oQEOuA=
X-Received: by 2002:a25:ba4b:: with SMTP id
 z11-v6mr4131509ybj.427.1535573344499; 
 Wed, 29 Aug 2018 13:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
In-Reply-To: <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
From: Rebecca Broekhuis <beccabroek@gmail.com>
Date: Wed, 29 Aug 2018 15:08:53 -0500
Message-ID: <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
Subject: Re: SOL Logging
To: a.amelkin@yadro.com
Cc: openbmc@lists.ozlabs.org, a.senichev@yadro.com
Content-Type: multipart/alternative; boundary="000000000000b9be8605749887ed"
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
X-List-Received-Date: Wed, 29 Aug 2018 20:09:09 -0000

--000000000000b9be8605749887ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>The downside of that is the large amount of backlog to be transferred at
>the start of the console session, which is typically when you need the
>current data the most. In most cases, this could just be stale data from
>a previous boot. Because of this, I think it'll be a net *loss* in
>usability.

I was looking at how AMI and supermicro's console works in the UI, and when
the console session is started
it is pre populated with just 30 or so log messages, nothing more. Would it
be possible to combine both channels, replaying only the N most recent log
statements?
I may be misunderstanding what is possible here.

I am also wondering if an implementation like this:
 a) is adequate
 b) would be a net gain in usability (considering the amount of backlog to
be transferred at the start of the session would be smaller)

Becca

On Wed, Aug 29, 2018 at 6:37 AM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

>
> 25.08.2018 00:02, Tanous, Ed wrote:
>
> I would like to start a discussion around the feature of SOL logging, and
> how to best implement it.
>
>
>
> There is a proposal here
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/12063/
> that proposes dumping the SOL console text buffer from Javascript into a
> file, and presenting it to the user as a download.  On its face, it seems
> to work as designed.  This has some pretty severe limitations, in that yo=
u
> can only dump the console log from your session, and your session is
> essentially destroyed when you switch pages in the webui, or hit refresh.
> I think this is overly limiting, and of the production BMC stacks that I
> know of, none of them implement SOL logging in this way.
>
>
>
> Instead, other BMCs implement it as a circular buffer inside the BMC
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
>
>
> I=E2=80=99m looking for feedback from the community here.  As written, I =
don=E2=80=99t
> think the javascript console export is a useful feature given its
> limitations.  Do others agree?  Am I off base?  Are there use models wher=
e
> having a log of only the current session is useful?  Should we document t=
he
> limitations so we can respond to bugs in the future?
>
>
>
> That's exactly what we have implemented in our BMC for YADRO VESNIN.
> We have a circular buffer that constantly logs host console output and
> also preserves the first several pages of each host boot. That way we
> always have the last host boot "dmesg" as well as the very last few pages
> before the host dies (or the logs were gathered).
>
> Alexander.
>

--000000000000b9be8605749887ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>&gt;The downside of that is the large amount of backlo=
g to be transferred at<br>&gt;the start of the console session, which is ty=
pically when you need the<br>&gt;current data the most. In most cases, this=
 could just be stale data from<br>&gt;a previous boot. Because of this, I t=
hink it&#39;ll be a net *loss* in<br>&gt;usability.<br><div><br></div><div>=
I was looking at how AMI and supermicro&#39;s console works in the UI, and =
when the console session is started</div><div>it is pre populated with just=
 30 or so log messages, nothing more. Would it be possible to combine both =
channels, replaying only the N most recent log statements?=C2=A0</div><div>=
I may be misunderstanding what is possible here.</div><div><br></div><div>I=
 am also wondering if an implementation like this:</div><div>=C2=A0a) is ad=
equate</div><div>=C2=A0b) would be a net gain in usability (considering the=
 amount of backlog to be transferred at the start of the session would be s=
maller)</div><div><br></div><div>Becca</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Wed, Aug 29, 2018 at 6:37 AM Alexander Amelkin &l=
t;<a href=3D"mailto:a.amelkin@yadro.com">a.amelkin@yadro.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <div class=3D"m_5796614707251720308moz-cite-prefix">25.08.2018 00:02, T=
anous, Ed wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div class=3D"m_5796614707251720308WordSection1">
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

--000000000000b9be8605749887ed--
