Return-Path: <openbmc+bounces-1059-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54838E6748D
	for <openbmc@archiver.kernel.org>; Mon, 22 Dec 2025 06:15:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZSY70XBZz2xg3;
	Mon, 22 Dec 2025 17:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766384106;
	cv=none; b=EjUVZj8V26J81/vqjo8hw5pzlyqDwVqgOY03ZnV3G5cZ2NRVGxQseOP7SnKecQO1kGBQO+qhHNKoEzxrXpmkH5vlZf5cYNfS40xZ8OGuPdB7pXeJ1UpJcDH/N9prSxaNxEcElnhumewzKJrsxBaVGuswv4I6uh2uN++J6qHoU9ZjYn0tnZT3MBGPTT7PYDd0j8xTEZhSFa63/MZxDYoGDjo5igukQbVf1piEYt+AGtAOc5iJqDbkxI6bV6PGKs5GhQfUdOvWabVJyQ9hpXKdPhh+kczOHH42ajBlhVZCqd263Fg9dyLJxUNo8qu2QQ88BpSwyfNA96EI5try/6hS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766384106; c=relaxed/relaxed;
	bh=WfC/FuYIK2D5pmYNqSr8eNM8RPtHtLy9WqdWKS303KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TLwkjzAN+WyfWCMy1z62JNTa4BrGUd7I8ACZ0CKbA00vDaFTZyzaJIY/xTfNtDYnlFdfvr91OnmTTa7Q7f8Z1nBNmsJj02sG4q1wrwNGmNa5k0x1GXvy46g3vzgux6IEVSKuSYvyvDLAjlbL9wg0+llNDaPVlRW2+yVw/+nW9arbebJKh5FqfVZJRzJ67ZLZoPC5C3YbyeuIkzK2d8+5dG64UyBR7DQxbKDpIt4YUtQycAcIk1eFOJ/67EsRVRSNc3vswnEsnKsiF7Prw4rvxmOnxQGZAamJ0otbp5eqDZT2zn66848mLO8+wpCxgOMepOuEYsKquP+BoMdL8onAeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dllPvgnO; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dllPvgnO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZSY41Nrtz2xSX
	for <openbmc@lists.ozlabs.org>; Mon, 22 Dec 2025 17:15:02 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766384095; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WfC/FuYIK2D5pmYNqSr8eNM8RPtHtLy9WqdWKS303KM=;
	b=dllPvgnO7SSsi5sETZMJJax86YQLAVeNgRNCuxqdsg39Q3dYeDcntBfdJ+5vCTmfWfXjNFCcUdiZv1ptDhxVYrgAodgt8kek7ppwLWcnt1REw7foL+d9mPzM+EkHD3QhAB4/y4nybTtcl/X98e9h66Di2m72WdzwLzw6QYNwd+s=
Received: from 30.221.129.201(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WvLtJLz_1766384093 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 14:14:53 +0800
Message-ID: <1e6ee97b-3768-4cb5-8a40-1115069bfa7d@linux.alibaba.com>
Date: Mon, 22 Dec 2025 14:14:52 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
To: qiu ding <qdwby2008@outlook.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

You can try adding "-C 17" to ipmitool.

Heyi

On 2025/12/21 17:51, qiu ding wrote:
> Hello, I'm testing the IPMI interface on the evb-ast2600 simulator with Ubuntu 22.04 and OpenBMC v2.12.0. I'm encountering an IPMI authentication issue (the port is 6230 -> 623, and port 623 is listening on UDP by default). How can I resolve this? Does phosphor-ipmi-host use CMake or Autotools for compilation by default?
>
> Addition: When compiling phosphor-ipmi-host, the default recipe parameters from the OpenBMC v2.12.0 branch are used.
>
> Simulator Environment:
> root@evb-ast2600:~# systemctl status phosphor-ipmi-host
> * phosphor-ipmi-host.service - Phosphor Inband IPMI
>       Loaded: loaded (/lib/systemd/system/phosphor-ipmi-host.service; enabled; vendor preset: enabled)
>      Drop-In: /lib/systemd/system/phosphor-ipmi-host.service.d
>               `-10-override.conf
>       Active: active (running) since Thu 1970-01-01 01:23:46 UTC; 5s ago
>     Main PID: 305 (ipmid)
>       CGroup: /system.slice/phosphor-ipmi-host.service
>               `- 305 ipmid
>
> Jan 01 01:23:37 evb-ast2600 systemd[1]: Starting Phosphor Inband IPMI...
> Jan 01 01:23:43 evb-ast2600 ipmid[305]: JSON file not found
> Jan 01 01:23:46 evb-ast2600 systemd[1]: Started Phosphor Inband IPMI.
> Jan 01 01:23:47 evb-ast2600 ipmid[305]: Loading whitelist filter
> Jan 01 01:23:47 evb-ast2600 ipmid[305]: Set restrictedMode = false
> Jan 01 01:23:47 evb-ast2600 ipmid[305]: New interface mapping
> root@evb-ast2600:~#
>
> root@evb-ast2600:~# netstat -an |grep :623
> udp        0      0 :::623                  :::*
> root@evb-ast2600:~#
>
> Issues:
> $ ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 mc info
> Error in open session response message : invalid authentication algorithm
>
> Error: Unable to establish IPMI v2 / RMCP+ session
>
> $ ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc info
> Error in open session response message : invalid authentication algorithm
>
> Error: Unable to establish IPMI v2 / RMCP+ session
> $ ipmitool -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc info
> Authentication type NONE not supported
> Error: Unable to establish LAN session
> Error: Unable to establish IPMI v1.5 / RMCP session

