Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFMvZ4yY8zDqBX
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 03:36:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nGNgIMGK"; 
 dkim-atps=neutral
Received: by mail-io0-x243.google.com with SMTP id 101so2741906iom.0
 for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2017 08:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fYe57rgOC4HZM3TcItgm2q3ujeqVRei89pBF2Q6j6X0=;
 b=nGNgIMGKCnmm9VxpxO3HU/GYt4oqRnpzzYF2S/HQmsCAAPRo/qWtcflKFnJfIOm16W
 LCQ4k/w3eBcJmEaulMZLHRv+qDR8523nwH6bZWYclHRSQwlXe4oiHjmDoyCNKpu8IxTm
 1rk1pZS3x1etf8FBTb2Vdxb5kc6xPOOjhItj1GYnv1qJCYx2kI11JbJedO5s970rFJ5n
 v5pbLQ/tNu3irGmzyBJwHOtYkvsAFchPTWZMZAj8dc8xGZow3xvJTgcnErFUTSeMwov9
 B3UHVhsy4bUk/8/j6ARb2vY9WOaqdI9o45J5WaWMtKHZhfc4D+5Yc9ok7c7Ekb9xG8Td
 aAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fYe57rgOC4HZM3TcItgm2q3ujeqVRei89pBF2Q6j6X0=;
 b=QwzxCqIsBybI0EabIy7XHT97QwL3/vgBPuJeZCFiLn0/ycNukNtDBTK/4LNRkoLySP
 VxcabGc4NCqX18bidxGGNa3mGQXxoW4u0o6eRDUwkrwtmkoFYd+HaPNj44TGUBL745pP
 na39C2/G+j/Ps2k4TdkRWn/y5WrakUDtFcUzu5+Li+GHowmERs8Rscl3mHY7NSClRteo
 zKSuLpNuL+lomXEE8LsTynILaH02pfo5n0Q+MwkSAXS8oY8c+tes5nBP+uAReWwXc/Cd
 c70vir+nVzxrH17bh3YnY5IQBAEjtoxrRP0hwrvJPEv7DDPdsHPutANV4MH43t+lyUhD
 1nSg==
X-Gm-Message-State: AIkVDXIz/Ate67M+Q7CA21wftIoT3ro5NX5sPXRdHk6HqhilA11N8nIKv7vHUHp5YhqEce2jaOpHcBMMf3DkwA==
X-Received: by 10.107.128.68 with SMTP id b65mr11170819iod.113.1486139800111; 
 Fri, 03 Feb 2017 08:36:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Fri, 3 Feb 2017 08:36:39 -0800 (PST)
In-Reply-To: <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 3 Feb 2017 10:36:39 -0600
Message-ID: <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
To: Joel Stanley <joel@jms.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 03 Feb 2017 16:36:43 -0000

On Thu, Feb 2, 2017 at 6:51 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Feb 1, 2017 at 5:09 AM, Rick Altherr via openbmc
> <openbmc@lists.ozlabs.org> wrote:
>> openbmc/openbmc commit 1ed6fe335cda50cf60b7afddbe530077a1b25d27 includes
>> the initrd in the kernel image.  Update the flash layout used by OpenBMC
>> dts accordingly.  This is required for OpenBMC's kernel update mechanism
>> to work as the kernel image now exceeds the size of the original kernel
>> partition.
>
> Brad, Patrick: This change will mean new kernels can't boot on old
> flash layouts, and vice versa.
>
> All users will need to do a full-flash update to move to this version,
> and a full flash update to downgrade.
>
> Are we ok to proceed?

Ack, we just went through this with the last update and all hit
https://github.com/openbmc/openbmc/issues/1030.  It was pretty
disruptive for all of us in the lab needing to pull the chips and
manually flash each.  This is would be fine if we can just flash the
<system>.all.tar and all works ok, but that was not what we found in
https://github.com/openbmc/openbmc/issues/1030.

> Cheers,
>
> Joel
>
>>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> index 65095a40a203..4bcfd1bf8dc5 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> @@ -12,13 +12,9 @@
>>                                         label = "u-boot-env";
>>                                 };
>>                                 kernel@80000 {
>> -                                       reg = < 0x80000 0x280000 >;
>> +                                       reg = < 0x80000 0x440000 >;
>>                                         label = "kernel";
>>                                 };
>> -                               initramfs@300000 {
>> -                                       reg = < 0x300000 0x1c0000 >;
>> -                                       label = "initramfs";
>> -                               };
>>                                 rofs@0c0000 {
>>                                         reg = < 0x4c0000 0x1740000 >;
>>                                         label = "rofs";
>> --
>> 2.11.0.483.g087da7b7c-goog
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
