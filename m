Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c32; helo=mail-yw1-xc32.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nS0EGty/"; 
 dkim-atps=neutral
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Ky8c16gxzDqNP
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 05:36:15 +1100 (AEDT)
Received: by mail-yw1-xc32.google.com with SMTP id j66so5228947ywc.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 11:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kjuNjZf7mo1pw/lQbCsmidkk1ajcXHsrUidIPW2c9I=;
 b=nS0EGty/sqiDRD/Ap8dCZnJQmhQ8eIjqHMaKPvedMDAn7wNtR/T/B2axkV4hjJz/rq
 HYE3yuURz7mE//Znl5doX+9NjOj6WcTYw7k0YUHdnEVMl0TPbRm5sb7fEoHSEOYKjoS8
 8kgmZ0pGIrlsYO4Lj86AMkqN1yWqQ4JenKxjV1IbJCkYT85pqr/rxWvmmOg5tzT4uWLQ
 3CQZSoFi/Q+nAxYxn3rjskag1rMKtcWfG7TU+7meIagRp6ceiL2A0p4LfxjaUBjg6Y2N
 BZutPLdyqsN4cBg6Wp7wOaqB4G2T1rm5tRxVpiRW5gTYa3CnhuYIL8QHkRcs0opqgutl
 WlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kjuNjZf7mo1pw/lQbCsmidkk1ajcXHsrUidIPW2c9I=;
 b=XTLoMhKThiVW74DhVEDnBfygw/3hC6l5dr8Kd6aADxH/kRIC4gUqv3jBlENIdBmwDl
 JMA4kefv8kKMf7hKRRkmY7f1KFebaaPfC6Zu63dQuKJtX520d7M8RP3CVNdjBUtT4EUw
 pYlg5l1e9SZO7EazmH7epm/5ZcKiq2hlh2Yrz0ki3Stx6ovZUeRTObFOFJUzSlg8dWcI
 N1btVYWqKOoY6gYgUJe64xbohA2Frkagv/JTCZMQoFMMx51o0ABbvNy9/V3iJrHPLbbZ
 fBwPRQx/CCAtEMG/q/MRk8pushPd7BaoNURtUAAZ/m7PTACN4CwYBLfDpMIzumizFIxb
 52Og==
X-Gm-Message-State: APjAAAUYJNppbhR9UIMdrlHA+nQuX7LjIo0OzrvMzxld7pccXUFncckt
 fXFK9x7zby44n27/TBo+S0v7lNdf1OX0g5mMeHA=
X-Google-Smtp-Source: APXvYqxx4ZqyY/GGbTVmW4RCT5XXtC3vFb8WyCFTl+wT5gBAtcpd/D3LzJLvZPiMvMjCAD8Kd9UK4kLk0n0dJ20vYWk=
X-Received: by 2002:a25:870a:: with SMTP id a10mr41822744ybl.339.1552588572718; 
 Thu, 14 Mar 2019 11:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
 <CAJoAoZnUxBzsXRS_o-E4Z8mmDdxSA2M+BS5yo-f1RYPi5pGu-g@mail.gmail.com>
 <CAMTupoSJkv25HXUrNH4pCrjrkXhDNecykKN34j6Z7feE=Dhyug@mail.gmail.com>
 <CAJoAoZm0WJmb5F-kxcZR5Lyi3gKANuX3FGGXpX8d1wzg=Z36hw@mail.gmail.com>
In-Reply-To: <CAJoAoZm0WJmb5F-kxcZR5Lyi3gKANuX3FGGXpX8d1wzg=Z36hw@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Thu, 14 Mar 2019 13:36:01 -0500
Message-ID: <CAMTupoR0EJkteNfzg97G_eq8YP8Dx-UvNAhEkDdTfu=6RXmRdA@mail.gmail.com>
Subject: Re: Restore MAC address to factory settings
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005bfa69058412320e"
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
X-List-Received-Date: Thu, 14 Mar 2019 18:36:17 -0000

