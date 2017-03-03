Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZLwz05jwzDq5x
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 18:51:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B/U8qobG"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l16so9195985ywb.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 23:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VrYXt60x869nwPKDXp93Pdmxo4AcMciz8mrwZ2m++FY=;
 b=B/U8qobGA1oxXGBXE2cZMSqyQ9h90F0G2kzkLAgr4QSBezzT1Riq/uUdjHqbO6INPG
 7srjYxnTQLpZMKB1EvQEowx/S94Nd3aNlgEzoP15rAHIMkYFGCf/pRxnRFOGooB6dCNA
 /laAif6NMwEuM/xm8ag01TimX+uukUxfTxMjIFOYEkr1zA6GF8NgqynH/IAfx7TBR6mE
 +9cBcIgyqb1QJoJsgSTLaRfO5Smsn6g9J2+KACsCxN+EDrJc4epJ4F3OFEwQ7v4cqi73
 iKnNTYk/dRzbxk7dRsAZCFbh5Ya+F2MvvGX3hSk+naoBMdBVVevUZGH5mCitQ9njPGlY
 5GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VrYXt60x869nwPKDXp93Pdmxo4AcMciz8mrwZ2m++FY=;
 b=S80iI6jYyb1DmqZDxmZ2F7HElandAmcVxJjTx7cwHuYtIowkoWtsrPLRDO+joGFz6d
 7Wii60j8IrCRcfae1O1ErMoEC8zBtZ2aEBpKvbpvbcyWikDpWfYhxUguXFNKMsAQBZZU
 iUJ3ndyGHvU1o/9S0LbAECxAQBe5OI+NVkf2+vPQIPNHc3lLqaRESa+FGFlrdb2MKzVR
 pLpeH85po/JL8KIKMO4xPDlFqVlScArdmBW8uHi+JRDRdum92cmPGox4TMbctGZqw0CP
 2up6e9evCBWmWubm05H0XLUcCAtC3shaOp1CdfeYWkMQXCDF9ruYkc5Zhtb29vMPLeTZ
 Se3Q==
X-Gm-Message-State: AMke39nCFK4OAkNqPBb/R4FmterhXi9m209UP47uYe5T9gg8BGfmkbrrvXqt+z5xY6BeBsB0emOCJ6BcYv/vAQ==
X-Received: by 10.129.118.82 with SMTP id j18mr781825ywk.10.1488527504115;
 Thu, 02 Mar 2017 23:51:44 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 2 Mar 2017 23:51:23 -0800 (PST)
In-Reply-To: <20170302214625.69263-1-cbostic@linux.vnet.ibm.com>
References: <20170302214625.69263-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Mar 2017 18:21:23 +1030
X-Google-Sender-Auth: Y3eyOC5wRuo_9lPqy99B24ud4q8
Message-ID: <CACPK8Xd1Mgn8r05sJ2Y7qxoVc6Laq-RQJR48+ynRO6nZ+Lm26w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Change hub sysfs name
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
X-List-Received-Date: Fri, 03 Mar 2017 07:51:47 -0000

On Fri, Mar 3, 2017 at 8:16 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Fix duplicate "hub@00" naming bug when two or more hubs are
> detected during scan. Each hub was assigned id '00'. Duplicate
> hub device names were causing kernel warnings to console on
> every scan.  Create a unique name by using the upstream master's
> idx field. i.e. hub@00, hub@01, ...
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2:
>     Add more description for the change.

Much better commit message. Thanks for the explanation.

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 542544e..b9573c5 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -437,7 +437,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>                                 return -ENOMEM;
>
>                         device_initialize(&hub->dev);
> -                       dev_set_name(&hub->dev, "hub@%02x", hub->master.idx);
> +                       dev_set_name(&hub->dev, "hub@%02x", slave->master->idx);
>                         hub->dev.release = hub_master_release;
>                         rc = device_add(&hub->dev);
>                         if (rc)
> --
> 1.8.2.2
>
