Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgdFk302czDqhC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 10:53:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FBjR7X50; 
 dkim-atps=neutral
Received: by mail-vk0-x232.google.com with SMTP id k68so47192392vkb.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ldnTMevMYM4EHAUByXrtv1Hy6+8NcZsgjm7DAocKZLw=;
 b=FBjR7X50lMwKeHTV2plTH1MVzU9Y25jwWOUcfA5zJwqHZ0SAheaakK8RnJc6aOqRMJ
 A31VcR2BncTPPAQVzXVg+J29zp4yb/gs60aXMTAdgeXG5QbjsqinEvqIH8WL9iQ/zzTp
 DI3rJ8qkAMNlAs0n8oO2nJQzgqboD7YNGIBl6LW47n9itnu0pLrZNRya37OFhebfcxKo
 BwFY9Fj1adBUoRFG4gym4Bx1r6fTh47/MJfcsbKGYsLGMU7lXJFCvPl2hIJc5bAcG4nL
 a2+lPf6gLFgUs36lQR8cHqp5QHC10HoP+7wbgocAAaF70ShsRv+dlD0RA9zIifJwaFRs
 LCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ldnTMevMYM4EHAUByXrtv1Hy6+8NcZsgjm7DAocKZLw=;
 b=jfImypv+PFKA9R7FMeyDRuSchBqvrMfVBaiM0XKsTn8VA5QvyCa2GrYRGIlTPe1XWa
 b3/CqRy6nMfk9plMfxMOLuJM6PL4lWQjh9uBiZGUELEOT2XMbTSzVEqQ1r/iGGar8+iC
 e+ib7gVCgDDtF706BghrGG7kR2LNOcCS6grukyqMZ596yS3CBFsnEt5ODgHyDcFcmxxx
 Zlxu/Es4qAxFb69IeQethCk7I4LF+ckv2dNXIxGg9D20MORAH3oTJL9sw6yUc89gPWMX
 8NmbYRGMwm4jug9V+cKLlA3QuYDgLuFzz7bGHABf6NqF+Am+Zq9F/FGdpJJmPr70Kjq3
 ZuqA==
X-Gm-Message-State: ALyK8tIQ5cwl75TdtTxp6EMA2Uov5X4RHcFnJyUNDdjtHkhgIQh5WpiLdVU0s3At9nmqarx1BVXjPk/iWCIXnA==
X-Received: by 10.159.36.119 with SMTP id 110mr2058996uaq.106.1467334423775;
 Thu, 30 Jun 2016 17:53:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.103.98.68 with HTTP; Thu, 30 Jun 2016 17:53:24 -0700 (PDT)
In-Reply-To: <20160630212709.GV20922@asimov.austin.ibm.com>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
 <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
 <20160630212709.GV20922@asimov.austin.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Jul 2016 10:23:24 +0930
X-Google-Sender-Auth: QCObX4zaCQGxxEUaN_mlEviSzrA
Message-ID: <CACPK8XdYZrNXFrxp2beXwWKrORCApWtSh+1LRG+qOrd_DHvz-g@mail.gmail.com>
Subject: Re: [PATCH openbmc 3/3] meta-openpower: Update pflash version
To: Patrick Williams <patrick@stwcx.xyz>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 00:53:47 -0000

On Fri, Jul 1, 2016 at 6:57 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Thu, Jun 30, 2016 at 11:20:33AM -0500, OpenBMC Patches wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> Move to HEAD so we can drop the patches we carry.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Stewart released 5.2.3 with these fixes.  Can you put us onto that
> instead?  Prefer to stay on a released version rather than a commit.

It was my intention to bump us to 5.2.3. However, I went and looked at
the recipe and we were carrying 7 patches against skiboot. Only the
7th is on the stable branch.

Stewart,

I assume you don't want to tag master at all?

If not, can you please pull this list of commits into the stable branch:

 e42206bf0729782330778e77283af2aca23499dc
 7c7911eb7bea505474c3062bf5b0c60d99b502a5
 e5fc583e610d4360f8fe50f225c868cb3019c1a7
 e415b3b9bf0441745f442e12bfce25ed49c589bf
 45e548176e16ad8ba9540fcd75131ba4993e42b7
 24ae270984a37525f8393eeccbd0ac55da4503e1

They are all related to building pflash.

Cheers,

Joel
