Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb0Z4hkWzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:53:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBds8Ruc"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 203so3926545ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=eRPqzwLbiQKU3WuUPjCVhiNmL/z12IGo/gFHWjdPEGM=;
 b=UBds8RucAukc7muTPN5fP4kUp6TmoYxdvUnDnkj7T2kNBoMM+6HzcGg5UhbLm5d2iP
 dbcoe3nINPToHLlyKYEGoGx1VZ73vS7W0X1P+ZYGOeo6J8kg1AZk5scW/f2UcL+zNOQ0
 UzcsRxgYHImE04uHkcbhii5x1qKuu9pyFc11QfbXgxA60umbWaEWGcnKhX6fRdoSdjrd
 njMANK54mOQJjDcW++lJEN1G6GeN4jl5Z3M1dloKAdVSHYX/j93k43NaZ5BpajMOhK7c
 CVMUQVkNnyXYlnzXNXm7GjJl1r5/Rz2xN05I2LBE/6G95LiGZD9bOUcOU1HFLbOHwx06
 zFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=eRPqzwLbiQKU3WuUPjCVhiNmL/z12IGo/gFHWjdPEGM=;
 b=h/vfB6yRW3/EmyRWdIhvYZMbidcGsRLhJRozBWCri9oRVgnkPh0grgNCMq12u6kxe9
 x98BcRwIudt9ET3K7tzd7oMSAa1VE8IYIi6ifdUcF4bZKzLynZcjA33pXFDLcnI9YCbG
 zq+d19GCQ3tA+8GoA31SxlP+fngeFgJNC5STc69UsIHHSYKpIi8azMk4fkoHhGHx7WO8
 LnU3H5bsg3hO8l6NMSD6JlrgfVFdKU3O4qv8gQxszNbGHuzKKye02p7biUrHKZ5H4Hmj
 ZzUX3QgqQFPhIbrd0mQrVTXNRCsRbdHQD21Ht6f6CN2+oXDlPcUY+kK2kz4B7M85uoFR
 MjMw==
X-Gm-Message-State: AN3rC/6gEKE/Hol0fzDILv7+JDudeLS0IlMgCTvssBuY708VLjtKoyJz
 9irTdeHZYyC08hQXSJZH9whWklRP4w==
X-Received: by 10.129.76.21 with SMTP id z21mr7276669ywa.43.1493340811940;
 Thu, 27 Apr 2017 17:53:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:53:11 -0700 (PDT)
In-Reply-To: <CAPH-5w747NM1a+0RvEniXyDo5RQmCV-b7ckCGbuoWuw18Y84eg@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-8-andrew@aj.id.au>
 <493f7f06-99c7-e391-6258-d315bd87d950@kaod.org>
 <CAPH-5w747NM1a+0RvEniXyDo5RQmCV-b7ckCGbuoWuw18Y84eg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:23:11 +0930
X-Google-Sender-Auth: B7PDM2qTfabHT4zerjCtNVhhHuk
Message-ID: <CACPK8Xczp4c815_0e9E6d0MgWLs6hWtqat826irZ+t9e8fb=dA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 07/10] aspeed: zaius: Remove manual CS
 decoding window configuration
To: Xo Wang <xow@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 00:53:35 -0000

On Fri, Apr 28, 2017 at 2:50 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Apr 26, 2017 at 11:57 PM, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>> On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
>>> This is now handled by the SMC driver.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Applied to dev-4.10. Thanks for the reviews.

Cheers,

Joel

>>
>> Thanks,
>>
>> C.
>>
>>> ---
>>>  arch/arm/mach-aspeed/aspeed.c | 6 ------
>>>  1 file changed, 6 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspee=
d.c
>>> index e879e9e1aa42..ded756b4fae5 100644
>>> --- a/arch/arm/mach-aspeed/aspeed.c
>>> +++ b/arch/arm/mach-aspeed/aspeed.c
>>> @@ -136,12 +136,6 @@ static void __init do_zaius_setup(void)
>>>       reg =3D readl(AST_IO(AST_BASE_GPIO | 0x00));
>>>       writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
>>>
>>> -     /* Set SPI1 CE1 decoding window to 0x34000000 */
>>> -     writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
>>> -
>>> -     /* Set SPI1 CE0 decoding window to 0x30000000 */
>>> -     writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>>> -
>>>       /* Disable default behavior of UART1 being held in reset by LPCRS=
T#.
>>>        * By releasing UART1 from being controlled by LPC reset, it beco=
mes
>>>        * immediately available regardless of the host being up.
>>>
>>
>
> Reviewed-by: Xo Wang <xow@google.com>
