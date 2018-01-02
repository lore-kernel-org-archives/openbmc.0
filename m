Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::233; helo=mail-lf0-x233.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CuOyS2lV"; 
 dkim-atps=neutral
Received: from mail-lf0-x233.google.com (mail-lf0-x233.google.com
 [IPv6:2a00:1450:4010:c07::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z9rl52LHhzDqws
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jan 2018 22:03:12 +1100 (AEDT)
Received: by mail-lf0-x233.google.com with SMTP id e27so20479399lfb.9
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jan 2018 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VkHG/aTFeQOTrWcWXvO1PLKzven8bHKinUyzrbfHUxY=;
 b=CuOyS2lVOBqLU+2NSTGBS19UTk7AI87h9zDlBdiqpNDDGzWF3JtgAkZWMkmU9NlFwL
 0FCWV1DV5alkez3mw8B5TxldwqGWzXLl5ae3CE67zmFXvQCJZGp7zIE5/ftGO12QsBdP
 IbIStUHYxJSluk1riRefzhYIrocBU4eAvJVNAHrntygurxep3rn974czYoVAjFAPEGv1
 8tVBzVQdECgfHONwr0u8K4OlD40X+h/Jb4ylOHyAWeJE2/O8iED2IkSQZ6E60O0JGyQh
 mF08H/Es6emvO6DSJscuVdE3P/sBuHNwVGiIQtMX0KZRlEcAXighZDvYmgu0IHd/ttbT
 c8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VkHG/aTFeQOTrWcWXvO1PLKzven8bHKinUyzrbfHUxY=;
 b=A6D+LiZd9eNM6mUikSh1bqwDcbQS+/6SkFG6hDItH11BgQIZ5btlzMFxmAmKsFed4W
 /KVPcvmfaXozglkZnPbJgIQU55DQrm0brKOqJ6RoMuUOfOE3IIdEo1dUw/Otlqw1Wxeb
 lUs3YK54DXTJzAjNroJrk5mYd5rVCi4286dfG62GBnPGyNJ47J/qtMRNIMUEWXmR4lK0
 iZxZoQSRXAKhjoTtNhj8uLUkOaT0HUjOtzWVWlFFY63xpuy0/sAS2tBs2TTwRtwYzQ1w
 yi6DPMvRE61qtc9QM7148fEEcNxuuf12ZeacJps0PCmWyZvWP2cI5fF9sDobMYWAOWBQ
 3oPA==
X-Gm-Message-State: AKGB3mL1U6xh+irRV1e/kHiHzJT6RM5PCmenzPiokRuSafcodPrqWwV1
 pfVKTxeLurW0cmEndAnG9EeymKtzdyPCS374yQs=
X-Google-Smtp-Source: ACJfBosPVvmEECGDyozu2KzyT6UQmwD+XLTuIQSDB2XFrI9f5udhF3w92tO3sNZ/V2A0OfvJrOS9XuMvbPY2SR7FmaE=
X-Received: by 10.46.101.74 with SMTP id z71mr26528644ljb.35.1514890988630;
 Tue, 02 Jan 2018 03:03:08 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.142 with HTTP; Tue, 2 Jan 2018 03:02:48 -0800 (PST)
In-Reply-To: <000501d37dec$d18b5680$74a20380$@linux.intel.com>
References: <000501d37dec$d18b5680$74a20380$@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jan 2018 21:32:48 +1030
X-Google-Sender-Auth: Hwx_8jPOmTBmXyOpxBZ3sQzFad0
Message-ID: <CACPK8Xeru=RsvGuJCVOfEaWVfCe9+t4MP+qZjcKSiqtEWW_bNQ@mail.gmail.com>
Subject: Re: Kernel oops error
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jan 2018 11:03:14 -0000

Hello Yong,

On Tue, Dec 26, 2017 at 12:26 PM, Yong Li <yong.b.li@linux.intel.com> wrote:
> Sometimes I received the below error message when reboot the ast2500(With
> the latest kernel version). Does anyone have the similar issue? How to
> narrow down such problem?

I haven't seen this one before. Do you have any other information
about what was happening at the time of the crash? Is it reproducible?

Are you applying any extra patches in your yocto tree to this kernel?

Cheers,

Joel

>
>
>
> [  472.770000] Unable to handle kernel NULL pointer dereference at virtual
> address 00000000
>
> [  472.770000] pgd = 80004000
>
> [  472.770000] [00000000] *pgd=00000000
>
> [  472.770000] Internal error: Oops: 80000007 [#1] ARM
>
> [  472.770000] CPU: 0 PID: 946 Comm: klogd Not tainted
> 4.10.17-7422acad49264653b7895c252806a8074e1029c7 #2
>
> [  472.770000] Hardware name: ASpeed SoC
>
> [  472.770000] task: 9d1cb000 task.stack: 9d40a000
>
> [  472.770000] PC is at 0x0
>
> [  472.770000] LR is at __wake_up_common+0x60/0x9c
>
> [  472.770000] pc : [<00000000>]    lr : [<80040e0c>]    psr: 20000093
>
> [  472.770000] sp : 9d40bd00  ip : 9d0bfff4  fp : 9d40bd34
>
> [  472.770000] r10: 00000001  r9 : 00000000  r8 : 00000000
>
> [  472.770000] r7 : 9d4ab8e0  r6 : 00000000  r5 : 00000000  r4 : fffffff4
>
> [  472.770000] r3 : 00000000  r2 : 00000000  r1 : 00000001  r0 : 9d0bfff4
>
> [  472.770000] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment
> user
>
> [  472.770000] Control: 00c5387d  Table: 9cb28008  DAC: 00000055
>
> [  472.770000] Process klogd (pid: 946, stack limit = 0x9d40a188)
>
> [  472.770000] Stack: (0x9d40bd00 to 0x9d40c000)
>
> [  472.770000] bd00: 800e01d8 00000000 9d40bd2c 20000013 9d1a8900 00000001
> 9d1a8990 9d40bd68
>
> [  472.770000] bd20: 9d1a8990 00000008 9d40bd54 9d40bd38 800410b8 80040db8
> 00000000 9d40bd48
>
> [  472.770000] bd40: 800410b8 9d1a86c0 9d40bd64 9d40bd58 80337934 80041094
> 9d40bd94 9d40bd68
>
> [  472.770000] bd60: 803d0394 80337904 00000000 00000000 9e37a2e0 9e37a300
> 9e3ab048 9e41e570
>
> [  472.770000] bd80: 00000000 9e37a300 9d40bdac 9d40bd98 803d0438 803d01d0
> 9e37a2e0 9e37a300
>
> [  472.770000] bda0: 9d40bdc4 9d40bdb0 80335388 803d0418 9c9facc0 9e37a300
> 9d40bdd4 9d40bdc8
>
> [  472.770000] bdc0: 80335418 80335368 9d40be14 9d40bdd8 800e810c 80335408
> 00000000 00000000
>
> [  472.770000] bde0: 9e4bb980 9c9facc8 9d12d040 9d1cb2e0 9d1cb000 00000000
> 80659e80 9c9faa40
>
> [  472.770000] be00: 9d12d074 00010600 9d40be24 9d40be18 800e82a4 800e8084
> 9d40be4c 9d40be28
>
> [  472.770000] be20: 80031f2c 800e8298 9d1cb000 00000000 ffffe000 9d12d040
> 00000000 9d12d074
>
> [  472.770000] be40: 9d40be6c 9d40be50 8001b398 80031ebc 0000000f 00000000
> 9d40beac 0000000f
>
> [  472.770000] be60: 9d40be84 9d40be70 8001ba9c 8001b124 00000000 4b24ca30
> 9d40bec4 9d40be88
>
> [  472.770000] be80: 800254f0 8001ba5c 9d40bec8 9d1f4ac0 9ca2f540 9d40a000
> 9d40a000 9d40bfb0
>
> [  472.770000] bea0: 4b24ca30 9d40bec8 00000000 4b24ca34 9d40a000 00000000
> 9d40bf8c 9d40bec8
>
> [  472.770000] bec0: 8000ccf0 800252e8 9d40bef4 9d40bed8 80024954 80024870
> 9d40a000 0000000f
>
> [  472.770000] bee0: 00000000 fffffffa 000003b2 00000000 00000000 00000000
> 00000000 00000000
>
> [  472.770000] bf00: 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
>
> [  472.770000] bf20: 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
>
> [  472.770000] bf40: 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 80025a30
>
> [  472.770000] bf60: 00000000 9d40a000 8000a6e4 9d40bfb0 000000af 8000a6e4
> 9d40a000 00000000
>
> [  472.770000] bf80: 9d40bfac 9d40bf90 8000d1d4 8000cc28 00000000 7ed07b90
> 000aed68 000000af
>
> [  472.770000] bfa0: 00000000 9d40bfb0 8000a58c 8000d134 00000000 7ed07b90
> 00000000 00000008
>
> [  472.770000] bfc0: 00000000 7ed07b90 000aed68 000000af 0000000a 00000000
> 000b0d70 0000000f
>
> [  472.770000] bfe0: 00000020 7ed07b90 ffffffff 4b24ca34 00000010 00000002
> 00000000 00000000
>
> [  472.770000] [<80040e0c>] (__wake_up_common) from [<800410b8>]
> (__wake_up+0x30/0x3c)
>
> [  472.770000] [<800410b8>] (__wake_up) from [<80337934>]
> (sock_def_wakeup+0x3c/0x40)
>
> [  472.770000] [<80337934>] (sock_def_wakeup) from [<803d0394>]
> (unix_release_sock+0x1d0/0x248) // 0x803378f8+0x1d0=0x80337AC8
>
> [  472.770000] [<803d0394>] (unix_release_sock) from [<803d0438>]
> (unix_release+0x2c/0x3c)
>
> [  472.770000] [<803d0438>] (unix_release) from [<80335388>]
> (sock_release+0x2c/0xa0)
>
> [  472.770000] [<80335388>] (sock_release) from [<80335418>]
> (sock_close+0x1c/0x24)
>
> [  472.770000] [<80335418>] (sock_close) from [<800e810c>]
> (__fput+0x94/0x1c4)
>
> [  472.770000] [<800e810c>] (__fput) from [<800e82a4>] (____fput+0x18/0x1c)
>
> [  472.770000] [<800e82a4>] (____fput) from [<80031f2c>]
> (task_work_run+0x7c/0xa0)
>
> [  472.770000] [<80031f2c>] (task_work_run) from [<8001b398>]
> (do_exit+0x280/0x8e8)
>
> [  472.770000] [<8001b398>] (do_exit) from [<8001ba9c>]
> (do_group_exit+0x4c/0xb4)
>
> [  472.770000] [<8001ba9c>] (do_group_exit) from [<800254f0>]
> (get_signal+0x214/0x580)
>
> [  472.770000] [<800254f0>] (get_signal) from [<8000ccf0>]
> (do_signal+0xd4/0x3dc)
>
> [  472.770000] [<8000ccf0>] (do_signal) from [<8000d1d4>]
> (do_work_pending+0xac/0xbc)
>
> [  472.770000] [<8000d1d4>] (do_work_pending) from [<8000a58c>]
> (slow_work_pending+0xc/0x20)
>
> [  472.770000] Code: bad PC value
>
>
>
> Thanks,
>
> Yong
>
>
