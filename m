Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="j3oloDe4"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mCc34VzbzDqf9
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 04:58:11 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id b11-v6so9701517pfi.5
 for <openbmc@lists.ozlabs.org>; Thu, 01 Nov 2018 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCtJjk5ceD8lztU4NgzEwMd/CIoohTCwR2Wr4dOFVNo=;
 b=j3oloDe4OYI4hc7LGe3k/LhCTyxN0kbJb7wSjONcGMumsCkGu70y7uuCCCnFXw5+NH
 Iq0fjSBZ9Mzo/cGh9GydQlpbwigtYAoW5Y5bXVskhvt5WHMMU5YSyLnQnNerF86lOqxY
 SoJEksC1YOGUQoSOUDY07T2tk5o+mrxbNFfln/+i1zWCiWb8GsMVP/jvFecBtK0Rxle2
 yeIC1j+/20CVDy4pZEENiLcEC2tCAr7t2U8CdCk3Dn2Lsge3OUKDBycC81fHLtMHHieW
 LVE1rgQxG31ThFRwLyblU/q7xGE85W3iVyf24lEitYVSW1mox0qOk0zuOjR8qnrYnxhj
 KENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCtJjk5ceD8lztU4NgzEwMd/CIoohTCwR2Wr4dOFVNo=;
 b=s6w4dU2X3cTM6G/GIQnsU4Y3BRRoqCANAIEO7A7/iljEREJIAwplRYcGsHs+nFkeTe
 oKrSNrjcjC1xDQpgh2V+1U5vXez7yhaHawe7vrBkzHNlkGtcD+++G5UTiA1z3MXst/3M
 ZooAszC4aZzpUMDs+fSRV52TP9lT05Jwd0eAhT8SUlj1/v6TBh5ODtzL8KqzC9g4zp7W
 scXf+ijz0H4ppjgolNAiRr7+iWq7FDO6wHROWsRjpsZywwfo4e1cknt06wA4B8fWu1R0
 cA3S9QmIWTMzkSY3SExNvpB1e5bvsXFqmBrjtwZoGPkLDfTIoGLtlMge9pUiOBtgeini
 k1+w==
X-Gm-Message-State: AGRZ1gLcLzdz79ZtHAPRQD3SPO8QLGtPAe+X35XE6c4jkhbkLArqyIvN
 JxK6t6sD3mz9AYQEf6A0K66fhOLCcSI2TcfKkyGY9A==
X-Google-Smtp-Source: AJdET5eJO2rmWN5ker1soQCdn/iXt3XpEDVUipqldKn8V6fe1ZkLnzjQVy5VQmKvKaIk7L7EdODIJPmbvDuqt3RSjfM=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr8199722pgh.290.1541095089090; 
 Thu, 01 Nov 2018 10:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
In-Reply-To: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 1 Nov 2018 10:57:57 -0700
Message-ID: <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: AKASH G J <akashgj91@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 01 Nov 2018 17:58:12 -0000

On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wrote:
>
> Hi All,
>
> I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed AST-2500. The board we are using have one temperature sensor (Texas Instruments TMP75) on I2C-12 interface.
>
> I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine configuration directory with the following contents.
>
> LABEL_temp1 = ambient
> WARNLO_temp1=-40
> WARNHI_temp1=125
>
> I added the following patch to the kernel file linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
>
>  &i2c12 {
> -    status = "disabled";
> +    status = "okay";
> +
> +    tmp75@48 {
> +        compatible = "ti,tmp75";
> +        reg = <0x48>;
> +    };
> +
>  };
>
> After booting Linux, the changes are reflected in /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48. Also,
> tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90.
>
> when I am running the ipmitool command: ipmitool -I dbus sdr elist full it is not showing the temperature sensor and its reading.
>
> Please someone help to resolve the problem.

You'll need to add the sensor configuration to the
phosphor-host-ipmid's sensor configuration, see:

https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml

>
>
> Thanks and Regards,
>
> Akash
>
