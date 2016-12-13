Return-Path: <clg@kaod.org>
Received: from 14.mo3.mail-out.ovh.net (14.mo3.mail-out.ovh.net
 [188.165.43.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdG5v6YTVzDvNm
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 21:24:19 +1100 (AEDT)
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 284686937F
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 11:24:14 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: postmaster@kaod.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id 766AD2E00C0;
 Tue, 13 Dec 2016 11:24:13 +0100 (CET)
Subject: Re: [PATCH linux 0/3] LPC/MBOX work
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
References: <20161209054323.7320-1-cyrilbur@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9ff2c6fd-8d1d-0f71-f475-414b76711246@kaod.org>
Date: Tue, 13 Dec 2016 11:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161209054323.7320-1-cyrilbur@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14721704232126155522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrieeggddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 13 Dec 2016 10:24:20 -0000

On 12/09/2016 06:43 AM, Cyril Bur wrote:
> Cedric (or anyone really): Do you know of a way the lpc-ctrl driver
> could query the MTD subsystem for the size of the PNOR? There is
> currently a hack in the UNMAP ioctl() which can't hang around.

well, it is a platform device so you could loop on them I guess. 
Or maybe use register_mtd_user() ? 

C.
