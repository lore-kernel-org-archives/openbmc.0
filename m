Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmlsP6qdbzDqXq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 01:13:45 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 9 Sep 2020 11:13:39 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Benjamin Fair <benjaminfair@google.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Subject: Re: New meta-layer request
Message-ID: <20200909151339.ronsxrtvij4mu4fe@thinkpad.dyn.fuzziesquirrel.com>
References: <FA2BA7DD-2DD5-4CCD-927B-310AB5B56C64@fii-na.com>
 <CADKL2t5z_ZcgN1jKChungKgNuRJs4JRQtaqa3DeKX-DQtYPGRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADKL2t5z_ZcgN1jKChungKgNuRJs4JRQtaqa3DeKX-DQtYPGRA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Sep 2020 15:13:46 -0000

On Thu, Sep 03, 2020 at 04:18:09PM -0700, Benjamin Fair wrote:
>On Mon, 31 Aug 2020 at 15:40, Lancelot Kao <lancelot.cy.kao@fii-na.com> wrote:
>>
>> Hi, Pioneer
>>
>>                 I come from Fii crops as a subgroup of Foxconn. We are using the openBMC to develop our openBMC with the Ampere & Nuvoton solution.
>>
>>                 So, we need to create a new meta-layer for us. I am told there is someone who may help us to create the meta-layer for us. The below is the information needs to create meta-layer.
>>
>>                 Name : meta-fii
>>
>>                 Maintainers :
>>
>> Lancelot.kao@fii-usa.com
>> Neil.chen@fii-usa.com
>> vveerach@google.com
>> benjaminfair@google.com
>>
>>
>>
>>                 If I miss anything, please let me know.
>>
>>
>>
>> --
>>
>> Best Regards.
>>
>> Lancelot Kao
>>
>> CABG/CESBG
>> TW : +886-2-2268-3466 #3766
>>
>> US : +1-281-655-2668
>> e-mail : lancelot.cy.kao@fii-na.com
>>
>
>Hi Brad,
>
>Can you help create the repo for meta-fii as described above?
>
>Thanks,
>Benjamin

Lancelot, Ben - sorry about the delay.  meta-fii has been created.

-brad
