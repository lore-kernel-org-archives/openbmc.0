Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQT4F5B7DzDqyb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 10:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gxRMfLL/; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id u190so8651712pfb.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 16:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiFIaThf9LhCdbFBgCMRoviY9rWXXMKkdYO8BbHgDps=;
 b=gxRMfLL/Ylmmf0wUJeUVcZ4bszkuZzeb6cn05rJzdtH6qnoMJXULe1ZfyNxRgfSN8D
 DGs7OoDWO1wlKD8DNHT3YHkWAgMtzlzicFUGdcuUgsfktTaQewOJHvTBZM7bedbQeMFV
 +02iZqCvNKv0cQH1+TDu1HrOqNJthvJ0xsCRZr/i28Apfq5zed2wMl9BaUPX3IgPbvhi
 F585UnE+YUCvTk2f31UnAWOF+RXu2ijokjqNBfgazE77SP5RlwROCQ5euHbCNUN6aeQ7
 N9t9Y0lPQvlBquEIaCdGB80yZRODo2lSFdesKP2vZlg2aY3RMlkmozL05fSM8ArInpqk
 BSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eiFIaThf9LhCdbFBgCMRoviY9rWXXMKkdYO8BbHgDps=;
 b=ItWsnPUky6MWBNI3bJTEUYjVa75VNprcIxK6WATTCssfL06VcvL+lC3UhNK4/MMlMr
 bBsAx6GrcpKsmMoIcq7xBAAwqT0Wouie6ol5mJN1d8POwttDTCIfP/DX+cZwRIreTVB3
 2GuUSUL94lv6eOYyXWkeB7P+BNeBNw4iZyk9dmjrlWzKJ5nggVmBAvaJstBuVYYBUoaj
 mQM6FLj+OyI1VANuq4nm1YDMFiL5cZgIz7Dr/t8THK1MAZtM01BKrDG7y+oHaYsNNoKB
 JOWYqeTOKyHp6qU5vIdPLNYcsjQ7xs3PoJb7hHR72J5BMv7pobhb4IryCkt1shS+kA+Q
 I+dg==
X-Gm-Message-State: AD7BkJLiF05L0f6xAF1THYORha58hReVRXfeNIRMJw4qScf2KQ/ifunjcRzSpBJNJX8HPg==
X-Received: by 10.98.75.10 with SMTP id y10mr10342656pfa.32.1458172779420;
 Wed, 16 Mar 2016 16:59:39 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t87sm8251741pfa.54.2016.03.16.16.59.37
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 16 Mar 2016 16:59:38 -0700 (PDT)
Date: Thu, 17 Mar 2016 10:59:31 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2 0/5] Only call aspeednic_init when preparing
 to use network
Message-ID: <20160317105931.1c1d0f18@camb691>
In-Reply-To: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2016 23:59:42 -0000

On Tue, 15 Mar 2016 18:00:56 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> The aspeednic driver was calling init from its initialization function and
> calling halt later.  This left the DMA engine running and writing to
> memory when Ethernet traffic arrived when control was handed off
> to the operating system.
> 
> Remove this call to init and rely on the framework to call
> write_hwaddr with the assigned MAC address.
> 
> In addition upstream discourages setting the random address in
> drivers.  Later upstream created a config for this behavior and I
> back-ported that patch.
> 
> In my testing, the random mac address is about 90% 1 value after a
> u-boot reset command but after a kernel reboot it does not repeat.
> 
> The code uses rand with timer as the seed source; the network stack
> then uses the mac as the seed for random delays.  We may prefer
> to only configure u-boot setting a random mac only after a better
> source of entropy, letting the kernel use its sources to set it when
> we do not net-boot.
> 
> milton
> 

Hi Milton,

Looks good, I agree with your thoughts for patch 5/5. The way you have is
safest so happy with that.

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

for the series.

> <!-- Reviewable:start -->
> ---
> 
> v2: update README and README.ethaddr with backported CONFIG var name.
> 
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/u-boot/4)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/u-boot/pull/4
> 
> Joe Hershberger (1):
>   net: Implement random ethaddr fallback in eth.c
> 
> Milton D. Miller II (4):
>   net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
>   net: aspeednic: Do not start hardware in initialize
>   net: aspeednic: Remove extra spaces before assignments
>   net: aspeednic: Do not fill in a random MAC address
> 
>  README                  |  3 ++-
>  doc/README.enetaddr     |  2 ++
>  drivers/net/aspeednic.c | 31 ++++++++++++++-----------------
>  net/eth.c               | 13 ++++++++++++-
>  4 files changed, 30 insertions(+), 19 deletions(-)
> 
