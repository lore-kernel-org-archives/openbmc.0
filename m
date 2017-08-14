Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW71Y5DgPzDr1B
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tEsxuCNH"; 
 dkim-atps=neutral
Received: by mail-lf0-x244.google.com with SMTP id o85so6075674lff.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NogBFEwDFh7Nxj141hw/+3/JD6S+yI+CkGO1jdQJTbw=;
 b=tEsxuCNHae0ZGy7sSiXcO12A5M7kurJui8kI4/e2db2Zv1YM/MeyB/s27rKS/SL9qM
 Kvn9DyBjmXxfC20oqSbhOLqlrlZByCUDlEdaa4dDaLSp1svQ+ofKH7Mi/nR9KWnjxI31
 q15+Br4cPEziGlb4pU9eeXx+rA08iAHzMA8AmZQWNUk7ZfF1vdiu1LY0i+Sqmv0sfSJR
 oa6O1+GKBnAbQ0bBSuU9rGqK55drNtkagjKtTuVazI/Ah1OTzsOJ+QS0J3hMF+12kQGj
 z5MWQFsyW4/+DV7MC65L7dR72Ze0zBKrpbHmPzOuOw8YndnSLi7u3bp2l9PFR7YQlDBR
 hmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NogBFEwDFh7Nxj141hw/+3/JD6S+yI+CkGO1jdQJTbw=;
 b=c4OQddtYFa/rdi/izsReIsMwqbLB/ntuI/80/vep4BGH8GyrO6MR1iRdUCbTt18B0N
 rNyEoKMKesvKwLDaM63EnWy9qqhFD3O0ChbNcUFFNjnUIEZXNnTc3R0M+ggGg2Xhqy5A
 DGwMX3L5H06jXxEqPdO1nFIiyiUy+MOWQZk3PWxQc3ZMbnmDJ0K4W+w6AOnMLIIwyCfF
 lzxfgG9/k6vKvEgYpZtsFZW8AxWU9/zNG8yzt6oBYnH3EHBZBbLCud5gnGkg8m+OKpq8
 sOhR7XPTYyGfin52wUQFHCFD21tHVwlxP4vjEvtPW4KNBh++kXRUZQ9ZaSggFV/tlsp5
 f60g==
X-Gm-Message-State: AHYfb5gvOjTB885e1r/W4VSRPzQjK+lU0frCupzJDCkHtY639a85dzdH
 o3w0PWKsj0+9MOxJxhadhVoBgt11Iw==
X-Received: by 10.25.168.3 with SMTP id r3mr8358848lfe.111.1502696702693; Mon,
 14 Aug 2017 00:45:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Mon, 14 Aug 2017 00:44:42 -0700 (PDT)
In-Reply-To: <CAK_vbW02752Bz4bCe2FKk_6A+=B6Pp6qBBMfDrQei2xph5U0eg@mail.gmail.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CAK_vbW02752Bz4bCe2FKk_6A+=B6Pp6qBBMfDrQei2xph5U0eg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 17:14:42 +0930
X-Google-Sender-Auth: 81Q06USZq-BLa6_DnJZC2rJXZGg
Message-ID: <CACPK8XeQ2sxiSV6sbRhxhCoqo640b4fYGVsO4UOdNhON59dr2Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5 0/4] hwmon: (pmbus): Add IBM Common Form
 Factor (CFF) power supply driver
To: Brandon Wyman <bjwyman@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 07:45:06 -0000

On Sat, Aug 12, 2017 at 11:43 PM, Brandon Wyman <bjwyman@gmail.com> wrote:
> On Fri, Aug 11, 2017 at 12:56 PM, Eddie James
> <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This series adds a hwmon pmbus driver for a POWER System power supply. The
>> core monitoring functionality is provided by pmbus.
>>
>> These devices should be auto-probed on the I2C bus, so I added them to the
>> witherspoon device tree.
>>
>> Changes since v4:
>>  * Rename the driver again...
>>  * Change compatible property; we can't have any '-' in the compatible
>>    property because pmbus will use that string for hwmon registration name,
>>    which disallows that character.
>>  * Remove debugfs bool from pmbus_driver_info
>>  * Add comment about returning rc when reading STATUS_MFR_SPECIFIC fails.
>>

> Tested-by: Brandon Wyman <bjwyman@gmail.com>

Thanks for the testing Brandon.

I've applied this series to dev-4.10, along with Andrew's reviewed-by tags.

Cheers,

Joel
