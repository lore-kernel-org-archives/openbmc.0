Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT2l93P6CzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 03:24:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oGf+IRQd"; 
 dkim-atps=neutral
Received: by mail-io0-x241.google.com with SMTP id q20so746143ioi.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=t37wOtrYg3ECnjLjRNSM4hywGxBz4dhAyxT7l+mewng=;
 b=oGf+IRQd6+fEyzL3Z/dphNCq1kmyUwdk5+hLD7AGMN9unzVmD7tzxGDA5jqWOZ51UD
 +x8KRzh23tFrdItO4K3P92VTi9gu+13+G9f7H7TgzFtzQEKbRXp0eTQT2g9fOVoAIQd7
 ePNU7TciTkR5riHxVwTYcPnlEEFaLObjSzrHTwbdxlwIMHV0bV+gFNuvdxbK9NoaNTg9
 sW3o1NUjIgvazS5CpEjgXSzf+tZ3yyp0kal2DOizNKNrhJq9Z7HeyrYGRGN/ccgzpvE0
 YxdeLMFMntqSEFy5WrWsxfa2HOK1o1cmJ3UVSQ4SsQZSGxKugMS/X4+LfvyEHXVFAQcx
 KYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=t37wOtrYg3ECnjLjRNSM4hywGxBz4dhAyxT7l+mewng=;
 b=iYjayDiO2HV5wvAsgDZHxq9Zfd7EW6+8HXRxsKteRaOnp8jovBbZCYV40ax5NKQDZ5
 qZsVuUbJw111zhN7ODJ29iioDnwQj69+V23/8lIjr5szKAn2H7Abi8NCQTFZtSD0fWWZ
 ptvULvQ2UHHruoebCbTluRzADOtQ49TlfV2yKROqFZYtFIHjauvVz7R84qZqwr0QGx9g
 k2vXx+VInTSGEXB6ZehmGCW9Q0q9lZK/HZH/79p7b8uh70p19ih4EkcpZKaGwos9sFUo
 pfLFz59v6EgenZcXc6bhAW35ZwwRTxm6k9O5AQSyOTAdTf8dVPpZ8YctphkYWl4KwQUx
 oCLA==
X-Gm-Message-State: AMke39lzmV4dPRKOP9CObKgugWqlLB14bG/bnEVcqBr0RfjhWNG5vaCew0x1N07XeBjG2qVuyMEM1E1mZoyJ+w==
X-Received: by 10.107.128.68 with SMTP id b65mr25173564iod.113.1487780690786; 
 Wed, 22 Feb 2017 08:24:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 22 Feb 2017 08:24:50 -0800 (PST)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 22 Feb 2017 10:24:50 -0600
Message-ID: <CALLMt=qf_+-JR2gSz8mAHBLwuZ2sV7iz+4gVG9ZcGzxifU1Tag@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 0/7] drivers/fsi: Add hub master
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Feb 2017 16:24:54 -0000

On Tue, Feb 21, 2017 at 3:50 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Adds the FSI hub master functionality to the OpenFSI device driver.
> Hub master is a FSI client device driver that registers with the
> core and is notified when devices it wants, hub master engine and
> links, are discovered.
>
> v2: Restructured to move hub into the core instead of a separate
>     slave device driver.
>
> Christopher Bostic (7):
>   drivers/fsi: Add hub master scan detect
>   drivers/fsi: Initialize hub master
>   drivers/fsi: Define hub master callbacks
>   drivers/fsi: Move common read write ops into single function
>   drivers/fsi: Add retry on bus error detect
>   drivers/fsi: Cleanup bus errors
>   tools/testing/selftests: Add fsi command line tool
>
>
> --
> 1.8.2.2
>

Do I need to respond that I tested to all commits in this series?
I'll just do this one for now.

I built all patches into an image and we verified all is looking good
on Witherspoon and Zaius.

Tested-by: Andrew Geissler <geissonator@gmail.com>
