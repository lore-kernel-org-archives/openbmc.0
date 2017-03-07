Return-Path: <clg@kaod.org>
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcn5g0T8szDq8g
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 17:37:42 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1CCAB40B2F
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 06:18:52 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 32035180073;
 Tue,  7 Mar 2017 06:18:49 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: remove second
 BMC flash
To: Joel Stanley <joel@jms.id.au>
References: <1488787487-12257-1-git-send-email-clg@kaod.org>
 <CACPK8Xeia=yG3LqkZq_RSS9z=dm+xkmtcCdxQQKL1VE17rpCDA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2bcbeb33-5799-52eb-2910-4354ac468c25@kaod.org>
Date: Tue, 7 Mar 2017 06:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xeia=yG3LqkZq_RSS9z=dm+xkmtcCdxQQKL1VE17rpCDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4808718505856436994
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrgedugdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 07 Mar 2017 06:37:43 -0000

On 03/07/2017 03:23 AM, Joel Stanley wrote:
> On Mon, Mar 6, 2017 at 6:34 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Romulus systems have only one MX25L25635 (32768 Kbytes) flash module
>> for the BMC firmware and other MT25QL512A (65536 Kbytes) for the host.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts |    5 -----
>>  1 file changed, 5 deletions(-)
>>
>> Index: linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> ===================================================================
>> --- linux-openbmc-4.7.git.orig/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -51,11 +51,6 @@
>>                 m25p,fast-read;
>>  #include "aspeed-bmc-opp-flash-layout.dtsi"
>>         };
>> -       flash@1 {
>> -               status = "okay";
>> -               label = "alt";
>> -               m25p,fast-read;
>> -       };
> 
> I think this patch was against a different tree; we don't have the
> fast-read properties in 4.7.

Ah yes. Sorry about that.

> I fixed it up and committed to dev-4.7.

Thanks,

C.
