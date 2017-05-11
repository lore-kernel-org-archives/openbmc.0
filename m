Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNsPM4GdMzDqLS
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 22:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lmf7BoBn"; 
 dkim-atps=neutral
Received: by mail-yw0-x229.google.com with SMTP id b68so11384267ywe.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=W9kCs7Oc5opXTu95Jg18iBTXU64E1TlzGUGgbKeO61s=;
 b=lmf7BoBniNbA00N/6vsQLS2QeaakiUTAcML58xEudUFbkYcuw6fztfk9Jsfwb+xBWU
 /pARHzLJjWwE4NbHeeyu6MgPmQIz9L3R/GvLJS5TO7ra3hSbFmV7KZEOsNpK5SX4Om3C
 JaoLqqY/m587ZTRwxoR1IGdYLv6VqbUqDeHoqJSJQdnRay9ncmW7frKOfuWgOLARZaxa
 9FJpJqiIrMy7tUjbHgx13ypYKP75T/OYcYw7JDM+vt5YkupmmcQBAdVEGaRXhmwH6CrZ
 UxIO4EJnKjZaoFG9J5WNY7QojZgHszSIDBr/iFo+308Hhr9c7z/XCqdxunBznJ1S/qk5
 2qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=W9kCs7Oc5opXTu95Jg18iBTXU64E1TlzGUGgbKeO61s=;
 b=JQgfMCw76ZJhvjebXM2ZrA93+ZUWxXYqmCzX7dXnN6KEbrrgorsbiF9NqpTMdnFW9j
 nB6e0BIPxm6M63Ik9rNaiOCSfikK9rS/gbCTfCr7oEdfSCrbUAUNOfsIr7pReB+CfLZh
 LG2qDlUE0h17cqOpHM7TBEv9aTxno8aCWWKRvbX4wwUweFXBw23VSR43Mur7z7sMz0xm
 pfIaW/fZv6+1q7EfyMzZ530ir3PjVFy41ikKunudgPjOXOBjlIcGE6KSqXXHUaksQhye
 usEs2CVdPn4rwBxVNEf5+9D/jTkDVvvjyGatvT1wlo6EZvwTNjnqx7tPGSmn6/11EWEV
 7FXg==
X-Gm-Message-State: AODbwcBth5+px1d2ualnCwidl9FPQ1Gekmp6gb4Xdcm+LgdMMogdkTs5
 uRQ00/wAIkhmpJyRnkfV6Iyyyezuvg==
X-Received: by 10.129.76.19 with SMTP id z19mr9350003ywa.43.1494504612279;
 Thu, 11 May 2017 05:10:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 11 May 2017 05:09:51 -0700 (PDT)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 May 2017 21:39:51 +0930
X-Google-Sender-Auth: 7oqALX7TF6yAy3b58r6NWo58Gr8
Message-ID: <CACPK8Xethn=jHirhPvn9kEzzDpaQ5y_U_Dv-ijBErYG7g=oNLQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/7] OpenFSI Updates for dev-4.10 kernel
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 11 May 2017 12:10:16 -0000

On Wed, May 10, 2017 at 7:08 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> These changes bring the 4.10 kernel FSI device driver up to date
> with the 4.7 kernel version.
>
> * Add basic and hub interrupt support
> * Bug fixes introduced during 4.7 to 4.10 migration
> * FSI protocol modification for added operational stability
>
> Christopher Bostic (5):
>   drivers/fsi: Add slave interrupt polling
>   drivers/fsi: Scan for hub sourced IRQ's
>   drivers/fsi: Set IRQ masks along hub path
>   drivers/fsi: Add Client IRQ Enable / Disable

As discussed we will hold off on these until the stability issues are resolved.

>   drivers/fsi: Unscan on master unregister
>   drivers/fsi: GPIO stability changes for Cronus/Hostboot
>   drivers/fsi: Fix one and two byte bus reads/writes

These three have been applied.

Cheers,

Joel
