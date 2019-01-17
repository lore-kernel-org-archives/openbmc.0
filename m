Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gL5V2cPfzDqBV
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 21:33:31 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id ILS27939
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 18:27:39 +0800
Received: from mail-lf1-f46.google.com (10.100.1.52) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 17 Jan 2019 18:27:37 +0800
Received: by mail-lf1-f46.google.com with SMTP id e26so7378565lfc.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 02:27:37 -0800 (PST)
X-Gm-Message-State: AJcUukdIGXMf5PnYsrxQrc5mNkVg6bZR0EzKf+JDDpYS8sgbA3QbSCxj
 +/UoUb9YeKMIGOD+GTRBFA1Mma07r+rwm5McXlE=
X-Google-Smtp-Source: ALg8bN6F/GSP1nRmuPUB2R+KixQpYE/kLYfE25uirV3cEbJV0NSAIZxTDj7lNpfRgila6l3zAMSjBv+oB+xYaU64NzM=
X-Received: by 2002:a19:a58d:: with SMTP id o135mr10042237lfe.97.1547720854287; 
 Thu, 17 Jan 2019 02:27:34 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB5693D3A8387A48C7453FEC0796830@SN6PR02MB5693.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB5693D3A8387A48C7453FEC0796830@SN6PR02MB5693.namprd02.prod.outlook.com>
From: John Wang <wangzqbj@inspur.com>
Date: Thu, 17 Jan 2019 18:27:22 +0800
X-Gmail-Original-Message-ID: <CAHkHK08_MujVhwv2SaPfNPn+bS36a3uLEWjfvYU+CkFFE_2j4Q@mail.gmail.com>
Message-ID: <CAHkHK08_MujVhwv2SaPfNPn+bS36a3uLEWjfvYU+CkFFE_2j4Q@mail.gmail.com>
Subject: Re: couple questions for OpenBMC
To: Brenden Lai <Brenden_Lai@jabil.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201604.home.langchao.com (10.100.2.4) To
 jtjnmail201601.home.langchao.com (10.100.2.1)
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
X-List-Received-Date: Thu, 17 Jan 2019 10:33:35 -0000

On Thu, Jan 17, 2019 at 3:52 PM Brenden Lai <Brenden_Lai@jabil.com> wrote:
>
> Hi
>
> I have couple questions about OpenBMC .

>
> 1.if I decide use OpenBMC solution , Does it mean I should put all BMC source code on github including some commercial software  ?
>
>
>
> 2.Are there any tutorial or /document  for using dbus within OpenBMC ?
please refer to this link [https://github.com/openbmc/sdbusplus] for
documentation and examples.
or you can use busctrl to find out it.

example:
    busctl tree xyz.openbmc_project.LED.GroupManager
    busctl introspect   xyz.openbmc_project.LED.GroupManager
/xyz/openbmc_project/led/groups/enclosure_fault

> 3.Why there is no release note after V1.05 ?  Will the coming release  attach release note ?
>
>
> 4.I know openBMC is using some file text to represent  device (LED , sensor)

Linux uses device tree to describe the hardware component,you can
refer to https://elinux.org/Device_Tree_Usage
This link[https://github.com/openbmc/docs/blob/master/LED-architecture.md]
tells you how openbmc controls led.

Can be roughly described:
          phosphor-led-manager(strategy) -->
phosphor-led->sysfs(action)  --> linux led subsystem

 linux led subsystem :
https://github.com/openbmc/linux/blob/dev-4.19/Documentation/leds/leds-class.txt

>but I am curious about how this files bind to real device ?
>    Where is the low level operation relate code ?

https://github.com/openbmc/phosphor-led-sysfs/blob/e0844ff447abad01fa6f902caab3839336d1518d/physical.cpp#L131

>
>
> Thanks -Brenden
>
>
>
>
>
> Brenden Lai
> SR. BMC Design Engineer
> E&I, Jabil Design Services
>
>
