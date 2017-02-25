Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVcZR1WJLzDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:52:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1Lxc0Gh"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id x71so5434664qkb.0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 21:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GUDZTIEWb3xFMy56F1U/ulEnr51KIdYE7ex1RrdP5rQ=;
 b=j1Lxc0GhiQ599yDLJ9sjPWnYVWFFh803NlqB70Uwkt6Dra4xto/WhYCzUtDa7OQqSG
 huN4GIa4IJV2WfnMvssx4NUWGp9ysEJt+YjIG3E937eeYyjg0ugy+xOAYKlvKQN/qsgT
 z1wWrwfgGzmA7WxYooWq1baSJ4Q5KN1CXP56OEjIuYKjg4I/EBZe6LxZOQ/5katqTKUR
 HvmhUiNcphs4ESwd/5zrUN4zeVHz20rU0TJ0JVaKHwucdOkf43VTaenucWRpBzJGq54+
 gSYwis2ZGfNzb9ovVqLYLY7OL//juG+77MlplXTEcyBC8Q3wgMLgCz7z4WEtfVDWtyaS
 rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GUDZTIEWb3xFMy56F1U/ulEnr51KIdYE7ex1RrdP5rQ=;
 b=YsyDUxqeu8wliB882wTD9QyJVjbgdm09x/6NCYhVHlqtMyYU5qGKBML8w2kXZaZwug
 NFmE969oav1FX4BObvWpybVRNQLlY1B5kTpp6PyZ7Gsfs1XDwX7q0uY4HcwscF+hnoGF
 +LtTGcIuy/S8RU1qOZl64N9lNEux7qBDs2sJBM5NcJjMFrvQgITmoNsRSvY3e6Vdauxh
 l432kjdHigf0WSW0SQIKqnaPHxuQUzXA0/Zd5V91rsmDdy4f9qw8uIf04pRXVHhVB10M
 zFXZLQnmS3sRKd2f20EJWkH5KF9nXoZ6Adr/2R0F4kHEEubnS+v5nF9+MdLnS4kXuTKh
 xpuw==
X-Gm-Message-State: AMke39nLh8dVq2twuMTqVLVz/EXPBu7kpPzbXe1U++h3fe5KvWH45aqXD1ofILmXedksp+nbqeHz1tn0xTxK7A==
X-Received: by 10.237.60.65 with SMTP id u1mr6185463qte.176.1488001964741;
 Fri, 24 Feb 2017 21:52:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Fri, 24 Feb 2017 21:52:44 -0800 (PST)
In-Reply-To: <CAPH-5w6F_P9z6JgQcTOp3Brqt3jw7T1m5NYZJqUuo4Fz9rZPrQ@mail.gmail.com>
References: <20170221051259.18383-1-joel@jms.id.au>
 <20170221051259.18383-2-joel@jms.id.au>
 <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
 <CAPH-5w6F_P9z6JgQcTOp3Brqt3jw7T1m5NYZJqUuo4Fz9rZPrQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Sat, 25 Feb 2017 13:52:44 +0800
Message-ID: <CAARXrtkYSvdWS_GS82PfMeFchrvQry+eP1FD=+bAM0o8d8cL9w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on all
 P9 machines
To: Xo Wang <xow@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sat, 25 Feb 2017 05:52:48 -0000

Hi Xo,

I got confirmation that Zaius does use 1GiB RAM.
Please ignore my previous comment.

--
BRs,
Lei YU

On Fri, Feb 24, 2017 at 2:36 AM, Xo Wang <xow@google.com> wrote:
> Hi Mine,
>
> On Wed, Feb 22, 2017 at 7:34 PM, Mine <mine260309@gmail.com> wrote:
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> index e1c9b3f4fe44..c3a6a8656b3e 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> @@ -25,9 +25,9 @@
>>>                 #size-cells = <1>;
>>>                 ranges;
>>>
>>> -               flash_memory: region@94000000 {
>>> +               flash_memory: region@bc000000 {
>>>                         no-map;
>>> -                       reg = <0x94000000 0x04000000>; /* 64M */
>>> +                       reg = <0xbc000000 0x04000000>; /* 64M */
>>
>> For Zaius with 512MiB RAM (what I saw in Foxconn), the memory size
>> will be adjusted by Uboot,
>> which is OK.
>> Will this reserved memory be adjusted from 0xbc000000 to 0x9c000000?
>
> We have no plans to use RAM size other than 1 GiB for Zaius BMC. Can
> you please explain what you saw at Foxconn?
>
> thanks
> xo
