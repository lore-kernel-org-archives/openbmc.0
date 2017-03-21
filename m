Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnDtg2HMGzDq5g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 11:57:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vnDtf6gcbz9s3w;
 Tue, 21 Mar 2017 11:57:30 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling
 input on SDA
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
 <5abc5b5b-d431-94c1-00f3-42d2d595b278@ozlabs.org>
 <f3991ff8-7584-23c3-488d-17bdd4efb1ae@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <fa128d63-338c-84c3-ed54-ce0bc3107556@ozlabs.org>
Date: Tue, 21 Mar 2017 08:57:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <f3991ff8-7584-23c3-488d-17bdd4efb1ae@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 21 Mar 2017 00:57:31 -0000

Hi Chris,

> The echo delay in the driver clocks '1's on the line so as long as the
> echo_delay() utility is used there is no risk of random data in this
> phase. 

Ah, I'd missed the set_sda_output(1), there. That should be fine then.

> Yes that's true, cpu load shouldn't be a factor in this case then. The
> failure mode is during the sampling of input data during the slave
> response phase of the command.  CRC received does not match the CRC
> calculated due to bit flips
> related to sampling/clocking timing issues.  This problem only appears
> when hostboot is accessing the BMC.  Increasing delay does correct the
> issue.  I don't have a good explanation for why this timing behavior
> occurs given its not cpu load related.

My concern here is that with such a dramatic change in timing there
(200x), and not knowing what the underlying problem is, we're just
making the issue less likely to occur, rather than fixing it.

Do you know if we have access to HW folks to scope the data & clock? We
could set a GPIO when we see a CRC error, to use as an external
trigger...

Cheers,


Jeremy
