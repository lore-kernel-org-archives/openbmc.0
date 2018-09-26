Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.165.232; helo=10.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
 [87.98.165.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KpgR3PPyzF0fg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 16:58:24 +1000 (AEST)
Received: from player760.ha.ovh.net (unknown [10.109.146.143])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3AE9E1D8094
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 08:58:19 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 656702009D;
 Wed, 26 Sep 2018 08:58:14 +0200 (CEST)
Subject: Re: MAC#2 RGMII mode can't ping other IP address on AST2500
To: Andrew Jeffery <andrew@aj.id.au>, xiuzhi <1450335857@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_5BF308BD00D5F7E65B3CB94C@qq.com>
 <1537933762.273359.1520855776.6C5F0423@webmail.messagingengine.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <321addb6-c1e6-587c-a967-df93ef2132d3@kaod.org>
Date: Wed, 26 Sep 2018 08:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1537933762.273359.1520855776.6C5F0423@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3317745552074771202
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtvddgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Sep 2018 06:58:28 -0000

On 9/26/18 5:49 AM, Andrew Jeffery wrote:
> Hello,
> 
> On Wed, 26 Sep 2018, at 11:47, xiuzhi wrote:
>> Hi All,
>>    My hardware set AST2500 MAC#2  on RGMII mode. the device is Broadcom 
>> BCM54612, The PHY and control is good . But it can not ping other IP. 
>> The .dts file is:
>>  
>> &mac1 {
>>
>>         status = "okay";
>>
>>         pinctrl-names = "default";
>>
>>         pinctrl-0 = <&pinctrl_rgmii2_default>;
>>
>> };
>>
>> The kernel boot info:
>>
>> [    3.747357] ftgmac100 1e680000.ethernet: Error applying setting, 
>> reverse things back
> 
> The failure to apply the pinctrl configuration isn't going to help. Can you please open an issue on GitHub, provide the full dmesg output and point to the kernel tree and configuration you are building?

yes. 

The OpenBMC kernel works fine but the DTS is adding the mdio pins. 

Thanks,

C.  


> Thanks,
> 
> Andrew
> 
>>
>> [    3.755351] ftgmac100 1e680000.ethernet: Generated random MAC address 
>> 6a:ba:31:cd:e3:32
>>
>> [    3.771891] libphy: ftgmac100_mdio: probed
>>
>> [    3.776178] Generic PHY 1e680000.ethernet--1:00: attached PHY driver 
>> [Generic PHY] (mii_bus:phy_addr=1e680000.ethernet--1:00, irq=POLL)
>>
>> [    3.799636] ftgmac100 1e680000.ethernet eth0: irq 19, mapped at 5ae85020
>>
>> ... ...
>>
>> [  OK  ] Found device /dev/aspeed-lpc-ctrl.
>>
>> [  OK     17.494678] ftgmac100 1e680000.ethernet eth0: Link is Up - 
>> 100Mbps/Full - flow control rx/tx
>>
>> m] Created slice[   17.503871] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link 
>> becomes ready
>>
>>  system-xyz.openbmc_project.led.controller.slice.
>>
>>          Starting Network Name Resolution...
>>
>> [  OK  ] Reached target System Time Synchronized.
>>
>> ......
>>
>> The values of register SCU0C and SCU70 are correct, the values are:
>>
>> #devmem 0x1e6e200C
>>
>> 0xFFDD7A8B,  the bit 21 is 0(MAC#2 enable clock running) ,the bit 20 is 1
>>
>> #dev mem 0x1e6e2070
>>
>> 0xF109F296 , the bit 7 is 1 (RGMII),the bit6 is 0
>>
>>
>>
>>
>> Execting the command "ifconfig eth0 up" log is:
>>
>> root@romulus:~# ifconfig eth0 up  
>>
>> [  274.978358] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>>
>> root@romulus:~# [  274.986878] ftgmac100 1e680000.ethernet eth0: Link is 
>> Up - 100Mbps/Full - flow control rx/tx
>>
>> [  274.995944] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready 
>>
>> My bmc ip is 192.168.120.141, it can't ping other IPs.
>>
>> I also set the gateway. route add default gw 192.168.120.254.
>> I trace the error  "ftgmac100 1e680000.ethernet: Error applying setting, 
>> reverse things back" in file drivers/pinctrl/core.c  
>> L1206 
>> list_for_each_entry(setting, &stte->settings,node)
>> switch(setting->type）{
>> case PIN_MAP_TYPE_MUX_GROUP
>>       ret = pinmux_enable_setting(setting); 
>> }
>> the ret value is -1 
>> My kernel version is 4.17.14. The other kernel versions reproduce the 
>> same error.
>> What is wrong with it?
>>
>>
>> Xiuzhi
