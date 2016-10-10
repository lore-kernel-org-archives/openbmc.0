Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st4p265FjzDrbq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 03:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PeCgxjoP; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id z65so75451476itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vvmLq4VN1c9KvP3ndeRduUHwMXnfUY6IKWnUccSrubc=;
 b=PeCgxjoPD6wzwyVDh6lp9QbxDPbnn157sqMriHl+igieZpmvt1gRd4w26jPzCHpE4S
 yzJX9k4j7TwC/+gKSGoIdJirzPxKNzM+gKMwPZ2sz6woH2+hmsM4MQgG03888Fp25heM
 cceX9w4DHleIFJ8yJxbh3IKyP0Z+vLsobiAtEtLrK1sH+T2vQ61tBCw5ZABgZa99aj+G
 AtPEOVW2Ne/+GeSdEVpu9nAOIvgd4rIjsskh1wiVVAg+7IuG3QfFfCNyN2C2+vJF7sdW
 6ACoRSyl9PbYfLUc2/sSzEyBYpfTEfR7/NISZFTWv3vn3iCKDg0MRSDWGQz5V9y7Rscf
 il4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vvmLq4VN1c9KvP3ndeRduUHwMXnfUY6IKWnUccSrubc=;
 b=FXSS8u9SvcgcGYq24KwKL7BqenItqJihrqvQAHzpDCg34a9SXY4KiBxAT0Vr1vCqaS
 VLQt8/ZbHa5AH7GKvZQVoKQESjwxt42olz46iIIG0M7MZz/uasLr98P1dsOsR02kDovF
 X0rTEImBSERiS51PSG8oZnhLU2lcusQq/bINEGuTDUguq/ANT2UJoDAqxkpEimxGg7dB
 LWbxq4eNDnPMswCrdd9zxU2ix2D932UH2QP7xKkBGWaWJekWU/F6cM1Nl8C5PExbn+n5
 g7RuQ3MFX7EuQkK0uavmM2EUQQwhzNSrAPTZmDgnc5qwO+CzJ0kHbd7MFxIx52yBun/R
 Ksag==
X-Gm-Message-State: AA6/9Rmnc0dw0BVND/taH4NqQSyjvr/3boz3IrxJxWh0TWBy+AVv+cQO2+2qcyZ2atJo5HnYKfIYJR5Zz63p6A==
X-Received: by 10.36.2.1 with SMTP id 1mr5649355itu.47.1476115784750; Mon, 10
 Oct 2016 09:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.148.194 with HTTP; Mon, 10 Oct 2016 09:09:43 -0700 (PDT)
In-Reply-To: <20160930131252.GD7390@heinlein.lan>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Oct 2016 11:09:43 -0500
Message-ID: <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Oct 2016 16:09:48 -0000

I noticed our gerrit trigger job to verify userid's was broken again
this morning.  Looks like the trouble plugin (Git Client Plugin) was
upgraded again to the latest version.  Anyone out there know why/who
did it?  I'm going to put us back to 1.19.7 per my earlier comments.

There's no fix per-se for this, jenkins is always a bit hit or miss
with it's latest LTS version working with the latest plugins.  Best
thing we can do is when we schedule our next jenkins LTS upgrade, to
try all the latest plugins again.

Andrew

On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
>> Okay. Do we plan to test the individual projects as part of an
>> openbmc/openbmc build in the future?
>>
>
> Yes.  https://github.com/openbmc/openbmc/issues/382
>
> --
> Patrick Williams
