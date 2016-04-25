Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qtk2r1DNqzDq5y
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 21:07:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=t6gAL0ZO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=MQ7RaATs; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r186so22581019oie.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=s3kWjZpG8jZ6GbLhzjYKQI2MS9ZCa2P7B1zAkzGxWlU=;
 b=t6gAL0ZOsADz8r8Qp2RXOFXY9swLRWvfJs1rEZaaKHdpfm6OwH7ei4Y6Da/A97/VoF
 KGScsI/QDtDoyw8t2i4wEj3EqgpV3EM4Dw2ps+my9zhJAWCxBO4P5SfFxyRGw5eP/oNP
 Qm596RuPdB7tbjOfkreVg8/vJIpQauc4piKnb9ECAKFPoTYgoCjqcfJvpINAWRj0gSOx
 bMLEp7RNmFWJ/LNXp/9DZLp9nSFc1vcNx/Z5ViWQxmBGqOUuCKy1oLLgwh4jbTaoVfeF
 XC0jNJTMscpnlRSNZV4YAGemdUJfzHqpfDeEhOitpsQNYDJHuhBcuINNEPSS6vZTWFuG
 kXVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=s3kWjZpG8jZ6GbLhzjYKQI2MS9ZCa2P7B1zAkzGxWlU=;
 b=MQ7RaATsNC8ZKclc98A+BiSH5iyUwzEBYhrRThHdBo2AsJvEakRChCh3Ynau0XB+Vw
 g1C/YgJgk++MHJ5UwYU3ArdsVJEWRcnJtrntmq31gwffKpAZfmRmRxluDYl13pKBPRZ+
 HAfgytGcxG8o99hhnc64B0x+7iQZ/85bNyRvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=s3kWjZpG8jZ6GbLhzjYKQI2MS9ZCa2P7B1zAkzGxWlU=;
 b=gLhviS1gMwyPmjS16RlXhkrmKxjonZrJMyDPsBNaCl1U1VCf+kv/fNbZS9ZVVjS+7B
 tyNz8HPPhP4s5Bcvdc2K+meGLGBFwMNhil7wnL1tpwgUbxsESkTNhx8fwIaClMmQUhbr
 NMv+THR0rJ+6KxX39dd3jBhc4mm/TAhzeZk6CIKLqM1Soi6MY1hTh4aCEXnPA1544yUd
 QVTx3nw49ui4liKbyI5k0I1Er7CR6xurVWcd5hSRSzAkdTgdYWj8w90n8lk4I6rkdEtU
 HWPo7hfAj927UKNtcSBt8eerNPPhKyyD4qM9fncGskxRKypiYOFWhBaAna5YI2W0O3Eo
 L/Aw==
X-Gm-Message-State: AOPr4FXaqqCVR9qU2rZIL9F0aPw0Hv2hVPXAr+4JDpVU3fmkdbEBIRit3tDeyagg405KOS5sBux5rv1s0AeEBw==
X-Received: by 10.202.217.136 with SMTP id q130mr13694030oig.127.1461582449136; 
 Mon, 25 Apr 2016 04:07:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Mon, 25 Apr 2016 04:07:09 -0700 (PDT)
In-Reply-To: <28037416-9A0B-4299-B77D-46B4F40500CB@fuzziesquirrel.com>
References: <743F4413-5504-4274-A4F6-E32333DA8D89@fuzziesquirrel.com>
 <28037416-9A0B-4299-B77D-46B4F40500CB@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Apr 2016 20:37:09 +0930
X-Google-Sender-Auth: t2rdgV9_Li2lRpyT9IXjZi42RqM
Message-ID: <CACPK8XdsJWZX6s2wp_2axOFmWbb7ZPbOBw8M7VGnYEQnL32-ig@mail.gmail.com>
Subject: Re: help getting ast2400 i2c busses 7-13 to work
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 25 Apr 2016 11:07:33 -0000

Hey Brad,

On Sat, Apr 23, 2016 at 12:09 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> fyi - it was the multifunction pins not being configured.

Yeah, the i2c (and GPIO) drivers don't change the SCU configuration on
pins. We rely on the configuration in the board file
(arch/arm/mach-aspeed/aspeed.c) to have them in the correct state.

This will be fixed by the pinmux driver that Andrew is writing.

Cheers,

Joel
