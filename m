Return-Path: <peterh@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcfRc0vT2zDq5W
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 12:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mF4XLeCB"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id g6so7134311ioj.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 17:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Sn/GKj3R/dym4SOF8LryjTZ2JVusLF3sds5stOHvZZM=;
 b=mF4XLeCBsfEr1s7MiM4XnlY4HGHhuTckb413UISgoMg57o0Ue44FEmxlXrHdSU/S7Q
 tev/5YR8fOJT0nw+DKCtqfe2UUoXYgPjWFzKNgXpBS7XmvGuo7guY1mKwElKcrX3Yy5V
 2tIiyqRvX4GnZpt/2O2IqUpxM6DM5+k0RMLpGVQgAWan3yB/b0bYovDLcfdzIKRLrvRF
 SUGBEOUVY1zpfIO9Q6e98yhHXVtebsS4pOP3zPTxGyx0X1yOUwg45wicNtsNmH07zBvi
 4fc128aQ7ZbFocw+rep5iokQwr5ldScRB1JzLCilMjKqdqMxLt58v1AD9MGDb+ZH/Beh
 plNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Sn/GKj3R/dym4SOF8LryjTZ2JVusLF3sds5stOHvZZM=;
 b=QQaiiEAoyWEz9jpkIWxkH+V0Qk2kC40VuoAGyU/m0WIAhZbmEhX/YoyVeX8VCtgP9E
 ym7YxUVGWEg1YskQ4o+ghJ7wGf4PljBw/9S4yJG9U2G83hJA0m5P1En2UGHzsj+GAk7G
 4kK9ohLhj1jVFVEtPX4IrRa0ikh0/8SxU5uXr9b/0K5yoEqcIIWV57k4eie8WwaHowEF
 H6A2ddu0q/OKRVazf+UB+c/cr7g8nvbXY7QvBvoaH9h1QsCqXqu+DQI2wMwkC82zUdlt
 Rk+e6n+KuoyLmGdyEJvMFWQNBqDvtpbCUbBYW7OFHL7y+j625FMu/ct1ow0fYpyGmBlt
 x9uw==
X-Gm-Message-State: AMke39l5DaaRbT5K6JKMWRVDfh0guHd9R7rAw5a8fE3lY0qNcagwOMrVt8/d87CiLfR/I06W0kr2B59dw5gnDdUb
X-Received: by 10.107.6.211 with SMTP id f80mr16402131ioi.96.1488850663938;
 Mon, 06 Mar 2017 17:37:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.170.22 with HTTP; Mon, 6 Mar 2017 17:37:43 -0800 (PST)
In-Reply-To: <CACPK8XebaQ6qTQG5mm3nW2bLdwgZjDpg_Kfkt_786k6==m7L9Q@mail.gmail.com>
References: <CAPozSNrAzFnZpP9PgTXUtPvDtF6Ag6dijOqYhMn4f8OQs2OqFg@mail.gmail.com>
 <CACPK8XebaQ6qTQG5mm3nW2bLdwgZjDpg_Kfkt_786k6==m7L9Q@mail.gmail.com>
From: Peter Hanson <peterh@google.com>
Date: Mon, 6 Mar 2017 17:37:43 -0800
Message-ID: <CAPozSNpoJ134FYXwOjrr9TGRFmBnkT3867g2S8v=qQbWHVZkxA@mail.gmail.com>
Subject: Re: Zaius can use a backport of pmbus device support
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 07 Mar 2017 01:37:48 -0000

Yes, I first noticed it in Linus' 4.10 tree, so that should cover it.

Was advised by yuenn to create https://github.com/openbmc/openbmc/issues/1260
but I agree: at this point, it may be just another reason to keep up with head.

On Mon, Mar 6, 2017 at 5:21 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hello Peter,
>
> Welcome to the project!
>
> On Tue, Mar 7, 2017 at 10:55 AM, Peter Hanson <peterh@google.com> wrote:
>> Device support added to 4.9 can be used to support the Zaius power brick.
>>
>> The relevant commit is cc00decf0e280953e9067e938ad331f93bda8b40
>> also available as https://patchwork.kernel.org/patch/9245427/
>>
>> Tested the patch - it works. Suggesting to backport that commit.
>>
>> Of course, pulling ahead to 4.10 would work too...
>
> I've started testing a 4.10 tree. We're looking good on the ast2400,
> and I will do some ast2500 testing over the coming days.
>
> I'd put a tentative ETA on switching of next week. I'll let you decide
> if you want to do the backport now, or if you can wait until we rebase
> on 4.10.
>
> Cheers,
>
> Joel
