Return-Path: <clg@kaod.org>
Received: from 10.mo1.mail-out.ovh.net (10.mo1.mail-out.ovh.net
 [178.32.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssshh2FLYzDsTQ
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:49:24 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E8CEE1371C
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 09:41:36 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id A081B2A007F;
 Mon, 10 Oct 2016 09:41:34 +0200 (CEST)
Subject: Re: [PATCH u-boot 11/12] bootm: fix ramdisk relocation
To: Joel Stanley <joel@jms.id.au>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-12-git-send-email-clg@kaod.org>
 <CACPK8Xeg=MguGsn8tXp-_RG7AfesKBzpjK75JrGZy8+2kWSYDQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Milton D. Miller II" <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <df5bef1c-910a-90d3-d2e1-88ff34a3f4e2@kaod.org>
Date: Mon, 10 Oct 2016 09:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xeg=MguGsn8tXp-_RG7AfesKBzpjK75JrGZy8+2kWSYDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5057542383186643867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeejgddvkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 10 Oct 2016 07:49:24 -0000

On 10/10/2016 08:23 AM, Joel Stanley wrote:
> On Fri, Oct 7, 2016 at 8:26 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> We are working on bringing to mainline a set of changes adding support
>> for the Aspeed SoC and we have a couple of work around we are trying
>> to elimitate first. This is one of them. The ramdisk is not relocated
>> and Linux fails to boot. The current port does not use a device tree
>> (yet) so that might be the most obvious culprit.
>>
>> Thanks
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> I see you're chatting with upstream about this one.
> 
> Do you want me to include this in our tree for now, or wait for the
> outcome of those discussions?

Let's wait. The current hack does exactly what Linux needs, which 
is to load the ramdisk at the load address of the ramdisk image. 

This patch enables loading but on some occasion, the ramdisk can be 
loaded in conflicting memblocks for Linux, which then disables 
INITRD ... So we need to do better than that.


C. 
