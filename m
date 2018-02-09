Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::233; helo=mail-qk0-x233.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiGF58iL"; 
 dkim-atps=neutral
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd2Q81Q6fzF17f
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 15:38:56 +1100 (AEDT)
Received: by mail-qk0-x233.google.com with SMTP id c4so6256204qkm.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 20:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+IWchd/FH6wDX27ZSblfst0p9gXhT484Uij3ikMu97E=;
 b=aiGF58iLp07d0FrDIlkYdRr958AQM0MLJhd6v94MFqdAtIAB0vaQM+rEcwE+XSrEv7
 fLtwWTs7QfHKkb2LUn/cz+wusocnQu64OOi1WbukKjPjvU74VAXbucyBJ9LiYmoM6F2t
 YIwWbV72HvjGVmsNBM/7y7rJZTVqqDqZPS8rrsh1SwrnSTV48v+CnGRWtpDDGI/8L7aX
 abFVNT35cV0yGpqM+TtiQltjbpu1uB3SERyDYphPCxuVyOLVbQYPCWhJZZ45RN8mDdNB
 M80x8T+4SjOHLih7v4oSzy2hPphzNSaWa9JHt+znPiAj0+3p1JSKZryfYIxHTX7e9x/D
 mLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+IWchd/FH6wDX27ZSblfst0p9gXhT484Uij3ikMu97E=;
 b=P/X3gtpTylH1XUCGAsxNwZD5wcj6ws9COIgoH84XZN7eo2f7xDI+arlqoo5FB+Uif6
 tvp8FObarb/3CDDYwEkSVqDBqJIV2VLmq/iBPg0UWJgqWILi16OCv3SHIsjxp4r8gg0g
 5GA/TIb8oNhrKdpYXLPTI66eZBq8+AzN8lrRGt+/SagZZLziDKyDhVcO8kLMhdjJntwW
 NVmYPD4lqIPOoLYX9c05jRrEr2a4umPjvSdPN12gdCenJxv/xJysM7nlgxsb3uQKSl1o
 gFmYsCsXyOM49iHy8kCyAB0b2BsY2O7GvSEtyvE2SCgM/D4oIKYMkrzTSwG76r2jke4E
 /z0Q==
X-Gm-Message-State: APf1xPB1fcdR1Gvqh7mdjMwTgFymldH4J7rjEZFTPYJKppAqVEjd9nZh
 wRMSxLs+YRCtOPR+YQypeFXF+R1IOQWUH8OqCsI=
X-Google-Smtp-Source: AH8x225sVKRP64TGGvg6QviBcmkXOpTuYyVE5e7xoynpRuge2EOasWsjY2jXlLlrLgWwlGVicVZ9yD27i+17V0K090c=
X-Received: by 10.55.33.129 with SMTP id f1mr1717576qki.158.1518151133417;
 Thu, 08 Feb 2018 20:38:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.81 with HTTP; Thu, 8 Feb 2018 20:38:32 -0800 (PST)
In-Reply-To: <CACPK8Xdn-8OTMhucBFXz0CRWi+72-2ZjOnjRWDuHYEWxD-qk5g@mail.gmail.com>
References: <20180208053745.31254-1-joel@jms.id.au>
 <20180208053745.31254-4-joel@jms.id.au>
 <1518076351.14456.8.camel@aj.id.au>
 <CACPK8Xdn-8OTMhucBFXz0CRWi+72-2ZjOnjRWDuHYEWxD-qk5g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Feb 2018 15:08:32 +1030
X-Google-Sender-Auth: e2WCFv6vn2nVuAce7NKL2GAw5Ns
Message-ID: <CACPK8Xdjj1-RfwjfSd5bTGNepzm0A7bVXJhLOgOUpFfw+TiWdQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 3/3] soc: aspeed-lpc-ctrl: Enable FWH cycles
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 04:38:56 -0000

On Fri, Feb 9, 2018 at 12:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Feb 8, 2018 at 6:22 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Thu, 2018-02-08 at 16:07 +1030, Joel Stanley wrote:
>>>
>>> +#define HICR5 0x0
>>> +#define HICR5_ENL2H  BIT(8)
>>
>> Shouldn't we be setting this at the same time as HICR5_ENFWH below?
>
> In our testing we didn't require it.
>
> Lei, can you double check that the patch works from a power cycle
> without setting bit 8 in 0x1e789080?

Our testing was off. We discovered that bit 10 is always set (in this
case by u-boot, in platform.S), but we need to set bit 8.

I will send a v2.

Cheers,

Joel
