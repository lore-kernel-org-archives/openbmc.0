Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dB/12Ncf"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yB1xh61YXzDr4W
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 13:57:44 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id a16so11931221lfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 19:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RIwLcHKdPMb9viZhu9C1U4rYp208ZTBh7kWLM1DWNw8=;
 b=dB/12NcfschTZTKpMKg75YHG6Hl+z6AVf9WDu9LkhvM1aebHuAcJgmtdVY/jryJ01q
 yssIVccBN2z9shG+97gKYo4MuAP9taMfnHtEhUodcf7BUeWcuic9YjU/UprxiuzgbaVR
 w5BTUvIeYAVnIcC/9Kpr0+3YUW1YiqexEjpUgBVh0ONubycw1qJnAhBO4ZhYoNjLIct/
 TVlqAFkxbyyVSLookQgckWZnUow2XcRjOA1w0evd4c8UjZKIzvSoogS3EofAP34x4MWa
 J6GfNTaFQr3LU4GsfNkjgPhjI1DjLso0W9W9hHp0TJmKWTzuRr3Tp/hSnNRNERT5ydM4
 okMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RIwLcHKdPMb9viZhu9C1U4rYp208ZTBh7kWLM1DWNw8=;
 b=AuaGgTumZS60iL3p93d5m4uJ5pMOiyeB8yfZtHhoLWXajNogOhWuIZCtaVd55Eiuf/
 UIOzjFnM067vzqOy9BCCS5SzSTonLdzaFf05l2ep5FNASPh8lg7RGg/C8UkvPo4DBajT
 lmgkv+3+Y4PDQ1kJkP8x63g8P1FYSMVM4nRm1mMhNLnFBajjkfDpSRaIls2CTTyKfEgS
 srDQHdco22hTy/L9Rqfkh2aLqE68dOm2vd31WMi0RII8fl8lnR2t3Qh5NE5IPP5mwpZT
 iqpsVVq4RaaMLNGo73hK8G6SGU8HmOjdIFsLDpelsulLFLW15PHQI2q6Z/TC5xzrjliM
 j4qg==
X-Gm-Message-State: AMCzsaXTUL0qFZozviyY1WFcHLIUcgG4rOo+xyoHrEI5WsTVEYfMDFbY
 7F25UZXW+xxG4hkCemLNunnZm/tceM6wLutad3Y=
X-Google-Smtp-Source: AOwi7QDesyLFbCajf8/SlNxQkEX+CW/TnIpt88WJUDZTtmpFfV/0w8o1vQP17N2Xmv3KQ8DmGd+LuwhIOJ6q3BbcnVQ=
X-Received: by 10.25.89.132 with SMTP id n126mr2446640lfb.104.1507604260646;
 Mon, 09 Oct 2017 19:57:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Mon, 9 Oct 2017 19:57:20 -0700 (PDT)
In-Reply-To: <1b82ae0a-9754-b9d1-3cba-12a796b37366@linux.vnet.ibm.com>
References: <1507300148-8208-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeiD_qukBjibd1FxMjXt9AbJ_jXGF6AJCE5HQFwr0tuFw@mail.gmail.com>
 <1b82ae0a-9754-b9d1-3cba-12a796b37366@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Oct 2017 12:27:20 +0930
X-Google-Sender-Auth: cxJLBIbDtfRDqflWMRnM8i9T6h4
Message-ID: <CACPK8Xc7f0AYTSfuSBC2=kgPaYvWFw7q5O8y-tF=-TSNG7xyDw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5 31/31] drivers: hwmon: occ: Cancel occ
 operations in remove()
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 10 Oct 2017 02:57:45 -0000

2017-10-10 0:03 GMT+09:30 Eddie James <eajames@linux.vnet.ibm.com>:
>
>
> On 10/08/2017 09:00 PM, Joel Stanley wrote:
>>> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
>>> +{
>>> +       struct occ_client *tmp_client;
>>> +
>>> +       spin_lock_irq(&occ->lock);
>>
>> Why not spin_lock_irqsave/spin_unlock_irqsave? Same throughout this patch.
>
>
> Well spin_lock_irq/spin_unlock_irq is used through the occ and sbefifo
> drivers. Just following suit here. I can switch it if necessary.

If you understand the differences and used the non-save/restore
versions intentionally, then we can keep the driver as it is.

In general, to be safe, more experienced kernel hackers than myself
recommend the irqsave/irqrestore versions of the spin lock functions
as they are safe to call from any context (IRQ or otherwise).

Cheers,

Joel
