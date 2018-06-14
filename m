Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kpOt77X7"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="U/PoRZYj"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415t3H2qGGzDrpC
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 15:48:58 +1000 (AEST)
Received: by mail-qk0-x241.google.com with SMTP id y4-v6so2990373qka.5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=RW6Yqqu0mn3mtYikHHWiz8fnQgy0TiPbD6eBRI9uIb0=;
 b=kpOt77X7MN866O8E5aHlAjd8hPn/mUSHF3LCDAC6jN5rCe3fKX1NMgjD2NxYldp5Rl
 /ETVmPh9/lKrKI8zZKOmBPCgjEu7M8Z4F6t8ku3p1qkUs8vBbBKr0BJJGWwyRhUb1bNF
 XJ4JltinvcDa4oKlEU1gWmkZ7ElE4/LXpyshs3S8iQGilE0wTBCH7P0IsrRWozgWJ8Dt
 f9b0Udo8SdZsgStJBv1Wc4qHIdPzYPK679igVua2oELBqF/dfUH+eMT+PmLH7cOqdy53
 5qQV5/KZo8fWonPVxvDJGPkJ63VbtBgVZJ3/bSft/vygRIB4YIkv9GbXod41yzX2w7Mc
 ipmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=RW6Yqqu0mn3mtYikHHWiz8fnQgy0TiPbD6eBRI9uIb0=;
 b=U/PoRZYjV+xkl8QNSRlyMrdbgOQU8EshisPEFqbQeNMP3p7W9b00q1j3iPBhTzY5G+
 NqHqvKWZAU035A+oo4pcNLbRb4OKSqTtnnJpZ02TIWbL/EBZ871jxL9k0nAHbEugco71
 Bb0hJJZ012TRzxhkmcZhxyM5D3VI+cwr3vcdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=RW6Yqqu0mn3mtYikHHWiz8fnQgy0TiPbD6eBRI9uIb0=;
 b=YnBXG8/A8ikSvm1gWrYLEI6uh+5tJhR2hn7tVt/ESPfvxWDNEVgNNP4xADCPk90d9I
 yh44Cpq3xxnrkc+0OrBMmre0qPMp8w1V1HTuyailtWjEp/mcgb53/vf/1cirJeyGtgTL
 DoRGUXGqpZieZ+/GdSA+OeiONiLdBHKZ/akP6x6p6We3cBu/82Ppb1ezbfNCs/oAkGXw
 JAEsJQ0Go44dO973yC79GakhK7qpgi01LNlllrzFXZ+/UIIbImTOTbZnknZmj/FGAaR7
 8+bD4eGkA/LGQ+Hb/mCc+5pOoLX4ZK+8lpyRV9WXX2+fKUemPLwc3SpWCL6oqO+Qjz+p
 Njyg==
X-Gm-Message-State: APt69E0sU1I3nu9dSLECqVs+07h/gx3nzAoT9ubyR/8CjYsISZIhWrqN
 p7vkflqMfP8SMbZ3kqEU8QAiReRhR4vFnahl0II=
X-Google-Smtp-Source: ADUXVKKiqllMfbND14BjpNMR9Z1EeOusT2Ku827cBQEiqv0nZkH8ykPfHCUxftptXWkVr/YSQTdLTLM2DdJRKB2xecY=
X-Received: by 2002:a37:1904:: with SMTP id k4-v6mr895549qkh.370.1528955336233; 
 Wed, 13 Jun 2018 22:48:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 22:48:35
 -0700 (PDT)
In-Reply-To: <134b1525-1d3b-dc57-71b0-e298a3d9fa24@kaod.org>
References: <20180608130000.22627-1-clg@kaod.org>
 <CACPK8XfM3B6FbukwTMtbi4FVU8SGxpFF-ox3MiDkMS8f3CASQQ@mail.gmail.com>
 <134b1525-1d3b-dc57-71b0-e298a3d9fa24@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Jun 2018 15:18:35 +0930
X-Google-Sender-Auth: AuvdIfomXymmbLr5BsvRfjTvs4c
Message-ID: <CACPK8XeEL+Er5KzKtFwpuDkbrsy1-yubSrbXSuhRJCeB8L3S9Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: aspeed: introduce a "spi-max-frequency"
 property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 05:49:00 -0000

On 14 June 2018 at 14:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/13/2018 05:00 PM, Joel Stanley wrote:
>> Hi Cedric,
>>
>> On 8 June 2018 at 22:29, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> Hello,
>>>
>>> The property protects some optimistic settings of optimize read algo
>>> on certain chips (old ones). It also makes the read access to the
>>> alternate FMC chip 3 times faster.
>>
>> The changes look okay to me. Do you plan to submit them for upstream inc=
lusion?
>
> yes. I would like to have some testing first and also make sure
> it fits OpenBMC needs.

Okay.

I suggest we wait until openbmc has moved to the new 4.17 tree
(probably next week), and once we've verified there are no
regressions, we can add your patches in.
