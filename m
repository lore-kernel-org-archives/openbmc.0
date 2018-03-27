Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409Gtf3gFrzF261;
 Tue, 27 Mar 2018 14:38:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Sp9Yahs0"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 409Gtd4m71z9ryr;
 Tue, 27 Mar 2018 14:38:01 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522121882; bh=It1Jh086Z5pe9U00oNjYI8s0mHN3UIdCM88ULwPDygE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Sp9Yahs0M33rGAqgstgKs8cCcEJ1ueDD/af7H1jx8eRqxYwNSZMdHj7oCVSUKyWaz
 pmv2KUuMot/BPQrfVJfJkRcbIFKJW0ma0hlhRcm4tz6LhYgDh1wcWlgtyZ7uI+IyMy
 iu8W0wfV1TU2bpADuRf1cPXr5o7bFH8o5swnHwVdvB5n6+J4WP0iPtyb0tjr0x59yV
 fARXrMWh46czzaieP/pzRI+N6mi5g8ITMH1eKxgYnRVNyVHwAMZDLH3BPaHfLtBdI/
 NtofhQq97QDiZJumSyF9/rxNwCUpoBwCLbDSWY6JHER/0NwzycNS0NW/I3Num1eEoP
 wark2Lrils5Ig==
Subject: Re: [PATCH 0/5] serial: implement flow control for ASPEED VUART driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180323155116.GA31423@kroah.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56d0cb10-7c89-f424-4657-cd822cc74e17@ozlabs.org>
Date: Tue, 27 Mar 2018 11:38:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323155116.GA31423@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 03:38:03 -0000

Hi Greg,

> I've applied patch 2 here, can you redo the series again after fixing up
> the first one and include the v2 of patch 5 so it's easier for me to
> figure out what to really apply here?

Sure thing. I'll base v2 on top of tty-next, so you'll end up with a
4-patch series, without the duplicate.

Patches coming.

Cheers,


Jeremy
