Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MWJ2NpRt"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410nFk6XxpzF1wy
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 08:55:21 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id x34-v6so4393133qtk.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2rId1aRP566GqYDURS3gLVRANo71gDC/btTlVAQFBAs=;
 b=MWJ2NpRtP5M7diHJfo2IFKe9rH8GGZ4GI38msKKuxWhPtTTC0jPZLVwqk94vktCAbK
 oycfZliwlixsNyWHqoLInQbSustOCPHP1shLE4nWhKqMriDh3PKX8Stjhc0YI8Lil+93
 dswFgTr9mInJa/bbkEy4figTKSpu3VuMBidP/fdSkILIdOn1qN+BVxEi42eUPmC4LvlV
 aXoMLcI3VAHnVckyZOYOt8Aa+X6U24XepCXPBEd2vk17meRA3PoKU9BqoknnCKRk8jht
 Vljy1mhavXpq4IVB9342S+N3YNJx/GAt2E3nF8OQ0oGVf4ZzEb5O76VSGl1wIiGaP7ik
 Nzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rId1aRP566GqYDURS3gLVRANo71gDC/btTlVAQFBAs=;
 b=htgT2LSzWud+S5ROqJytO/wkmt4xOjQtI9L0TPNuAHUnzzbchahMOciJXKB5m0xpkz
 BOV3vjVsRDboxnJ1eJ9VrL0FW5lteVXgtRVMyEDm8tA77EgASOLquMIDWz/XwDE+9G4J
 zSB9a00B7EkzAnq4ISRREJ8h3aHTX4shBA8k0Q37lbj2hFI9hC2eOZftjM2ynwLHx9iC
 nKNQ5iDeZHNHrXeENViLiHmsZ4LyIeSh2oJ7lYVMmWaTp6PafkvYBm8SuwpxzN2vw2dg
 zWynUoBTSlJgSjBmZOnhLQUF0MpjPxsPryf+mX7kVQPLvnK3ETfeRz2TpwFj6z0jgddE
 jw6A==
X-Gm-Message-State: APt69E3pkVdSSjHpGS0sPgjxfv5elIqN8efXpmDW3oMdsizChfyfBoCU
 P8wOZYNQDLDbegOL1R1anHxLjznFrNfnncKWO8njLQ==
X-Google-Smtp-Source: ADUXVKKudhzjjCeCBEqjTbIL7UCQR8wQApWd1kWvEJX9aw+BqwJScv3aHNGVXhzuPLyk1ot6fgBu1I8YKqXqEPBOv0c=
X-Received: by 2002:a0c:879b:: with SMTP id 27-v6mr554750qvj.171.1528239318504; 
 Tue, 05 Jun 2018 15:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
 <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
 <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
In-Reply-To: <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 5 Jun 2018 15:55:06 -0700
Message-ID: <CAJoAoZk_uf8MCyp_x-RwKh44YSHPhk1eGAO_R54WuAO52qbJAQ@mail.gmail.com>
Subject: Re: Hackathon - Sept 18th - 20th, 2018
To: James Mihm <james.mihm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "Mihm, James" <james.mihm@intel.com>
Content-Type: multipart/alternative; boundary="000000000000b6bb6c056decf101"
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
X-List-Received-Date: Tue, 05 Jun 2018 22:55:24 -0000

--000000000000b6bb6c056decf101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd like to prepare an entry-level talk on various types of testing and
tenets for writing good tests, if there's enough interest, considering that
there's an overall push for more testing in OpenBMC and some confusion on
which kinds of tests we want, and why.  If nobody else is planning to
cover, I can also try to dig into what kind of test tooling is available on
OpenBMC.

On Tue, Jun 5, 2018 at 3:50 PM James Mihm <james.mihm@gmail.com> wrote:

