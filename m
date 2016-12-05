Return-Path: <clg@kaod.org>
Received: from 10.mo5.mail-out.ovh.net (10.mo5.mail-out.ovh.net
 [46.105.52.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXHbH3YTkzDvtQ
 for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2016 19:14:02 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D716348629
 for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2016 09:13:58 +0100 (CET)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
 (Authenticated sender: postmaster@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id E7292600092;
 Mon,  5 Dec 2016 09:13:55 +0100 (CET)
Subject: Re: [PATCH u-boot v2 1/3] aspeed: remove hack loading ramdisk in
 memory
To: Simon Glass <sjg@chromium.org>, Rick Altherr <raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-2-git-send-email-raltherr@google.com>
 <CAPnjgZ3WpLrsHMARpbkdSRzTd51y4Noi+fYYh+tVncWgG5pUBw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e0967b2e-2de1-c41f-1620-e7e0b8d5b158@kaod.org>
Date: Mon, 5 Dec 2016 09:13:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3WpLrsHMARpbkdSRzTd51y4Noi+fYYh+tVncWgG5pUBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2433632652106959618
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrgeejgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 05 Dec 2016 08:14:03 -0000

Hello,

On 12/05/2016 07:24 AM, Simon Glass wrote:
> On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
>> From: Cédric Le Goater <clg@kaod.org>
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>> ---
>>  common/image.c | 11 -----------
>>  1 file changed, 11 deletions(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 

So how do you fix the ramdisk loading ? is using the FIT images 
enough to work around this problem ? 

For legacy type images, this patch seemed to work : 

	https://github.com/legoater/u-boot/commit/86fd073a12650ee7fc4e6514f2b0f159be275f29

I am not sure if this is a good approach though.

Thanks,

C.
