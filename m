Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYSFz1wnjzDqXt
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 12:48:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ONDeMHL0"; 
 dkim-atps=neutral
Received: by mail-lf0-x235.google.com with SMTP id t128so37357074lff.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rr8BvWOyDiaZJOvBk0kOWithTns2qn9+tfVaMhZ61eo=;
 b=ONDeMHL08vhTnLKBaVDbm/GNDw3PSTOYXbl/6P6NSLaI2CC45kI+/X82omrrQYApmR
 diTjzw65x9oMHoxHsU3/EG3Ji8KerpdTrrVcGQRrF1Ez78KOihJACcEW2/fJ+bYoavoI
 aJhM1oBPTsBpUJjHvb3kwYtRenLWNhnyh3qDN3hyHIueYhQgvQSG9XVXTOPLcy2dQEBg
 b00c6+czBJri4EORQbf2W4B0twh25iFe4aRsXntkEAHvmMoHrTtsCsACndCITxR3fNA0
 KVd1E51NmbPKSCmVEj9lryYksuig7Tw4TqhhGYD+ILHFIYcQB1diFI7+P+IOOBeXI6Qj
 P0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rr8BvWOyDiaZJOvBk0kOWithTns2qn9+tfVaMhZ61eo=;
 b=iAmT85UThYU1Ia4vOudTm0caerzqSiuDkKKCG5fXaevMDbzuf+4VXM7Uy9eE/zc2lJ
 nK2Hu9ilD4E6PH09duUMQCMu999Mz+kHwhnGgNqrlpELJucwZYntgYIoy8KZ8p3VpYdX
 Uvd3qh6v12bxgnnqCq4pnH9qdhL7JFJ7zMEkbt+JKTEXF6ox6qwDd2woK8iTKhdTTuaa
 W/Gmv/KfRNJvVeKPX56tSuvqvfUT0tGspPjZMYtPLC+uhLByO6T5oLEpJg8Bs5MWHMTJ
 WbRib25xA5XuMFrU9sX72t68t+52OBCDFS98F0uQ1Z4u7Kd+2QbVtTSa8vS93EgwjvoF
 93sA==
X-Gm-Message-State: AHYfb5i8s6MGrXa9NVlbCAvUzMp2IRm/iJodOkOpePlclI+PNQZxeg5G
 98jUl5uLX/bqHuoCZ4nxbNuXqoX+kyOP
X-Received: by 10.25.202.74 with SMTP id h10mr2765721lfj.85.1503024530973;
 Thu, 17 Aug 2017 19:48:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Thu, 17 Aug 2017 19:48:30 -0700 (PDT)
In-Reply-To: <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Aug 2017 12:18:30 +0930
X-Google-Sender-Auth: yAefk6ACNR9-HHleYiHjyEjwtEQ
Message-ID: <CACPK8XfHF0h0_SJy8Tcd_Z6=eew4JoNH-dvQE6Ddm2XSnLvwpw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 18 Aug 2017 02:48:56 -0000

Hi Chris,

On Fri, Aug 18, 2017 at 11:05 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:

> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> +               ucd9000_clear_logged_faults);
> +
> +static struct attribute *ucd9000_attributes[] = {
> +       &dev_attr_clear_logged_faults.attr,
> +       NULL
> +};

Given this introduces new userspace ABI that will need to be support,
we will want to run this past upstream as soon as possible.

I suggest you post the next revision of these patches to the hwmon list.

Cheers,

Joel
