Return-Path: <clg@kaod.org>
X-Greylist: delayed 405 seconds by postgrey-1.36 at bilbo;
 Sat, 11 Mar 2017 19:10:53 AEDT
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vgGzK0HPqzDqXf
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 19:10:52 +1100 (AEDT)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B86055FD59
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 09:04:02 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 8562244006E;
 Sat, 11 Mar 2017 09:03:56 +0100 (CET)
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: Xo Wang <xow@google.com>
References: <20170310122135.29827-1-andrew@aj.id.au>
 <1e540c49-0053-087b-0021-3ca259d2ca32@kaod.org>
 <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
 <CAPH-5w5i0O=CAWw97_LGAJUShBHM6CK=_aN42UgQ-ANZzu71Ww@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 miltonm@us.ibm.com, wghoffa@us.ibm.com, Patrick Williams
 <patrick@stwcx.xyz>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f771fae0-998a-d90f-5959-9907bf99b03c@kaod.org>
Date: Sat, 11 Mar 2017 09:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAPH-5w5i0O=CAWw97_LGAJUShBHM6CK=_aN42UgQ-ANZzu71Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12642167106566720258
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrgeelgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Mar 2017 08:10:53 -0000

On 03/10/2017 10:17 PM, Xo Wang wrote:
> On Fri, Mar 10, 2017 at 6:20 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 03/10/2017 02:38 PM, Cédric Le Goater wrote:
>>> On 03/10/2017 01:21 PM, Andrew Jeffery wrote:
>>>> Protect against suspect hardware causing the bus to read off more data
>>>> than defined in the SMBus specification.
>>>>
>>>> Some investigation that suggests that the DEVICE_ID command (0xfd) to
>>>> a UCD9000 occasionally returns all 0xff, causing the bus driver to
>>>> overrun the 34-byte data buffer provided by the I2C core with a 255-byte
>>>> broken response. This patch should prevent trashing the stack and also
>>>> cause the UCD9000's probe to fail.
>>>>
> 
> Excellent. We tracked down failures to the same error, that the
> occasional 0xff from the UCD is interpreted as SMBus block length.
> However, the symptom we observed for the overrun is a kernel panic:
> 
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted
> in: 802e5e38
> 
> CPU: 0 PID: 1559 Comm: zaius_vcs.sh Not tainted
> 4.7.10-f26558191540830589fe03932d05577957670b8d #2
> Hardware name: ASpeed SoC
> [<801072f8>] (unwind_backtrace) from [<80105558>] (show_stack+0x10/0x14)
> [<80105558>] (show_stack) from [<8016d06c>] (panic+0xb8/0x248)
> [<8016d06c>] (panic) from [<80110df4>] (__stack_chk_fail+0x10/0x14)
> [<80110df4>] (__stack_chk_fail) from [<802e5e38>] (i2c_smbus_xfer+0x508/0x54c)
> [<802e5e38>] (i2c_smbus_xfer) from [<ffffffff>] (0xffffffff)
> 
> I'm not sure that the UCD probe failures are totally related to the
> bug that this patch fixes.

No. I think the device is sometimes quite slow to respond and also 
the bus recovery path seems a bit fragile.

C. 
