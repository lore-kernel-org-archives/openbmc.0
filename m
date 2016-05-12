Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r54095xKfzDqBs
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:11:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jc7Knt/U; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=XuQTfw+R; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id t140so7839545oie.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zhlEdPG5mxQ/GILRjd2sHT6821qlaSCgDBDerrXPvec=;
 b=jc7Knt/UGYWrmP1eXDL0BdxSWqmmSFceshgmdRZPoF+kdxhL/hoCVxtLvixYyzQC9U
 3l0mQUZtCcca4aC0lQKZwh93y76LW8FCnaz/agzocSAs4PxxjLqO5VhPXL11qZJRlUMK
 93Bdn4YQAm1iQj7orJLhNS7fA3lEqLoOctyVwJRJKoSvWnQhR5Ru8SFF/pMEFAwWXLBW
 6M+NUNdiQ9Cn13h7v0Fy06aoqqsjAzjNMHOPkgf3IvNdKYbCVFFmBs/2AyEd4NoEtiK6
 NHP5LrPVrdXkOAufANtVYNwk9xAgnx2Sft9/OiAu70I33Eu2bPCHFJa5WEjqllxi4ken
 exmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zhlEdPG5mxQ/GILRjd2sHT6821qlaSCgDBDerrXPvec=;
 b=XuQTfw+RduJlpaBy8IeEK/tzKqtZSNh+Q0P7mADM3nOD/wcYhKOOWbhtY+oxC8oTGf
 NvboF3ooMz9s6LUuUtG2m1mFOEJwOEd022xKjaz6/LbbVlA6+j1+F8YXOKECP5jjYAz1
 qn5vkP3piQvZFsycPJz+rl0CTIwjrtKE6gUsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zhlEdPG5mxQ/GILRjd2sHT6821qlaSCgDBDerrXPvec=;
 b=MFVcv83zr2a9l2+kpFHubS9w2Ss7uDYfpfXcuoMbJl9NdNjquUIimbch94j8U0VmKn
 qlVdB7alBGH3bnzZiu0I7Tn6f4KDO7EDJ5YQhGHdT/kBHrms7RIjKSaYfUd92bvK6f+U
 99rfbqgMeZj3oT5vwLvsi5DWOt3mXnCCGXUA4Rm1LZKIsLoIXoCi5PiICEybRA/jSQQw
 VPmE8UBDwLHWlrp0AsRf/8jJKOVfRXT6hncps7GzB1bR+TDhQzH+k9kb3Cjws1Dhh4op
 YCdbFa06AAh7zw0UIhEwCGjCqjwCbvZcHsjAXuDW4GQk6Iw86965yI+4Sf59jWw/I2H5
 9lMg==
X-Gm-Message-State: AOPr4FU+EZLgY3IZFTMF/xzkYkBpauetK34XDTbyuq8kiS18ykL8XVE557rcO3QeW+VrMJYjIqVhufg+6bdz7Q==
X-Received: by 10.157.41.202 with SMTP id g10mr4834977otd.122.1463037062611;
 Thu, 12 May 2016 00:11:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Thu, 12 May 2016 00:10:43 -0700 (PDT)
In-Reply-To: <CACPK8XdBaCC5npZ8UvfxEaeLuDL72n3p98-sx_XnpwbaRqYuHQ@mail.gmail.com>
References: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XdBaCC5npZ8UvfxEaeLuDL72n3p98-sx_XnpwbaRqYuHQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2016 16:40:43 +0930
X-Google-Sender-Auth: bm0AAAt9BwCgbiZzhPHbdzG4UCQ
Message-ID: <CACPK8Xfwb3TJeUHWZYY6LRHUK+eyjPfo5B2Hq=jcJ4p2UUFd2A@mail.gmail.com>
Subject: Re: [PATCH linux] Add debounce for power button, pull down gpioQ7 to
 unlock identify LED
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, ken.th.liu@foxconn.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 12 May 2016 07:11:06 -0000

ping

On Mon, May 2, 2016 at 11:12 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Apr 29, 2016 at 3:10 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
>> From: Ken <ken.sk.lai@mail.foxconn.com>
>>
>
> We need to include a description of why this change is being made.
> What does it fix? Why does the previous behaviour need to be modified?
>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>  mode change 100644 => 100755 arch/arm/mach-aspeed/aspeed.c
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> old mode 100644
>> new mode 100755
>> index 594a781..fa5d467
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -138,9 +138,10 @@ static void __init do_barreleye_setup(void)
>>         /* GPIO setup */
>>         writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
>>         writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
>> -
>> +       writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));
>
> We have a GPIO driver that handles setting this register.
>
>>         /* SCU setup */
>>         writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));
>> +       writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
>
> Can you explain each of these you're setting each of these bits?
>
>>         /*
>>          * Do read/modify/write on power gpio to prevent resetting power on
>> @@ -150,7 +151,10 @@ static void __init do_barreleye_setup(void)
>>         reg |= 0xCFC8F7FD;
>>         writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
>>         writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
>> -       writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
>> +       writel(0x0031FF2F, AST_IO(AST_BASE_GPIO | 0x80));
>> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
>> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
>> +       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
>
> As above; we have a GPIO driver that handles setting this register.
> Changing these states needs to be done from userspace. See
> https://github.com/openbmc/skeleton/blob/master/bin/Barreleye.py#L531
