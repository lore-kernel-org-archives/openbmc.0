Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tOGZNNeu"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409Dmv5J1KzF27q
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 13:02:55 +1100 (AEDT)
Received: by mail-io0-x22b.google.com with SMTP id q84so20137258iod.10
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zIZdWAWe3xi2SlTAdwQE38VkwZ6kTx5bvtV7sklhdW0=;
 b=tOGZNNeuseEl6Beo2v5YvCpsBaQSLzyiv7Ko5nVWEK7knSM4vHIVPv+RZIq7ke3mCs
 UTTLgWMI4stXGPHrHPTfFjSUN9YzgdHBnSBT74CTa1Espb2SSG7RfyQtIY5eLMapLTHY
 AZSBe6TQT+QO0GzIKal3YgGf5IiSgVtYVua24n6Yp+pU6iKzqJLVcUwBeJSOBE4iQkVq
 v4TmSY6KLJvSz95D0LPLpXuOdYpCMTRsOOA2qwBVEDQkJbm5oENKHQo6ULzh5x9qFxxS
 iKmWLC/FFeHqP5a13qEnvkq9LeMYLdf11oKVjgoqBetvcB80Zr+6J5yJJ7lyEwEIJW4u
 4VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zIZdWAWe3xi2SlTAdwQE38VkwZ6kTx5bvtV7sklhdW0=;
 b=LJUpBz3OtdaCuoHusNZUPSjwpgy+SrLj/b62IHHKGkyQwiaT2VaZCCK1QqklGlgOEz
 FbEXsTrSduQonulg/b9UKAxmhRTvbLGaIL3vlOWIyyYIgVlhsugWUfJJY7bgIUnTiTWo
 c/tfAxniccQV9S0YIcPP009VNsr2JfRmuWc5/sx5RWeuxV2zofQAfFqYChUqolGF09Cv
 aAhLM/UOLmV47Nw+HHzEyVFS3nigKBZrapgCCQYPZwjjP604M9yG+59qpBCif924gCYs
 uHf4K1EEr5AVTRJZTQc5CEg5mCnCTZ5iQN2gfAwK18p1bX/Bts8MlufFUPHZHbv0Cnx5
 nABw==
X-Gm-Message-State: AElRT7EXXEql2rQ7U4hDVd8kKZs0weI5D4322OKc18KK3zGAs5vpESLV
 qvxJsDZxxQpOL/fdGQfbFlLU5NidQm8mcV9nAkU=
X-Google-Smtp-Source: AG47ELsXF7n1e5TTDEdxmXoIiSQxC26I+9stSj9FBtlRjEXWow87QWV0k7ePMZ8/vWZK760jUWoNy7zdhXOLwFW6lkE=
X-Received: by 10.107.149.70 with SMTP id x67mr41747769iod.156.1522116173509; 
 Mon, 26 Mar 2018 19:02:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.142.67 with HTTP; Mon, 26 Mar 2018 19:02:52 -0700 (PDT)
In-Reply-To: <13bb70dbdcefb4d41a4d0692ecd12091@linux.vnet.ibm.com>
References: <13bb70dbdcefb4d41a4d0692ecd12091@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 27 Mar 2018 10:02:52 +0800
Message-ID: <CAARXrtk00ZgR4GNPmXsWiEGcKMDdJvxiCmCTTwk32Vy0EzG3nA@mail.gmail.com>
Subject: Re: Inband Update
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: jk@ozlabs.org, vernon.mauery@linux.intel.com, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 02:02:56 -0000

On Tue, Mar 27, 2018 at 4:57 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Hi Jeremy, Vernon, Andrew, Joel, and anybody interested,
>
> I wanted to start this thread to discuss the implementation of inband
> update.

Patrick Venture has posted in-band BMC update over OEM IPMI commands via
PCI/LPC:
https://gerrit.openbmc-project.xyz/#/c/9497/

Just FYI.

> At the face-to-face earlier this year, we were discussing to use a USB drive
> as the communication mechanism between the host and BMC.
>
> What would need to be the first step, is it to write a kernel driver,
> anybody doing related work, high-level requirements, ..., ?
>
> Thanks.
>
