Return-Path: <xow@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDNxL04YxzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 03:20:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GN5wtDla"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id y63so33345469qkd.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GUImW0PYEBguK+THi42OxuzZDZbdarXXM8vvGSad2yA=;
 b=GN5wtDla3zphtzeVOxse6E8b1zFSJKvyn2hQb2bZkufgwPfnGyeWNYnTuSKCeBnVRj
 qMmjDUjQLRGGfUA4wDDsZ1Vrh6j3kz2NupcZt5jYAUPKZ5CgYfVBRMPDwVaNrQ/7CMjN
 TDu+XW23LstziCHSJNkHW2t9GTLwnmElcTkXKWZudW1fujgmTWBabMnt5sApCLu6IPRw
 CCrZfEbh0LCIoqQaYSOXn/yUIVNpq6XVd1GrcSJ7H+JzP8/NjfuQUcmhB6jQCtlStab1
 nZLd1TEWPomgEgtsNNf1kHdtOrUpbndpb4kLTwZJ2orbbwhYN16kF5jnAW3yyDqYCpCm
 ZjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GUImW0PYEBguK+THi42OxuzZDZbdarXXM8vvGSad2yA=;
 b=N8rihUsjfYkzafjUv6tpU2sSOmDdZxaBw46Kn53G0oRTTc8QRwpB8iF+ywmWRaH6cK
 5QawVX1/ZSFM6Iz4id2NlvKriodI9FVOTQ09SAENEpcX222z4bPMpO9cIuEozWZHbCYZ
 xluoJYMFGY/D1+l0uxmiAEVIlJMUKJtQl1zDI3zVntthEI7oTWY7ODdnG8puzSeKN8nk
 /1wwuct1GuEjsB21a7Y/nr8Je+JQh6aI+gXCwVSOb5JhX+grcxN3O+1fdZsilv9QjLuA
 vn3XTXyu8oZpY89baVAgc5iEhXjGjwk8EavWOQZ57G7MUNvfYsLFNsnl/CEysXqxiMyk
 EuiQ==
X-Gm-Message-State: AN3rC/6xBA2JHW7ULYZpdGdDoaqwVlMgxHZwciWq3Oonjx4cWgFEWVk1
 jJGBEwHU+UZaMfEyL608HkzD8uBemrqp
X-Received: by 10.55.89.66 with SMTP id n63mr5820625qkb.254.1493313603398;
 Thu, 27 Apr 2017 10:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Thu, 27 Apr 2017 10:20:02 -0700 (PDT)
In-Reply-To: <493f7f06-99c7-e391-6258-d315bd87d950@kaod.org>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-8-andrew@aj.id.au>
 <493f7f06-99c7-e391-6258-d315bd87d950@kaod.org>
From: Xo Wang <xow@google.com>
Date: Thu, 27 Apr 2017 10:20:02 -0700
Message-ID: <CAPH-5w747NM1a+0RvEniXyDo5RQmCV-b7ckCGbuoWuw18Y84eg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 07/10] aspeed: zaius: Remove manual CS
 decoding window configuration
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 17:20:06 -0000

On Wed, Apr 26, 2017 at 11:57 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
>> This is now handled by the SMC driver.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed=
.c
>> index e879e9e1aa42..ded756b4fae5 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -136,12 +136,6 @@ static void __init do_zaius_setup(void)
>>       reg =3D readl(AST_IO(AST_BASE_GPIO | 0x00));
>>       writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
>>
>> -     /* Set SPI1 CE1 decoding window to 0x34000000 */
>> -     writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
>> -
>> -     /* Set SPI1 CE0 decoding window to 0x30000000 */
>> -     writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>> -
>>       /* Disable default behavior of UART1 being held in reset by LPCRST=
#.
>>        * By releasing UART1 from being controlled by LPC reset, it becom=
es
>>        * immediately available regardless of the host being up.
>>
>

Reviewed-by: Xo Wang <xow@google.com>
