Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22a.google.com (mail-wr0-x22a.google.com
 [IPv6:2a00:1450:400c:c0c::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxfGN2BwqzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 03:28:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jpvKjGxL"; 
 dkim-atps=neutral
Received: by mail-wr0-x22a.google.com with SMTP id k6so173874593wre.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 10:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c778l2AW4pnrKnMykDyG00yS+0fJcDiT/YkzQFWv2Sc=;
 b=jpvKjGxLHurXyuVPXtHF8pIGXJc0JL4Am/B1UPOgHG8xbjZfkygQlHQU7+GFOCfHtf
 4SZWzDXS40UcDn2sEGj6kOcXfZqMDFdZL+d/ztBVX8kc0943TTjEGwvR6/yUFbchDoe3
 dPI7TtSFA5h3J8SiuetIemIW4e++eDlW/haEYlhnS6IeFihK9JaaHRC71WyCg8BuBWaX
 pmQsUgTufESySyJcc4rCWf3khLOnPlvbwCH52osv6KjXIlPfBCrR1Pux7ZRdzHcJ3aog
 DuAbYMu1C2GjfBXKF2pdJ7MQCI2wPjZot6hIqpFaSC9ZNDbKCX4gsw2kCd+UFkTW+UBl
 zvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c778l2AW4pnrKnMykDyG00yS+0fJcDiT/YkzQFWv2Sc=;
 b=pgBhFZtJqxy6/iFR32UkMxd0bNXyLIWq/TDrzQALZSD/3f1qjlk72qjBnne9Ndkj2t
 8Get3G4WSIIV90MzMDSrVF0s5zsgtbDEBsOp/XeR6fce6uhsYyTvoPn6Un6//IVBAKJW
 +BgmUIGwyHjwoN6WGk9CtQGeFkh1uZI9q8m49QZD3EnlrhF05AfgnG1xuELG12ImoQ7P
 7gTskgET4SmRBqOckLO3FdlWT7xbw/xCo+bxGZC3pnORBsLYntrSXKotQx5U8+NrL6zv
 5jCv2/Yl+ijxe3UW/wNl9PiOQlKqvJBbxUluEz3nnura9uAW19y5/6zzWgxwlGNuTg/3
 NsPw==
X-Gm-Message-State: AFeK/H3yxwvsjJ60qd/V5BPd5LddNw9vTzCkRMYRWRS6ehRibn7nLp7dvSjOT21HEA67at/XWaCIU2+/5Bv2s1uC
X-Received: by 10.28.146.12 with SMTP id u12mr11231043wmd.142.1491240520256;
 Mon, 03 Apr 2017 10:28:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Mon, 3 Apr 2017 10:28:39 -0700 (PDT)
In-Reply-To: <E41D83B2B2E8CB42AC13E92B4C3FABD3B6026B@TS-GGN-MBX002.ibtechnology.com>
References: <E41D83B2B2E8CB42AC13E92B4C3FABD3B6026B@TS-GGN-MBX002.ibtechnology.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 3 Apr 2017 10:28:39 -0700
Message-ID: <CAPLgG=k4aLLywcRe_Ds-jhjbt4kcfM8FBb5whHBXvWga029deg@mail.gmail.com>
Subject: Re: OpenBMC and DHCP server
To: Karthik BalaGuru T <karthik.t@incedoinc.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114434a07c9807054c467d64
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
X-List-Received-Date: Mon, 03 Apr 2017 17:28:45 -0000

--001a114434a07c9807054c467d64
Content-Type: text/plain; charset=UTF-8

OpenBMC is a linux distribution and as such can run a DHCP server.  The
default configurations provided do not do so, nor is there a defined IPMI
or REST interface for doing so.  Are you planning to use AST1250 behind
AST2520 in a blade chassis configuration?

Rick

On Mon, Apr 3, 2017 at 10:10 AM, Karthik BalaGuru T <karthik.t@incedoinc.com
> wrote:

> Hi,
>
> I am analyzing few parts of OpenBMC for an architecture.
> Kindly let me know whether OpenBMC of AST1250 and AST2520 allow setting of
> DHCP server so that it can serve IP addresses to the connected clients.
>
> Thanks in advance,
> Karthik Balaguru
> Disclaimer :
> This email communication may contain privileged and confidential
> information and is intended for the use of the addressee only. If you are
> not an intended recipient you are requested not to reproduce, copy
> disseminate or in any manner distribute this email communication as the
> same is strictly prohibited. If you have received this email in error,
> please notify the sender immediately by return e-mail and delete the
> communication sent in error. Email communications cannot be guaranteed to
> be secure & error free and Incedo Inc. is not liable for any errors in the
> email communication or for the proper, timely and complete transmission
> thereof.
>

--001a114434a07c9807054c467d64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OpenBMC is a linux distribution and as such can run a DHCP=
 server.=C2=A0 The default configurations provided do not do so, nor is the=
re a defined IPMI or REST interface for doing so.=C2=A0 Are you planning to=
 use AST1250 behind AST2520 in a blade chassis configuration?<div><br></div=
><div>Rick</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Mon, Apr 3, 2017 at 10:10 AM, Karthik BalaGuru  T <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:karthik.t@incedoinc.com" target=3D"_blank">karthik.t=
@incedoinc.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<=
br>
<br>
I am analyzing few parts of OpenBMC for an architecture.<br>
Kindly let me know whether OpenBMC of AST1250 and AST2520 allow setting of =
DHCP server so that it can serve IP addresses to the connected clients.<br>
<br>
Thanks in advance,<br>
Karthik Balaguru<br>
Disclaimer :<br>
This email communication may contain privileged and confidential informatio=
n and is intended for the use of the addressee only. If you are not an inte=
nded recipient you are requested not to reproduce, copy disseminate or in a=
ny manner distribute this email communication as the same is strictly prohi=
bited. If you have received this email in error, please notify the sender i=
mmediately by return e-mail and delete the communication sent in error. Ema=
il communications cannot be guaranteed to be secure &amp; error free and In=
cedo Inc. is not liable for any errors in the email communication or for th=
e proper, timely and complete transmission thereof.<br>
</blockquote></div><br></div>

--001a114434a07c9807054c467d64--
