Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb4q0RbvzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="itbx0eBJ"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id u70so3951631ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KHB4ryjtzyFYt0WxtEDOXqdLpipv6647/nl8hl3egvI=;
 b=itbx0eBJM5GSlX112IYhJNTQNPX0qHkN4TbeCy4c8NeEsZhiPzOPsCbx8NXxgKiT3K
 AAMpLYcjpCY2CHrV3SDjKEHvMICFBSeC933D21hL5yto5jZ2xTLOtxKoDQ2VF23AxAoY
 jzazRrQIiDAa213/K8qalnCoxnn33TF/OhcF8KWLBrxEPYgN1BEE2BxU9y6ZGiYnnacW
 P+yotHZOd6qEa2FuHG9fhVy8WEkm/DZVdcxcQ5orxgrYLYKi9QpsjEXLbTxUps5R8uFP
 E+rITXg2jB6sdJDOCSsCNNIfY6yICgdBpzHXDqhjjIevjXb4BTIlqn4jXoF4GEYqwov5
 G0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KHB4ryjtzyFYt0WxtEDOXqdLpipv6647/nl8hl3egvI=;
 b=dkdt2seCAG5g2EVaSgtliFW/7MHf3VWxyf35TDMDpksgH3p98YVw8LBO8Myh6YRRWW
 mf9jfoYZpXkK57qn3UB76Wx4xH0hiZTXQ6wjoJWIEN2vVjIKmbp0IQZCRyqGq69MzVgs
 HLR9Q7T/yPK+mWK3BPRRaIs3uZI/niBZllR3OFYMhVf51pLbCZVwOYepYaC08Hb8Igi/
 l6yVGwjjiV5YYvFy59ILE29iostGr2Pd9NUXsyVLyw5yGUqP+DDql9+DSDQoB2POW5vx
 1xRZkazPcd0RRqvBoVPYo5NF3bYRm46OI/rnwqOPkTwYcFtVqc+GZZKZxc9h/oPzdxuy
 OqVw==
X-Gm-Message-State: AN3rC/7+thEMYEsxaDvbr8c700lUCYf0TW7qbbDgsy7++U8Meg5j0cjG
 Cn6HLN8ab1TxXkTxIuuCkB2raAOrww==
X-Received: by 10.13.251.4 with SMTP id l4mr6752271ywf.329.1493341032953; Thu,
 27 Apr 2017 17:57:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:56:52 -0700 (PDT)
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:26:52 +0930
X-Google-Sender-Auth: XI11Yhh5qqg62lnCrDR13GW8Wfo
Message-ID: <CACPK8XcDmMEAL96ynSk7=kEDOfxgFohwHuFtcVm55T8eNztp=w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 00/10] Clean up mach-aspeed/aspeed.c
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Lei YU <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 00:57:15 -0000

On Thu, Apr 27, 2017 at 3:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi all,
>
> Here's RFC-ish series for cleaning up the board file given functionality we now
> have in the tree. The intent here is to:
>
> 1. Demonstrate what can be done with some of the driver support we have merged
> 2. Solicit feedback from system owners about the changes
>
> Probably the most overtly breaking change is the patch for power button
> debouncing in Barreleye, which switches to using gpio-keys.
>
> Another likely controversial change is creating two devicetrees for Zaius to
> isolate EVT1 requirements from the general Zaius configuration.
>
> The rest of the changes hopefully shouldn't cause too much grief, but still
> need some inspection.
>
> The series depends on patches not included in it, however Joel is in the
> process of putting together a tree on which the series can be applied. For
> reference, the dependencies include:
>
> GPIO debouncing: https://lists.ozlabs.org/pipermail/openbmc/2017-April/007219.html
> Pinconf support: https://lists.ozlabs.org/pipermail/openbmc/2017-April/007213.html

Thanks! This is some of our Barreleye-era technical debt that is
finally being cleaned up.

I've applied the  LPC-to-AHB and CS decoding window patches to
dev-4.10. The others require a bit more testing, or userspace changes,
so we can revisit those in the coming weeks.

Cheers,

Joel
