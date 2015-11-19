Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x229.google.com (mail-ob0-x229.google.com
 [IPv6:2607:f8b0:4003:c01::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A79831A073D
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 23:02:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=or8qaDt8; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=L9PeBry0; 
 dkim-atps=neutral
Received: by obbnk6 with SMTP id nk6so57941302obb.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=7PRiw8xJIgo7NhhxyQR62kRyYahv83aHGeHD8aCT4Q8=;
 b=or8qaDt8tc8JE/2TwFZamNJ2oIG6al09VVemTyv1L2epu0C/bdq/GYy2YczHr2m9bN
 Lr4Dz+2qIzCrDp0FudZpbvmMTT/EPtPx3Xkz7WG3ObvdWMrMB/meaXm09XM5SubsAUmm
 Kjmj2DOcdZiBKX3OdRQDIORTa3r/5N7JIQnODr1trN4rkux/I93VZrNt+DZNDYCUDJbF
 4BIKjFZXdPoBmOaKhOPcn5x9nO6UJvtAduXECjoHZmrIgGBIZyDRDmKSA+Ykrc8yY6Lj
 1B3bjtKWEVN1B6wS/FTjUrpYIO4Bk04yT7HImZ21QY4PTz7T3iC6WUtyauG1gufXSHkv
 51xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=7PRiw8xJIgo7NhhxyQR62kRyYahv83aHGeHD8aCT4Q8=;
 b=L9PeBry0sVNjg6RIraz4IYlThrBZSvpNtxEdszUCS7ciu+hfYm6Ri6EXV/2HPpcjz+
 z8lOJOBNBWKxYVzgyxjkMOqp9FRGlLRSBot1WL2wAPiT4QK3p0oNT2cp1FC5dxMDyF2l
 b+KEl9zsBzPpuqzr2L4G8MCAd3NbchDeE3C4Y=
X-Received: by 10.60.85.34 with SMTP id e2mr4797175oez.61.1447934532431; Thu,
 19 Nov 2015 04:02:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.226.10 with HTTP; Thu, 19 Nov 2015 04:01:53 -0800 (PST)
In-Reply-To: <1447877380.3729.86.camel@kernel.crashing.org>
References: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
 <1447877380.3729.86.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2015 22:31:53 +1030
X-Google-Sender-Auth: si8IigatmIbzApZ7Ht7sGN0WkEg
Message-ID: <CACPK8Xc-w=w47sG=O_+=kEZ83jVqC7ZwWtmBXRy3MPmC+wUX_g@mail.gmail.com>
Subject: Re: Supporting new flash in pflash
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Norman James <njames@us.ibm.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 12:02:15 -0000

> On Wed, 2015-11-18 at 17:23 +1030, Joel Stanley wrote:
>> root@barreleye:~# ./pflash -i -b
>> LIBFLASH: Failed to set controller 4b mode
>> LIBFLASH: Flash configuration failed
>> Failed to open flash chip

The error message was due to libflash/pflash not supporting 4b mode
when talking to the BMC flash. It wasn't actually failing, the code
was intentionally not entering 4b mode as it thought it was
unsupported.

With Ben's help we discovered the BMC bus needed the SPI Address Cycle
Selection bit in FMC04 set in order to enter 4b mode. I have fixed
this in my branch on Github:

 https://github.com/shenki/skiboot/commits/barreleye-pflash

I will finish these patches off tomorrow and submit them to the
skiboot tree. From there we can pull in a new pflash build into
OpenBMC, and be able to flash our BMC from under Linux.

I tested it on both a Palmetto and a Barreleye tonight, and didn't
create any bricks, so feel free to give it a spin if you need it
before it hits the official builds.

Cheers,

Joel
