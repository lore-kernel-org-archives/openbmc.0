Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7hHv6s4yzDvM9
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 06:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=pIFAh8b0; 
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id p9so36256187vkd.3
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jghROSu3KSrf6NtC6oCHuHHFw9R2dlYXfgsjZaE5Mj0=;
 b=pIFAh8b0LMBLblKxxvldB1pMD+bY2IqQJAjdvmPkdrHS5IUYmSQKiBJ4nNbanOuJs3
 3YWvuq8H1YPQaSjQLnKkGt3L0WTutXfkCV7iRZc9LOTMJuDKldcG4GJ4C5aA3s7NWKSV
 gomojrERUbjO+uImRJBkMlNxoDnA8Cw4EDI1fzSz9shDVsUW4HmGRBc0JFfCnb2lCgYT
 AeutqXygNEQ36wvFR8e+jY35UecwvLbg3DsJvSJGz6V+eG2JJ4LEu6/1Jq60/z4WD1Xp
 H6QspvUdQcKl/3AZPfNqdGettJa76LUr+z3NaEOrZ9YCTz/1N6lAzLHVZVhmCCPkntFR
 q9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jghROSu3KSrf6NtC6oCHuHHFw9R2dlYXfgsjZaE5Mj0=;
 b=Vf3X7PeRXkJPnDVS4BH7yDU8aKlLVGA5rZe0gt02Gk3Vh7yYP2opJkO7ZAIKF8FfeT
 mmtV15g6AicOo6Z9x+gGkQpKGME1QHKyMWQVBEl0J7HXstSvG8MwP8xxmrl6xC7vQTw1
 Ff8con+1yTivsYtSMWWY5No16isKMriN8IDHXs8E1LVBmHgMMzVu+AF9g65L+g2oJkMD
 KeEAw9rJjO7IyZRi2KXuf2zi5VVnna+Nf1QXAWWdUcobUep+zB8X1ugZJ7zOHytaaOpX
 TNkxxZ5kyz5h/O2S5go252+UXGJWC81HEsIidIIINGS8+GKF8BYEcifv/UXEpFRjLKsN
 Y8Dg==
X-Gm-Message-State: ABUngvdyLFIdEMVKaFxL5ddfPABJRdG0MYBCneVFOJYTDAtLia8Uxabu5AAFSwGlyEIBFcxbzb6L/nzwWry2nYfI
X-Received: by 10.31.136.195 with SMTP id k186mr26564173vkd.50.1478028856923; 
 Tue, 01 Nov 2016 12:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.102 with HTTP; Tue, 1 Nov 2016 12:34:16 -0700 (PDT)
In-Reply-To: <20161101190930.gkr6bctv6iejbfj4@asimov>
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
 <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
 <20161101190930.gkr6bctv6iejbfj4@asimov>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 1 Nov 2016 12:34:16 -0700
Message-ID: <CAFd5g45iH7=9EAmnN886DCCToxw-nJ5F_J4VuTxhj0030hHquQ@mail.gmail.com>
Subject: Re: Adding a MAINTAINERS file
To: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11442c70fc79100540426828
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
X-List-Received-Date: Tue, 01 Nov 2016 19:34:20 -0000

--001a11442c70fc79100540426828
Content-Type: text/plain; charset=UTF-8

>
> I'm not sure how you can enforce specific reviewers in Gerrit without
> yet another config file per repo that we need to maintain.


Again, the goal of listing reviewers is not to enforce a particular set of
reviewers, but to offer a quick and easy reference as to who you should be
talking to; where to direct your questions; and consequently good people to
put on your code reviews; I see no reason to make that a requirement since
a maintainer has to sign-off anyway.

--001a11442c70fc79100540426828
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"font-size:12.8px">I&#39;m not sure how you can enforce specific revi=
ewers in Gerrit without<br></span><span style=3D"font-size:12.8px">yet anot=
her config file per repo that we need to maintain.</span></blockquote><div>=
<br></div>Again, the goal of listing reviewers is not to enforce a particul=
ar set of reviewers, but to offer a quick and easy reference as to who you =
should be talking to; where to direct your questions; and consequently good=
 people to put on your code reviews; I see no reason to make that a require=
ment since a maintainer has to sign-off anyway.</div>

--001a11442c70fc79100540426828--
