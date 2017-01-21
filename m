Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v5CfG2FZ0zDqX2
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 20:56:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ke6Hi+LO"; 
 dkim-atps=neutral
Received: by mail-qt0-x233.google.com with SMTP id k15so66958005qtg.3
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 01:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nG3W6PfyKjuh3RFOOx8+1o6Ltqv2A6QTS8WpxlQ6uBs=;
 b=ke6Hi+LOQmdHyljsK/7sMFb0ji5x/vQ+FFUzgPFdxVfYXWbd5zGfBrmqGOnqIrRNxO
 o+NVfC6ZtUU0TrgWO2Na0dCKfAFIsuuJw4WCANDgaaZ1RTWDnbBJWEc+vZdJzOsq6F3t
 8tZ7D3fKmebLKO7D/jb/SaqUn3WrE2WQ/NAL/NbkGRIHc4zRBw32JpTWbEuSH7usapqs
 vFERGXTkgS9Xe3Xi7AHdMKSAq8YuiJHLz9LyxHK9T5xACMQ7vYrAs/TuFTSc+m7zH/Nu
 eXsN2FI1S28YPnXKvbiBcXHXJq67IiE6MnurHZIDRwKbqIi1I0brHxK3MG5I6w/OfH8G
 nSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nG3W6PfyKjuh3RFOOx8+1o6Ltqv2A6QTS8WpxlQ6uBs=;
 b=W1HO8yymQ8zu5FcIQjSypCPqL+UMb73FnYn1nME+mEeLN0thUfbMc1frT89inapQ3S
 noPUfgCDpyhVzG0c3DfkMPbGxXqxPBS5BH3uP3TX4xIC6ddu9+5eD9PfOp6F6BrJntJ1
 52dVfOob6uZgzXd+LIkHW14HIA1grlnWtNtEG8VulwY7n/guVGrnMNYy0jT7G+Q3ZlUy
 37sHPfRF/mZ13s8fKnuyLW4IUZqkbBOtKACckFAFYLEuycqumNPgaAoiVyb50jz4UGt6
 LFQDMrma76ge0EXx0DPixD23XMBrFh+i6SMMRIHqHIPgqn3ZBeInk6r3lDmSFLTSbPuW
 x0Hg==
X-Gm-Message-State: AIkVDXKQhpHzf8Bu6BXFItLy4obhiTJWhOWtKpjxJsPzK1LeqWo6nbXK7L1V3ojEDnnYcnF7UXq2YdSkYk1pcQ==
X-Received: by 10.200.1.2 with SMTP id e2mr14993884qtg.142.1484992611156; Sat,
 21 Jan 2017 01:56:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Sat, 21 Jan 2017 01:56:50 -0800 (PST)
In-Reply-To: <20170120190801.GB5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
 <38683dc2-7d4f-11eb-589c-c87784253610@linux.vnet.ibm.com>
 <CAARXrt=ZcCdUC73c27aY28ZgLo8Fsu7GH49RWc-wySK4AcXnkw@mail.gmail.com>
 <20170120190801.GB5120@heinlein.lan>
From: Mine <mine260309@gmail.com>
Date: Sat, 21 Jan 2017 17:56:50 +0800
Message-ID: <CAARXrt==uCfsr_yH=Wfqsj7TocXkW5rrqCbXHHTJhMUsVeaVcA@mail.gmail.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Patrick Williams <patrick@stwcx.xyz>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
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
X-List-Received-Date: Sat, 21 Jan 2017 09:56:55 -0000

On Sat, Jan 21, 2017 at 3:08 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Thu, Jan 19, 2017 at 03:37:34PM +0800, Mine wrote:
>> Currently the time_mode/owner has 8 combinations, some of them are not valid.
>> Could you help to verify what's the expected behavior in each combinations?
>>
>> Mode      | Owner | Set BMC Time  | Set Host Time
>> ------------- | --------- | ----------------------- |
>> -------------------------------------
>> NTP        | BMC   | Not allowed      | Not allowed
>> NTP        | HOST | Invalid case     | Invalid case
>> NTP        | SPLIT | Not allowed      | OK, and just save offset
>> NTP        | BOTH | Not allowed     | OK, and set time to BMC
>> MANUAL | BMC   | OK                  | Not allowed
>> MANUAL | HOST | Not allowed      | OK, and set time to BMC
>> MANUAL | SPLIT | OK                  | OK, and just save offset
>> MANUAL | BOTH | OK                  | OK, and set time to BMC
>
> Why is 'Set BMC Time' not allowed in any NTP mode in your table?  There
> is no reason to stop 'Set BMC Time' except in the NTP/HOST case.

The current implementation uses this logic. (time-manager.cpp:300)
Actually the above table is the summary of the current implementation's logic.

>
>> If my understanding is correct, then we can see:
>> * NTP/HOST is invalid case, such case shall not exist, the current
>> implementation
>>   either hacks settingsd to change the mode to MANUAL, or just behaves
>> like MANUAL;
>
> When the 'host' owns the clock, 'ntp' vs 'manual' is irrelevant.

OK

>
>> * NTP/BOTH has the same behavior as MANULA/HOST, they can be merged.
>
> No, these are significantly different.  NTP/BOTH means that we run the
> NTP client on the BMC but allow either side to set the time.
> MANUAL/HOST means we do not run the NTP client and the BMC is prohibited
> from setting the time in any way.

Yup, with or without NTP means BMC will run or disable NTP client.
But the "same behavior" I mean here is to refer that if set BMC/HOST
time is allowed
or not, the current logic:
NTP/BOTH: setting BMC time is not allowed (you mentioned above that this shall
be allowed, but the current implementation does not allow it); setting
HOST time is allowed.
MANUAL/HOST: setting BMC time is not allowed, setting HOST time is allowed.
They are the same.

But if your suggestion that in NTP/BOTH setting BMC is allowed, then
the behavior will be
different.

>
>> That's why I propose to combine the settings to:
>> * NTP-BMC
>> * NTP-SPLIT
>> * NTP-BOTH (or MANUAL-HOST)
>> * MANUAL-BMC
>> * MANUAL-SPLIT
>> * MANUAL-BOTH
>>
>> Then we don't have to "hack" or "disagree" with settingsd, and the
>> logic could be
>> a little simpler.
>
> 1. NTP vs Manual controls if the NTP-client is running.
> 2. Owner controls who is allowed to set the time.

Sure. Let's keep the current mode and time separately.
But please confirm the behavior of setting BCM/HOST time in each
combination (the table)

>
> --
> Patrick Williams
