Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c34; helo=mail-yw1-xc34.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VB2aPH5o"; 
 dkim-atps=neutral
Received: from mail-yw1-xc34.google.com (mail-yw1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KxWt4XndzDqGW
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 05:07:54 +1100 (AEDT)
Received: by mail-yw1-xc34.google.com with SMTP id j66so5157027ywc.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsklLqokTZxrFgJJw1uWZ0Bp5oaN5A+5I9vSH83uuRM=;
 b=VB2aPH5oBpm4Lz2Jm2xlbBmsgnPI05z6UBWQJFMuz6Vdglv9b2K8EPWKs7UTD/YQX6
 MGbwBWYsafrY7IFzy1s95BkhSl3KNQAw1BrvcYEnhBWv5sfKxfwnP6ejrVLiFquKDrnA
 XMQlPj5V/hLQYqu3e/V+t8WDoXy0g/5AJ+yrrxga67/vftBIDqstB0a3pXC9xGLt2kJY
 KXwYPT2YoM7Wa9sKLf5EnBYXo+/+8VnDI4lCpwrmT21TnFyoB9K93aoQAmqjFjz7Vm39
 zTI5ZeKTa2Edbd3muFhDlxUCtZikmk7lZIVWd4c2bruW4O+0MjU/si/VqTZ8Rusj3OWP
 XZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsklLqokTZxrFgJJw1uWZ0Bp5oaN5A+5I9vSH83uuRM=;
 b=Gn9O3zwCvY9M1G4O7tOUceRS5ipjNvBOWQSfgIoUGZMt2xmxovwE4bG/NCpYyzdnq9
 MXFlAdlJxdQD1JRER95Yid3ysDfXqhxd4J1QHakhHI/yjEAQud95ibLXlrOhddGnLqhA
 QQ+RkXNsceFUfyAHP1ssyava3Yz6fyvU+LStRa3Nay9UfQllXxbG9LU0ztT/HFkEyfMV
 Gweg8IH8qz1UExnvXRr1NyEg1Jua4JhfcT2WFeXxQZbMzBqEx0y/wxfTpl3Z2gRV/L2+
 UT9CbPs5z29shwrfLnXZADOwYYy1JX/qR7tjjfq0B7IHQtFI0v18x08NZn8ZUGQ08xAC
 FfQg==
X-Gm-Message-State: APjAAAXdKlQ3feB1k9U8q5okf6DAFblZLxdhv25gRSaQ0mbKjL7JpZR2
 xFJSyOSzPT38caTs+vkEZzLSvsoNOTgx/lDf3F4=
X-Google-Smtp-Source: APXvYqzNS0TEoybmR+vQOdKGF2KioPvaj5utMMEdWbw2ZdQoZGWZ2ZtapfRcoSuT2N4KRPzAMryIWqsSy7HbhItAl4k=
X-Received: by 2002:a81:1693:: with SMTP id 141mr1421045yww.448.1552586870577; 
 Thu, 14 Mar 2019 11:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
 <CAJoAoZnUxBzsXRS_o-E4Z8mmDdxSA2M+BS5yo-f1RYPi5pGu-g@mail.gmail.com>
In-Reply-To: <CAJoAoZnUxBzsXRS_o-E4Z8mmDdxSA2M+BS5yo-f1RYPi5pGu-g@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Thu, 14 Mar 2019 13:07:39 -0500
Message-ID: <CAMTupoSJkv25HXUrNH4pCrjrkXhDNecykKN34j6Z7feE=Dhyug@mail.gmail.com>
Subject: Re: Restore MAC address to factory settings
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e75e00058411cc36"
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
X-List-Received-Date: Thu, 14 Mar 2019 18:07:55 -0000

--000000000000e75e00058411cc36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We have a use case for editing MAC. I don't know about factory
> default.  So there's one (rather large) end user who would get value


Thanks Emily! Were you able to look over the design proposal? I'd love to
get your feedback.




> On Tue, Mar 12, 2019 at 12:42 PM Jandra A <jandraara@gmail.com> wrote:
> >
> > Hello all,
> >
> > I=E2=80=99d like your input on the value you see =E2=80=93 if any =E2=
=80=93 in the ability for
> > a user to restore a MAC Address to the factory default via the GUI
> > (Network Settings).
> >
> > BACKGROUND: Several end users have told us that they RARELY need to
> > change their MAC Address, if at all. However, we=E2=80=99ve heard from =
several
> > subject-matter experts that there IS value in making the MAC Address
> > editable as well as having a way to restore it to the factory default.
> >
> > QUESTION: Is there value for the end user in being able to edit a MAC
> > address? What about restoring it to the factory default?
> >
> > VIEW CURRENT DESIGN:
> >
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutl=
iple_VLAN
> >
> > Appreciate all thoughts on this.
>
>
>
> --
> Emily Shaffer

--000000000000e75e00058411cc36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; We have a use case for editing MAC. I don&#39;t know =
about factory<br>&gt; default.=C2=A0 So there&#39;s one (rather large) end =
user who would get value<br><br><br>Thanks Emily! Were you able to look ove=
r the design proposal? I&#39;d love to get your feedback. <br>=C2=A0<br><br=
><br><br>&gt; On Tue, Mar 12, 2019 at 12:42 PM Jandra A &lt;<a href=3D"mail=
to:jandraara@gmail.com">jandraara@gmail.com</a>&gt; wrote:<br>&gt; &gt;<br>=
&gt; &gt; Hello all,<br>&gt; &gt;<br>&gt; &gt; I=E2=80=99d like your input =
on the value you see =E2=80=93 if any =E2=80=93 in the ability for<br>&gt; =
&gt; a user to restore a MAC Address to the factory default via the GUI<br>=
&gt; &gt; (Network Settings).<br>&gt; &gt;<br>&gt; &gt; BACKGROUND: Several=
 end users have told us that they RARELY need to<br>&gt; &gt; change their =
MAC Address, if at all. However, we=E2=80=99ve heard from several<br>&gt; &=
gt; subject-matter experts that there IS value in making the MAC Address<br=
>&gt; &gt; editable as well as having a way to restore it to the factory de=
fault.<br>&gt; &gt;<br>&gt; &gt; QUESTION: Is there value for the end user =
in being able to edit a MAC<br>&gt; &gt; address? What about restoring it t=
o the factory default?<br>&gt; &gt;<br>&gt; &gt; VIEW CURRENT DESIGN:<br>&g=
t; &gt; <a href=3D"https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386=
_V2_Networking_Mutliple_VLAN">https://ibm.invisionapp.com/share/RQNYHJ0VBDY=
#/319002386_V2_Networking_Mutliple_VLAN</a><br>&gt; &gt;<br>&gt; &gt; Appre=
ciate all thoughts on this.<br>&gt;<br>&gt;<br>&gt;<br>&gt; --<br>&gt; Emil=
y Shaffer</div>

--000000000000e75e00058411cc36--
