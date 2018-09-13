Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXJLvC0Q"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B3F005bPzF3Sk;
 Fri, 14 Sep 2018 01:57:07 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id j8-v6so2780476pll.12;
 Thu, 13 Sep 2018 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=7I7b1oiADODjqJq5oO3cBiJvL9bgHNSH2mVfOfs7amI=;
 b=SXJLvC0Qwq+NkUWu6q22/hjYwdPCAMRycaII4HUVioJNq5YCZTX0po8LM6+wiQpfs6
 X8+bmzebkn4XJSMaxtZxhaF1ePgnDSIDsyH62/lzadfT0yzdHKxqpee4DdCa10hWg6Ot
 zSHWJHnBkF3XLE0Vgd/UOz4mJUH9aj7cx0CuzD22bFw3FdengoIcANZaXCPVNzKvdTZ8
 yfl7QnKsgrSWkohT5/tPIMvT9SGcpjHEnUdOaq++IuXLc5ZLwVq9Yp0gRa3PmSt/X3Y7
 iHk1v9n+GCw+dtJbu7jBtLUn5ismtCkqcdEx/ZF/0+94xVeLrtav1dMDfwp+H3S01OwJ
 3nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=7I7b1oiADODjqJq5oO3cBiJvL9bgHNSH2mVfOfs7amI=;
 b=BwnfO1A2W81YiUcprwMVIHsclOXKXjMQJWkR4arejmnYIyG8raVklXUErrgWTa+vjo
 XiL5mSnlAOviPc573IravyW3I+3PB7HDhwInGUX+sEvtVRBe2Lj5xzTWNe3dzANUq3xZ
 Hqxh6Cwa9hp9q2D5lk+vcb2ykV2fpz7mZ62SiuU89xgcbzBhOea2dHrrOFagKL5d8AdA
 5bHmUTkFvfALskZMgB5JiCBU7rhyGWWEVCKs2n9JWItpIpm5qFcz3ckSr4QJ19BP5Ln5
 4gB/IRl0qqeM7kDMDJHXO9r74x0NQs2ytd1T0tsUcSwUoxov9yW27UhccNqxi+TV8fWT
 hCGg==
X-Gm-Message-State: APzg51BENH7eD5GbBloOPYWRN1//j8I5Ona6hEi5fVY4Piv01GsQHMox
 0x2X/bCTqq2zgJxMbTyDqiMDh03B
X-Google-Smtp-Source: ANB0VdYDvTswa0fSP+eZ4K1ZIAi86JETceU3igNqoWw6S3WXRCE02aNlcePEFxRGa9FhafcW+FuyQg==
X-Received: by 2002:a17:902:d898:: with SMTP id
 b24-v6mr7838892plz.218.1536854225831; 
 Thu, 13 Sep 2018 08:57:05 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id i75-v6sm6661858pgc.20.2018.09.13.08.57.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Sep 2018 08:57:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Sep 2018 08:57:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Feist <james.feist@linux.intel.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined
 irq events properly
Message-ID: <20180913155703.GA22605@roeck-us.net>
References: <20180911233302.GA18799@roeck-us.net>
 <5698ca34-14c9-8d05-c4e6-5acf85ff9d14@linux.intel.com>
 <20180912013449.GA12612@roeck-us.net>
 <7fd98646-fb5a-be4d-ce37-84b74e0fa8b3@linux.intel.com>
 <20180912195844.GA6893@roeck-us.net>
 <da7f4691-7428-3114-32bb-e0171f6c7228@linux.intel.com>
 <20180912203059.GA18201@roeck-us.net>
 <fb185839-3ae0-01dc-09e8-f22db55ecb04@kaod.org>
 <3f86e75f-1502-eae8-0633-d087937111c8@roeck-us.net>
 <f47b3050-3abd-caa4-cc71-4b13ef60e2c0@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47b3050-3abd-caa4-cc71-4b13ef60e2c0@kaod.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2018 15:57:08 -0000

On Thu, Sep 13, 2018 at 05:48:59PM +0200, Cédric Le Goater wrote:
> On 09/13/2018 03:33 PM, Guenter Roeck wrote:
[ ... ]
> >>>   /*
> >>>    * The state machine needs some refinement. It is only used to track
> >>>    * invalid STOP commands for the moment.
> >>> @@ -188,7 +215,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
> >>>   {
> >>>       bus->cmd &= ~0xFFFF;
> >>>       bus->cmd |= value & 0xFFFF;
> >>> -    bus->intr_status = 0;> +    bus->intr_status &= I2CD_INTR_RX_DONE;
> >>
> >> it deserves a comment to understand which scenario we are trying to handle.
> >>    
> > 
> > Ok. FWIW, I wonder if intr_status should be touched here in the first place,
> > but I neither have the hardware nor a datasheet, so I don't know if any bits
> > are auto-cleared.
> 
> I just pushed a patch on my branch with some more explanation : 
> 
> 	https://github.com/legoater/qemu/commits/aspeed-3.1
> 
That seems to suggest that none of the status bits auto-clears, and that
the above code clearing intr_status should be removed entirely.
Am I missing something ?

Thanks,
Guenter