> Thank you Joel!
>
> This is meant to be a community-driven event. Please share your ideas
> for topics of discussion or work sessions.
>
> Here are some additional ideas I'd like to share and get community input
> on.
>
> Opening
>     state of the project
>     working group updates
>     roadmaps
>
> Onboarding (?)
>
> Developer Knowledge Sharing (training?)
>      Dbus - how to use bindings and libraries, pros & cons,
> alternatives, sensor and event database
>
> Security
>     Static analysis tools (intro/use?), threat analysis, assets,
> mitigations,
>     TPMs and the BMC, project cerberus and beyond
>     Threat landscape (freight train to hell and back!)
>
> Penetration Testing
>     Tools; burpsuite, lynis, cminer, appscan, postman,...
>
> Redfish
>
> Validation
>     Test cases, tools, and their usage
>
> Community Networking after 5pm
>      Pub-n-grub
>      Brainstorming sessions
>
> Closing
>      Next steps, calls to action
>
> James.
>
> On Mon, Jun 4, 2018 at 10:27 PM, Joel Stanley <joel@jms.id.au> wrote:
> > Hi James,
> >
> > On 1 June 2018 at 08:53, Mihm, James <james.mihm@intel.com> wrote:
> >> Event:  OpenBMC Hackathon hosted by Intel
> >>
> >> Date:  September 18th =E2=80=93 20th, 2018
> >
> > Thanks for organising this.
> >
> > To everyone: Is there any interest in discussing kernel and u-boot
> > related topics with me at this workshop?
> >
> > Cheers,
> >
> > Joel
>

--000000000000b6bb6c056decf101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d like to prepare an entry-level talk on various typ=
es of testing and tenets for writing good tests, if there&#39;s enough inte=
rest, considering that there&#39;s an overall push for more testing in Open=
BMC and some confusion on which kinds of tests we want, and why.=C2=A0 If n=
obody else is planning to cover, I can also try to dig into what kind of te=
st tooling is available on OpenBMC.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Tue, Jun 5, 2018 at 3:50 PM James Mihm &lt;<a href=3D"mail=
to:james.mihm@gmail.com">james.mihm@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Thank you Joel!<br>
<br>
This is meant to be a community-driven event. Please share your ideas<br>
for topics of discussion or work sessions.<br>
<br>
Here are some additional ideas I&#39;d like to share and get community inpu=
t on.<br>
<br>
Opening<br>
=C2=A0 =C2=A0 state of the project<br>
=C2=A0 =C2=A0 working group updates<br>
=C2=A0 =C2=A0 roadmaps<br>
<br>
Onboarding (?)<br>
<br>
Developer Knowledge Sharing (training?)<br>
=C2=A0 =C2=A0 =C2=A0Dbus - how to use bindings and libraries, pros &amp; co=
ns,<br>
alternatives, sensor and event database<br>
<br>
Security<br>
=C2=A0 =C2=A0 Static analysis tools (intro/use?), threat analysis, assets, =
mitigations,<br>
=C2=A0 =C2=A0 TPMs and the BMC, project cerberus and beyond<br>
=C2=A0 =C2=A0 Threat landscape (freight train to hell and back!)<br>
<br>
Penetration Testing<br>
=C2=A0 =C2=A0 Tools; burpsuite, lynis, cminer, appscan, postman,...<br>
<br>
Redfish<br>
<br>
Validation<br>
=C2=A0 =C2=A0 Test cases, tools, and their usage<br>
<br>
Community Networking after 5pm<br>
=C2=A0 =C2=A0 =C2=A0Pub-n-grub<br>
=C2=A0 =C2=A0 =C2=A0Brainstorming sessions<br>
<br>
Closing<br>
=C2=A0 =C2=A0 =C2=A0Next steps, calls to action<br>
<br>
James.<br>
<br>
On Mon, Jun 4, 2018 at 10:27 PM, Joel Stanley &lt;<a href=3D"mailto:joel@jm=
s.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br>
&gt; Hi James,<br>
&gt;<br>
&gt; On 1 June 2018 at 08:53, Mihm, James &lt;<a href=3D"mailto:james.mihm@=
intel.com" target=3D"_blank">james.mihm@intel.com</a>&gt; wrote:<br>
&gt;&gt; Event:=C2=A0 OpenBMC Hackathon hosted by Intel<br>
&gt;&gt;<br>
&gt;&gt; Date:=C2=A0 September 18th =E2=80=93 20th, 2018<br>
&gt;<br>
&gt; Thanks for organising this.<br>
&gt;<br>
&gt; To everyone: Is there any interest in discussing kernel and u-boot<br>
&gt; related topics with me at this workshop?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
</blockquote></div>

--000000000000b6bb6c056decf101--
