Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.43.205; helo=6.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwfW01MtyzDqYd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 18:36:43 +1000 (AEST)
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9036791D90
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 09:59:54 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player169.ha.ovh.net (Postfix) with ESMTPSA id 2A27F580087;
 Mon, 18 Sep 2017 09:59:49 +0200 (CEST)
Subject: Re: [PATCH qemu] arm: aspeed: Add palmetto and evb EEPROM I2C devices
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20170915061830.1527-1-joel@jms.id.au>
 <9659eb97-6d10-d204-02a5-9359e2a09b8f@kaod.org>
 <CACPK8Xe3_XNjoLF5CzmY8dDFbg8ivs1Fm4nLXbpNonds85rW+Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <860fa7c3-1d04-6df5-61dd-2a991414197c@kaod.org>
Date: Mon, 18 Sep 2017 09:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe3_XNjoLF5CzmY8dDFbg8ivs1Fm4nLXbpNonds85rW+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9005228933207526146
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheefgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 08:36:44 -0000

On 09/18/2017 05:26 AM, Joel Stanley wrote:
> On Fri, Sep 15, 2017 at 4:55 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 09/15/2017 08:18 AM, Joel Stanley wrote:
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> We could fill the eeprom_buf with some valid data if needed.
> 
> 
> 
> That's a good idea.
> 
> When I use this I see the following error:
> 
> # pwd
> /sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a100.i2c-bus

hmm, the address is I2C bus 3.

> # hexdump -C i2c-0/0-0050/eeprom

But you use bus 0 ? weird.

> hexdump: i2c-0/0-0050/eeprom: Operation timed out
> 00000000  74 65 73 74 20 64 61 74  61 0a 00 00 00 00 00     |test data......|
> 0000000f
> 
> A strace shows three reads, with the first succeeding and the second
> two failing:
> 
> # strace hexdump -C i2c-0/0-0050/eeprom
> execve("/usr/bin/hexdump", ["hexdump", "-C", "i2c-0/0-0050/eeprom"],
> [/* 12 vars */]) = 0
> set_tls(0x76fad764, 0x3c, 0x76fac47c, 0x24, 0x76fad698) = 0
> set_tid_address(0x76fad6b4)             = 581
> getuid32()                              = 0
> open("i2c-0/0-0050/eeprom", O_RDONLY|O_LARGEFILE) = 3
> dup2(3, 0)                              = 0
> close(3)                                = 0
> readv(0, [{iov_base="test data\n\0\0\0\0\0", iov_len=15},
> {iov_base="", iov_len=1024}], 2) = 15
> readv(0, 0x7e898cd4, 2)                 = -1 ETIMEDOUT (Operation timed out)
> readv(0, 0x7e898cd4, 2)                 = -1 ETIMEDOUT (Operation timed out)
> write(2, "hexdump: i2c-0/0-0050/eeprom: Op"..., 50hexdump:
> i2c-0/0-0050/eeprom: Operation timed out
> ) = 50
> ioctl(1, TIOCGWINSZ, {ws_row=0, ws_col=0, ws_xpixel=0, ws_ypixel=0}) = 0
> writev(1, [{iov_base="00000000  74 65 73 74 20 64 61 7"...,
> iov_len=76}, {iov_base="|\n", iov_len=2}], 200000000  74 65 73 74 20
> 64 61 74  61 0a 00 00 00 00 00     |test data......|
> ) = 78
> writev(1, [{iov_base="0000000f", iov_len=8}, {iov_base="\n",
> iov_len=1}], 20000000f
> ) = 9
> exit_group(0)                           = ?
> +++ exited with 0 +++
> 
> Any ideas there?


If I use your patch adding the eeprom to bus 0 on the palmetto machine, I don't 
see any issues while reading the contents.

  hexdump -C  /sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a040.i2c-bus/i2c-0/0-0050/eeprom
  00000000  00 80 80 80 80 80 80 80  80 80 80 80 80 80 80 80  |................|
  00000010  80 80 80 80 80 80 80 80  80 80 80 80 80 80 80 80  |................|
  *
  ...
  00007f80  80 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  00007f90  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00008000


Cheers,

C. 
