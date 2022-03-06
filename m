Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AF9C433F5
	for <openbmc@archiver.kernel.org>; Sun,  6 Mar 2022 01:55:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KB4RK0d2rz3bV1
	for <openbmc@archiver.kernel.org>; Sun,  6 Mar 2022 12:55:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KB4Qr19WDz2yNv
 for <openbmc@lists.ozlabs.org>; Sun,  6 Mar 2022 12:54:40 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0V6JORag_1646531671; 
Received: from 30.225.139.215(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V6JORag_1646531671) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 06 Mar 2022 09:54:32 +0800
Message-ID: <25c97c0d-e354-23c8-ad83-be080c533cde@linux.alibaba.com>
Date: Sun, 6 Mar 2022 09:54:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: phosphor-network: does it make sense to disable systemd-networkd
 sending DHCP release?
Content-Language: en-US
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com>
 <f392c47a-76d2-c9f5-44f4-07f127f8e928@intel.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <f392c47a-76d2-c9f5-44f4-07f127f8e928@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 Nagaraju Goruganti <ngorugan@in.ibm.com>, Adriana Kobylak <anoo@us.ibm.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Johnathan,

Thanks for your feedback; I'll try to make a patch for that.

Heyi

在 2022/3/2 下午11:50, Johnathan Mantey 写道:
>
> On 2/21/22 01:05, Heyi Guo wrote:
>> Hi all,
>>
>> Now systemd-networkd will send DHCP release packet when BMC reboots. 
>> This may cause BMC to lose its original aquired IP after next boot 
>> up. I see this feature can be disabled by adding below lines to the 
>> configuration file of systemd-networkd:
>>
>> [DHCPv4]
>> SendRelease=false
>>
>> Does it make sense to disable DHCP release? Or is there any reason 
>> for the current default configuration in phosphor-network?
>>
>> Thanks,
>>
>> Heyi
>>
>
> FWIW, users within Intel get very cranky when their IPv4 addresses 
> change. I'm presently working on a defect related to the IP address 
> being altered.
>
> As it is unclear there is a run-time mechanism for changing this 
> value, I'd at least like to see a compile time control. I expect Intel 
> will choose to block sending a DHCP release request for when the BMC 
> reboots.
>
>
