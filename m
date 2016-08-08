Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s71yW02G0zDqYt
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 12:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GbfCxKaS; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id g133so31772041ybf.2
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8+8367dwb/8smuPxNaq1HHDW5MenH0QzoN3S+bocu5s=;
 b=GbfCxKaSMtwRuRI4k0/agkGqaPMorYdQqQosJ2OPCWqzNtzBfTN5ARME6Rx4DTILOH
 kXHPF1SzJ5dMWxjXta/qBWnQ0W80QUHpg5uU0V3k9mEe3+YPvtqxgMgQPeONtWcVY2Q/
 sBi1ZiBWNi42VRi44ABqgHH1zteqSRb7B0g1H8ynOh7NGakxlqwdl+F2bQD3bc2+CFin
 5CPNKqYqHGCHIkENirI6pGeXn9Oa0DJ645Le/7CnVxO1+dmVuVMP2IUwgJPb+pUOIZnb
 hvHEqal0GtWEUXZYjL8oABoE8zv8l5VOiDHaB61iq5DfDbz1QvXn48mhi96CxWs+Z4el
 7xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8+8367dwb/8smuPxNaq1HHDW5MenH0QzoN3S+bocu5s=;
 b=KPHkSeYWexh/OVkC1gkylRddHuEsnOtJ3QbX2S3z1uZTMzXq9rmjoEVctjW/FPeVgY
 C5OKT/NOs2MtX7bej6ltnLmee+JoURVt1kuUBFv/E3uXhj/SUUjTswiSi+9LxHb4tiag
 jdfX13vKviIkLmcqGqWti6PT5+uWUrZxDZcAcKM63xuD2EK1nkqGi11tVfA/TQX8l4WQ
 Dsu2FQxYd7w302ieUyOBgtaplyGOtra3s7A77e1zvKAm0ylbQKEJqLxqqVjBxROpSYKv
 0Iy4Y6ClWips8MGf2NOALEaYfVid2surfHe65ISf64avD6s9mVOOJaV9D4nBNgTDFSn5
 JcHw==
X-Gm-Message-State: AEkoouu9g/4v7MBOv/ZlpO1KiMe4xF28ew0dFCWJuqdNdrGDFD7C5Iec7/CzBGz2BhMsPaPMzfZAbT0IM7AP7A==
X-Received: by 10.31.97.4 with SMTP id v4mr9372861vkb.38.1470624400031; Sun,
 07 Aug 2016 19:46:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 19:46:19 -0700 (PDT)
In-Reply-To: <OFD1661B1E.7722FD0E-ON48258009.000CAEA2-48258009.000D5F9B@notes.na.collabserv.com>
References: <OFD1661B1E.7722FD0E-ON48258009.000CAEA2-48258009.000D5F9B@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 12:16:19 +0930
X-Google-Sender-Auth: -of_bMoMgyX22VMSwIoHJ1qgzLM
Message-ID: <CACPK8XfdqPo0uCtetQ2RR8wJ-hDxZwN8jY+d7B8jBGGNi1-5Ww@mail.gmail.com>
Subject: Re: aspeed i2c multi-master mode
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 02:46:43 -0000

Hi Yi,

On Mon, Aug 8, 2016 at 11:56 AM, Yi TZ Li <shliyi@cn.ibm.com> wrote:
> Hi Joel and the List,
>
> Does current Aspeed I2C driver support multi-master mode?
> I checked the ASPEED data sheet, the aspeed2400 and aspeed2500 HW support
> I2C multi-master mode.

I don't know. I would have to read the driver and datasheet to
understand what is required for mutli-master support.

I suggest you take a look and report back to the list.

Cheers,

Joel

> Do we need to add code in i2c driver to enable multi-master mode?
>
> Regards,
> Yi Li (Adam)