--0000000000005bfa69058412320e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> I have made a couple comments, hope this makes sense. :)
>

Thanks, I replied to your comments. Please feel free to look through the
rest of the prototype if you are interested in the other features.

On Thu, Mar 14, 2019 at 11:07 AM Jandra A <jandraara@gmail.com> wrote:
> >
> > > We have a use case for editing MAC. I don't know about factory
> > > default.  So there's one (rather large) end user who would get value
> >
> >
> > Thanks Emily! Were you able to look over the design proposal? I'd love
> to get your feedback.
> >
> >
> >
> >
> > > On Tue, Mar 12, 2019 at 12:42 PM Jandra A <jandraara@gmail.com> wrote=
:
> > > >
> > > > Hello all,
> > > >
> > > > I=E2=80=99d like your input on the value you see =E2=80=93 if any =
=E2=80=93 in the ability
> for
> > > > a user to restore a MAC Address to the factory default via the GUI
> > > > (Network Settings).
> > > >
> > > > BACKGROUND: Several end users have told us that they RARELY need to
> > > > change their MAC Address, if at all. However, we=E2=80=99ve heard f=
rom
> several
> > > > subject-matter experts that there IS value in making the MAC Addres=
s
> > > > editable as well as having a way to restore it to the factory
> default.
> > > >
> > > > QUESTION: Is there value for the end user in being able to edit a M=
AC
> > > > address? What about restoring it to the factory default?
> > > >
> > > > VIEW CURRENT DESIGN:
> > > >
> https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mu=
tliple_VLAN
> > > >
> > > > Appreciate all thoughts on this.
> > >
> > >
> > >
> > > --
> > > Emily Shaffer
>
>
>
> --
> Emily Shaffer
>

--0000000000005bfa69058412320e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">I have made a couple comments, hope this makes sense. :)=
<br></blockquote><div><br></div><div>Thanks, I replied to your comments. Pl=
ease feel free to look through the rest of the prototype if you are interes=
ted in the other features.=C2=A0=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
On Thu, Mar 14, 2019 at 11:07 AM Jandra A &lt;<a href=3D"mailto:jandraara@g=
mail.com" target=3D"_blank">jandraara@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; We have a use case for editing MAC. I don&#39;t know about factor=
y<br>
&gt; &gt; default.=C2=A0 So there&#39;s one (rather large) end user who wou=
ld get value<br>
&gt;<br>
&gt;<br>
&gt; Thanks Emily! Were you able to look over the design proposal? I&#39;d =
love to get your feedback.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Tue, Mar 12, 2019 at 12:42 PM Jandra A &lt;<a href=3D"mailto:j=
andraara@gmail.com" target=3D"_blank">jandraara@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello all,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I=E2=80=99d like your input on the value you see =E2=80=93 i=
f any =E2=80=93 in the ability for<br>
&gt; &gt; &gt; a user to restore a MAC Address to the factory default via t=
he GUI<br>
&gt; &gt; &gt; (Network Settings).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; BACKGROUND: Several end users have told us that they RARELY =
need to<br>
&gt; &gt; &gt; change their MAC Address, if at all. However, we=E2=80=99ve =
heard from several<br>
&gt; &gt; &gt; subject-matter experts that there IS value in making the MAC=
 Address<br>
&gt; &gt; &gt; editable as well as having a way to restore it to the factor=
y default.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; QUESTION: Is there value for the end user in being able to e=
dit a MAC<br>
&gt; &gt; &gt; address? What about restoring it to the factory default?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; VIEW CURRENT DESIGN:<br>
&gt; &gt; &gt; <a href=3D"https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/31=
9002386_V2_Networking_Mutliple_VLAN" rel=3D"noreferrer" target=3D"_blank">h=
ttps://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutli=
ple_VLAN</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Appreciate all thoughts on this.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Emily Shaffer<br>
<br>
<br>
<br>
-- <br>
Emily Shaffer<br>
</blockquote></div></div>

--0000000000005bfa69058412320e--
