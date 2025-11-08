Return-Path: <openbmc+bounces-860-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DF4CCFA05
	for <openbmc@archiver.kernel.org>; Sat,  8 Nov 2025 03:44:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3MGz6xxcz3bfX;
	Sat,  8 Nov 2025 14:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762571421;
	cv=none; b=XxQbZGqYxAhkTINjqpmr9LIxoFU3YIkVnXSQL/lKl42/ZxWhzkvRuFTCcKz9trzlIsNt+ZoQUo2PE5tRM0HW3PvKHIHDtpj6I6uSXZGzxegX3L/v4K0vbS9qmszPDNlGGnq5mD5YUeYOvB4aRg6yM1cLLXgOdkarBoGpcky1HjsRP1CrMwP4L4YrA9GfXf2/sG5V17Hr2swmRb+jom7QlST15xEEtA5XirhmYATSAxFzNk82BC/Ss8KKW/qm9Agp0zWhpBwI0oyrHNvPVw+2Awdr0CW3EB6QEShbOppImHdTRnTSndxXEYvQBfs15NZBC7Gon/r8G5rE4M/Jb9V9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762571421; c=relaxed/relaxed;
	bh=fWTb2pOcM9CXmYC6UdWot4dWCYfXpxLg0tPmGPgdwak=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YozZt/7c6aYev3Y1ZYtbsB2C6JkOPEkGFv6f9Cl1YNQidT2MYBJLOXtDrYxwM0nGxqsJKIgEivdmZRlg4LQB0SRcOiu/Xhx5ROO11NqkazumQNu4UY5ufR5LoeQbKc87l/JGg6gS02UcrE+lvYDSFfusuOq6POqRpIz/XdwcLXgz7Qo0JHEslflSBPp/k97+vsUKdncLx6iPu7h5mbPmC0p/zVCDmyNZSr+fCKfLk2J6zPd+EsdVQbkP4nb9TQ5lhJeP4C/pnJACP3ArS3WXwHs/TQkMYVNBnjZPSirUsPRq4/m2HlK2utYDf8NapKasOI8Mu+cM0MV2w0u1bl0G4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3JB5MYKt; dkim-atps=neutral; spf=pass (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3JB5MYKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 385 seconds by postgrey-1.37 at boromir; Sat, 08 Nov 2025 14:10:15 AEDT
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3LX724Jkz2yG5
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 14:10:14 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fWTb2pOcM9CXmYC6UdWot4dWCYfXpxLg0tPmGPgdwak=;
	b=3JB5MYKtzMDOEFTMGqRYCsUNmJnLgQLHT8NUaT/G2qYNOfCyLO/TgCL7udDTHyLBDIFdzqsmv
	rx4WV+baK74czTdS+9ZPXLRcqlK0tAmZxI5m1Tk7tqKt9/XLS4ieYqRUM7ve3nXgVyfbKrOJlpg
	/Px2qfkM5/JwdsDW1ZqfVCU=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4d3LV837zKzLlSX;
	Sat,  8 Nov 2025 11:08:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F17B7140142;
	Sat,  8 Nov 2025 11:10:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Nov 2025 11:10:07 +0800
Subject: Re: UBIFS errors since Linux 5.15
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Eddie James <eajames@linux.ibm.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <sethjenkins@google.com>,
	<adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
 <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
Message-ID: <b48c9bad-3224-d606-d1a4-72239c3561e4@huawei.com>
Date: Sat, 8 Nov 2025 11:10:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)

在 2025/11/8 11:03, Zhihao Cheng 写道:
> 在 2025/11/8 1:38, Eddie James 写道:
>>
>> Hello,
>>
>> We are updating some BMC (Aspeed AST2600, ARM32) systems that were on 
>> Linux 5.4 but observe consistent UBIFS errors with Linux 5.15 and 
>> later. The errors seem to vary; there is a sampling below.
>>
>>
>> We performed a git bisect and came up with the following commit, which 
>> of course is completely unrelated to UBIFS. Reverting it does prevent 
>> the issue... Does anyone have any suggestions?
>>
>> commit 33fc9e26b7cb39f0d4219c875a2451802249c225
> [...]
>> [    8.180486] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad 
>> magic 0x101831, expected 0x6101831
> 
> Hi, look here, the magic number 0x101831 vs 0x6101831, the difference is 
> the highest bit(0 vs 6[0110])
>> [    8.189578] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad node 
>> at LEB 17:64664
> 
> [...]
>> [ 3739.678968] UBIFS error (ubi0:2 pid 13): ubifs_check_node: bad CRC: 
>> calculated 0x9179af29, read 0xa760f4f5
> 
> [...]
>> [10412.723111] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad 
>> magic 0x6100830, expected 0x6101831
> 
> and there, magic number 0x6100830 vs 0x6101831, the difference is lowest 
> bit(0 vs 1).

Sorry, I need to make a correction, the differences are the lowest bit(0 
vs 1) and the middle bit (0 vs 1). The number of flipped bits is also two.
> 
> So, I guess the crc error is caused by the similar reason, maybe there 
> is something wrong with the nand driver or flash? According to the 
> version information(5.15, and the unrelated commit 33fc9e26b7cb3), is it 
> possible that there is a compatibility issue between your nand(bsp) 
> driver with kernel nand common layer(which from different versions)?
> 
>> [10412.732436] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad 
>> node at LEB 13:60248
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


