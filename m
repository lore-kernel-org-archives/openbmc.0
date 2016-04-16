Return-Path: <teddy@prosauce.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qn4mc17khzDq5v
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 16:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=prosauce-org.20150623.gappssmtp.com
 header.i=@prosauce-org.20150623.gappssmtp.com header.b=Q+k69OWQ; 
 dkim-atps=neutral
Received: by mail-wm0-x235.google.com with SMTP id v188so56133009wme.1
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prosauce-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc; bh=9N4uRbuUxq1gq3+///LmhM3xzkE1qLvYuRGUjuPjE6A=;
 b=Q+k69OWQSEEZlLkbaXd9GybDKb6uTS0GERhlfJgspNNdR/Ui1j6up9Rqhbp1ApzgGn
 nDzCTYkuLOmeO1myrZeMrBQm4p30svOF4jADkkb21U8JKw47h4cbX6tA8O+klsd8u4U7
 uUGOf5EGCyO47JakjkVhj/E3p9Tz21LralLqLyr0awdCjET/+hDY4+MQN4MioqRMSrcY
 DtcYCjVoiFBFCv6PdXRU8d2CwOHHBZzduqI0eTbXb2PbglIo40I9Mcscb9pyv2AN8Q4l
 ToI+kL8IZBoOwH2PKfuHKgBPZ+8hzFgdwiiN3iSx7JJv8xIwEyvp6pR2ZOrO5fQ+M2tS
 WF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:date
 :message-id:subject:from:to:cc;
 bh=9N4uRbuUxq1gq3+///LmhM3xzkE1qLvYuRGUjuPjE6A=;
 b=VXUDHKBQ3Z+3eb+JHjV0xNLSE5G+Cj+kuumcp2/KVMLWvWQsctMhXrh640LlpDhF7M
 Qbr7OKQv5iKkxBNzXBqc044tfSbfdr/LTZ/SUggxzY60sl5XeSGU2gex65hiZ56cF7kc
 ae2ylWj3nJxznTYfWCqrLDsbfKKVA78d4UWZnkrxehOGDY7iVRoqtBZ9XQLLF+xtH8rz
 VBDVUq83uCwetybI3snb+58fG06hVfJ3WcXw6J+qZwFBG5Bf/rF6pYU6VJaetlwET9zD
 I79DASLrSlA3WQLTjnEJl/e4kPmsLgqSlR04uyEizHmzO8iC4V3A/xf9dLRtKdzA2uWS
 JPQA==
X-Gm-Message-State: AOPr4FUKerdEK8eq+pWeeQJ//T9PoUe8OkSsXJuDXLEhLeYTvV05m8sUJdSGcUEDGkstssvi4bjQNnOZYX3uIQ==
MIME-Version: 1.0
X-Received: by 10.28.179.7 with SMTP id c7mr8702368wmf.46.1460789433876; Fri,
 15 Apr 2016 23:50:33 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Fri, 15 Apr 2016 23:50:33 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <CACPK8XcnceWNFUNijp7haUvaBn9H607ceaMQN+pvKxYO0WuJVA@mail.gmail.com>
References: <CACPK8XcnceWNFUNijp7haUvaBn9H607ceaMQN+pvKxYO0WuJVA@mail.gmail.com>
Date: Fri, 15 Apr 2016 23:50:33 -0700
Message-ID: <CADUykeqpzJfuk5=NXYMdLweBat6ujVLx_P-hfq063gCU80qLTw@mail.gmail.com>
Subject: Re: Aspeed u-boot trees
From: Teddy Reed <teddy@prosauce.org>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@fr.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 19 Apr 2016 01:53:57 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2016 06:50:41 -0000

Thanks for summarizing Joel!

On Fri, Apr 15, 2016 at 9:12 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hello All,
>
> I wanted everyone who has been helping out with u-boot to get on the
> same page. We have a few trees floating around, and the last thing we
> want is to be doubling up on work.
>
> Ted's tree
>  - ast2400 patches that Facebook were using
>  - rebased on 2016.03
>  - cleanups
>  - https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r1
>
> Cedric's tree:
>  - ast2400 patches that the IBM team were using
>  - rebased on 2016.03+
>  - https://github.com/legoater/u-boot
>
> Joel's tree
>  - Cedric's tree, after deleting a lot of unused code
>  - https://github.com/shenki/u-boot/tree/aspeed/openbmc-cleanups
>
> Finally, I took a copy of Aspeed's latest BSP that supports the
> ast2500 as well as SoCs supported by the existing code and pushed it:
>
>   https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500
>
> This tree is somewhat cleaner than the previous. It groups boards in
> generation 3, 4, and 5. This is an attractive option for focusing our
> cleanup and upstream efforts from here.
>
> Ted, what are your plans for your tree? Do you have time, or would you
> like some help?
>

I have a lot of time to spend with u-boot and I'm happy to help
however possible.
In tandem with the QEMU and kernel work you've done, it would be best
to begin upstreaming to u-boot.

I'd like to organize 3 patches to upstream:
Patch 1: I can attempt to bundle the most basic set of patches from
the various trees which are based on v2016.03 for the 2400 boards. My
goal for the first patch is the simplest possible bit of code, based
on the 2400 SDK.
Patch 2: From there we can iterate with support for 2500 and include
the fixups Cedric has to the ASPEED-provided SDK code.
Patch 3+4: Finally, in a perhaps another two patches we can add the
Palmetto and Facebook board support.

I have one concern with this approach (aside from eagerly waiting for
your constructive criticism!):
The SDK provides helpful system level tests (SLTs) that we use
internally quite often. I want to continue having them available, but
u-boot does not facilitate this from what I can tell. They definitely
should be removed from the CPU and board definitions-- they might be
ok as u-boot commands. They could also be amalgamated into a command
suite. That said, CPU/board specific commands are very rare.

Any recommendations on how to support the SLTs within u-boot, or
perhaps recommendations or examples on how folks "vendor in" these
sorts of tests? Ideally they would still exist in the output u-boot
code for validation testing and runtime debugging.

> Cedric, I think you have some cycles available to do some u-boot work.
> Which tree do you think is best to work from?

-- 
Teddy Reed V
