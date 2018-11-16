Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42x8bC5npYzF3j5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 18:13:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2018 23:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,239,1539673200"; d="scan'208";a="106755791"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2018 23:13:23 -0800
Received: from [10.239.195.241] (yongli3-mobl.ccr.corp.intel.com
 [10.239.195.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8F7BB580495;
 Thu, 15 Nov 2018 23:13:22 -0800 (PST)
From: "Li, Yong B" <yong.b.li@linux.intel.com>
Subject: Re: qemu does not work for the latest image?
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, yong.b.li@intel.com
References: <000201d47cb4$495ee3e0$dc1caba0$@linux.intel.com>
 <CALLMt=ofV09ZW8bUvvySfefXzyqhVzeB+UyC7nqkBKEUCjQMSg@mail.gmail.com>
Message-ID: <e03c0741-43f6-fe99-136b-89c5c19a1066@linux.intel.com>
Date: Fri, 16 Nov 2018 15:13:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=ofV09ZW8bUvvySfefXzyqhVzeB+UyC7nqkBKEUCjQMSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 16 Nov 2018 07:13:28 -0000

Thanks Andrew for your commands.  The issue is caused by my older qemu 
tool.

After downloaded qemu-system-arm, I can boot the image now!

Thanks,
Yong
On 11/15/2018 10:13 PM, Andrew Geissler wrote:
> On Thu, Nov 15, 2018 at 1:25 AM Yong Li<yong.b.li@linux.intel.com>  wrote:
>> Hi All,
>>
>>
>>
>> Previously I can use qemu to test these built images, but it does not work now and get the below error messages:
>> Just want to know if there is any command/options changes? Or it does not support now?
> Hey Yong, I pulled down the latest qemu binary and witherspoon image
> and it booted up fine for me.
>
> Here were my commands:
> wgethttps://openpower.xyz/job/openbmc-qemu-build-merge-x86/lastSuccessfulBuild/artifact/qemu/arm-softmmu/qemu-system-arm
> wgethttps://openpower.xyz/job/openbmc-build/distro=ubuntu,label=builder,target=witherspoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/obmc-phosphor-image-witherspoon.ubi.mtd
> ./qemu-system-arm -m 256 -M witherspoon-bmc -nographic -drive
> file=./obmc-phosphor-image-witherspoon.ubi.mtd,format=raw,if=mtd -net
> nic -net user,hostfwd=:127.0.0.1:2622-:22,hostfwd=:127.0.0.1:2643-:443,hostfwd=:127.0.0.1:8580-:80,hostname=qemu
>
>> qemu-system-arm -m 256 -M witherspoon-bmc -nographic -drive file=tmp/deploy/images/witherspoon/obmc-phosphor-image-poon.ubi.mtd,format=raw,if=mtd
>>
>> qemu-system-arm: Aspeed iBT has no chardev backend
>>
>> U-Boot 2016.07 (Nov 15 2018 - 06:18:37 +0000)
>>
>>
>>
>>         Watchdog enabled
>>
>> DRAM:  240 MiB
>>
>> Flash: 32 MiB
>>
>> *** Warning - bad CRC, using default environment
>>
>>
>>
>> In:    serial
>>
>> Out:   serial
>>
>> Err:   serial
>>
>> Net:   aspeednic#0
>>
>> Error: aspeednic#0 address not set.
>>
>>
>>
>> Hit any key to stop autoboot:  0
>>
>> ubi0: attaching mtd1
>>
>> ubi0: scanning is finished
>>
>> UBI init error 12
>>
>> Error, no UBI device/partition selected!
>>
>> Wrong Image Format for bootm command
>>
>> ERROR: can't get kernel image!
>>
>>
>>
>>
>>
>> Thanks,
>>
>> Yong
