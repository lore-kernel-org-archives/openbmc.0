Return-Path: <chris@distroguy.com>
Received: from mx-out01.mykolab.com (mx.kolabnow.com [95.128.36.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t47Q36Q30zDt3c
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 11:42:18 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx05.mykolab.com (mx05.mykolab.com [10.20.7.161])
 by mx-out01.mykolab.com (Postfix) with ESMTPS id 7E73B615F7;
 Thu, 27 Oct 2016 02:42:11 +0200 (CEST)
Date: Thu, 27 Oct 2016 11:42:04 +1100
From: Chris Smart <chris@distroguy.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2] ARM: dts: witherspoon: add Epson RX8900CE RTC module
Message-ID: <20161027004202.GA3620@distroguy.com>
References: <20161026065509.GA10287@distroguy.com>
 <CACPK8XfM_24R6wAa92cMNtfWhL_JZ_zBwCnDza=sutbwJA_c0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XfM_24R6wAa92cMNtfWhL_JZ_zBwCnDza=sutbwJA_c0Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Oct 2016 00:42:20 -0000

On Thu, Oct 27, 2016 at 10:48:01AM +1030, Joel Stanley wrote:
>Hey Chris,
>
>On Wed, Oct 26, 2016 at 5:25 PM, Chris Smart <chris@distroguy.com> wrote:
>>         /* RTC */
>> +       rtc@32 {
>> +               compatible = "epson,rx8900"
>> +               reg = <0x32>;
>
>Did you try building this?
>

My bad, v3 incoming.

-c
