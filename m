Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAB2C433EF
	for <openbmc@archiver.kernel.org>; Sat,  5 Mar 2022 14:04:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9mg43XVmz3bWd
	for <openbmc@archiver.kernel.org>; Sun,  6 Mar 2022 01:04:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9mfX4qJqz30Hf
 for <openbmc@lists.ozlabs.org>; Sun,  6 Mar 2022 01:03:44 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0V6HYo.X_1646489015; 
Received: from 30.39.251.175(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V6HYo.X_1646489015) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 05 Mar 2022 22:03:36 +0800
Message-ID: <9321559d-ece8-e8b4-06eb-e0fa5bfb90a2@linux.alibaba.com>
Date: Sat, 5 Mar 2022 22:03:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: [phosphor-software-manager] potential out of order for reboot guard
 enable and disable procedure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: George Liu <liuxiwei@inspur.com>, Adriana Kobylak <anoo@us.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi all,

We found reboot might be permanently disabled after running BMC image 
update with curl command. The journal log showed the steps of reboot 
guard enable and disable were out of order:

Mar 05 20:32:58 ali2600 systemd[1]: Starting Enable a guard that blocks 
BMC reboot...
Mar 05 20:32:58 ali2600 phosphor-image-updater[370]: BMC activation has 
ended - BMC reboots are re-enabled.
Mar 05 20:32:58 ali2600 systemd[1]: Starting Removes the guard that 
blocks BMC reboot...
Mar 05 20:32:58 ali2600 phosphor-image-updater[370]: BMC image ready, 
need reboot to get activated.
Mar 05 20:32:58 ali2600 systemd[1]: reboot-guard-disable.service: Succeeded.
Mar 05 20:32:58 ali2600 systemd[1]: Finished Removes the guard that 
blocks BMC reboot.
Mar 05 20:32:59 ali2600 systemd[1]: reboot-guard-enable.service: Succeeded.
Mar 05 20:32:59 ali2600 systemd[1]: Finished Enable a guard that blocks 
BMC reboot.

It seems systemd would not guarantee the completion order for StartUnit 
operations, while I think this is critical for firmware upgrade 
procedure. Shall we switch to normal C++ implementation to create and 
remove reboot guaud configuration files, to guarantee the order of these 
sequential steps?

Thanks,

Heyi

