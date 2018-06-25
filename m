Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::234; helo=mail-it0-x234.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Oc4gbWap"; 
 dkim-atps=neutral
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Dt4c4RwgzDrq6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 01:14:23 +1000 (AEST)
Received: by mail-it0-x234.google.com with SMTP id 76-v6so12910378itx.4
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MUEAQ3y8kpUMxbtru4lc7TxHdgpLvzSGJsHbs0gCff4=;
 b=Oc4gbWappcbx2IqGP1+E2uUEcCqnNZ4EWgwkaDUWYgIlzS5vShSKfGtfJX+HVHiQ+u
 WVm6mDHhKsrqUxKulu2NopulJ24LWAeB4YzPQN2Vd2JaOZbUCtBXBrioPcLnEkzwXscT
 emd/JyTgx8I7gK2Z/CP1qUyX8dvw5f98G9j0RJ0sZFV9EClNB1O4pbsVG4FPsI0eEvNy
 ahC/uTwYMmOHBBhrCoNtppyosD3lcfNrEF4ObqnmFbZESKhaNNdjbGuHIo+9mQLnTfrd
 tgtOwXegRCJB0zTE6icYP8guwjXRXcSY7XyS0bqdivkZELMy9nutMQ8f4FZ5qdpnAw+V
 K8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MUEAQ3y8kpUMxbtru4lc7TxHdgpLvzSGJsHbs0gCff4=;
 b=EEmF2UguCzdqud7cKVJGzsXaNurHRUzo0y0v9klXwU2co5dksd+Bq2htsy+8fbD99F
 p0KqYuUydy9E4vIooIndFrTyWX2AQPWmb/5Kdr5XHH/iIURL1LV6JUmWLUTtjuzat+/J
 zoGIDx15umuXxMe8rMmgpRWYUx/9AO5yTVeCfNSvz0A/LkJ0id1OYXRpBO4iuGMgvQNe
 R2y2boMmD3IpnvO8AiBwGUQxhWoATKvb/NzUyk1nMgMbo+AP5RdLMoiMCDBpWmd1vibo
 RjMrV9NkA0Rqj/4YwK1PWCOMXwBIERIt5bP0d4dNq+wOIJ2pCNGeRr0Ni3vjVjyl+nYi
 IGTg==
X-Gm-Message-State: APt69E0M34waJhkpTJc3kISL5Y9TKg+LJ4ceB4uXH7mxywanqPM5xt8w
 YwiSYGtyr9nPLdj6iXwcVjHLXGE01TNoF07FDW+nYA==
X-Google-Smtp-Source: AAOMgpckgZAo01+iMQ9Ny3AFfQmDL7Dym8x7QpvBM4oZI0mT+HCjUg75iwzuDuQsBgh0WWPaIDcWtt4DphH4RvDkQWI=
X-Received: by 2002:a24:688a:: with SMTP id
 v132-v6mr1249205itb.153.1529939661652; 
 Mon, 25 Jun 2018 08:14:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ed1a:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 08:13:41
 -0700 (PDT)
In-Reply-To: <8B76C1CF-5AF3-417A-A46F-30508DA74A38@fuzziesquirrel.com>
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
 <8B76C1CF-5AF3-417A-A46F-30508DA74A38@fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 25 Jun 2018 08:13:41 -0700
Message-ID: <CADfYTpHf=6W4jbzmifVMjZSSR_e0+ZekFoj_s04obvL1Kde4mQ@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000103157056f78d662"
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
X-List-Received-Date: Mon, 25 Jun 2018 15:14:27 -0000

--000000000000103157056f78d662
Content-Type: text/plain; charset="UTF-8"

I can't make Tuesday.  Thursdays times work from me, my preference is for
the 3PM but I can make 8AM work too.

----------
Nancy

On Sun, Jun 24, 2018 at 6:27 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Jun 21, 2018, at 3:07 PM, krtaylor <kurt.r.taylor@gmail.com> wrote:
> >
> > Hi all,
> >
> > The long anticipated OpenBMC Release Planning working group is now
> forming and will have its first meeting next week. I would like to keep the
> meeting small at first so that we can move quickly, but I do need complete
> representation. Please let me know if you'd like to participate and what
> day a meeting would work best for you. Those on copy should plan on
> attending or at least make sure someone is covering for your organization.
> >
> > Let me know if you have any questions.
> >
> > Regards, Kurt Taylor (krtaylor)
> >
> >
> > Proposed times:
> >
> > 1) Tuesdays, 2:00pm Central US (1900 UTC)
> >
> > 2) Thursdays, 8:00am Central US (1300 UTC)
> >
> > 3) Thursdays, 3:00pm Central US (2000 UTC)
>
> any of these times work for me.
>
> >
> >
> > Initial Agenda:
> >
> > 1) Agree on the release process and set an initial release date in
> November (see email from May 21)
> >
> > 2) Set design and freeze milestones
> >
> > 3) "Must" deliver items for November release
> >
> > 4) How to open the design and development for a needed feature
>

--000000000000103157056f78d662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t make Tuesday.=C2=A0 Thursdays times work from =
me, my preference is for the 3PM but I can make 8AM work too.<br></div><div=
 class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Sun, Jun 24, 2018 at 6:27 AM, Brad Bishop=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" targe=
t=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D""><br>
&gt; On Jun 21, 2018, at 3:07 PM, krtaylor &lt;<a href=3D"mailto:kurt.r.tay=
lor@gmail.com">kurt.r.taylor@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi all,<br>
&gt; <br>
&gt; The long anticipated OpenBMC Release Planning working group is now for=
ming and will have its first meeting next week. I would like to keep the me=
eting small at first so that we can move quickly, but I do need complete re=
presentation. Please let me know if you&#39;d like to participate and what =
day a meeting would work best for you. Those on copy should plan on attendi=
ng or at least make sure someone is covering for your organization.<br>
&gt; <br>
&gt; Let me know if you have any questions.<br>
&gt; <br>
&gt; Regards, Kurt Taylor (krtaylor)<br>
&gt; <br>
&gt; <br>
&gt; Proposed times:<br>
&gt; <br>
&gt; 1) Tuesdays, 2:00pm Central US (1900 UTC)<br>
&gt; <br>
&gt; 2) Thursdays, 8:00am Central US (1300 UTC)<br>
&gt; <br>
&gt; 3) Thursdays, 3:00pm Central US (2000 UTC)<br>
<br>
</span>any of these times work for me.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; <br>
&gt; <br>
&gt; Initial Agenda:<br>
&gt; <br>
&gt; 1) Agree on the release process and set an initial release date in Nov=
ember (see email from May 21)<br>
&gt; <br>
&gt; 2) Set design and freeze milestones<br>
&gt; <br>
&gt; 3) &quot;Must&quot; deliver items for November release<br>
&gt; <br>
&gt; 4) How to open the design and development for a needed feature<br>
</div></div></blockquote></div><br></div>

--000000000000103157056f78d662--
