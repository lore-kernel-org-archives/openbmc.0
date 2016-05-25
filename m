Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x244.google.com (mail-qg0-x244.google.com
 [IPv6:2607:f8b0:400d:c04::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDzPT1pqpzDqHF
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 14:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eucj5dFN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=cnji1UER; 
 dkim-atps=neutral
Received: by mail-qg0-x244.google.com with SMTP id 90so2928455qgz.0
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S2KptFM4+kQSrOJOJmz280HJz007eV9UKQkTaKNf0qg=;
 b=eucj5dFN5O7YIQuAMn4xHzc4xzICPUzb45byiNbeY4QTHYzjMRG0C4aiCb4Dm2kNxi
 PXtO8XEPeou6NzUGIVzTYvCHqXSyw1oEAgBiw2IRaLYatpNbqCM8OKsx4ngSsgF1P6Do
 DVMuoa5OIE+TEkCOOJgArTSjEri3ribCaCBvTsLZgmqiNelq39NffhCmK3Fh3SKZQn94
 +vxv7OxxzOHb2Ctmw2SBDz4KADuqgfvaV/osWwdGNxvKhDz4f3jUhRAQMC9vOy499iMy
 y9QY4fmEV/IHWc+FXzz7kNcrbBj0CUV0a6BVDNyp8De4Xu6yHiDH6rDt4ryQz4SX1TNf
 6S/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S2KptFM4+kQSrOJOJmz280HJz007eV9UKQkTaKNf0qg=;
 b=cnji1UERdRpGRtFzVVpCCwCv9AzsY7zbg9mjwz+KNCK4xjxdLDQyu6UTbnj6t4ZxMV
 KPQ5Ha1uc5kLECxcZtejFK6FM7xrvn+tvjGsM9ACRX0zx8RoHEXiUAGvToYoG3ieiFnh
 QFtHeAss7vqElh/LgMvePU+CGbwfeLLpMrNHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S2KptFM4+kQSrOJOJmz280HJz007eV9UKQkTaKNf0qg=;
 b=ku3k0InjkTFIoEfOd3vSL81dlGM4++OqK9c8/Jslq/GyphXA4tmLCWgdUT518cEOYa
 FhR7v0LHqIXYE64TswoSX+e2GFVMOcH7ZeaYyPaKOeEDiICZulOw75403zT6jCWNZwXO
 VXLN6DicWpZ8t6kCWYrYoDuX//w54M4rEYN27abTIb/0GaMG89aXSUQ/fM5taTczmuqL
 rGr226rE120cirYg2Di1hux18/k9Y12kGLYF7m1rQCWQvGrRz97KmZO+eQHy0H7UEUfL
 jKtYugyNg6RzuqzVKb9reTjdYLEEBgNTuuHDPJjC3b58O6YxX+9AhnyeloFodgcPQ9CI
 bu5g==
X-Gm-Message-State: ALyK8tI6zYbVRm1jOWFCq8nNy1MlQpye+WHlACRoF4D6Ie2ekZeu6ohfmGRKnU6sWy6VC8pD1gnSQ0y/Xx9enw==
X-Received: by 10.140.181.70 with SMTP id c67mr1686475qha.20.1464149515000;
 Tue, 24 May 2016 21:11:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Tue, 24 May 2016 21:11:35 -0700 (PDT)
In-Reply-To: <20160524200842.GO19968@asimov.austin.ibm.com>
References: <1463495441-27767-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463495441-27767-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xc7_+mV=W9-ZRZSO=uQ6y_Ys6VN4Dk82f7hjm37PdibaA@mail.gmail.com>
 <20160524200842.GO19968@asimov.austin.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 May 2016 13:41:35 +0930
X-Google-Sender-Auth: wgbijv20qQF1OXmILX5GSzgTAAY
Message-ID: <CACPK8Xd_uvrMtMqP8L5wSWHBckv_gqCz2uUsysy9x__Y9cbLTw@mail.gmail.com>
Subject: Re: [PATCH openbmc v2] Re-enable out of tree device trees
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 25 May 2016 04:11:58 -0000

On Wed, May 25, 2016 at 5:38 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Thu, May 19, 2016 at 11:26:01AM +0930, Joel Stanley wrote:
>> Hi Brad,
>>
>> On Wed, May 18, 2016 at 12:00 AM, OpenBMC Patches
>> <openbmc-patches@stwcx.xyz> wrote:
>> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> >
>> > This snippet was mistakenly removed with 8ef9fee.
>>
>> It was intentionally removed.
>>
>> > Note that this isn't a matter of policy, it simply enables
>> > the option to do it.  The in-tree device tree is still the default.
>> >
>> > This enables things like workbook or schematic generated device
>> > trees.  It also addresses the inevitable fact that the upstream kernel
>> > will probably not want device trees for every board in the world.
>>
>> As we do development the device tree is strongly coupled to the
>> kernel. I think we want to keep the dts in the kernel tree, so that
>> changes are made together.
>>
>> Secondly, when testing kernels the developer may or may not be using
>> the poky environment. This means that the developer writing and
>> supporting your kernel is not testing the same code that is running on
>> the board.
>>
>> We can add every device trees to our kernel tree. As the upstream
>> maintainer of the aspeed port, I will also send them all upstream.
>
> I can think of almost a dozen openpower boxes, plus the IBM branded FSP
> boxes.  That is before we even start to support x86 and ARM servers.  Do
> you really think we are going to want to submit every single device tree
> for every single openbmc supported box upstream?  That sounds really
> cumbersome for both us and the Linux community.

Yes, I do think this is what we want to do.

By adding it to the kernel tree we ensure we stay in sync with what
the code expects. It also allows a level of review and quality
control.

> Yocto already has a mechanism for creating device trees from snippets.
> As we start to use the MRW data from the system engineers, I would like to
> see us generate many aspects of the device tree from those directly.
