Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A41E11A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 15:44:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 6678C1402C4;
 Fri, 12 Feb 2016 15:44:05 +1100 (AEDT)
Subject: Re: [PATCH 1/2 v2] serial/aspeed-vuart: Only disable host tx discard
 when serial port is in use
To: Stewart Smith <stewart@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
 <1455179366-13956-1-git-send-email-jk@ozlabs.org>
 <87bn7mophf.fsf@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56BD6314.8010609@ozlabs.org>
Date: Fri, 12 Feb 2016 12:44:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <87bn7mophf.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 04:44:05 -0000

Hi Stewart,

>> OpenPOWER firmware doesn't like it when the host-side of the VUART's
>> FIFO is not drained. This change only disables host TX discard mode when
>> the port has been opened.
> 
> Do we have what's arguably a bug somewhere?

I'm not 100% sure that it's a bug; it's fairly reasonable to expect that
a UART's TX FIFO will be drained. That expectation is present in a lot
of different UART implementations (including skiboot & Linux).

Cheers,


Jeremy
