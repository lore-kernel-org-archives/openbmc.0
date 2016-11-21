Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBS1J11zDvj4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PI4V/9gs"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id m75so2038646oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=UIOEVVVYmYbCL2LK8jjU6VvJdayWalkhDcjwplk7lds=;
 b=PI4V/9gsVlhaCwRv4zM2xYQDEFT3sTHW5CV9vauv2cCKVTEhyDzA1C4BZCzcfnEL8A
 K2JyW6oODz9ZV7dKeG7gCGbq5mCEjQiQbc8SEsTcFlV7Z0srqSmOBHYuwh44mY0I2Snp
 KC6mhAb7m7+A5mD5hn5SC3w8z2u/bflllLz0/inD51oImKw+DVC0YEGuHdJEtb9FKSDQ
 BfeCCGWjNPGfp0dlD4zIp/SHYseC1UMyXUdEtzT0UwiDhf/m0m83PZxPLzbnV1CuAx5w
 TnmHxv8eBeI5UUUHwfqLlzAmOW/G6+QxkX3fCiQMij1QPRnr02LMDQBtNtq52Ii8NUDO
 vUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=UIOEVVVYmYbCL2LK8jjU6VvJdayWalkhDcjwplk7lds=;
 b=JaZBS4tYNqbb4FbE6HhP+W7har4PHFAMJNeVQEsFY7MPjXs1N15ABXHICDvW8LpaBA
 DXyN7hDV6dLZrdUcm3R4yO/K7KaKhxgq+7sXa9K0BydR4lxbR1v70riB/qD88Xng2zva
 ncxfxfVYg5J0Xl8viNvYT8HqUEGiBLZpXfdjpQlugqGbxn1LCMpS+Y/nIuJoE5OUljAT
 9uTzTn0sfVsShZtcTPQsAiZ2l4i3iZN16mdzmD9r54basy3rZuBYCwf2AwiAMsABQ6CG
 GXBi6rCiDW55y+rS/g5HvnGpX+F2YvmXCmvtdZu2b0yz8G8Zm88UCR0S1bm88/VijRrt
 FzGA==
X-Gm-Message-State: AKaTC03wACAiHczKNW4Z1O87BA2NxwG5EE22cwRRz2V7m8TdAFshFyT4eNrpwYPGwfkrucspiPSnGFCgg6KG/A==
X-Received: by 10.157.36.36 with SMTP id p33mr8485523ota.8.1479713166487; Sun,
 20 Nov 2016 23:26:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:46 -0800 (PST)
In-Reply-To: <1479478938-13267-22-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-22-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:46 +1030
X-Google-Sender-Auth: uFQd30K0oUmPBhVRf8RPMJe1Qcg
Message-ID: <CACPK8XdWc0+xr-PieEpbBpset6ss2BU5fObqL3TnoTT8tCsu5w@mail.gmail.com>
Subject: Re: [PATCH qemu 21/38] aspeed/smc: adjust the size of the register
 region
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:08 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The SPI controller of the AST2400 SoC does not support DMAs and
> segment registers, hence it has less registers. So we can adjust the
> size of the memory region holding the registers depending on the
> controller type. We can also remove the guest_error logging which is
> useless as the range of the region is strict enough.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c         | 23 ++++++++---------------
>  include/hw/ssi/aspeed_smc.h |  1 +
>  2 files changed, 9 insertions(+), 15 deletions(-)
