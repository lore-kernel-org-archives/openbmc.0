Return-Path: <roblip@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0gVF3gC6zDqZ2
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jan 2017 11:34:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GMIEa4/k"; 
 dkim-atps=neutral
Received: by mail-lf0-x243.google.com with SMTP id h65so7281174lfi.3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 16:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TX04Y4/oMupqEc1MPLAh41Tv0D1p95lbWxIqDHUBTDA=;
 b=GMIEa4/k176FOX+i1JfL+HN49DITyRZgAQuPlcJAk/pQ9olEJm2WU3lERZZAyAXhZ6
 SjF9C2PkyBXEf3qrhE8sYE12mISYduRa0/ptptcFeKcS5UtscEm35Ajj5kMtDnpZPxcO
 N4acz02pTPJ4pJvtBFMNFBrxHKsp4h5rT4pYV4zE7VV7Ptp8QiMbdgpOmjdQ7oGWn+ig
 4abi0vgi4WAqPqNHhEyBvFyCha/XG+5g6GPIiTaP13A6HC/qCT5+EV+vAMdIr1wWilBK
 ayHmL+ouuhByEsvDVPVrq9oHChd7RVl9EH9N6I6jHBDmHn23862x3MaoeAWnPawz+Kaj
 wNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TX04Y4/oMupqEc1MPLAh41Tv0D1p95lbWxIqDHUBTDA=;
 b=BG3FFW+mEG8i8CzJHC5hhaexSS5QbeuApLpfWTl2ph3IOuhH5x9qLM/ZEhubsydrZ5
 uFvseKX0UGUQ2XtMe7tlxIp9jZclKKCT5T2pGljX1ygV4bFkNkcErLnnvBLwHuku7kx/
 rP1Akj5JI1FvBnSPA5FHCXpsrYBLpc8i39MZ9AlWQW06mvIsNvXWHEK3Z4H+qosGkuWa
 28cctNcLYWmpqtQfZMwy5m+3Biy3/JxjxZzpWi2Mz4fRWbraOWITpzQGeum3YRz1W5fk
 5S5Nehu9s1gqmVIavDc0Wv8H6/1g31uBvNiJISuHRoaq0bZXMXSMOMPVmdNKkzjHxAEl
 6whA==
X-Gm-Message-State: AIkVDXKrupqJSMkkpAAiguhe4B0qBOeAZyUICVwrUm3XZVbYtOZkPcxvRL6/htEnFDowbHR2KOBSIytNq1jttQ==
X-Received: by 10.25.28.145 with SMTP id c139mr7282055lfc.167.1484354050433;
 Fri, 13 Jan 2017 16:34:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.177.141 with HTTP; Fri, 13 Jan 2017 16:34:09 -0800 (PST)
In-Reply-To: <CAN+5HW0+CGrw5VSvGqk7hjYEznUxtUecpL3hQCjL=KqtHPXZrw@mail.gmail.com>
References: <20170110225555.117814-1-rlippert@google.com>
 <b3b47fb6-3d73-c7a4-064f-d5ccbbd27b1a@kaod.org>
 <CAN+5HW0+CGrw5VSvGqk7hjYEznUxtUecpL3hQCjL=KqtHPXZrw@mail.gmail.com>
From: Rob Lippert <roblip@gmail.com>
Date: Fri, 13 Jan 2017 16:34:09 -0800
Message-ID: <CAN+5HW0CsdRDbHJzNFjg3HXMvm+X_jBjeO=+Ws_qY77L46Wsng@mail.gmail.com>
Subject: Re: [PATCH linux v2 0/3] ASPEED SPI driver support for dual IO mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Sat, 14 Jan 2017 00:34:15 -0000

On Fri, Jan 13, 2017 at 4:03 PM, Rob Lippert <roblip@gmail.com> wrote:
> On Fri, Jan 13, 2017 at 5:44 AM, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> Hello Robert,
>>
>> On 01/10/2017 11:55 PM, Robert Lippert wrote:
>>>
>>> Adds support for dual IO SPI mode.  This speeds up SPI accesses, droppi=
ng
>>> time to dump an entire 64MB Macronix chip from ~12s to ~6s using:
>>>       dd if=3D/dev/mtdblock0 bs=3D64MB count=3D1 of=3D/dev/null
>>>
>>> The dual IO bit mode should not depend on any board-specific properties
>>> as it uses the same IO lines as single bit mode.  Only issue could be
>>> if a board used a one-way level tranlator or mux on the MOSI line
>>> but that seems unlikely to me.
>>>
>>> Tested on Zaius board with AST2500 chip, not tested on AST2400 but I
>>> expect it to work since registers are identical.
>>>
>>> Note dropped TODO about quad mode since ASPEED SPI controller does
>>> not support quad mode.
>>>
>>> Changes in v2:
>>> - Cleanups suggested by Cedric.
>>
>> could you please give a quick try to this kernel :
>>
>>         https://github.com/legoater/linux/commits/openbmc-4.7
>>
>> This is an openbmc 4.7 kernel with a backport of the mainline smc
>> driver, dma support, fastread support and your dual io support.
>>
>> I have tested it on a palmetto and an ast2500 evb but I don't have
>> the HW you use.
>
> Tested it after fixing a compilation error for
> s/CONTROL_SPI_IO/CONTROL_IO/ and it works on Zaius board.
>
> But it seems to be a bit slower, about half as fast as I saw before.
> I think it is due to your branch missing this commit from the openbmc
> tree:

Scratch that, speed is the same between the openbmc tree and upstream
tree after retesting.  I was just misremembering the timing...

-Rob

>
> 423ac0dc0117f411244c38b7a351664a4c30c19a mtd: spi-nor: aspeed: rework
> io routines
