Return-Path: <raltherr@google.com>
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com
 [IPv6:2a00:1450:400c:c0c::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsYVR1729zDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 02:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="McNKhIsZ"; 
 dkim-atps=neutral
Received: by mail-wr0-x232.google.com with SMTP id y25so58991792wrd.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BygT/CLjJls8a9h5aJzH0uSs5Jzyhh965wXTlE0yEbA=;
 b=McNKhIsZFXyBJ6XZYSL+ZNeJHBFTsEYO5+audQNPFB2wCIxP4zL/vWCf77i6/9Doaa
 Hwcnw5t7IsBNsQeH2BzRIBMmMV0C4j/3zP2glT8owtUL7bO0NpfvBZz7t1gpwzq1eM/9
 KbI3i7btyvphFLdFmZ99GiMhZVUxO/UtAoy7IXNioXCqcd/lYcsaQjqCa4GDSi0YSfY7
 VahMKdQQ5/ANZ9UgB1RquOfPGDOykPFHBT9qVLfC2jWb4IV6yWzBZCBTN4hoLzt6Iv/l
 tpvX6Ml0TtuEfjJml0g5BthlEl0+N9wjlUlcCs2N2iWuSomhW31k38Ikdg68t2Tq3ZQC
 7kIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BygT/CLjJls8a9h5aJzH0uSs5Jzyhh965wXTlE0yEbA=;
 b=SYfiSaQMmXEB99wByGgdSyYuEgnZ+6rCEwrDe1A1U9OLo3NLT8M+gL3aAJh0JQu6LF
 abMfTEAmgyzLOhNhRyLASlMfljDBHLQiYJhlbitGDx62rbVEr/bbc1yFhT2UHrdqdpit
 c9/BKstWG/9j1SFCe4mAPn+J2p8/IR3PdZ1EJVeU2sg5OknHVdVTkDDehYvSK91sILHv
 B7oV+Au2trgrG15Jws3wjPI699oiZQH1XlL+dB5V6jY7qkAHNuhVGclel8iLry2Bw7au
 jMPSHqoeYWSdYKizcA5VETAjLYxMii3xjcHa6PN0aaJC0jw1rBg50t6BKPTMqmPWRYQq
 j54g==
X-Gm-Message-State: AKS2vOzV+KjvIGQ4OuKIgF89l+WGYTKDb2A4lUaExczH7wbOGBuzohaC
 8RUjCVyVS2QgqX2JRBmYLrrA5wxNnlr8
X-Received: by 10.28.91.198 with SMTP id p189mr3358693wmb.97.1497976811766;
 Tue, 20 Jun 2017 09:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.143.18 with HTTP; Tue, 20 Jun 2017 09:40:11 -0700 (PDT)
In-Reply-To: <CACPK8Xf-1TBsN-Xpju1WOrSYvmjwdghQD-x5eFX1jvSyNw-Uug@mail.gmail.com>
References: <OFA5A59E2D.D08E083C-ON8625813E.00649282-8625813E.0072EF32@notes.na.collabserv.com>
 <CACPK8Xf-1TBsN-Xpju1WOrSYvmjwdghQD-x5eFX1jvSyNw-Uug@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 20 Jun 2017 09:40:11 -0700
Message-ID: <CAPLgG==Kdf9cT1_GYyRnEmmi+QS7Sd=96S89yTVNP=OWTaQO-g@mail.gmail.com>
Subject: Re: OpenBMC world wide call for topics
To: Joel Stanley <joel@jms.id.au>
Cc: Chris Austen <austenc@us.ibm.com>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11440c14bff8a7055266e73d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jun 2017 16:40:15 -0000

--001a11440c14bff8a7055266e73d
Content-Type: text/plain; charset="UTF-8"

My team is based in California (currently UTC-7).  I know we are working on
a variety of enhancements for Zaius and Quanta Q71L as well as more general
features such as A/B booting.  I'd like to hear a discussion on a
community-led roadmap so my team can coordinate with everyone else on their
development efforts.

Rick

On Mon, Jun 19, 2017 at 8:00 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Jun 14, 2017 at 6:25 AM, Chris Austen <austenc@us.ibm.com> wrote:
> > Greetings,
> > during the recent OpenPOWER Developers Congress it became apparent that
> > there was a need; beyond the mailing list, to have a discussion about
> what
> > is going on in the OpenBMC Project and how to improve communication. I
> > committed to creating an event and to reach out to our ever growing
> > community for topics. Is there something that you would like to hear
> about
> > or understand more? Are you looking for places to volunteer or show off a
> > technology using OpenBMC? The tentative plan is to hold an over-the-phone
> > discussion during the week of July 10-15th. The exact date and time
> really
> > depend on the time zones I get feedback from. So what would you like to
> hear
> > about?
>
> I'm in UTC+9.5.
>
> I would be happy to give a 3 minute run down on the OpenBMC kernel efforts.
>
> Cheers,
>
> Joel
>

--001a11440c14bff8a7055266e73d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My team is based in California (currently UTC-7).=C2=A0 I =
know we are working on a variety of enhancements for Zaius and Quanta Q71L =
as well as more general features such as A/B booting.=C2=A0 I&#39;d like to=
 hear a discussion on a community-led roadmap so my team can coordinate wit=
h everyone else on their development efforts.<div><br></div><div>Rick</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jun=
 19, 2017 at 8:00 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:=
joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Jun 14, 2017 at 6:25=
 AM, Chris Austen &lt;<a href=3D"mailto:austenc@us.ibm.com">austenc@us.ibm.=
com</a>&gt; wrote:<br>
&gt; Greetings,<br>
&gt; during the recent OpenPOWER Developers Congress it became apparent tha=
t<br>
&gt; there was a need; beyond the mailing list, to have a discussion about =
what<br>
&gt; is going on in the OpenBMC Project and how to improve communication. I=
<br>
&gt; committed to creating an event and to reach out to our ever growing<br=
>
&gt; community for topics. Is there something that you would like to hear a=
bout<br>
&gt; or understand more? Are you looking for places to volunteer or show of=
f a<br>
&gt; technology using OpenBMC? The tentative plan is to hold an over-the-ph=
one<br>
&gt; discussion during the week of July 10-15th. The exact date and time re=
ally<br>
&gt; depend on the time zones I get feedback from. So what would you like t=
o hear<br>
&gt; about?<br>
<br>
</span>I&#39;m in UTC+9.5.<br>
<br>
I would be happy to give a 3 minute run down on the OpenBMC kernel efforts.=
<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a11440c14bff8a7055266e73d--
