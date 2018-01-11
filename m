Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFVIbpOd"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHJvD1BtWzF0Y7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 19:29:12 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id r39so855399qtr.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gu1t0+acRS19wd5UYBsZCe1iCQeN18m1QSakVo6nCvg=;
 b=kFVIbpOd4HfVAVft6ewjHChz1H2C6ge7kIkdv/BTT8CbIWLzj02U/NN9paxNWILtRF
 wCd9clZ6ctViEhITMMV5Ezceqve+QRH8r7IDBtnjggLM3M5ui5HdI99ipUA3pHYprue2
 9FWDp0/iM3wlL00EqXfiiUM+4+RwGbIL1sWL3NT4DTLBh5HBjCwVEaFYxnkhE+Hxxfuv
 FldvnCVxnEbctBgw4Tx1YGQV4HZTuSElA0Z4t6H6ct95MtMOXOm0w5u9ow0ofV4Yt8LL
 Lei5nvzPe6F3ASXwzCqPGvQzkwTugj9jaK1RsI2UsJjeSwoED1uj9ybwn5cFjG2wQKSV
 yvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gu1t0+acRS19wd5UYBsZCe1iCQeN18m1QSakVo6nCvg=;
 b=of2zkSofnYLV01Uufc4INu4C8WVs6MxQlCPnoE1Srh7QZtSP7KcaG32ttKJx3VuKnw
 Co2c8T7j7h+bCiipwcnZ7zjymlCrUe8wo8bWTI+RZq0fIqII0RrYP7HLSGZY8ICZfOow
 g5IfLK2xdeLmvLZtniZ0A7vhH9/mBlxJbouljh2ldPbKwbXF38cnc2CGin3Dam+KaFz8
 Mhf5p6K29VPNT3Y8gq7h6VidOrj7w6y+/Q9toHFSAYdgCWoa78Z/Sj6RrXBr9ly6fxhZ
 V/9BmAxn1B2s5gWhaB0u7/x389BePThBHGDxOeLMD4Cp4TP+WBtRieJWaRb4d3iw+6V/
 bS4w==
X-Gm-Message-State: AKwxytehtCOeEEOkhBsXeEoCjC3GkPanVGtLPhTNSGU2ReNsctiu/krx
 6XzGAaXY4E6SqTnoV8/wfVJL7iHmYiOZVptdtqE=
X-Google-Smtp-Source: ACJfBosFTdIDBOhXNfvstzm7gjUzpvoTNf9qto2iQoOlB7T3E4qkv0TZpwlEFWrmHXCIJbZgI0zyfbMhEkO0KSoDl3o=
X-Received: by 10.237.43.229 with SMTP id e92mr32741520qtd.178.1515659349213; 
 Thu, 11 Jan 2018 00:29:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 11 Jan 2018 00:28:48 -0800 (PST)
In-Reply-To: <20180111073038.GA3600@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jan 2018 00:28:48 -0800
X-Google-Sender-Auth: QacoDSvAINX7d9p270QmCHn03HQ
Message-ID: <CACPK8Xe9Jti8S2px=QOcSMA2v+TZ4eGDGQND4qmBUBXeBpsBZQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 11 Jan 2018 08:29:12 -0000

On Wed, Jan 10, 2018 at 11:30 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jan 10, 2018 at 01:46:34PM -0800, Jae Hyun Yoo wrote:
>> Thanks for your pointing it out and I totally agree with you. Actually, we
>> are preparing 4.13 update for now and an another update will be followed up.
>> As I answered above, I'll rebase this patch set onto the latest kernel.org
>> mainline. Sorry for my misunderstanding of upstream process.
>
> 4.13?  Why that kernel?  It too is obsolete and insecure and
> unsupported.

It contains support for our hardware that I have integrated from work
in progress patches and upstream commits.

The OpenBMC project, with myself as the kernel maintainer, have
intentions to regularly move to upstream releases. This takes time and
effort. This time and effort is balanced with submitting our drivers
upstream.

> What keeps you all from just always tracking the latest tree from Linus?

Linus' tree does not contain all of the drivers required to boot
systems. Many of them are still under review on lkml, and others still
require rewrite from the vendor tree.

> What is in your tree that is not upstream that requires you to have a
> kernel tree at all?

We have PECI, video compression, crypto, USB CDC, DRM (graphics),
serial GPIO, LPC mailbox for the ASPEED SoC.

Another silicon vendor has recently joined the project and that brings
an entire SoC that is not upstream. We have patches on the ARM that
are under review for this SoC, with more drivers undergoing cleanup in
order to submit them to the relevant maintainers.

>
> And if you do have out-of-tree code, why not use a process that makes it
> trivial to update the base kernel version so that you can keep up to
> date very easily?  (hint, just using 'git' is not a good way to do
> this...)

We have a process that we've been developing under for the past few
years. I find git to be a great tool for managing Linux kernel trees.

What would you recommend for managing kernel trees?

Cheers,

Joel
