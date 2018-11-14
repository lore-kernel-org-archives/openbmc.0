Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eyeFHovh"; 
 dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wDQ640m4zF3Vm
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 06:02:22 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id w204so27743107qka.2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHeJPTrAXDqK1hPffGKwwjxMgpOw1HblhPMrKsLU0L4=;
 b=eyeFHovhEbi2ZPz0uMTjRL3Fb1AcIpMx20zaadPBr/H6kSKnSkf1Kq10kEEXVSBe5s
 bm/K57DVi6k2QXSm2bx18Z17IZGuPR1aJRRpHd722GrLPLZ1hHgtH5OuCNtTWinJ6e21
 FglTA7VSNZbxF+BbV9GLF48KF1aJnZcxI8gHsUvvUCTf7Fl9YZmrmvxaqPcExcISosJ9
 vN9cC2/PClDFpZ2ao3XnS1OGEKJC3xLwH3FH67Wyz8gKudHFu/qmrZ8V9O/XRGIWhNZd
 IV5vtqZdgBniMpR8xRytmS8eEJeO79PD0axZV3cNNz6QtxsK0d8TqzHJvkk+/86BUgQa
 DcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHeJPTrAXDqK1hPffGKwwjxMgpOw1HblhPMrKsLU0L4=;
 b=pOICggWMtO0uiZoDkMexbv+OhFebJ2MAeB8HcdHxrCgCsLc+HR8ye4+WZwjzXqfXkd
 h/hcJoinesoh88anqWCNc0+tTxQHL46PpfYVqfs1DkMtpsh+fKfbFQLZZSV7E6+eJL5A
 lViK5UTGeCCfXcQF8RMxgdXnberMdOSioP2lMaa2ArE9AWyTRjIdfOBDUjNQ/G60e/+b
 2/pm6jMSmHBR1CT00eqM1XiZRGnGKa+C9ksrnxN5eYx/As8TwIl3GuYqVIAXBZU84M3o
 z5dXp7EBAMYVIKHju2ndT7xYEH5t6mH9w+yhZuvPoit7YbVEt0iGAA0/3rgGEbhWfkPT
 5Dhw==
X-Gm-Message-State: AGRZ1gLqk1oPvio31aJZVr/mq3dwevZJdEe3GgOyqnra/lkQgU6QGBkQ
 AQqSYnyrnZw9oVmnvocKMutsTI5EhuAuhw2eQ2fS/g==
X-Google-Smtp-Source: AJdET5cJTeNRLL7XlsBYZNunpL/Z0m3JfpxwDEO2EVEhW6OeoUNCO7GfhZt7xDMQ4xWQjOTDu+C5gabYLNYgEGNPyFQ=
X-Received: by 2002:a37:d994:: with SMTP id q20mr2979535qkl.116.1542222139444; 
 Wed, 14 Nov 2018 11:02:19 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
In-Reply-To: <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 14 Nov 2018 11:02:07 -0800
Message-ID: <CAJoAoZn1uAas9jfefVnV-vSKVQ9eNUwa9+_8zv_xEPhk3_Y_ig@mail.gmail.com>
Subject: Re: MCTP protocol support in OpenBMC?
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, David Thompson <dthompson@mellanox.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Dong Wei <Dong.Wei@arm.com>
Content-Type: multipart/alternative; boundary="000000000000c9d14e057aa4924d"
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
X-List-Received-Date: Wed, 14 Nov 2018 19:02:23 -0000

--000000000000c9d14e057aa4924d
Content-Type: text/plain; charset="UTF-8"

Google is interested in investigating MCTP as well. I'd love to join the wg.

Emily

On Wed, Nov 14, 2018 at 8:14 AM Supreeth Venkatesh <
Supreeth.Venkatesh@arm.com> wrote:

> David/Jeremy,
>
> We (@ arm) are also interested in contributing MCTP to OpenBMC.
> We are in the process of getting CLA signed.
> We have the same concern regarding duplicating work.
> We would like to collaborate with OpenBMC folks  who are interested in
> this topic. (maybe form a Workgroup to discuss this).
>
> Thanks,
> Supreeth
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+supreeth.venkatesh=arm.com@lists.ozlabs.org>
> On Behalf Of Jeremy Kerr
> Sent: Wednesday, November 14, 2018 8:00 AM
> To: David Thompson <dthompson@mellanox.com>; openbmc@lists.ozlabs.org
> Subject: Re: MCTP protocol support in OpenBMC?
>
> Hi David and Rick,
>
> > Does OpenBMC currently have any support for MCTP protocol layer, or is
> > there a plan to deliver something like this in the future?  I'd be
> > very interested to hear about any future plans related to MCTP stack.
>
> Us too! I'm interested in looking at MCTP, and am in the middle of doing a
> little prototyping with our host firmware stack.
>
> I'd also like to avoid duplicating work though, have you (or others) made
> progress on this since this initial email? I know there was a presentation
> on MCTP at the recent hackathon, but I'm not sure if any solid plans came
> from that.
>
> If not, I'd be happy to sketch out an architecture for this...
>
> Cheers,
>
>
> Jeremy
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--000000000000c9d14e057aa4924d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Google is interested in investigating MCTP as well. I&#39;=
d love to join the wg.<div><br></div><div>Emily</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 14, 2018 at 8:14 AM Supreeth =
Venkatesh &lt;<a href=3D"mailto:Supreeth.Venkatesh@arm.com">Supreeth.Venkat=
esh@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">David/Je=
remy,<br>
<br>
We (@ arm) are also interested in contributing MCTP to OpenBMC.<br>
We are in the process of getting CLA signed.<br>
We have the same concern regarding duplicating work.<br>
We would like to collaborate with OpenBMC folks=C2=A0 who are interested in=
 this topic. (maybe form a Workgroup to discuss this).<br>
<br>
Thanks,<br>
Supreeth<br>
<br>
-----Original Message-----<br>
From: openbmc &lt;openbmc-bounces+supreeth.venkatesh=3D<a href=3D"mailto:ar=
m.com@lists.ozlabs.org" target=3D"_blank">arm.com@lists.ozlabs.org</a>&gt; =
On Behalf Of Jeremy Kerr<br>
Sent: Wednesday, November 14, 2018 8:00 AM<br>
To: David Thompson &lt;<a href=3D"mailto:dthompson@mellanox.com" target=3D"=
_blank">dthompson@mellanox.com</a>&gt;; <a href=3D"mailto:openbmc@lists.ozl=
abs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
Subject: Re: MCTP protocol support in OpenBMC?<br>
<br>
Hi David and Rick,<br>
<br>
&gt; Does OpenBMC currently have any support for MCTP protocol layer, or is=
<br>
&gt; there a plan to deliver something like this in the future?=C2=A0 I&#39=
;d be<br>
&gt; very interested to hear about any future plans related to MCTP stack.<=
br>
<br>
Us too! I&#39;m interested in looking at MCTP, and am in the middle of doin=
g a little prototyping with our host firmware stack.<br>
<br>
I&#39;d also like to avoid duplicating work though, have you (or others) ma=
de progress on this since this initial email? I know there was a presentati=
on on MCTP at the recent hackathon, but I&#39;m not sure if any solid plans=
 came from that.<br>
<br>
If not, I&#39;d be happy to sketch out an architecture for this...<br>
<br>
Cheers,<br>
<br>
<br>
Jeremy<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>

--000000000000c9d14e057aa4924d--
