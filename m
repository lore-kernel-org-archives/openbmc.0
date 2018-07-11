Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::236; helo=mail-oi0-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="coWCcPBm"; 
 dkim-atps=neutral
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QpD53mLxzF35P
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 04:55:16 +1000 (AEST)
Received: by mail-oi0-x236.google.com with SMTP id k81-v6so51168124oib.4
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KATvmzb2VwC28Gs9ZDnZRjwfZkCJNPNE5blSiUL2MDs=;
 b=coWCcPBmgJWOmh0P8t4RgSwlZ2Ob0JwE2gFZWTxZmS9+g/lJCxpnzZGTilwt3Ywth0
 02JWyIb/WIgVqAIQzPMKlU0diEnTfu588cSZECM8Wty2S9P7lIjEp9SzaF+z1l6bpQ1a
 ApoKcXlisnt/7Cm3nTsADt0ADNFlyY0jSkEnVpgf6l841wnTFUZi1Ijg72ezouWMlSxv
 vnWPRXhewqKgPw2g73HDpZUcIeRgssOtEHu3nuvWtG7YdW8FeVkjb69+73RE/l1xsi30
 lxi3+Xv2ZkHz0zpin1SBdtnneTnKbytcveCkwVhplfcjlt4ErXuWsz8HPUnATgcxRtqW
 IpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KATvmzb2VwC28Gs9ZDnZRjwfZkCJNPNE5blSiUL2MDs=;
 b=OGrI5hHrilllwAQESSqmGzb18FJu8vmXqgbk6S7lp4/D1qNeVVzgDdgJ24VQPQ+YUW
 Hgn18duQwG1t0QJEXuLR+3m91mbA/iXK9WERLTLFA0J9hADJylJOLBV+dz9TZiHwu7w1
 v0YWAp8pISXwuz9lCvBvQf7N3DvgpJsJf2z8Uz4wWG4swosE6+gFGxuFP3NGLNhB9bh3
 zpK8qqY8Hdw51hC9t+g3T8TYSRI6L/Pd5tUEU0QByF32JfjseKWmTSsJenH1mIA1UVoY
 Y52qKYCEUdTEn+Q1mga2jqn83A9AbHdoegtY6yocjtHHXhm70A9Gfs+XzOQdtLioio8+
 Og+w==
X-Gm-Message-State: AOUpUlECTewb7FkB7UJiyFp+V0xFlkDVU+FKFu2j3zgN5ilvc5yLFUCo
 fHtAUDGcKUjFb8lMqhjfm2ye/8+dkZ9gxqK3G6c=
X-Google-Smtp-Source: AAOMgpfHnTk8JdbsJCF0V4DA8Kev9uq9syvebR11uMO7tikhvmQUnqasaQ0r4XuafiSid0oUJp4pmQ2FM4KN59MYN4w=
X-Received: by 2002:aca:b909:: with SMTP id j9-v6mr490540oif.257.1531335314127; 
 Wed, 11 Jul 2018 11:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
 <b562920a-329f-d5c4-28af-555e4bb3bc33@gmail.com>
 <CALLMt=oO7x9MtCNrmFzrXCrmYEiVys31cLJJat31N1y89nSZEQ@mail.gmail.com>
 <1531319763.4184525.1437335200.4879B6DE@webmail.messagingengine.com>
In-Reply-To: <1531319763.4184525.1437335200.4879B6DE@webmail.messagingengine.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 11 Jul 2018 13:55:03 -0500
Message-ID: <CALLMt=qo1wqBNzy5msu6sh=iXkmL3=a=qWWzVtz2zhaw23Tvig@mail.gmail.com>
Subject: Re: gerrit server update coming - 2.15.2
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Kurt Taylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 18:55:18 -0000

On Wed, Jul 11, 2018 at 9:36 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Wed, 11 Jul 2018, at 21:40, Andrew Geissler wrote:
> > On Tue, Jul 10, 2018 at 4:33 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
> > >
> > > On 7/10/18 3:13 PM, Andrew Geissler wrote:
> > >
> > > I'm planning a gerrit update in the near future (this Saturday
> > > maybe?).  Anyone have any issues with an update (or know of any issues
> > > with the 2.15 release)?
> > >
> > > OpenStack is still on 2.13.9+ (we're at 2.14.7), is there a problem we need fixed? No issues, just curious.
> >
> > A few months ago someone asked when I was doing the next update
>
> "Someone"!?
>
> I'm crushed!

Hahaha, sorry, should have remembered, you got the best name out there! :)
Andrew

Andrew
