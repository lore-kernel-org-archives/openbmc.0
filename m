Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NKWv5HH5zDqn5
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 07:16:41 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 14:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,464,1559545200"; d="scan'208";a="187394026"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga006.jf.intel.com with ESMTP; 03 Sep 2019 14:16:38 -0700
Subject: Re: [yocto] Build break in the latest openbmc tree.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 akuster808 <akuster808@gmail.com>
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
 <fbcfc988-687f-55ad-1ca9-ace092f09a99@gmail.com>
 <68bddbec8c08cbd9d31f561222bb3afde814a94b.camel@fuzziesquirrel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9e7fa5a8-3ac4-a187-e878-2e6a24b1713d@linux.intel.com>
Date: Tue, 3 Sep 2019 14:16:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <68bddbec8c08cbd9d31f561222bb3afde814a94b.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
X-List-Received-Date: Tue, 03 Sep 2019 21:16:45 -0000

On 8/27/2019 5:00 PM, Brad Bishop wrote:
> On Sun, 2019-08-25 at 10:49 -0700, akuster808 wrote:
>> the meta-security layer should be fix now.
>>
>> please update and let me know if not.
> 
> Thanks Armin!
> 
> Jae, I've pulled this into OpenBMC.  Can you give it a try?
> 

Thanks Armin, Brad!

I tried it using the latest tree and checked that the build breakage has
gone, but a new issue happened while it's building 'qemu-native'.

| ERROR: Execution of 
'/home/yoojae/workspace/openbmc/build/tmp/work/x86_64-linux/qemu-native/4.1.0-r0/temp/run.do_configure.2396' 
failed with exit code 1:
| ERROR: unknown option --disable-libssh

So I made a patch to fix the new issue.

--- a/poky/meta/recipes-devtools/qemu/qemu.inc
+++ b/poky/meta/recipes-devtools/qemu/qemu.inc
@@ -137,7 +137,7 @@ PACKAGECONFIG[curses] = 
"--enable-curses,--disable-curses,ncurses,"
  PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+3 gettext-native"
  PACKAGECONFIG[vte] = "--enable-vte,--disable-vte,vte gettext-native"
  PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
-PACKAGECONFIG[ssh] = "--enable-libssh,--disable-libssh,libssh,"
+PACKAGECONFIG[ssh] = "--enable-libssh2,--disable-libssh2,libssh2,"
  PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
  PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
  PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"

Brad,
Please apply this change into the qemu recipe.

Thanks,
Jae
