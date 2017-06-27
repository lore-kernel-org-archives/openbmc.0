Return-Path: <clg@kaod.org>
Received: from 9.mo4.mail-out.ovh.net (9.mo4.mail-out.ovh.net [46.105.40.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxmn72dk2zDr26
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 23:22:34 +1000 (AEST)
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 3AA64763DC
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 08:13:31 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 06996640094;
 Tue, 27 Jun 2017 08:13:27 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Joel Stanley <joel@jms.id.au>, Brandon Wyman <bjwyman@gmail.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
 <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f8553d4f-c0b9-5cef-de01-067b313b10cb@kaod.org>
Date: Tue, 27 Jun 2017 08:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17837069275355515650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddtuddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 27 Jun 2017 13:22:35 -0000

On 06/26/2017 08:16 AM, Joel Stanley wrote:
> Hello Brandon,
> 
> On Sat, Jun 24, 2017 at 9:26 AM, Brandon Wyman <bjwyman@gmail.com> wrote:
>> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
>> is used for fan fault and identify LED control. Adding this chip and the
>> LED lines to the device tree.
> 
> Great first submission. One issue I found, please see below.

Joel, 

haven't you merged the patch defining all the PCA9552 pins as GPIOS ? 

https://github.com/openbmc/linux/commit/db30464ee579176abc82d0fe95aa9b9ff76d0c3a

Cheers ,

C. 
