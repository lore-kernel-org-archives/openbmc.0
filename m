Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.107.143; helo=1.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8914 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Nov 2018 08:11:50 AEDT
Received: from 1.mo177.mail-out.ovh.net (1.mo177.mail-out.ovh.net
 [178.33.107.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v3NQ6XHczF3Kt
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 08:11:48 +1100 (AEDT)
Received: from player773.ha.ovh.net (unknown [10.109.146.86])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id CCB9AD24C7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:43:11 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 435FC600092
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:43:11 +0100 (CET)
Subject: Re: Flashing Image using 'pflash' Tool
To: openbmc@lists.ozlabs.org
References: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e235eedb-e62f-13d2-5beb-921678797d8b@kaod.org>
Date: Mon, 12 Nov 2018 19:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14537338126080314114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrkeelgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
X-List-Received-Date: Mon, 12 Nov 2018 21:11:51 -0000

On 11/8/18 11:04 AM, AKASH G J wrote:
> I tried to flash kernel image /fitImage.bin/ to the flash memory address /0x20100000/ using the following command.


If you are trying to flash a custom BMC kernel only and bypassing 
the standard procedure to do so, you should update the correct
MTD device with dd or flashcp.

	# cat /proc/mtd 
	dev:    size   erasesize  name
	mtd0: 02000000 00010000 "bmc"
	mtd1: 00060000 00010000 "u-boot"
	mtd2: 00020000 00010000 "u-boot-env"
	mtd3: 00440000 00010000 "kernel"
	mtd4: 01740000 00010000 "rofs"
	mtd5: 00400000 00010000 "rwfs"
	mtd6: 02000000 00010000 "pnor"

I don't have a zaius but it should be roughly similar.  

Cheers,

C.


> root@zaius:/var# /pflash -a 0x20100000 -f -p fitImage.bin /
> 
> It exited with following error.
> 
> /About to program "fitImage.bin" at 0x20100000..0x20371e20 !
> Programming & Verifying...
> [                                                  ] 0%Flash write error 3 for chunk at 0x20100000/
> /
> /
> Please someone help to resolve the problem.
> //
> 
> Thanks and Regards ,
> 
> Akash G J
