Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="jfYIvZzi"; 
 dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Jul 2018 19:02:39 AEST
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41b8Pq0L7zzDrHF
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 19:02:38 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2247250A07;
 Wed, 25 Jul 2018 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1532509000; x=1534323401; bh=aF/028SAwqAvBbkCP9AJHYD4O2nQHBo7gLQ
 qGD/Mhf4=; b=jfYIvZzib23QISE0aEUL3McSsXHNq0QHxYHp48zzWZSxXnvpD6F
 8r/EgT6A/VJC6jzGbJ96uVX2nd24NLlQYH4xdqGZi8mFc4V38ycHLWj3J1MpbJC9
 9s1cXjx8owMcc5O9m5nsloteev09gdvmOC4FWZwaD8ypKVgkOmSoU+AA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAAh2PU1VICs; Wed, 25 Jul 2018 11:56:40 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E77CF49857;
 Wed, 25 Jul 2018 11:56:40 +0300 (MSK)
Received: from localhost (172.17.15.155) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 25
 Jul 2018 11:56:40 +0300
Date: Wed, 25 Jul 2018 11:56:40 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>, xiuzhi <1450335857@qq.com>
Subject: Re: KVM Support?
Message-ID: <20180725085640.GA10849@bbwork.lan>
References: <tencent_7C15837BAB91A131A31142D54EE9723ED405@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <tencent_7C15837BAB91A131A31142D54EE9723ED405@qq.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Originating-IP: [172.17.15.155]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2018 09:02:39 -0000

Hello everybody,

Could you check the size of `build/tmp/deploy/image/<platformname>/fitImage-openbmc-phosphor-initramfs-*.bin`?
If it exceeds 4456448 (0x440000) bytes, this is the problem described at https://github.com/openbmc/openbmc/issues/3314


In this case you should modify flash partitions layout or trying to decrease kernel size.

--
Alexander

On Wed, Jul 25, 2018 at 03:48:04PM +0800, xiuzhi wrote:
> Hi Eddie,
> 
> 
>   I read your KVM Support email on mailinglist.
> 
> 
> I am going to port the BMC kvm to ast2400 . The u-boot can not load kernel ,the error message read:
> 
> 
> ""U-Boot 2016.07 (Jul 23 2018 - 11:11:50 +0000)
> 
> 
> DRAM:  240 MiB
> WARNING: Caches not enabled
> Flash: 32 MiB
> *** Warning - bad CRC, using default environment
> 
> 
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Error: aspeednic#0 address not set.
> 
> 
> Hit any key to stop autoboot:  0
> ## Loading kernel from FIT Image at 20080000 ...
> Bad FIT kernel image format!
> ERROR: can't get kernel image!
> ast#
> 
> 
> I added  config options to defconfig of ast2400 as follows:
> 
> 
> CONFIG_MEDIA_SUPPORT=y
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_MEDIA_SUPPORT=y
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # CONFIG_MEDIA_CONTROLLER is not set
> CONFIG_RATIONAL=y
> CONFIG_VIDEO_DEV=y
> CONFIG_VIDEO_V4L2=y
> CONFIG_V4L_PLATFORM_DRIVERS=y
> CONFIG_VIDEO_ASPEED=y
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> 
> 
> Need I modify the aspeed-bmc-opp-palmetto.dts and aspeed-g4.dtsi?
> 
> 
> Can you give me the file list need to modify?
> 
> 
> Thanks,
> 
> 
> xiuzhi
