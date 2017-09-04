Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::235; helo=mail-lf0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJbzf05E"; 
 dkim-atps=neutral
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmQhh3W4VzDqYQ
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 09:16:36 +1000 (AEST)
Received: by mail-lf0-x235.google.com with SMTP id 80so848386lfy.4
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CnOQxhdu7/0j7zx0VHR+0jVCewJw2yJuJz1PIrTon78=;
 b=CJbzf05E0+Lay+Ss/abb9kInIToSf1fQi0IdzjhjKDYJCbdq1aKKWKTsPe5hc3XL1A
 +gL4ko8/IHMS5JgtyVC4C3i7LiBKceZcPDryK9Sk61gWAnpu4quROmLBt/PDAucYgzg4
 SAQvx+DuPg2Ls/tN5ic2JQAxQJ9EqBr03njnE5jWI2BVhtdSFJh16Dn2C7LtJts3PEwG
 0fX2Gi+nEECqC/T0LYX6T1Jrwylf90s1mipfbxSj8lbRQABjKNlQvznzn388DQjW6dAY
 Xj7HDjPuqV8JeW6Yd7O40JK2Rt5NP+KJbRlAFcwQt9gu8TxXjF+MB+mDvQ5xHGfBCbFq
 rqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CnOQxhdu7/0j7zx0VHR+0jVCewJw2yJuJz1PIrTon78=;
 b=WhFiFpf3JAS2kzMtfR9cjg0amPLizl+oYoca+WdBTXs5ppZC1zg0Sj0JXV5a+Z9KVO
 TM8MNirZQ0bCyp06LLc1PMgezHVsQ1sXxsywB7r7T9+XaNOW5ow3P6JN2VpDfcRX5HLt
 p8BtfG9UB0+XIbXvs8SUj9eenmU1OsWFXCwHujcYn7NSeTi7CA3KFtMPHojdJZ6fq3Ma
 LRac8AI9pzS92dr9g2s5ILpa6u5/mHkGWqv/KxfUAzp18LXuYApWyPYcIQCqA3INg06/
 bODa7EjYG0HoF7bbZkq+QdCqe68LRUleKO1Dsk/XEJbjXOBKM5lWWqm/xRzxkLM7gFeT
 4l1A==
X-Gm-Message-State: AHPjjUh58mrZc18lBpNpV0irtusPaMBV8nU3vyqBmcL3K0ncJe9kNCxq
 /3xAjnQ4lG4wCvyYXwgm9fDfUgbuAw==
X-Google-Smtp-Source: ADKCNb5zDHxgq+eGqrwcpoZAB6EeCX0fF1TvxwV8C7SsI3yabF2BDirOOzf4kclBjPkoFbfagZl6qJRF8PmRfU9POEs=
X-Received: by 10.46.25.3 with SMTP id p3mr765307lje.36.1504566992239; Mon, 04
 Sep 2017 16:16:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Mon, 4 Sep 2017 16:16:11 -0700 (PDT)
In-Reply-To: <59A929E3.7040209@linux.vnet.ibm.com>
References: <59A929E3.7040209@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Sep 2017 08:46:11 +0930
X-Google-Sender-Auth: LoNY6BNOW3ZyqPuKekrh3Gehc8k
Message-ID: <CACPK8Xd0s8YkLZb5PvowJF2rF8P3O1GCfUiBHb87Mz0MmJO0=A@mail.gmail.com>
Subject: Re: IPMI support on OpenBMC
To: tomjose <tomjose@linux.vnet.ibm.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 04 Sep 2017 23:16:37 -0000

On Fri, Sep 1, 2017 at 7:05 PM, tomjose <tomjose@linux.vnet.ibm.com> wrote:
> This mail is to solicit feedback on the IPMI implementation on OpenBMC and
> figure out if any important feature is missing.
> We have added support for IPMI over network(standard IPMI port) and the BT
> transfer. The first milestone we are trying to
> achieve is to have support for all the mandatory IPMI commands. Below is a
> snapshot of current situation based on feature
> and command support.
>
> Supported Features:
> ---------------------------
>
> -> Chassis Commands

Do we support the following:

 power soft
 power on
 power off
 power reset

Last I tested this the behaviour did not match expectations
established from other platforms.

Cheers,

Joel

> -> SEL
> -> FRU command
> -> Serial Over LAN
> -> Watchdog support
> -> Sensor commands
> -> Network Configuration
> -> Boot Configuration
>
>
> Work in Progress & Pending stuff:
> -------------------------------------------
>
> -> Full fledged SDR support
> -> DCMI Compliance
> -> User Management commands
>
> Following is the list of the supported IPMI commands:
>
> #<NetFn>:<Command
> 0x00:0x00    //<Chassis>:<Chassis Capabilities>
> 0x00:0x01    //<Chassis>:<Get Chassis Status>
> 0x00:0x02    //<Chassis>:<Chassis Control>
> 0x00:0x08    //<Chassis>:<Set System Boot Options>
> 0x00:0x09    //<Chassis>:<Get System Boot Options>
> 0x04:0x2D    //<Sensor/Event>:<Get Sensor Reading>
> 0x04:0x2F    //<Sensor/Event>:<Get Sensor Type>
> 0x04:0x30    //<Sensor/Event>:<Set Sensor Reading and Event Status>
> 0x06:0x01    //<App>:<Get Device ID>
> 0x06:0x02    //<App>:<Cold Reset>
> 0x06:0x03    //<App>:<Warm Reset>
> 0x06:0x04    //<App>:<Get Self Test Results>
> 0x06:0x08    //<App>:<Get Device GUID>
> 0x06:0x22    //<App>:<Reset Watchdog Timer>
> 0x06:0x24    //<App>:<Set Watchdog Timer>
> 0x06:0x2E    //<App>:<Set BMC Global Enables>
> 0x06:0x31    //<App>:<Get Message Flags>
> 0x06:0x35    //<App>:<Read Event Message Buffer>
> 0x06:0x36    //<App>:<Get BT Interface Capabilities>
> 0x06:0x40    //<App>:<Set Channel Access>
> 0x06:0x41    //<App>:<Get Channel Access>
> 0x06:0x42    //<App>:<Get Channel Info Command>
> 0x0A:0x10    //<Storage>:<Get FRU Inventory Area Info>
> 0x0A:0x11    //<Storage>:<Read FRU Data>
> 0x0A:0x12    //<Storage>:<Write FRU Data>
> 0x0A:0x40    //<Storage>:<Get SEL Info>
> 0x0A:0x42    //<Storage>:<Reserve SEL>
> 0x0A:0x44    //<Storage>:<Add SEL Entry>
> 0x0A:0x48    //<Storage>:<Get SEL Time>
> 0x0A:0x49    //<Storage>:<Set SEL Time>
> 0x0C:0x01    //<Transport>:<Set LAN Configuration Parameters>
> 0x0C:0x02    //<Transport>:<Get LAN Configuration Parameters>
> 0x2C:0x00    //<Group Extension>:<Group Extension Command>
> 0x2C:0x03    //<Group Extension>:<Get Power Limit>
> 0x2C:0x04    //<Group Extension>:<Set Power Limit>
> 0x2C:0x05    //<Group Extension>:<Activate/Deactivate Power Limit>
> 0x2C:0x06    //<Group Extension>:<Get Asset Tag>
> 0x2C:0x08    //<Group Extension>:<Set Asset Tag>
>
> Regards,
> Tom
>
