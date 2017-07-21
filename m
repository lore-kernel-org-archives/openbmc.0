Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDJtH57CfzDqsx
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 15:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VLYYpfLB"; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id v193so20608584ywg.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 22:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=G7BtKyqKJGkCzflL4jx9bTsV/RxActocczmTUpDiPZ4=;
 b=VLYYpfLBo9kACNFykExCiirJzEFKIFR9cTS6Zs6i9ANT9q56I5ZKJjKf3qZtPv21tV
 S/xTj7VBy2ateReSninBSE3SMl33MBiyWKyOCf+y1QEMXUZy/K2Jv2NTVWLKbJdVgQYr
 0SesHDqIvJcymeUkoresNAUIMMBpQS8CnFI8pT1DvMUcj5yr6TPCozyZYcrw05J+g2uN
 q3TJnvz/hPyyTKzYUb/LLURmCId7436TMVamEFh/cpUDe9xSFOzEi5Q+fNLWNpQiJRxy
 tZRV3/gVdPnpF4N0Pqnudu3mtHu/gf0EL6KUVvEc2NdEcQ8POyxnuEyZKot6srohMMcA
 J7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=G7BtKyqKJGkCzflL4jx9bTsV/RxActocczmTUpDiPZ4=;
 b=Hu8EI2qEnE3LYElmmzr9deiNv622j23LRR6FT0A7omFRXLgrt67pJXCTawX7zkOFjn
 aYXX9LBFNyB4835Pm++3zoNqqCWqWn2W7wJrZ67SK5NPr2NjVWqxVp2iDJAtGM4FL6Wr
 UoYndrnkyORzEGRVgwBz/ZWamqCOt9l1FzitYGI5anLREf1QTTXJMoxw16AXtZPwkqGQ
 I38vkFWAHFoQa6BQERycGQGE+gnr+bg/rQahk7CRp7KwrdOSsTcRgZ7XRXNH0xcWEvsO
 wjKbZLmCsJR7tQ8BE/P2BCca6SfUoPALkWVr68IFtAYx4ME417dkKrfprLl2SySqlt57
 3/4g==
X-Gm-Message-State: AIVw111MZw67/Oh2UuW/uEEvqAjmvxaYyQGduEqvmVnC8YgxRqjpSkC/
 XD1kffNn1s1AHwFujRYG7EL34HUFPQ==
X-Received: by 10.129.53.140 with SMTP id c134mr5133674ywa.439.1500614245283; 
 Thu, 20 Jul 2017 22:17:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Thu, 20 Jul 2017 22:17:04 -0700 (PDT)
In-Reply-To: <efef70a7-4c02-e459-c21f-9862ae6f0156@linux.vnet.ibm.com>
References: <efef70a7-4c02-e459-c21f-9862ae6f0156@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jul 2017 14:47:04 +0930
X-Google-Sender-Auth: kbPPn5UN908jxcinsx--KLW8N74
Message-ID: <CACPK8XejX5hFeOMkRUDqvPP-V2XWz9PBtG2PO0vEuQO=A0erQQ@mail.gmail.com>
Subject: Re: DPS310 sampling
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 21 Jul 2017 05:17:28 -0000

On Fri, Jul 21, 2017 at 2:22 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> Hi Joel,
>
> Now that phosphor-hwmon-readd tries to read the DPS310 temp, we keep hitting
> EAGAINs from the driver.

Can you elaborate here. What happens when it hits EAGAIN?

> It turns out that the delay call within
> phosphor-hwmon doesn't always wait a full second because it pops out of the
> delay if there is some dbus work to handle.  It would take a nontrivial
> refactoring to fix that properly, and I think even if we did we'd just
> barely be avoiding a race between that being done and the temp being
> available every 1s.
>
> What do you think of changing the rate to be faster than 1 measurement per
> second?  Is that a device tree binding?  In combination with that change and
> phosphor-hwmon doing retries, we should be able to get things to work.

This is not configurable with the current implementation, so changing
the sample rate would require reworking the driver. It's unfortunate
we didn't bring up this requirement before the driver was developed.

There are a set of parameters that need to be set to configure the
device's sampling rate, and the wrong combination results in invalid
readings. It took me a few days to get this right, but it might be
easier now that we have a working driver.

I'd be happy to take a patch to change this.

Cheers,

Joel

> Alternatively I could just add in up to a second of retries from within
> phosphor-hwmon, but that would slow down users that request data from it on
> dbus.
>
