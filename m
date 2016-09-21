Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfRm90nqzzDsTW
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 03:42:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jNuV7dt3; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id a62so4369485oib.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sRUGRPMdaoELr/KwitqVhSwjnk7w6Z8bvYsGagwWjVM=;
 b=jNuV7dt3Trj9k21o8VNByQii0FVhhm9P3f4Mfny1uAF1EnWdLMrUFvkPzBLyGd8/tQ
 goqsF2z0R1QcPpIpCbTJJPzF2vrcaFR5368osqD9/x2o8ViZ0D+ptehIHDLX1SDWFhmN
 To7/fROIavM1u4g7YoPFKa8N5Cfxw6ToXQnWewJVPkeqyZYy9PhrVhZeP57oA6pCXVsz
 QYlEgu5OpJbfR5UubBpuw+/FHb4+EvtczHZ5py36i/w8+vRACwpliLkJ2PgQpUA9MGT9
 Zlra0Fq7/sFT7fVg9eb0rWiJz/2SRuvOey4Yi/1FYsJ8Sm08DiTB+VQ3Z+V2R8v/GZXL
 uYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sRUGRPMdaoELr/KwitqVhSwjnk7w6Z8bvYsGagwWjVM=;
 b=SR98IxJxiacBYgttR+e+r3gca6JBy5/LEDdZU8Roem7NDh0EZrkQHZHjwecwk7wuba
 JAMwl8vU3tYHvXzt4nnaY243Udx1JP2qG0zCkXYUy5+Gz/UwaLFCxL6FXWgd31sk5RsL
 WXJ5zz+v/EZK+EPldYpiIbCd+ojqIlraV1yMggODpMDQIFwRIGaJXxTUxsrfvRhKL0vm
 l28TDhA/cIAhQYwjwDw3bQxfKbjaZDGUMLjYmgQxPnp+1b1iRo2pmK3+7uwqM7ihgSpJ
 Rx+roPIQd9AXOun6h9Be/UM7k3n82t8kpaDrsS9tde834ZzWaWOKl6foJkv9SCl5Htpz
 WOZA==
X-Gm-Message-State: AE9vXwMgJoTgIRhh1Fk8Te2UGG71GDF4VQYHj7eyAz7KaxaU4amI7yRIfurx2mx9jY/ZkrwrLfNsxJx1LvWXXw==
X-Received: by 10.202.79.215 with SMTP id d206mr43547276oib.141.1474479766359; 
 Wed, 21 Sep 2016 10:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 10:42:45 -0700 (PDT)
In-Reply-To: <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 12:42:45 -0500
Message-ID: <CAA0LjjX1F+kjWBfJ8PfYLVfburbDGGn9xBmJQb1qf3vttEYKsQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/7] Introducing the FSI device driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Wed, 21 Sep 2016 17:42:50 -0000

On Fri, Sep 2, 2016 at 12:05 AM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Chris,
>
> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
>> driver. FSI is a high fan out serial bus consisting of a clock and a serial
>> data line capable of running at speeds up to 166 MHz.
>
> Nice work on the cover letter. It's a good introduction.
>
> I haven't had a chance to take a close look a the patches yet. They
> are on top of the stack for Monday.
>
> I was wondering if you have had a look at Jeremy's implementation yet?
> If so, are there any ideas you have incorporated into your series?
>
Joel, apologies for the slow response.  Yes I've had a look at
Jeremy's suggestions and I'm in process of adapting my patch set to
incorporate those changes.  Will reply to his note directly on
specifics.   I've been focusing on getting all the core code ready for
submission and will have something for you by end of week.

> Cheers,
>
> Joel
>
>>
