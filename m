Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tczmS4g1NzDw1N
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 10:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hgz7R+UF"; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id b35so10200698uaa.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MwZH0jTdKtKU818DmhtUYCNSJDYIhsovcw3EgtyJpLg=;
 b=Hgz7R+UF6hsBuUfM5PDvcgkhS+pnzDiyS9BBtL4haIIU/W+/J/JhmDDf71qWnTkyLy
 BeaksnesfxEjiTZUj6DguIEcGc4HuIl3cfqMLmPws82EDsvgCE9LlNDMfUscmwMBGoIu
 GW9LnfMssnvOwcDRcAM4ijJOwEs2FTFvOjnl0RpHlYh629vozvfuhzenxP/N46+1hPEx
 od4653U8jx1xjGBi4/1+SkHcExd+T7CnYZERzYpdZgpXCcMQBw2jvccNapnffTWGRWEg
 HK4GXe8+m967jDfzUAMAVLoKgg52rI2e87SVWtA1fMoeHX4JohHBClmMrBoUL/68t28O
 7hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MwZH0jTdKtKU818DmhtUYCNSJDYIhsovcw3EgtyJpLg=;
 b=FT+0JcEno/zmr+R0NiEgeTOiP7rLhwgZMyta4AaCOApHP91S1MqQVK9jHXnQS1a3f6
 wmEkfSYBJm+9MR7CIFAUBauycpU8JbO9s0/Wkv4TA3h75/1Q+O/p0x4pb9lAXyMB4VzL
 ccP2zjkYgmwPXFd1frahMVs3+ykpvFYGbIcKkgHSRaZeNonyzwoktSXmPm2mRr2DfCtT
 zqCAxjmO6XVa9br6aKqfCrhg0YsjQCpjDe8ANv1d9K2ySSBU3VeVT+Vs6CNgENfFBCXT
 e7lXLSItu8lFSyalHFpvKLSqBB96BiMMeVd+m5b12TssgmtXoCUvnS/scmtdNSySK13I
 nw5A==
X-Gm-Message-State: AKaTC02NFTQX/cd7ZYbl/OmbWMXFNeZv4DcVCCzSKtkhi899wJGpEeXJq6+iiMCQOtA9KotX6fCp8e4NxAjpbQ==
X-Received: by 10.159.34.41 with SMTP id 38mr29166065uad.160.1481585893709;
 Mon, 12 Dec 2016 15:38:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 15:37:53 -0800 (PST)
In-Reply-To: <OF3D3B8518.26AA2AD8-ON00258087.007EAF40-00258087.007ED179@notes.na.collabserv.com>
References: <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
 <CACPK8Xcwk-ctKv-G-RdOo2xcwb3PHfDVfBJa=r4qkm5Ncbuoqw@mail.gmail.com>
 <20161212225215.GA5150@heinlein.lan>
 <OF3D3B8518.26AA2AD8-ON00258087.007EAF40-00258087.007ED179@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 10:37:53 +1100
X-Google-Sender-Auth: EUVe4uoEh5mDyoMGnyRyUXtIJ2k
Message-ID: <CACPK8XcYT51saXXKuZzVZG960Y0Yfq_JwguAd93Aofd4PJYG9w@mail.gmail.com>
Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client device driver
To: Edward James <eajames@us.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, 
 Christopher Bostic <christopher.lee.bostic@gmail.com>, eajames.ibm@gmail.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 12 Dec 2016 23:38:17 -0000

Hi Eddie,

On Tue, Dec 13, 2016 at 10:05 AM, Edward James <eajames@us.ibm.com> wrote:
> Yes, the OCC driver will depend on the SBE driver for P9. I suppose the OCC
> driver could handle all the SBE register access over FSI itself... but not
> sure if that's a good approach.

Can you expand on why you think this not a good approach?

What abstraction does the SBE driver provide that the OCC driver
benefits from? In other words, how does the code change in the OCC
driver if we don't have a SBE driver in between?

Cheers,

Joel
