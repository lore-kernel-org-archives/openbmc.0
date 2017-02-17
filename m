Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPb9p2rmnzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:32:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="szzbH2DC"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id v73so2415748ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wU7gr7PQ8s7W3w26qQhJ1xuPhweJG0DHSbIqBqThuI4=;
 b=szzbH2DCWPSP6UQ6nd44x5MvFUto57MH3IaEr9rUOaLpi/8P4yE3a4ZfeEqYiKeMf3
 XBhaHYUNArtjTyc1enOu40MTb5ba4NzRGHBNOx9CieYcMnRdhIM2HYHfGOmpDWt3fiSu
 Ii5AEV9eqNe3nE3QuNMn7DIV9AG5B0BAbHH3iJhLpSsWLivQ2DJq8U6EOC4OhC9c7W4v
 b32Lh5sBjeDXXepzGJKkUtPPwuqTrntoL5rvrZQMggZvZYcSKFrsxHPJoI1A2LdphFkb
 wdRU1oSoaBfqEAf+HGFZorSOja3F8R3kxEJL7BrpU8rsKnWEjj2z+zUa9urFz2oWtqup
 3nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wU7gr7PQ8s7W3w26qQhJ1xuPhweJG0DHSbIqBqThuI4=;
 b=lMubvTW6EThNnQkh0RWnSXghwE+0GS7kNBXFLaSRDiWBoRaM1y0vr/W0yuozqI7+si
 gJTk0qJfoNyxW2vNQjODzdaiGux63+lMkmvuXO4WEErll+CfQO6ylULUgu3MGFzgDZ64
 iIMvGFQQqfBqx6zryTxT6E3NObF5WT15S+8YjWxs027DaesEKnQWVSdHZI3kqVJVIm0c
 OxyE3UBalN+k6Tulv2LZ4vg8cKbP3EVE6g6IXcOmwu6KkYj5+dq0QxuiqMyoyJXynYEH
 6HRJonoFSYminms7LhFQeLryZimmjs70mI/6D0CHL1eKIDiVJjG7w0JzMU1pybtdK3a0
 JW3A==
X-Gm-Message-State: AMke39lx30t+njPLQfIXJOUf5t6A5Dddef70sDmhHw0t8jCs2TKX5a2Wn9T+iP/ehqjou5YnxXQPU1Z7nQx4zQ==
X-Received: by 10.13.202.195 with SMTP id m186mr3777805ywd.11.1487295148084;
 Thu, 16 Feb 2017 17:32:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 17:32:07 -0800 (PST)
In-Reply-To: <CACPK8Xfp5_qF3D64rcJz3X2pLx9TPrM_YREmS-dsUmPUrt2JpQ@mail.gmail.com>
References: <20170203193800.90838-1-cbostic@linux.vnet.ibm.com>
 <CACPK8Xfp5_qF3D64rcJz3X2pLx9TPrM_YREmS-dsUmPUrt2JpQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 12:02:07 +1030
X-Google-Sender-Auth: y5mLrH4nXywNUPv54qBHelZW-fc
Message-ID: <CACPK8Xc-KZ6H1vH+rzkoB_-6rEVgRKYT7jVh+26_718ROEXSLA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Clock slave prior to master
 command
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Edward James <eajames@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 01:32:31 -0000

On Thu, Feb 9, 2017 at 4:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Feb 4, 2017 at 6:08 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> If the FSI bus has been idle for some period it is necessary to
>> wake up the slave so its ready for a new master initiated
>> commands. This is done by clocking out a series of 0's on the
>> SDA line immediately before any command.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> In my testing I did not need this patch even after a long idle period.
>
> This patch did help when I tried to read or write to an invalid FSI
> address. I suspect we want to fix the root cause of those invalid
> read/writes - perhaps by catching them before they turn into
> transactions on the bus, or only doing the reset when the bus got into
> a bad state.
>
> Doing it on every read/write seems excessive and will slow down access
> to the bus.

I spoke with Chris about my concerns. He agreed that this was not the
correct fix, and is only a temporary fix while he develops proper
address checking and bus recovery.

In his words from https://github.com/openbmc/openbmc/issues/1122:

> Right now the FSI driver must clock a number of times, 32 presently, just
> before a command is issued. This prevents situations where the slave fails
> to respond to transactions after the bus has been idle for some time.
>
> Its expected that once bus error handling and clean up is in place that this
> extra clocking will no longer be required but that has not yet been proven.
> The issue tracks the need to remove this extra clocking once error handling is in place.

So we will apply this now in order to get the FSI kernel driver
working. Except to see the code removed in the coming weeks.

Cheers,

Joel
