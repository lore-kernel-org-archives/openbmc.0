Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c33; helo=mail-yw1-xc33.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZ9j39p8"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VDKg61s0zDrMl
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 10:42:12 +1100 (AEDT)
Received: by mail-yw1-xc33.google.com with SMTP id e201-v6so1433209ywa.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDJNYCcqlrV56pbe+WF7kZ6D6uoslJO9Txmvyq+lJI8=;
 b=KZ9j39p8XV8V7x0qLIFcF4l74n1tNijAt3rpJQ0PpDqduUiPxgmlInJ33hJ5oaw9Ti
 v6OOse/SpKD+8NoEzRnanxyfAc118jrObZd4E2GYNQZBsEevR3wDFqtdSNljKCxE4l+i
 r701QH93PYMC3PZn+X6ahK3DWmoMxzYkDO+rAKa58XbyhANWi2qk7QayORCY0D3/4Lak
 vOHypUsvnyWxJlaQ4i35GIeqL8q7OyzpvT3j0WDHbKbyQwo9TVjxZcvLMrsVaJ4VQFiC
 P5Q0Ee+yW/835XvdcYNRmBOIH9qjfHQYVlnjvQI0rACPNvr93j5+uRgiPQ2TW1jpfpWg
 uezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDJNYCcqlrV56pbe+WF7kZ6D6uoslJO9Txmvyq+lJI8=;
 b=qQs0ZN2M8XFN+Zf/1hWmKgPZRuRC2EVxDDW5CbQOrFiP+HalSoGq1hLXNURFg6aA0s
 iCNscMoLmzR8vBy0UG/okdHNKfPUnMzILK0dnftQzN97WTED2qIxhhR2QN6QfjWea04b
 f8iW63t/789HAgPM7n+ZqlaEgIwfHPM8dzADAkqT3b7oLT0/osDtlnS0YAm3tMKJpQaK
 0BeM+SA/mLxAHbRBYoj5+zYB+kUHJ5QAgmgHE9JqRYhvvANESOybmsmP+L14CZQ8+S9X
 mG4HpuXSsMutkPLHSLC2SnSVtkgrSTZBHQKQZtR2p/VrYXYlQnIGqEOxPmPnqbOarlqp
 a7pQ==
X-Gm-Message-State: ABuFfohpIOZDKEPuzVe5CU7eUrmaCDcdqtaNGt5ECy0/jNqiTpwfYw8B
 KIrJsrlmBJdjCfwvTKi/34tUimgH5TOli3aEJ6c=
X-Google-Smtp-Source: ACcGV60UqUbvg4D0xXqOZKTPiMMBgHnqUXyfLkQJ+Fj9DFYEtesoHXoNS1iuBruA9ePHqw8U28FG2rhFKnF6RqjvCMY=
X-Received: by 2002:a81:7d87:: with SMTP id
 y129-v6mr16455132ywc.442.1539128530152; 
 Tue, 09 Oct 2018 16:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <C599FC839619124CAC44E062ABB7DFE2D700D9D3@ORSMSX101.amr.corp.intel.com>
 <CACPK8XevxBTX+8Co5Xg+=1AXr2+5nB19BKm-6PbB1pHb=qQWaQ@mail.gmail.com>
In-Reply-To: <CACPK8XevxBTX+8Co5Xg+=1AXr2+5nB19BKm-6PbB1pHb=qQWaQ@mail.gmail.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 9 Oct 2018 16:42:03 -0700
Message-ID: <CADy_Pt2RQuj0pOsHqecbpouYU11GSSr8QrofHtZ3NwMOJY5azg@mail.gmail.com>
Subject: Re: OpenBMC Hackathon Remote Access
To: Joel Stanley <joel@jms.id.au>
Cc: "Mihm, James" <james.mihm@intel.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004db0d40577d44973"
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
X-List-Received-Date: Tue, 09 Oct 2018 23:42:16 -0000

--0000000000004db0d40577d44973
Content-Type: text/plain; charset="UTF-8"

I don't, but I'll check into it.

James.

On Tue, Oct 9, 2018, 4:16 PM Joel Stanley <joel@jms.id.au> wrote:

> On Tue, 9 Oct 2018 at 06:06, Mihm, James <james.mihm@intel.com> wrote:
> >
> > Day 1  Tuesday, Oct 9th, 2018
> > https://meet.intel.com/james.mihm/V544MVHT?sl=1
> > Conference ID: 184797518
>
> Do you have any tips for using this on Linux? The plugin link did
> nothing, and showed this in the javascript console:
>
> Lync.Client.Common.Consolidated.js?lcs_se_w16_ship6.0.9319.281:20098
> 9:31:38:572, TL_WARN, , Framework, Plugin install skipped as plugin is
> not supported,
>
> I am using Chrome.
>
> Cheers,
>
> Joel
>

--0000000000004db0d40577d44973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I don&#39;t, but I&#39;ll check into it.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">James.<br><br><div class=3D"gmail_q=
uote" dir=3D"auto"><div dir=3D"ltr">On Tue, Oct 9, 2018, 4:16 PM Joel Stanl=
ey &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Tue, 9 Oct 2018 at 06:06, Mihm, Jame=
s &lt;<a href=3D"mailto:james.mihm@intel.com" target=3D"_blank" rel=3D"nore=
ferrer">james.mihm@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Day 1=C2=A0 Tuesday, Oct 9th, 2018<br>
&gt; <a href=3D"https://meet.intel.com/james.mihm/V544MVHT?sl=3D1" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://meet.intel.com/james.mihm/V=
544MVHT?sl=3D1</a><br>
&gt; Conference ID: 184797518<br>
<br>
Do you have any tips for using this on Linux? The plugin link did<br>
nothing, and showed this in the javascript console:<br>
<br>
Lync.Client.Common.Consolidated.js?lcs_se_w16_ship6.0.9319.281:20098<br>
9:31:38:572, TL_WARN, , Framework, Plugin install skipped as plugin is<br>
not supported,<br>
<br>
I am using Chrome.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div></div></div>

--0000000000004db0d40577d44973--
