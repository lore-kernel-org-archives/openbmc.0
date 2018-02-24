Return-Path: <miguel.ojeda.sandonis@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jj3N/RVa"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zp7Xp2Rd4zF1jr
 for <openbmc@lists.ozlabs.org>; Sat, 24 Feb 2018 11:01:10 +1100 (AEDT)
Received: by mail-qt0-x230.google.com with SMTP id a23so263565qtn.0
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fVzH3b+seDJbUEtOtN6/TDOtnCpwPcNbN4E0ahurEPY=;
 b=Jj3N/RVaeQb1BcTDbKF9tQSEDDpEMN0Lr065t7XRoCe12DAWRxT1DXObRQHl5NpM15
 BxBT4pXThph4m5tBWYhjzLKD5Php5UlqtBj4fdQ87b0LTwMP6v5xTV7U3ckzNcIOQDGv
 hQ7I/RWvBar7v7CqitZIFZchSRs3epiYl1yYdLSoENMVOC7VMpobwzA60dmGa16nW2X8
 gjUI8QFjjoPzqfYnBC2GcMe/mYDuX24qoEXmNfphy5wI/vD0Kpld98ovTLr0UlZE4zFg
 XaUJBPC2nSc352vNeWUtX4DDBGtQpv3oM7132qyJMcxvmKQk4PW2Oh4uk5vQfzlYs5Y3
 /Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fVzH3b+seDJbUEtOtN6/TDOtnCpwPcNbN4E0ahurEPY=;
 b=BSVTHWJIqCcSoZTXLRlUuOAisvTuYV5GeZTSKBhFBUn+vIQnx0BpPzVaUyIXfLqTmc
 QuE9BLLbRTTENkYs9mwFiz2Z8u8TcQQQsyb/doEKOO5YrGRDXHT3iydDeHWrgfbNtOfQ
 2JOKXh2i7f4AF5PJF9gxMZsEAy+yLCL/iGrz9SgRO+DdwNQp6Rx1/Bnh7lA4ncGYDfNy
 UlWU+L63AWImcDTdwzHfvZNRrVra7rGfxotWwdr+d4gbEtzKo+ptPfJUVUVdopP/lZoP
 ydD6+6H9lyevY7bKfMrgBV/vhCiCuMCKzFcRQ+u2TgrlzNzOJVcCWkq33gEpIruU6yYO
 uf5g==
X-Gm-Message-State: APf1xPC4jxBGUbJ6gGPviE2YFWKBG5wNAYBm5R5VF9GyNpgU6ISvkgvI
 kHuH6qSO6qcCJP6Imp2ccV8ZpKn4z2ZHSicb2KI=
X-Google-Smtp-Source: AG47ELsPzwmNWK8ili5Bc2tURgqYd/9NCy2CmJ+qXhe0iXlRX/AVRuXCaEKh+uacBkP9k8axQMxOP/IcBIjWqUD+UUQ=
X-Received: by 10.237.57.197 with SMTP id m63mr5516365qte.249.1519430468294;
 Fri, 23 Feb 2018 16:01:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.52.247 with HTTP; Fri, 23 Feb 2018 16:00:47 -0800 (PST)
In-Reply-To: <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
 <20180222003720.GA25250@lunn.ch>
 <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Feb 2018 01:00:47 +0100
Message-ID: <CANiq72mjsfJRzfFmhbL7dnih_0=2pFoJDTrmi35x0yLmKrSBFA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>,
 joel@jms.id.au, andrew@aj.id.au, 
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 jdelvare@suse.com, 
 benh@kernel.crashing.org, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 26 Feb 2018 09:20:51 +1100
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
X-List-Received-Date: Sat, 24 Feb 2018 00:01:16 -0000

On Thu, Feb 22, 2018 at 2:29 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 2/21/2018 4:37 PM, Andrew Lunn wrote:
>>>
>>> But even with this change, it still needs to use delayed creation
>>> because BMC side kernel doesn't know how many DIMMs are populated on
>>> a remote server before the remote server completes its memory
>>> training and testing in BIOS, but it needs to check the remote
>>> server's CPU temperature as immediate as possible to make
>>> appropriate thermal control based on the remote CPU's temperature to
>>> avoid any critical thermal issue. What would be a better solution in
>>> this case?
>>
>>
>> You could change this driver so that it supports one DIMM.  Move the
>> 'hotplug' part into another driver which creates and destroys
>> instances of the hwmon DIMM device as the DIMMS come and go.
>>
>> Also, do you need to handle CPU hotplug? You could split the CPU
>> temperature part into a separate hwmon driver? And again create and
>> destroy devices as CPUs come and go?
>>
>>         Andrew
>>
>
> That seems like a possible option. I'll rewrite the hwmon driver again like
> that.
>
> Thanks for the good idea. :)

By the way, in the rewrite, please try to avoid the create*workqueue()
functions (they are deprecated :).

Cheers,
Miguel

>
> Jae
