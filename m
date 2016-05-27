Return-Path: <clg@kaod.org>
Received: from mo179.mail-out.ovh.net (mo179.mail-out.ovh.net [178.32.228.179])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rGL3K61dCzDqZy
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 19:15:57 +1000 (AEST)
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6AF6BFF95AF
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 10:58:41 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id EB1C71C007D;
 Fri, 27 May 2016 10:58:35 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: updating u-boot_2013.07.bb recipe
Message-ID: <57480C2F.4090902@kaod.org>
Date: Fri, 27 May 2016 10:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 882987003545553819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrgeejgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2016 09:15:58 -0000

Hello. 

The uboot recipe in openbmc is still at 4b44678c11. Without them, I see 
memory corruption under qemu, so I suppose this is the same for real HW. 

commit 6f7818cdb8d8 "net: aspeednic: Do not start hardware in initialize"
seems to solve the problem. 

Is there a reason for staying at that level in uboot ? Could we take all
Milton's patches in ? 

Thanks,

C. 
