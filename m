Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMg9t1gTHzDvj1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dw0DtRTf"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id u15so1444126oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qf/DYQMM7FG3seHqzYGPHRfgzCTXegWmTg0hd12krzs=;
 b=Dw0DtRTfUmcpqj11dQ8RjU3HTVPDuLBdqjZcM6IT2nO+pLV4hnaM+Q4Wn9ZdO1jk+H
 mDDP+nBT9PkEp5QHxsOMaGoM/hD9mUKIglkbb0WEgmwSMY3zb2w6O/BMfMsMUi06ZLve
 5NQuyxbWqgO/y7IeAEBqp7GBvbV03JfHg1GTgj5KkBcvu9dfvkDMYtpS7GWhTc8bPPG+
 WMgFjTp7WEcXmRQuhuqYvt2xNWNxMRuj4UBjgwztciuzFNTQMmeZFrMta/XWN6gp7aM/
 kuQhnrojyLp32Wgy8WL9IVzWyt0uFDwTJnJtVLEX6JTfRpEinPzysReCAfsBSYS752fg
 2GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qf/DYQMM7FG3seHqzYGPHRfgzCTXegWmTg0hd12krzs=;
 b=EIcPr2M+/5cIjnNcrFkL8nvjZtk3km7qOfmqNoNKMdQgL8BkuuQ3XBbDbVlFJzrdLF
 6+m1U7T6ccsy98IJW7yDhcwPjbGPkLGbilwdpV3q1zTaeRTgpNT9RzfWoRrcztJ8UWNu
 NKRiNlP2OHiMRWT7xNl3jMRp7U88upR/wwo/0A8VR0pVc48e6ZyU4VJhVpAlTmo4tMV8
 010/rT4ApNG4aoYRI0A8Sqzkb81YzRj7iMfR4xgzH0FONTeFbgmpj/rqqYRN1hxtIEmF
 uRtnhlS5FfoWVMqvtLs51D6n1KvR4V5E7iqJUzLzu6whCqHEwBUqIKCX4ChU7Hx45elD
 W8KQ==
X-Gm-Message-State: AKaTC00M14xDkr/8HdLq8sC66VWO8kgCj0bYACCfJb9emuoY635hF53EAEFDAf+EuKd0wvHKFpk4VLvqrJmbQQ==
X-Received: by 10.157.24.41 with SMTP id b38mr7375456ote.117.1479713136461;
 Sun, 20 Nov 2016 23:25:36 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:16 -0800 (PST)
In-Reply-To: <1479478938-13267-7-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-7-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:16 +1030
X-Google-Sender-Auth: szSDjGbSLrhugHezUf8oy9lvhuQ
Message-ID: <CACPK8XdrRJLK2Z_m8dFTSt5BbGJDbPiv8vd-sT6XBe_NiZsuHw@mail.gmail.com>
Subject: Re: [PATCH qemu 06/38] aspeed: add a memory region for SRAM
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:38 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The size of the SRAM depends on the SoC model, so use a per-soc
> definition when creating the region.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c         | 52 +++++++++++++++++++++++++++++++++++++--=
------
>  include/hw/arm/aspeed_soc.h |  2 ++
>  2 files changed, 45 insertions(+), 9 deletions(-)
