Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJdpR0vKDzDq8X
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 11:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="plhClQts"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 96so14196194uaq.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 16:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=AOsUEF9NTdkiveE3o0/riUpDV1KWCHneGZkuh5Zr0CQ=;
 b=plhClQts+sasUZpBzbrrOvMF9jcwt13hxk4pQ+WPOifoCxvBZjoQNerUhEx+bXFMoQ
 q3clWiKAv7auz1XCXcVkMEgsM2y6m3nHRrAITVasKPv73JIlbzf3UMR0lULKLGAkT8mQ
 q2Q6Opcncdkx77m26vQSY+qkFLQs8p/zuLkLudEycX6liY6tSoEDGei7xR1dd5d5jk7H
 hRekSfdoiX4vwsKIbBzitdlIWKcF1Kp1IsWuTuJNvuKiUAG1JVxq0UHe6LGryCHjIf2c
 AGkyszqjrTTpeDBtZPsEahCmF5x0/qA1CBbPuYZDdieVBJYnikevu3IsnDxN+OaCPrAs
 2ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=AOsUEF9NTdkiveE3o0/riUpDV1KWCHneGZkuh5Zr0CQ=;
 b=OZ4WE7vsg5tzaAF4ZrjzioG5wOyCyPhxP98GQ/o5TtoqSQiAZPyMZkeIHLgibZgPsX
 fAn2ncmCc9rclf7gbhYqKA1RHbzhfniNFry2cVGw6KxkzYWZSXt4ukTGx2sYh3dk4G1Z
 TmPPrt/Dgi/saKYO1ayAdNufMgusUN9bfRVkr9GLpglmkbZIyXObou94hIE8JWfruksb
 eUbza//RUeviJcJdJoLB2K39aj+mCpC0l8/YcizWF4kaM8SlHU+ZxIDUZ0fSKzlSXWVk
 XNnzMqPIve4xrKMJVKAFdmz9c2PIZwdzqy0850R6t+/L3sgNmD2QpMZktl5KPWE3E50X
 RKZg==
X-Gm-Message-State: AMke39nGfUUtQJXwX6gnj+2ef2ZmSl/yi+r0C/vEvetCo1+GUq98aah9HuTE0NfZ0DBzUIZVjEx9jmNXGfTxrA==
X-Received: by 10.159.33.213 with SMTP id 79mr140100uac.32.1486599211696; Wed,
 08 Feb 2017 16:13:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 16:13:11 -0800 (PST)
In-Reply-To: <CAPH-5w7D9XeTpFHJefE-7abYnBY6r32UsRSjZnN4aCEzm1JF0Q@mail.gmail.com>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
 <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
 <490CE008-B094-4008-83A7-7CD13F3F6C26@fuzziesquirrel.com>
 <CAPH-5w7D9XeTpFHJefE-7abYnBY6r32UsRSjZnN4aCEzm1JF0Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 10:43:11 +1030
X-Google-Sender-Auth: GgmBi_sDGOomAvgZ0kq-d4gpRrk
Message-ID: <CACPK8XfM3JiKPAHaab0yStVD04BFvsfqtyZjRQXD2p+TPip0yg@mail.gmail.com>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
To: Xo Wang <xow@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 09 Feb 2017 00:13:35 -0000

On Thu, Feb 9, 2017 at 9:36 AM, Xo Wang via openbmc
<openbmc@lists.ozlabs.org> wrote:
> On Fri, Feb 3, 2017 at 8:44 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
>> I=E2=80=99m not suggesting one way or the other as far as how to proceed=
 but I don=E2=80=99t
>> think pulling chips is ever necessary.  You can always netboot and flash=
 the
>> entire image image that way.
>>
>
> The hack we've been using for whole-image updates here on non-netboot
> BMCs is to use flashcp/dd of=3Dmtdblock0/pflash to erase and program the
> BMC flash, then assert the hotswap reset GPIO.
>
> It saves a bit of time rebooting and is reliable, but feels dirty every t=
ime.

I was waiting for some more acks but it's been a week now so time is up.

I will merge this change today.

Cheers,

Joel
